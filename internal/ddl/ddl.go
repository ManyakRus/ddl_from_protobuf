package ddl

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"os"
	"strings"
)

// StartAll - создание всех файлов ddl .sql
func StartAll(Settings *config.SettingsINI, Proto types.ProtoAll) {
	var err error

	//FillMapMessages(Settings, MassProto)
	//FillMapEnums(Settings, MassProto)

	Settings.MapMessages = Proto.MapMessages
	Settings.MapEnums = Proto.MapEnums

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

// Start1 - создание 1 файл ddl .sql, для одного .proto
// возвращает текст SQL для одного .proto
func Start1(Settings *config.SettingsINI) (string, error) {
	Otvet := ""
	var err error

	//enums отсортированно
	MassEnums := micro.MassFrom_Map(Settings.MapEnums)
	for _, enum1 := range MassEnums {
		Otvet1, err := CreateFiles_Enum(Settings, enum1)
		if err != nil {
			err = fmt.Errorf("CreateFiles_Enum(%s) error: %w", enum1.Name, err)
			return Otvet, err
		}
		Otvet = Otvet + Otvet1 + "\n"
	}

	//messages отсортированно
	//сначала делаем map для сортировки
	MapSQL := make(map[string]string, len(Settings.MapMessages))
	MassMessages := micro.MassFrom_Map(Settings.MapMessages)
	for i, message1 := range MassMessages {
		Otvet1, ForeignCount, err := CreateFile_Message(Settings, message1)
		if err != nil {
			err = fmt.Errorf("CreateFile_Message(%s) error: %w", message1.Name, err)
			return Otvet, err
		}
		//Otvet = Otvet + Otvet1
		sCount := fmt.Sprintf("%09d_%09d", ForeignCount, i)
		if Otvet1 != "" {
			MapSQL[sCount] = Otvet1
		}
	}

	//сортируем по кол-ву внешних ключей
	MassSQL := micro.MassFrom_Map(MapSQL)
	for _, SQL1 := range MassSQL {
		Otvet = Otvet + SQL1
	}

	return Otvet, err
}

// IsNullableField - возвращает true, если поле nullable
func IsNullableField(Field *types.FieldElement) bool {
	Otvet := false

	TypeName := Field.Type

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

// IsTimestampType - возвращает true, если тип timestamp
func IsTimestampType(stype string) bool {

	if stype == "google.protobuf.Timestamp" {
		return true
	}

	return false
}

// IsIdentifierField - возвращает true, если поле ИД
func IsIdentifierField(Field *types.FieldElement) bool {
	Otvet := false

	//
	if IsTimestampType(Field.Type) == true {
		return Otvet
	}

	//ИД
	if Field.TypeSQL == "" {
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
func FindFieldName(field1 *types.FieldElement) string {
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

	if strings.HasSuffix(Otvet, "_id") == false {
		Otvet = Otvet + "_id"
	}

	return Otvet
}

// FindForeignTableNameAndColumnName - возвращает имя таблицы и столбца внешней связанной таблицы
func FindForeignTableNameAndColumnName(Settings *config.SettingsINI, Field *types.FieldElement) (ForeignTableName string, ForeignTableIDColumnName string) {

	//ИД
	if Field.TypeSQL != "" {
		return
	}

	ForeignTableName = Field.Type

	//поищем в messages
	MapMessage1, ok := Settings.MapMessages[ForeignTableName]
	if ok == true {
		ForeignTableIDColumnName = Find_ID_Name_from_Fields(Settings, MapMessage1.Fields)
	} else {
		//поищем в enums
		_, ok := Settings.MapEnums[ForeignTableName]
		if ok == true {
			ForeignTableIDColumnName = Settings.ENUMS_ID_COLUMN_NAME
		}
	}

	////проверка
	//if ForeignTableIDColumnName == "" {
	//	log.Warn("Not found message or enum (ForeignTableName) with name: ", ForeignTableName)
	//}

	return
}

// Find_ID_from_Fields - возвращает колонку с идентификатором таблицы (ID), или nil
func Find_ID_from_Fields(Settings *config.SettingsINI, Fields []*types.FieldElement) *types.FieldElement {
	var Otvet *types.FieldElement

	MassIndexNames := Settings.MassIndexNames
	for _, IndexName1 := range MassIndexNames {
		for _, Field1 := range Fields {
			if Field1.Name == IndexName1 {
				Otvet = Field1
				return Otvet
			}
		}
	}

	return Otvet
}

// Find_ID_Name_from_Fields - возвращает имя колонки с идентификатором таблицы (ID)
func Find_ID_Name_from_Fields(Settings *config.SettingsINI, Fields []*types.FieldElement) string {
	Otvet := ""

	Field1 := Find_ID_from_Fields(Settings, Fields)
	if Field1 != nil {
		Otvet = Field1.Name
	}

	return Otvet
}

// IsEnumField - возвращает true, если поле enum
func IsEnumField(Settings *config.SettingsINI, field1 *types.FieldElement) bool {
	Otvet := false

	Type := field1.Type
	_, ok := Settings.MapEnums[Type]
	if ok == true {
		Otvet = true
	}

	return Otvet
}

// IsMessageField - возвращает true, если поле message
func IsMessageField(Settings *config.SettingsINI, field1 *types.FieldElement) bool {
	Otvet := false

	Type := field1.Type
	_, ok := Settings.MapMessages[Type]
	if ok == true {
		Otvet = true
	}

	return Otvet
}
