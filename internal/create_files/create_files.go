package create_files

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/gobeam/stringy"
	"unicode"
)

// PascalCase - переводит строку в PascalCase
func PascalCase(s string) string {
	Otvet := ""

	str := stringy.New(s)
	Otvet = str.PascalCase("?", "").Get()
	Otvet = pascalCaseReformatNumbers(Otvet)

	return Otvet
}

// pascalCaseReformatNumbers - после цифр буквы должны быть в верхнем регистре
func pascalCaseReformatNumbers(s string) string {
	Otvet := ""

	var last rune
	for _, s1 := range s {
		if last >= 48 && last <= 57 {
			s1 = unicode.ToUpper(s1)
		}
		Otvet = Otvet + string(s1)
		last = s1
	}

	return Otvet
}

// CamelCase - переводит строку в camel_case
func CamelCase(s string) string {
	Otvet := ""

	str := stringy.New(s)
	Otvet = str.CamelCase("?", "").Get()
	Otvet = pascalCaseReformatNumbers(Otvet)

	return Otvet
}

// IsProtobufType - возвращает true, если тип protobuf
func IsProtobufType(Settings *config.SettingsINI, Type string) bool {
	Otvet := false

	_, ok := Settings.MapSQLTypes[Type]
	if ok == true {
		Otvet = true
	}

	return Otvet
}

// Convert_GolangTypeNameToProtobufTypeName - возвращает имя типа для protobuf
func Convert_GolangTypeNameToProtobufTypeName(TypeGo string) string {
	Otvet := ""

	switch TypeGo {
	case "time.Time":
		Otvet = "google.protobuf.Timestamp"
	case "string":
		Otvet = "string"
	case "int64", "int":
		Otvet = "int64"
	case "int32":
		Otvet = "int32"
	case "uint64":
		Otvet = "uint64"
	case "uint32":
		Otvet = "uint32"
	case "byte":
		Otvet = "uint32"
	case "[]byte":
		Otvet = "bytes"
	case "bool":
		Otvet = "bool"
	case "float32":
		Otvet = "float"
	case "float64":
		Otvet = "double"
	case "uuid.UUID":
		Otvet = "string"
	}

	return Otvet
}

// Convert_ProtobufTypeNameToGolangTypeName - возвращает имя типа golang
func Convert_ProtobufTypeNameToGolangTypeName(Settings *config.SettingsINI, TypeProtobuf string) string {
	Otvet := ""

	Mapping1, ok := Settings.MapSQLTypes[TypeProtobuf]
	if ok == true {
		Otvet = Mapping1.GoType
	}

	return Otvet
}

// NameGo_from_NameSQL - возвращает имя Go из имени SQL
func NameGo_from_NameSQL(TableName string) string {
	Otvet := TableName

	Otvet = PascalCase(Otvet)

	return Otvet
}
