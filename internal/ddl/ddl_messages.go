package ddl

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"strings"
)

// CreateFiles_Message - создание одного файла ddl .sql, для message
func CreateFiles_Message(Settings *config.SettingsINI, message1 *types.MessageElement) (string, error) {
	Otvet := ""
	var err error

	//сообщения с 1 полем не нужны
	if len(message1.Fields) <= 1 {
		return Otvet, err
	}

	TableName := message1.Name
	TableComments := message1.Documentation

	isFoundID := false

	Otvet = `
CREATE TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" (
`
	Otvet = Otvet + Settings.TextEveryTableColumns

	IdentifierName := ""

	//fields
	for _, field1 := range message1.Fields {
		FieldType := field1.Type
		SQLType := FieldType
		MapMappings1, ok := Settings.MapMappings[FieldType]
		if ok == true {
			SQLType = MapMappings1.SQLType
		}
		isNullabe := IsNullableField(field1)
		TextNullable := TextNullable(isNullabe)
		FieldName := FindFieldName(field1)

		//добавим колонку
		Otvet = Otvet + "\t" + `"` + FieldName + `"` + " " + SQLType + " " + TextNullable + ",\n"

	}

	//PRIMARY KEY
	IdentifierName = Find_ID_Name_from_Fields(Settings, message1.Fields)
	if IdentifierName != "" {
		TextPrimaryKey := "\t" + "CONSTRAINT " + TableName + "_pk PRIMARY KEY (" + IdentifierName + "),\n"
		Otvet = Otvet + TextPrimaryKey
		isFoundID = true
	}

	//добавим CONSTRAINT
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		IsIdentifier := IsIdentifierField(field1)
		if IsIdentifier == false {
			continue
		}

		ForignTableName, ForeignTableColumnName := FindForignTableNameAndColumnName(Settings, field1)
		if ForignTableName != "" && ForeignTableColumnName != "" {
			Otvet = Otvet + "\t" + "CONSTRAINT " + TableName + "_" + FieldName + "_fk FOREIGN KEY (" + FieldName + ") REFERENCES " + Settings.DB_SCHEMA_NAME + "." + ForignTableName + " (" + ForeignTableColumnName + ")" + ",\n"
		}
	}

	//удалим лишние запятые
	Otvet = strings.TrimRight(Otvet, ",\n")
	Otvet = Otvet + "\n"
	Otvet = Otvet + ");\n"

	//таблицы без идентификаторов не создаем
	if isFoundID == false {
		err = fmt.Errorf("CreateFiles_Message() message: %s warning: not found ID field", TableName)
		log.Warn(err)
		return "", nil
	}

	//CREATE INDEX
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		IsIdentifier := IsIdentifierField(field1)
		if IsIdentifier == false {
			continue
		}

		Otvet = Otvet + "\t" + "CREATE INDEX " + TableName + "_" + FieldName + "_idx ON " + Settings.DB_SCHEMA_NAME + "." + TableName + " USING btree (" + FieldName + ");" + "\n"
	}

	//COMMENT ON TABLE
	Otvet = Otvet + "\t" + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" IS '` + TableComments + `';` + "\n"

	//COMMENT ON COLUMN
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		Comments := field1.Documentation

		Otvet = Otvet + "\t" + `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `"."` + FieldName + `" IS '` + Comments + `';` + "\n"
	}

	return Otvet, err
}
