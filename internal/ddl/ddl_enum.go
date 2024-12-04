package ddl

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/create_files"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"regexp"
	"strconv"
	"strings"
)

// CreateFiles_Enum - создание одного файла ddl .sql, для enum
func CreateFiles_Enum(Settings *config.SettingsINI, MapTables map[string]*types.Table, enum1 *types.EnumElement) (string, error) {
	Otvet := ""
	var err error

	//сообщения с 1 полем не нужны
	if len(enum1.EnumConstants) <= 1 {
		return Otvet, err
	}

	//
	TableName := enum1.Name
	TableNameSQL := FormatTableNameSQL(Settings, TableName)
	TableComments := enum1.Documentation

	//фильтр
	Filter := Settings.FILTER_MESSAGE_NAME
	if Filter != "" {
		IsFound, _ := regexp.MatchString(Settings.FILTER_MESSAGE_NAME, TableName)
		if IsFound == false {
			return Otvet, err
		}
	}

	//фильтр кроме
	FilterExclude := Settings.EXCLUDE_MESSAGE_NAME
	if FilterExclude != "" {
		IsFound, _ := regexp.MatchString(Settings.EXCLUDE_MESSAGE_NAME, TableName)
		if IsFound == true {
			return Otvet, err
		}
	}

	//
	Otvet = `
CREATE TABLE IF NOT EXISTS "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" (
`
	Otvet = Otvet + Settings.TEXT_EVERY_TABLE

	ID_Name := "id"
	ID_SQL_TYPE := "int8"
	Name_Name := "name"
	Name_SQL_Type := "text"
	//
	Otvet = Otvet + "\t" + `"` + ID_Name + `"` + " " + ID_SQL_TYPE + " " + "GENERATED BY DEFAULT AS IDENTITY NOT NULL" + ",\n"
	Otvet = Otvet + "\t" + `"` + Name_Name + `"` + " " + Name_SQL_Type + " NOT NULL" + ",\n"

	//
	ConstraintName := TableNameSQL + "_pk"
	TextPrimaryKey := "\t" + `CONSTRAINT "` + ConstraintName + `" PRIMARY KEY ("` + ID_Name + `")` + "\n"
	Otvet = Otvet + TextPrimaryKey + ");\n"

	//CREATE INDEX
	IndexName := TableNameSQL + "_" + ID_Name + "_idx"
	Otvet = Otvet + `CREATE INDEX IF NOT EXISTS "` + IndexName + `" ON "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" USING btree ("` + ID_Name + `");` + "\n"

	//COMMENT ON TABLE
	Otvet = Otvet + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" IS '` + TableComments + `';` + "\n"

	//текст после таблицы
	TextAfterEveryTable := Settings.TEXT_AFTER_EVERY_TABLE
	if TextAfterEveryTable != "" {
		TextAfterEveryTable = strings.ReplaceAll(TextAfterEveryTable, `"TableName"`, `"`+TableNameSQL+`"`)
		TextAfterEveryTable = strings.ReplaceAll(TextAfterEveryTable, `"public".`, `"`+Settings.DB_SCHEMA_NAME+`".`)
		Otvet = Otvet + TextAfterEveryTable
	}

	//COMMENT ON ID
	Otvet = Otvet + `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."id" IS '` + "Уникальный технический идентификатор" + `';` + "\n"
	Otvet = Otvet + `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."name" IS '` + "Наименование" + `';` + "\n"

	//
	Table1 := types.NewTable()
	Table1.NameProtobuf = TableName
	Table1.NameSQL = TableNameSQL
	Table1.NameGo = create_files.NameGo_from_NameSQL(TableNameSQL)
	Table1.IsEnum = true

	//insert
	Otvet = Otvet + `INSERT INTO "` + TableNameSQL + `"(id, name) VALUES` + "\n"
	//Otvet1 := ""
	Comma := ","
	len1 := len(enum1.EnumConstants)
	for i, constant1 := range enum1.EnumConstants {
		ID := constant1.ID
		sID := strconv.Itoa(ID)
		Name := constant1.Name
		if i == len1-1 {
			Comma = ";"
		}
		Otvet1 := "(" + sID + ", '" + Name + "')" + Comma + "\n"

		//добавим колонку
		Otvet = Otvet + Otvet1

	}

	//ID
	Column1 := types.Column{}
	Column1.SQLName = ID_Name
	Column1.SQLType = ID_SQL_TYPE
	Column1.ProtoName = ""
	Column1.ProtoType = ""
	//Column1.NameGo = "ID"
	//Column1.TypeGo = "int64"
	Table1.MapColumns[ID_Name] = &Column1

	//Name
	Column2 := types.Column{}
	Column2.SQLName = Name_Name
	Column2.SQLType = Name_SQL_Type
	Column2.ProtoName = ""
	Column2.ProtoType = ""
	//Column1.NameGo = "Name"
	//Column1.TypeGo = "string"
	Table1.MapColumns[ID_Name] = &Column2

	//
	MapTables[TableNameSQL] = &Table1

	return Otvet, err
}
