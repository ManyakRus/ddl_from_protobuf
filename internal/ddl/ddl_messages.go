package ddl

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"strings"
)

// CreateFile_Message - создание одного файла ddl .sql, для message
func CreateFile_Message(Settings *config.SettingsINI, message1 *types.MessageElement) (string, int, error) {
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

		isNullabe := IsNullableField(field1)
		TextNullable := TextNullable(isNullabe)
		FieldName := FindFieldName(field1)
		FieldNameSQL := FormatNameSQL(FieldName)

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
						MapMappingsID1, ok := Settings.MapSQLTypes[FieldID.Type]
						if ok == false {
							log.Panic("message: ", FieldName, ", field: ", FieldName, ", not found message: "+ForeignTableName)
						}
						SQLType = MapMappingsID1.SQLType
					}

				}

			} else {
				//это enum
				_, ok := Settings.MapEnums[ForeignTableName]
				if ok == false {
					log.Panic("message: ", FieldName, ", field: ", FieldName, ", not found message: "+ForeignTableName)
				}
				SQLType = "bigint"
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
				field1.NameGo = FieldName1
				field1.NameSQL = FieldNameSQL1

				Otvet = Otvet + "\t" + `"` + FieldNameSQL1 + `"` + " " + SQLTypeForeign + " " + TextNullable + ",\n"

				//COLUMN COMMENTS
				Comments := field1.Documentation + " / " + FieldForeign.Documentation
				TextColumnComment1 := `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."` + FieldNameSQL1 + `" IS '` + Comments + `';` + "\n"
				TextColumnComment = TextColumnComment + TextColumnComment1
			}
			continue
		}

		//запомним
		field1.NameGo = FieldName
		field1.NameSQL = FieldNameSQL

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
	} else {
		//таблицы без идентификаторов не создаем
		return "", ForeignCount, err
	}

	//добавим CONSTRAINT
	Otvet = Otvet + TextConstraint
	//for _, field1 := range message1.Fields {
	//	FieldName := FindFieldName(field1)
	//	IsIdentifier := IsIdentifierField(field1)
	//	if IsIdentifier == false {
	//		continue
	//	}
	//
	//	ForeignTableName, ForeignTableColumnName := FindForeignTableNameAndColumnName(Settings, field1)
	//	if ForeignTableName == "" || ForeignTableColumnName == "" {
	//		continue
	//	}
	//	MessageF, ok := Settings.MapMessages[ForeignTableName]
	//	if ok == false {
	//		continue
	//	}
	//
	//	IdentifierName = Find_ID_Name_from_Fields(Settings, MessageF.Fields)
	//	if IdentifierName != "" {
	//		ConstraintName := TableName + "_" + FieldName + "_fk"
	//		Otvet = Otvet + "\t" + `CONSTRAINT "` + ConstraintName + `" FOREIGN KEY ("` + FieldName + `") REFERENCES "` + Settings.DB_SCHEMA_NAME + `"."` + ForeignTableName + `" ("` + ForeignTableColumnName + `")` + ",\n"
	//		ForeignCount = ForeignCount + 1
	//	}
	//}

	//удалим лишние запятые
	Otvet = strings.TrimRight(Otvet, ",\n")
	Otvet = Otvet + "\n"
	Otvet = Otvet + ");\n"

	//if isFoundID == false {
	//	err = fmt.Errorf("CreateFile_Message() message: %s warning: not found ID field", TableName)
	//	//log.Warn(err)
	//	return "", nil
	//}

	//CREATE INDEX
	Otvet = Otvet + TextIndex
	//for _, field1 := range message1.Fields {
	//	FieldName := FindFieldName(field1)
	//	IsIdentifier := IsIdentifierField(field1)
	//	if IsIdentifier == false {
	//		continue
	//	}
	//
	//	IndexName := TableName + "_" + FieldName + "_idx"
	//	Otvet = Otvet + `CREATE INDEX IF NOT EXISTS "` + IndexName + `" ON "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" USING btree ("` + FieldName + `");` + "\n"
	//}

	//COMMENT ON TABLE
	Otvet = Otvet + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" IS '` + TableComments + `';` + "\n"

	//COMMENT ON COLUMN
	Otvet = Otvet + TextColumnComment
	//for _, field1 := range message1.Fields {
	//	FieldName := FindFieldName(field1)
	//	Comments := field1.Documentation
	//	Otvet = Otvet + `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."` + FieldNameSQL + `" IS '` + Comments + `';` + "\n"
	//}

	return Otvet, ForeignCount, err
}

// FillTextConstraint1 - возвращает текст SQL ограничений
func FillTextConstraint1(Settings *config.SettingsINI, message1 *types.MessageElement, field1 *types.FieldElement) string {
	Otvet := ""

	TableName := message1.Name
	TableNameSQL := FormatNameSQL(TableName)
	FieldName := FindFieldName(field1)
	FieldNameSQL := FormatNameSQL(FieldName)
	IsIdentifier := IsIdentifierField(field1)
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
	FieldName := FindFieldName(field1)
	FieldNameSQL := FormatNameSQL(FieldName)
	IsIdentifier := IsIdentifierField(field1)
	if IsIdentifier == false {
		return Otvet
	}

	IndexName := TableNameSQL + "_" + FieldNameSQL + "_idx"
	Otvet = Otvet + `CREATE INDEX IF NOT EXISTS "` + IndexName + `" ON "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `" USING btree ("` + FieldNameSQL + `");` + "\n"

	return Otvet
}
