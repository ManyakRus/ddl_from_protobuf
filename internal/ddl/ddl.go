package ddl

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/starter/log"
	"github.com/tallstoat/pbparser"
	"strings"
)

// StartAll - создание всех файлов ddl .sql
func StartAll(Settings config.SettingsINI, MassProto []pbparser.ProtoFile) {
	for _, proto := range MassProto {
		Start1(Settings, proto)
	}
}

// Start1 - создание много файлов ddl .sql, для одного .proto
func Start1(Settings config.SettingsINI, Proto pbparser.ProtoFile) (string, error) {
	Otvet := ""
	var err error

	//
	for _, message1 := range Proto.Messages {
		Otvet1, err := CreateFiles_Message(Settings, message1)
		if err != nil {
			err = fmt.Errorf("CreateFiles_Message(%s) error: %w", message1.Name, err)
			return Otvet, err
		}
		Otvet = Otvet + Otvet1
	}

	//
	for _, enum1 := range Proto.Enums {
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
func CreateFiles_Message(Settings config.SettingsINI, message1 pbparser.MessageElement) (string, error) {
	Otvet := ""
	var err error

	MessageName := message1.Name

	Otvet = `
CREATE TABLE "` + Settings.DB_SCHEMA_NAME + `"."` + MessageName + `" (
`

	//fields
	for _, field1 := range message1.Fields {
		FieldType := field1.Type.Name()
		Map1, ok := Settings.MapMappings[FieldType]
		if ok == false {
			err = fmt.Errorf("MapMappings(%s) error: %w", FieldType, err)
			log.Error(err)
			return Otvet, err
		}
		SQLType := Map1.SQLType
		isNullabe := IsNullableField(field1)
		TextNullable := TextNullable(isNullabe)
		Comments := field1.Documentation
		//FieldName := field1.Name
		FieldName := FindFieldName(field1)
		Otvet = Otvet + "\t" + FieldName + " " + SQLType + " " + TextNullable + " --" + Comments + "\n"
	}

	return Otvet, err
}

// CreateFiles_Enum - создание одного файла ddl .sql, для enum
func CreateFiles_Enum(Settings config.SettingsINI, message1 pbparser.EnumElement) (string, error) {
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
