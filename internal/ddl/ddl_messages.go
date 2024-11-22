package ddl

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/create_files"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"strings"
)

// CreateFile_Message - создание одного файла ddl .sql, для message
func CreateFile_Message(Settings *config.SettingsINI, MapTables map[string]*types.Table, message1 *types.MessageElement) (string, int, error) {
	Otvet := ""
	ForeignCount := 0
	var err error

	//сообщения с 1 полем не нужны
	if len(message1.Fields) <= 1 {
		return Otvet, ForeignCount, err
	}

	TableName := message1.Name
	TableComments := message1.Documentation
	TextColumnComment := ""
	TableNameSQL := FormatNameSQL(TableName)

	//
	Table1 := types.NewTable()
	Table1.NameProtobuf = TableName
	Table1.NameSQL = TableNameSQL
	Table1.NameGo = create_files.NameGo_from_NameSQL(TableNameSQL)

	//isFoundID := false

	Otvet = `
CREATE TABLE IF NOT EXISTS "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" (
`
	Otvet = Otvet + Settings.TextEveryTableColumns

	IdentifierName := ""
	TextConstraint := ""
	TextIndex := ""

	//fields
	for _, field1 := range message1.Fields {
		FieldType := field1.Type
		SQLType := ""
		MapMappings1, ok := Settings.MapSQLTypes[FieldType]
		if ok == true {
			SQLType = MapMappings1.SQLType
		}

		isNullabe := IsNullableField(Settings, field1)
		TextNullable := TextNullable(isNullabe)
		FieldName := FindFieldName(Settings, field1)
		FieldNameSQL := FormatNameSQL(FieldName)
		ForeignName := ""
		ForeignType := ""
		//

		//для тип=enum или message with table
		IsEnum := false
		IsMessage := false
		IsMessageWithTable := false
		if SQLType == "" {
			IsEnum = IsEnumField(Settings, field1)
			IsMessage = IsMessageField(Settings, field1)
			ForeignTableName, ForeignTableColumnName := FindForeignTableNameAndColumnName(Settings, field1)
			if IsMessage == true {
				if ForeignTableName != "" && ForeignTableColumnName != "" {
					IsMessageWithTable = true

					FieldID := &types.FieldElement{}
					ForeignMessage1, ok := Settings.MapMessages[ForeignTableName]
					if ok == true {
						//это message
						FieldID = Find_ID_from_Fields(Settings, ForeignMessage1.Fields)

						//тип
						MapMappingsID1, ok := Settings.MapSQLTypes[FieldID.Type]
						if ok == false {
							log.Panic("message: ", FieldName, ", field: ", FieldName, ", not found message: "+ForeignTableName)
						}
						SQLType = MapMappingsID1.SQLType

						//запомним MapTables
						ForeignName = ForeignTableName
						ForeignType = ForeignTableName
					}

				}

			} else {
				//это enum
				_, ok := Settings.MapEnums[ForeignTableName]
				if ok == false {
					log.Panic("message: ", FieldName, ", field: ", FieldName, ", not found message: "+ForeignTableName)
				}
				SQLType = "bigint"

				//запомним MapTables
				ForeignName = ForeignTableName
				ForeignType = ForeignTableName
			}
		}

		//много колонок для случая тип=message without table
		if SQLType == "" && IsEnum == false && IsMessageWithTable == false {

			MessageF, ok := Settings.MapMessages[FieldType]
			if ok == false {
				log.Error("message: ", FieldName, ", field: ", FieldName, ", not found message: "+FieldType)
				return "", ForeignCount, nil
			}
			for _, FieldForeign := range MessageF.Fields {
				FieldTypeF := FieldForeign.Type
				FieldNameF := FieldForeign.Name
				FieldName1 := field1.Name
				FieldName1 = FieldName1 + "_" + FieldNameF
				FieldNameSQL1 := FormatNameSQL(FieldName1)
				SQLTypeForeign := ""
				MapSQLTypes1F, ok := Settings.MapSQLTypes[FieldTypeF]
				if ok == false {
					log.Error("message: ", message1.Name, ", field: ", FieldName, ", foreign message: ", MessageF.Name, " foreign field:", FieldNameF, ", not found type: "+FieldTypeF)
					return "", ForeignCount, nil
				}
				SQLTypeForeign = MapSQLTypes1F.SQLType

				//запомним
				Column1 := types.Column{}
				Column1.NameSQL = FieldNameSQL1
				Column1.TypeSQL = SQLTypeForeign
				Column1.NameProtobuf = field1.Name
				Column1.TypeProtobuf = FieldType
				Column1.NameForeignProtobuf = FieldNameF
				Column1.TypeForeignProtobuf = FieldTypeF
				//Column1.NameGo = create_files.NameGo_from_NameSQL(FieldNameSQL1)
				//Column1.TypeGo = create_files.Convert_ProtobufTypeNameToGolangTypeName(Settings, FieldType)
				Column1.IsObject = true
				Table1.MapColumns[Column1.NameSQL] = &Column1

				//
				Otvet = Otvet + "\t" + `"` + FieldNameSQL1 + `"` + " " + SQLTypeForeign + " " + TextNullable + ",\n"

				//COLUMN COMMENTS
				Comments := field1.Documentation + " / " + FieldForeign.Documentation
				TextColumnComment1 := `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."` + FieldNameSQL1 + `" IS '` + Comments + `';` + "\n"
				TextColumnComment = TextColumnComment + TextColumnComment1
			}
			continue
		}

		//запомним
		Column1 := types.Column{}
		Column1.NameSQL = FieldNameSQL
		Column1.TypeSQL = SQLType
		Column1.NameProtobuf = FieldName
		Column1.TypeProtobuf = FieldType
		Column1.NameForeignProtobuf = ForeignName
		Column1.TypeForeignProtobuf = ForeignType
		Table1.MapColumns[Column1.NameSQL] = &Column1

		//одна колонка
		//добавим колонку
		Otvet = Otvet + "\t" + `"` + FieldNameSQL + `"` + " " + SQLType + " " + TextNullable + ",\n"

		//CONSTRAINT
		TextConstraint1 := FillTextConstraint1(Settings, message1, field1)
		TextConstraint = TextConstraint + TextConstraint1
		if TextConstraint1 != "" {
			ForeignCount = ForeignCount + 1
		}

		//INDEX
		TextIndex1 := FillTextIndex1(Settings, message1, field1)
		TextIndex = TextIndex + TextIndex1

		//COLUMN COMMENTS
		Comments := field1.Documentation
		TextColumnComment1 := `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."` + FieldNameSQL + `" IS '` + Comments + `';` + "\n"
		TextColumnComment = TextColumnComment + TextColumnComment1

	}

	//PRIMARY KEY
	IdentifierName = Find_ID_Name_from_Fields(Settings, message1.Fields)
	if IdentifierName != "" {
		ConstraintName := TableNameSQL + "_pk"
		TextPrimaryKey := "\t" + `CONSTRAINT "` + ConstraintName + `" PRIMARY KEY ("` + IdentifierName + `"),` + "\n"
		Otvet = Otvet + TextPrimaryKey
		//isFoundID = true

		//
		ColumnPK := create_files.FindColumn_from_NameProtobuf(Table1.MapColumns, IdentifierName)
		ColumnPK.IsPrimaryKey = true
	} else {
		//таблицы без идентификаторов не создаем
		return "", ForeignCount, err
	}

	//добавим CONSTRAINT
	Otvet = Otvet + TextConstraint

	//удалим лишние запятые
	Otvet = strings.TrimRight(Otvet, ",\n")
	Otvet = Otvet + "\n"
	Otvet = Otvet + ");\n"

	//CREATE INDEX
	Otvet = Otvet + TextIndex

	//COMMENT ON TABLE
	Otvet = Otvet + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" IS '` + TableComments + `';` + "\n"

	//COMMENT ON COLUMN
	Otvet = Otvet + TextColumnComment

	//сохраним
	MapTables[TableNameSQL] = &Table1

	return Otvet, ForeignCount, err
}

// FillTextConstraint1 - возвращает текст SQL ограничений
func FillTextConstraint1(Settings *config.SettingsINI, message1 *types.MessageElement, field1 *types.FieldElement) string {
	Otvet := ""

	TableName := message1.Name
	TableNameSQL := FormatNameSQL(TableName)
	FieldName := FindFieldName(Settings, field1)
	FieldNameSQL := FormatNameSQL(FieldName)
	IsIdentifier := IsIdentifierField(Settings, field1)
	if IsIdentifier == false {
		return Otvet
	}

	IdentifierName := ""
	ForeignTableName, ForeignTableColumnName := FindForeignTableNameAndColumnName(Settings, field1)
	ForeignTableNameSQL := FormatNameSQL(ForeignTableName)
	ForeignTableColumnNameSQL := FormatNameSQL(ForeignTableColumnName)
	if ForeignTableName == "" || ForeignTableColumnName == "" {
		return Otvet
	}
	MessageF, ok := Settings.MapMessages[ForeignTableName]
	if ok == true {
		IdentifierName = Find_ID_Name_from_Fields(Settings, MessageF.Fields)
	} else {
		//enums
		_, ok := Settings.MapEnums[ForeignTableName]
		if ok == true {
			IdentifierName = Settings.ENUMS_ID_COLUMN_NAME
		}
	}

	if IdentifierName != "" {
		ConstraintName := TableNameSQL + "_" + FieldNameSQL + "_fk"
		Otvet = Otvet + "\t" + `CONSTRAINT "` + ConstraintName + `" FOREIGN KEY ("` + FieldNameSQL + `") REFERENCES "` + Settings.DB_SCHEMA_NAME + `"."` + ForeignTableNameSQL + `" ("` + ForeignTableColumnNameSQL + `")` + ",\n"
	}

	return Otvet
}

// FillTextIndex1 - возвращает текст SQL ограничений
func FillTextIndex1(Settings *config.SettingsINI, message1 *types.MessageElement, field1 *types.FieldElement) string {
	Otvet := ""

	TableName := message1.Name
	TableNameSQL := FormatNameSQL(TableName)
	FieldName := FindFieldName(Settings, field1)
	FieldNameSQL := FormatNameSQL(FieldName)
	IsIdentifier := IsIdentifierField(Settings, field1)
	if IsIdentifier == false {
		return Otvet
	}

	IndexName := TableNameSQL + "_" + FieldNameSQL + "_idx"
	Otvet = Otvet + `CREATE INDEX IF NOT EXISTS "` + IndexName + `" ON "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" USING btree ("` + FieldNameSQL + `");` + "\n"

	return Otvet
}

// Find_Field_ByName - находит FieldElement по имени
func Find_Field_ByName(MassFields []*types.FieldElement, IdentifierName string) *types.FieldElement {
	var Otvet *types.FieldElement

	for _, field1 := range MassFields {
		if field1.Name == IdentifierName {
			Otvet = field1
			return Otvet
		}
	}
	return Otvet
}
