package ddl

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/create_files"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"regexp"
	"strings"
)

// CreateFile_Message - создание одного файла ddl .sql, для message
// возвращает:
// - текст SQL для одного .proto
// - количество созданных внешних таблиц, для: сортируем по кол-ву внешних ключей
// - error
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

	//фильтр
	Filter := Settings.FILTER_MESSAGE_NAME
	if Filter != "" {
		IsFound, _ := regexp.MatchString(Settings.FILTER_MESSAGE_NAME, TableName)
		if IsFound == false {
			return Otvet, ForeignCount, err
		}
	}

	//фильтр кроме
	FilterExclude := Settings.EXCLUDE_MESSAGE_NAME
	if FilterExclude != "" {
		IsFound, _ := regexp.MatchString(Settings.EXCLUDE_MESSAGE_NAME, TableName)
		if IsFound == true {
			return Otvet, ForeignCount, err
		}
	}

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
		//массивы не перекачиваем
		if field1.Repeated == true {
			continue
		}

		//игнорируем текст deprecated
		//Documentation := field1.Documentation
		IsDeprecated := create_files.IsDeprecatedField(field1)
		if IsDeprecated == true {
			continue
		}

		//
		FieldType := field1.Type
		SQLType := ""
		MapMappings1, ok := Settings.MapSQLTypes[FieldType]
		if ok == true {
			SQLType = MapMappings1.SQLType
		}

		isNullabe := IsNullableField(Settings, field1)
		TextNullable := Find_TextNullable(isNullabe)
		FieldNameProto := FindFieldName(Settings, field1)
		FieldNameSQL := FormatNameSQL(FieldNameProto)
		ProtoForeignTableName := ""
		ProtoForeignColumnName := ""
		TypeForeignProtobuf := ""
		IsObject := false
		//

		//для тип=enum или message with table
		IsEnum := false
		IsMessage := false
		IsMessageWithTable := false
		if SQLType == "" {
			IsEnum = IsEnumField(Settings, field1)
			IsMessage = IsMessageField(Settings, field1)
			ProtoForeignTableName, ProtoForeignColumnName = FindForeignTableNameAndColumnName(Settings, field1)
			if IsMessage == true {
				if ProtoForeignTableName != "" && ProtoForeignColumnName != "" {
					IsMessageWithTable = true

					FieldID := &types.FieldElement{}
					ForeignMessage1, ok := Settings.MapMessages[ProtoForeignTableName]
					if ok == true {
						//это message
						FieldID = Find_ID_from_Fields(Settings, ForeignMessage1.Fields)

						//тип
						MapMappingsID1, ok := Settings.MapSQLTypes[FieldID.Type]
						if ok == false {
							log.Panic("message: ", FieldNameProto, ", field: ", FieldNameProto, ", not found message: "+ProtoForeignTableName)
						}
						SQLType = MapMappingsID1.SQLType

						//запомним MapTables
						//ProtoForeignTableName = ProtoForeignTableName
						//ProtoForeignColumnName = ProtoForeignColumnName
						TypeForeignProtobuf = FieldID.Type
						FieldNameSQL = AddText_id(FieldNameSQL)
						IsObject = true
					}
				}
			} else {
				//это enum
				_, ok := Settings.MapEnums[ProtoForeignTableName]
				if ok == false {
					log.Panic("message: ", FieldNameProto, ", field: ", FieldNameProto, ", not found message: "+ProtoForeignTableName)
				}
				SQLType = "bigint"

				//запомним MapTables
				//ProtoForeignTableName = ProtoForeignTableName
				//ProtoForeignColumnName = ProtoForeignColumnName
				ProtoForeignColumnName = "Number()"
				TypeForeignProtobuf = ProtoForeignTableName //"int64"
				FieldNameSQL = AddText_id(FieldNameSQL)
				IsObject = true
			}
		}

		//много колонок для случая тип=message without table
		if SQLType == "" && IsEnum == false && IsMessageWithTable == false {

			MessageF, ok := Settings.MapMessages[FieldType]
			if ok == false {
				log.Error("message: ", FieldNameProto, ", field: ", FieldNameProto, ", not found message: "+FieldType)
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
					log.Warn("message: ", message1.Name, ", field: ", FieldNameProto, ", foreign message: ", MessageF.Name, " foreign field:", FieldNameF, ", not found type: "+FieldTypeF)
					continue
					//return "", ForeignCount, nil
				}
				SQLTypeForeign = MapSQLTypes1F.SQLType

				//запомним
				Column1 := types.Column{}
				Column1.SQLName = FieldNameSQL1
				Column1.SQLType = SQLTypeForeign
				Column1.ProtoName = field1.Name
				Column1.ProtoType = FieldType
				Column1.ProtoForeignTableName = FieldNameF
				Column1.ProtoForeignColumnName = FieldForeign.Name
				Column1.ProtoForeignColumnType = FieldTypeF
				Column1.IsObject = true
				Table1.MapColumns[Column1.SQLName] = &Column1

				//
				isNullabe1 := IsNullableField(Settings, FieldForeign)
				TextNullable1 := Find_TextNullable(isNullabe1)

				//
				Otvet = Otvet + "\t" + `"` + FieldNameSQL1 + `"` + " " + SQLTypeForeign + " " + TextNullable1 + ",\n"

				//COLUMN COMMENTS
				Comments := field1.Documentation + " / " + FieldForeign.Documentation
				TextColumnComment1 := `COMMENT ON COLUMN "` + Settings.DB_SCHEMA_NAME + `"."` + TableNameSQL + `"."` + FieldNameSQL1 + `" IS '` + Comments + `';` + "\n"
				TextColumnComment = TextColumnComment + TextColumnComment1
			}
			continue
		}

		//запомним
		Column1 := types.Column{}
		Column1.SQLName = FieldNameSQL
		Column1.SQLType = SQLType
		Column1.ProtoName = FieldNameProto
		Column1.ProtoType = FieldType
		Column1.ProtoForeignTableName = ProtoForeignTableName
		Column1.ProtoForeignColumnName = ProtoForeignColumnName
		Column1.ProtoForeignColumnType = TypeForeignProtobuf
		Column1.IsObject = IsObject
		Column1.IsEnum = IsEnum
		Table1.MapColumns[Column1.SQLName] = &Column1

		//одна колонка
		//добавим колонку
		Otvet = Otvet + "\t" + `"` + FieldNameSQL + `"` + " " + SQLType + " " + TextNullable + ",\n"

		//CONSTRAINT
		TextConstraint1 := FillTextConstraint1(Settings, message1, field1, FieldNameSQL)
		TextConstraint = TextConstraint + TextConstraint1
		if TextConstraint1 != "" {
			ForeignCount = ForeignCount + 1
		}

		//INDEX
		TextIndex1 := FillTextIndex1(Settings, message1, field1, FieldNameSQL)
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
		if ColumnPK != nil {
			//log.Panic("message: ", message1.Name, ", field: ", IdentifierName, ", not found in table: ", TableNameSQL)
			ColumnPK.IsPrimaryKey = true
		}
	} else {
		//таблицы без идентификаторов не создаем
		if config.Settings.NEED_IGNORE_MESSAGES_WITHOUT_PRIMARY_KEY == true {
			return "", ForeignCount, err
		}
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
func FillTextConstraint1(Settings *config.SettingsINI, message1 *types.MessageElement, field1 *types.FieldElement, FieldNameSQL string) string {
	Otvet := ""

	TableName := message1.Name
	TableNameSQL := FormatNameSQL(TableName)
	//FieldName := FindFieldName(Settings, field1)
	//FieldNameSQL := FormatNameSQL(FieldName)
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
func FillTextIndex1(Settings *config.SettingsINI, message1 *types.MessageElement, field1 *types.FieldElement, FieldNameSQL string) string {
	Otvet := ""

	TableName := message1.Name
	TableNameSQL := FormatNameSQL(TableName)
	//FieldName := FindFieldName(Settings, field1)
	//FieldNameSQL := FormatNameSQL(FieldName)
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
