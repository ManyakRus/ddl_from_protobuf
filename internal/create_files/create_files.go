package create_files

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"github.com/gobeam/stringy"
	"strings"
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
func NameGo_from_NameSQL(TableNameSQL string) string {
	Otvet := TableNameSQL

	if TableNameSQL == "id" {
		return "ID"
	}

	Otvet = PascalCase(Otvet)
	if (strings.HasSuffix(TableNameSQL, "_id") == true) && (strings.HasSuffix(Otvet, "Id") == true) {
		Otvet = Otvet[:len(Otvet)-2] + "ID"
	}

	return Otvet
}

// Convert_GolangVariableToProtobufVariableType - возвращает имя переменной  преобразованное в тип protobuf
func Convert_GolangVariableToProtobufVariableType(Settings *config.SettingsINI, Column1 *types.Column, VariableName, VariableType string) string {
	Otvet := VariableName

	if Column1 == nil {
		return Otvet
	}

	TextVariableName := VariableName
	TypeGo := Convert_ProtobufTypeNameToGolangTypeName(Settings, Column1.ProtoType)
	if VariableType != TypeGo {
		TextVariableName = VariableType + "(" + VariableName + ")"
	}

	switch TypeGo {
	case "time.Time":
		Otvet = "timestamppb.New(" + VariableName + ")"
	case "string":
		Otvet = TextVariableName
	case "int64":
		Otvet = TextVariableName
	case "int32":
		Otvet = TextVariableName
	case "bool":
		Otvet = TextVariableName
	case "float32":
		Otvet = TextVariableName
	case "float64":
		Otvet = TextVariableName
	case "uuid.UUID":
		Otvet = VariableName + ".String()"
	}

	return Otvet
}

// Convert_ProtobufVariableToGolangVariableType - возвращает имя переменной  преобразованное в тип protobuf
func Convert_ProtobufVariableToGolangVariableType(Settings *config.SettingsINI, Column1 *types.Column, VariableName, VariableType string) string {
	Otvet := VariableName

	if Column1 == nil {
		return Otvet
	}

	TextVariableName := VariableName
	TypeGo := Convert_ProtobufTypeNameToGolangTypeName(Settings, Column1.ProtoType)
	if VariableType != TypeGo {
		TextVariableName = VariableType + "(" + VariableName + ")"
	}

	switch TypeGo {
	case "time.Time":
		Otvet = "timestamppb.New(" + VariableName + ")"
	case "string":
		Otvet = TextVariableName
	case "int64":
		Otvet = TextVariableName
	case "int32":
		Otvet = TextVariableName
	case "bool":
		Otvet = TextVariableName
	case "float32":
		Otvet = TextVariableName
	case "float64":
		Otvet = TextVariableName
	case "uuid.UUID":
		Otvet = VariableName + ".String()"
	}

	return Otvet
}

// Convert_ProtobufVariableToGolangVariable - возвращает имя переменной +  имя колонки, преобразованное в тип golang из protobuf
// VariableName - вводить "i."
func Convert_ProtobufVariableToGolangVariable(Settings *config.SettingsINI, Column1 *types.Column, VariablePrefix, VariableName string) (VariableColumn string, GolangCode string) {
	//time.Time в timestamppb

	TypeGo := Convert_ProtobufTypeNameToGolangTypeName(Settings, Column1.ProtoType)
	ProtoName := Column1.ProtoName
	switch TypeGo {
	case "time.Time":
		{
			VariableColumn = VariablePrefix + VariableName + ".AsTime()"
			return VariableColumn, GolangCode
		}
	case "uuid.UUID":
		{
			VariableColumn = VariableName
			GolangCode = ProtoName + `, err := uuid.FromBytes([]byte(` + VariablePrefix + VariableName + `))
	if err != nil {
		return
	}
`
			return VariableColumn, GolangCode
		}
	}

	return VariableColumn, GolangCode
}

// Convert_TypeSQL_to_TypeGo - возвращает имя типа golang
func Convert_TypeSQL_to_TypeGo(Settings *config.SettingsINI, TypeSQL string) string {
	Otvet := ""

	for _, v := range Settings.MapSQLTypes {
		if v.SQLType == TypeSQL {
			Otvet = v.GoType
		}
	}

	return Otvet
}

// AddImport - добавляет RepositoryURL в секцию Import, если его там нет
func AddImport(Text, RepositoryURL string) string {
	Otvet := Text

	//если уже есть импорт
	pos1 := strings.Index(Otvet, `"`+RepositoryURL+`"`+"\n")
	if pos1 >= 0 {
		return Otvet
	}

	//
	TextFind := "import ("
	LenFind := len(TextFind)
	pos1 = strings.Index(Otvet, TextFind)
	if pos1 < 0 {
		log.Error("not found word: import (")
		return Otvet
	}

	Otvet = Otvet[:pos1+LenFind] + "\n\t" + `"` + RepositoryURL + `"` + Otvet[pos1+LenFind:]

	return Otvet
}

// CheckAndAdd_Import - добавляет URL в секцию Import, если его там нет, если он нужен
func CheckAndAdd_Import(Text, URL string) string {
	Otvet := Text

	//проверим используется или нет
	ModuleName := micro.LastWord(URL)
	pos1 := strings.Index(Otvet, ModuleName+".")
	if pos1 < 0 {
		return Otvet
	}

	Otvet = AddImport(Text, URL)

	return Otvet
}

// AddImport_Time - добавляет пакет в секцию Import, если его там нет
func AddImport_Time(Text string) string {
	Otvet := Text

	RepositoryURL := `time`
	Otvet = AddImport(Text, RepositoryURL)

	return Otvet
}

// CheckAndAdd_ImportStrconv - добавляет пакет в секцию Import, если его там нет
func CheckAndAdd_ImportStrconv(Text string) string {
	Otvet := Text

	RepositoryURL := `strconv`
	Otvet = CheckAndAdd_Import(Text, RepositoryURL)

	return Otvet
}

// CheckAndAdd_ImportFmt - добавляет пакет fmt в секцию Import, если его там нет
func CheckAndAdd_ImportFmt(Text string) string {
	Otvet := Text

	RepositoryURL := `fmt`
	Otvet = CheckAndAdd_Import(Text, RepositoryURL)

	return Otvet
}

// AddImport_UUID - добавляет пакет в секцию Import, если его там нет
func AddImport_UUID(Text string) string {
	Otvet := Text

	//если уже есть импорт
	RepositoryURL := `github.com/google/uuid`
	Otvet = AddImport(Text, RepositoryURL)
	//pos1 := strings.Index(Otvet, RepositoryURL)
	//if pos1 >= 0 {
	//	return Otvet
	//}
	//
	////
	//TextImport := "import ("
	//pos1 = strings.Index(Otvet, TextImport)
	//if pos1 < 0 {
	//	log.Error("not found word: ", TextImport)
	//	return TextModel
	//}
	//
	//Otvet = Otvet[:pos1+len(TextImport)] + "\n\t" + RepositoryURL + Otvet[pos1+len(TextImport):]

	return Otvet
}

// AddImport_Gorm - добавляет пакет в секцию Import, если его там нет
func AddImport_Gorm(Text string) string {
	Otvet := Text

	//если уже есть импорт
	RepositoryURL := `gorm.io/gorm`
	Otvet = AddImport(Text, RepositoryURL)
	//pos1 := strings.Index(Otvet, RepositoryURL)
	//if pos1 >= 0 {
	//	return Otvet
	//}
	//
	////
	//TextImport := "import ("
	//pos1 = strings.Index(Otvet, TextImport)
	//if pos1 < 0 {
	//	log.Error("not found word: ", TextImport)
	//	return TextModel
	//}
	//
	//Otvet = Otvet[:pos1+len(TextImport)] + "\n\t" + RepositoryURL + Otvet[pos1+len(TextImport):]

	return Otvet
}

// AddImport_Timestamp - добавляет покет в секцию Import, если его там нет
func AddImport_Timestamp(Text string) string {
	Otvet := Text

	RepositoryURL := `google.golang.org/protobuf/types/known/timestamppb`
	Otvet = AddImport(Text, RepositoryURL)

	////если уже есть импорт
	//pos1 := strings.Index(Otvet, `"google.golang.org/protobuf/types/known/timestamppb"`)
	//if pos1 >= 0 {
	//	return Otvet
	//}
	//
	////
	//pos1 = strings.Index(Otvet, "import (")
	//if pos1 < 0 {
	//	log.Error("not found word: import (")
	//	return TextModel
	//}
	//
	//Otvet = Otvet[:pos1+8] + "\n\t" + `"google.golang.org/protobuf/types/known/timestamppb"` + Otvet[pos1+8:]

	return Otvet
}

// CheckAndAdd_ImportTime_FromText - добавляет пакет "time" в секцию Import, если его там нет
func CheckAndAdd_ImportTime_FromText(Text string) string {
	Otvet := Text

	pos1 := strings.Index(Text, " time.")
	if pos1 < 0 {
		return Otvet
	}

	Otvet = AddImport_Time(Otvet)

	return Otvet
}

// CheckAndAdd_ImportUUID_FromText - добавляет пакет "uuid" в секцию Import, если его там нет
func CheckAndAdd_ImportUUID_FromText(Text string) string {
	Otvet := Text

	pos1 := strings.Index(Text, "uuid.")
	if pos1 < 0 {
		return Otvet
	}

	Otvet = AddImport_UUID(Otvet)

	return Otvet
}

// CheckAndAdd_ImportGorm_FromText - добавляет пакет "gorm.io/gorm" в секцию Import, если его там нет
func CheckAndAdd_ImportGorm_FromText(Text string) string {
	Otvet := Text

	pos1 := strings.Index(Text, `"gorm.io/gorm"`)
	if pos1 < 0 {
		return Otvet
	}

	Otvet = AddImport_Gorm(Otvet)

	return Otvet
}

// CheckAndAdd_ImportTimestamp_FromText - добавляет пакет "time" в секцию Import, если его там нет
func CheckAndAdd_ImportTimestamp_FromText(Text string) string {
	Otvet := Text

	pos1 := strings.Index(Text, " timestamppb.")
	if pos1 < 0 {
		return Otvet
	}

	Otvet = AddImport_Timestamp(Otvet)

	return Otvet
}

// FindColumn_from_NameProtobuf - находит Column по имени Protobuf
func FindColumn_from_NameProtobuf(MapColumns map[string]*types.Column, NameProtobuf string) *types.Column {
	var Otvet *types.Column

	for _, Column1 := range MapColumns {
		if Column1.ProtoName == NameProtobuf {
			Otvet = Column1
			return Otvet
		}
	}

	return Otvet
}

// Find_ColumnPK - находит Column Primary KEY
func Find_ColumnPK(Table1 *types.Table) *types.Column {
	for _, Column1 := range Table1.MapColumns {
		if Column1.IsPrimaryKey == true {
			return Column1
		}
	}
	return nil
}

// Convert_ProtoName_to_GRPCName - преобразование имени Protobuf в имя
// access_level = AccessLevel
func Convert_ProtoName_to_GRPCName(NameProtobuf string) string {

	//if ProtoName == "id" {
	//	return "Id"
	//}

	Otvet := PascalCase(NameProtobuf)
	//if (strings.HasSuffix(ProtoName, "_id") == true) && (strings.HasSuffix(Otvet, "ID") == true) {
	//	Otvet = Otvet[:len(Otvet)-2] + "ID"
	//}
	return Otvet
}
