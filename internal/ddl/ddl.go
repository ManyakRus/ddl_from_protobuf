package ddl

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"github.com/tallstoat/pbparser"
	"os"
	"strings"
)

// StartAll - создание всех файлов ddl .sql
func StartAll(Settings *config.SettingsINI, MassProto []pbparser.ProtoFile) {
	var err error

	FillMapMessages(Settings, MassProto)
	FillMapEnums(Settings, MassProto)

	//создадим 1 общий текст SQL
	TextSQL := ""
	//for _, proto1 := range MassProto {
	TextSQL1, err := Start1(Settings)
	if err != nil {
		err = fmt.Errorf("Start1() error: %w", err)
		log.Panic(err)
	}
	TextSQL = TextSQL + TextSQL1 + "\n"
	//}

	//запишем в файл
	Filename := Settings.DDL_FILENAME
	err = os.WriteFile(Filename, []byte(TextSQL), config.Settings.FILE_PERMISSIONS)
	if err != nil {
		err = fmt.Errorf("WriteFile() filename: %s error: %w", Filename, err)
		log.Panic(err)
	}

}

// Start1 - создание много файлов ddl .sql, для одного .proto
// возвращает текст SQL для одного .proto
func Start1(Settings *config.SettingsINI) (string, error) {
	Otvet := ""
	var err error

	//отсортированно
	MassMessages := micro.MassFrom_Map(Settings.MapMessages)
	for _, message1 := range MassMessages {
		Otvet1, err := CreateFiles_Message(Settings, message1)
		if err != nil {
			err = fmt.Errorf("CreateFiles_Message(%s) error: %w", message1.Name, err)
			return Otvet, err
		}
		Otvet = Otvet + Otvet1
	}

	//отсортированно
	MassEnums := micro.MassFrom_Map(Settings.MapEnums)
	for _, enum1 := range MassEnums {
		Otvet1, err := CreateFiles_Enum(Settings, enum1)
		if err != nil {
			err = fmt.Errorf("CreateFiles_Enum(%s) error: %w", enum1.Name, err)
			return Otvet, err
		}
		Otvet = Otvet + Otvet1
	}

	return Otvet, err
}

// CreateFiles_Message - создание одного файла ddl .sql, для message
func CreateFiles_Message(Settings *config.SettingsINI, message1 pbparser.MessageElement) (string, error) {
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
	Otvet = Otvet + Settings.ColumnsEveryTable

	IdentifierName := ""

	//fields
	for _, field1 := range message1.Fields {
		FieldType := field1.Type.Name()
		SQLType := FieldType
		MapMappings1, ok := Settings.MapMappings[FieldType]
		Category := field1.Type.Category()
		if Category == pbparser.ScalarDataTypeCategory {
			if ok == false {
				err = fmt.Errorf("MapMappings() error: not found field type: %s", FieldType)
				log.Error(err)
				return Otvet, err
			}
			SQLType = MapMappings1.SQLType
		}
		isNullabe := IsNullableField(field1)
		TextNullable := TextNullable(isNullabe)
		//Comments := field1.Documentation
		FieldName := FindFieldName(field1)
		IsIdentifier := IsIdentifierField(field1)
		isFoundID = isFoundID || IsIdentifier

		//добавим колонку
		Otvet = Otvet + "\t" + `"` + FieldName + `"` + " " + SQLType + " " + TextNullable + ",\n"

		//добавим PRIMARY KEY
		if IsIdentifier == true {
			IdentifierName = FieldName
		}
	}

	if IdentifierName != "" {
		TextPrimaryKey := "\t" + "CONSTRAINT " + TableName + "_pk PRIMARY KEY (" + IdentifierName + "),\n"
		Otvet = Otvet + TextPrimaryKey
	}

	//PRIMARY KEY

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

// CreateFiles_Enum - создание одного файла ddl .sql, для enum
func CreateFiles_Enum(Settings *config.SettingsINI, message1 pbparser.EnumElement) (string, error) {
	Otvet := ""
	var err error

	return Otvet, err
}

// IsNullableField - возвращает true, если поле nullable
func IsNullableField(Field pbparser.FieldElement) bool {
	Otvet := false

	TypeName := Field.Type.Name()

	//Дата
	if TypeName == "google.protobuf.Timestamp" {
		Otvet = true
		return Otvet
	}

	//
	if IsIdentifierField(Field) == true {
		Otvet = true
		return Otvet
	}

	return Otvet
}

// IsIdentifierField - возвращает true, если поле ИД
func IsIdentifierField(Field pbparser.FieldElement) bool {
	Otvet := false

	Category := Field.Type.Category()

	//ИД
	if Category == pbparser.NamedDataTypeCategory {
		Otvet = true
		return Otvet
	}

	return Otvet
}

// TextNullable - возвращает текст NULL для nullable
func TextNullable(IsNullable bool) string {
	Otvet := ""

	Otvet = "NOT NULL"
	if IsNullable == true {
		Otvet = "NULL"
	}

	return Otvet
}

// FindFieldName - возвращает имя поля
func FindFieldName(field1 pbparser.FieldElement) string {
	Otvet := field1.Name

	IsIdentifierField := IsIdentifierField(field1)
	if IsIdentifierField == true {
		Otvet = AddText_id(Otvet)
	}

	return Otvet
}

// AddText_id - добавляет _id к имени, если ещё нет
func AddText_id(Text string) string {
	Otvet := Text

	if strings.HasSuffix(Otvet, "_id") == true {
		Otvet = Otvet + "_id"
	}

	return Otvet
}

// FindForignTableNameAndColumnName - возвращает имя таблицы и столбца внешней связанной таблицы
func FindForignTableNameAndColumnName(Settings *config.SettingsINI, Field pbparser.FieldElement) (ForignTableName string, ForignTableColumnName string) {

	Category := Field.Type.Category()

	//ИД
	if Category != pbparser.NamedDataTypeCategory {
		return
	}

	ForignTableName = Field.Type.Name()

	Map1, ok := Settings.MapMessages[ForignTableName]
	if ok == false {
		return
	}
	ForignTableColumnName = Find_ID_Name_from_Fields(Settings, Map1.Fields)

	return
}

// FillMapMessages - создаёт единый map messages
func FillMapMessages(Settings *config.SettingsINI, MassProto []pbparser.ProtoFile) {

	MapMessages := make(map[string]pbparser.MessageElement)
	for _, proto1 := range MassProto {
		for _, message1 := range proto1.Messages {
			_, ok := MapMessages[message1.Name]
			if ok == true {
				log.Warnf("warning: message %s already exists", message1.Name)
			}
			MapMessages[message1.Name] = message1
		}
	}
	Settings.MapMessages = MapMessages

}

// FillMapEnums - создаёт единый map enums
func FillMapEnums(Settings *config.SettingsINI, MassProto []pbparser.ProtoFile) {

	MapEnums := make(map[string]pbparser.EnumElement)
	for _, proto1 := range MassProto {
		for _, enum1 := range proto1.Enums {
			_, ok := MapEnums[enum1.Name]
			if ok == true {
				//log.Warnf("warning: enum %s already exists", enum1.Name)
			}
			MapEnums[enum1.Name] = enum1
		}
	}
	Settings.MapEnums = MapEnums

}

// Find_ID_from_Fields - возвращает колонку с идентификатором таблицы (ID), или nil
func Find_ID_from_Fields(Settings *config.SettingsINI, Fields []pbparser.FieldElement) *pbparser.FieldElement {
	var Otvet *pbparser.FieldElement

	MassIndexNames := Settings.MassIndexNames
	for _, IndexName1 := range MassIndexNames {
		for _, Field1 := range Fields {
			if Field1.Name == IndexName1 {
				Otvet = &Field1
				return Otvet
			}
		}
	}

	return Otvet
}

// Find_ID_Name_from_Fields - возвращает имя колонки с идентификатором таблицы (ID)
func Find_ID_Name_from_Fields(Settings *config.SettingsINI, Fields []pbparser.FieldElement) string {
	Otvet := ""

	Field1 := Find_ID_from_Fields(Settings, Fields)
	if Field1 != nil {
		Otvet = Field1.Name
	}

	return Otvet
}

// MapMessages           map[string]pbparser.MessageElement
