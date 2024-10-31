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

	//isFoundID := false

	Otvet = `
CREATE TABLE IF NOT EXISTS "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" (
`
	Otvet = Otvet + Settings.TextEveryTableColumns

	IdentifierName := ""

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

		//одна колонка
		if SQLType != "" || IsEnum == true || IsMessageWithTable == true {
			//добавим колонку
			Otvet = Otvet + "\t" + `"` + FieldName + `"` + " " + SQLType + " " + TextNullable + ",\n"
			continue
		}

		//много колонок для случая тип=message without table
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
			SQLTypeForeign := ""
			MapSQLTypes1F, ok := Settings.MapSQLTypes[FieldTypeF]
			if ok == false {
				log.Error("message: ", message1.Name, ", field: ", FieldName, ", foreign message: ", MessageF.Name, " foreign field:", FieldNameF, ", not found type: "+FieldTypeF)
				return "", ForeignCount, nil
			}
			SQLTypeForeign = MapSQLTypes1F.SQLType

			Otvet = Otvet + "\t" + `"` + FieldName1 + `"` + " " + SQLTypeForeign + " " + TextNullable + ",\n"
		}
	}

	//PRIMARY KEY
	IdentifierName = Find_ID_Name_from_Fields(Settings, message1.Fields)
	if IdentifierName != "" {
		ConstraintName := TableName + "_pk"
		TextPrimaryKey := "\t" + `CONSTRAINT "` + ConstraintName + `" PRIMARY KEY ("` + IdentifierName + `"),` + "\n"
		Otvet = Otvet + TextPrimaryKey
		//isFoundID = true
	} else {
		//таблицы без идентификаторов не создаем
		return "", ForeignCount, err
	}

	//добавим CONSTRAINT
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		IsIdentifier := IsIdentifierField(field1)
		if IsIdentifier == false {
			continue
		}

		ForeignTableName, ForeignTableColumnName := FindForeignTableNameAndColumnName(Settings, field1)
		if ForeignTableName == "" || ForeignTableColumnName == "" {
			continue
		}
		MessageF, ok := Settings.MapMessages[ForeignTableName]
		if ok == false {
			continue
		}

		IdentifierName = Find_ID_Name_from_Fields(Settings, MessageF.Fields)
		if IdentifierName != "" {
			ConstraintName := TableName + "_" + FieldName + "_fk"
			Otvet = Otvet + "\t" + `CONSTRAINT "` + ConstraintName + `" FOREIGN KEY ("` + FieldName + `") REFERENCES "` + Settings.DB_SCHEMA_NAME + `"."` + ForeignTableName + `" ("` + ForeignTableColumnName + `")` + ",\n"
			ForeignCount = ForeignCount + 1
		}
	}

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
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		IsIdentifier := IsIdentifierField(field1)
		if IsIdentifier == false {
			continue
		}

		IndexName := TableName + "_" + FieldName + "_idx"
		Otvet = Otvet + `CREATE INDEX IF NOT EXISTS "` + IndexName + `" ON "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" USING btree ("` + FieldName + `");` + "\n"
	}

	//COMMENT ON TABLE
	Otvet = Otvet + `COMMENT ON TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `" IS '` + TableComments + `';` + "\n"

	//COMMENT ON COLUMN
	for _, field1 := range message1.Fields {
		FieldName := FindFieldName(field1)
		Comments := field1.Documentation

		Otvet = Otvet + `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableName + `"."` + FieldName + `" IS '` + Comments + `';` + "\n"
	}

	return Otvet, ForeignCount, err
}
