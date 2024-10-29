package ddl

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"strconv"
)

// CreateFiles_Enum - создание одного файла ddl .sql, для enum
func CreateFiles_Enum(Settings *config.SettingsINI, enum1 *types.EnumElement) (string, error) {
	Otvet := ""
	var err error

	//сообщения с 1 полем не нужны
	if len(enum1.EnumConstants) <= 1 {
		return Otvet, err
	}

	TableName := enum1.Name
	TableComments := enum1.Documentation

	Otvet = `
CREATE TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" (
`
	Otvet = Otvet + Settings.TextEveryTableColumns

	ID_Name := "id"
	ID_SQL_TYPE := "int64"
	Name_Name := "name"
	Name_SQL_Type := "text"
	//
	Otvet = Otvet + "\t" + `"` + ID_Name + `"` + " " + ID_SQL_TYPE + " " + ",\n"
	Otvet = Otvet + "\t" + `"` + Name_Name + `"` + " " + Name_SQL_Type + " " + ",\n"

	//
	TextPrimaryKey := "\t" + "CONSTRAINT " + TableName + "_pk PRIMARY KEY (" + ID_Name + ")\n"
	Otvet = Otvet + TextPrimaryKey

	//CREATE INDEX
	Otvet = Otvet + "\t" + "CREATE INDEX " + TableName + "_" + ID_Name + "_idx ON " + Settings.DB_SCHEMA_NAME + "." + TableName + " USING btree (" + ID_Name + ");" + "\n"

	//COMMENT ON TABLE
	Otvet = Otvet + "\t" + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" IS '` + TableComments + `';` + "\n"

	//insert
	for _, constant1 := range enum1.EnumConstants {
		ID := constant1.ID
		sID := strconv.Itoa(ID)
		Name := constant1.Name
		Otvet1 := "\tINSERT INTO " + TableName + "(id, name) VALUES (" + sID + ", '" + Name + "');\n"

		//добавим колонку
		Otvet = Otvet + Otvet1

	}

	return Otvet, err
}
