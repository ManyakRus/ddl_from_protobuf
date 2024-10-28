package config

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/load_configs/load_configs_mapping"
	"github.com/ManyakRus/starter/log"
	"github.com/tallstoat/pbparser"
	"io/fs"
	"os"
	"strconv"
)

const DIRECTORY_DDL_DEFAULT = "ddl"

// Settings хранит все нужные переменные окружения
var Settings SettingsINI

// SettingsINI - структура для хранения всех нужных переменных окружения
type SettingsINI struct {
	PROTOBUF_DIRECTORY    string
	DDL_FILENAME          string
	CONFIG_DIRECTORY_NAME string
	MapMappings           map[string]load_configs_mapping.SQLMapping
	ColumnsEveryTable     string
	DB_SCHEMA_NAME        string
	MapMessages           map[string]pbparser.MessageElement
	MapEnums              map[string]pbparser.EnumElement
	MassIndexNames        []string
	INDEX_NAMES_FILENAME  string
	FILE_PERMISSIONS      fs.FileMode //= 0666
}

// CreateSettings - создает структуру типа SettingsINI
func CreateSettings() SettingsINI {
	Otvet := SettingsINI{}
	Otvet.MapMappings = make(map[string]load_configs_mapping.SQLMapping)
	Otvet.MapMessages = make(map[string]pbparser.MessageElement)
	Otvet.MapEnums = make(map[string]pbparser.EnumElement)
	Otvet.MassIndexNames = make([]string, 0)
	return Otvet
}

// FillSettings загружает переменные окружения в структуру из переменных окружения
func FillSettings() {
	//сменим текущую директорию чтоб работали локальные пути
	ChangeCurrentDirectory()

	//
	Settings = CreateSettings()
	Settings.PROTOBUF_DIRECTORY = os.Getenv("PROTOBUF_DIRECTORY")
	Settings.DDL_FILENAME = os.Getenv("DDL_FILENAME")

	if Settings.PROTOBUF_DIRECTORY == "" {
		Settings.PROTOBUF_DIRECTORY = CurrentDirectory()
	}

	if Settings.DDL_FILENAME == "" {
		Settings.DDL_FILENAME = DIRECTORY_DDL_DEFAULT
	}

	Name := ""
	s := ""

	//
	Name = "CONFIG_DIRECTORY_NAME"
	s = Getenv(Name, true)
	Settings.CONFIG_DIRECTORY_NAME = s

	//
	Name = "DB_SCHEMA_NAME"
	s = Getenv(Name, true)
	Settings.DB_SCHEMA_NAME = s

	//
	Name = "INDEX_NAMES_FILENAME"
	s = Getenv(Name, true)
	Settings.INDEX_NAMES_FILENAME = s

	//
	Name = "FILE_PERMISSIONS"
	s = Getenv(Name, true)
	x, err := strconv.Atoi(s)
	if err != nil {
		x = 0666
		log.Error("FILE_PERMISSIONS error: ", err)
	}
	Settings.FILE_PERMISSIONS = fs.FileMode(x)

}

// ChangeCurrentDirectory - устанавливает текущую директорию на директорию откуда запущена программа
// вместо директории где находится программа
func ChangeCurrentDirectory() {
	var err error

	// сменим директорию на текущую
	dir := CurrentDirectory()
	err = os.Chdir(dir)
	if err != nil {
		log.Error("Chdir error: ", err)
	} else {
		log.Info("Chdir: ", dir)
	}

}

// CurrentDirectory - возвращает текущую директорию ОС
func CurrentDirectory() string {
	Otvet, err := os.Getwd()
	if err != nil {
		//log.Println(err)
	}

	return Otvet
}

// FillFlags - заполняет параметры из командной строки
func FillFlags() {
	Args := os.Args[1:]
	if len(Args) > 2 {
		return
	}

	if len(Args) > 0 {
		Settings.PROTOBUF_DIRECTORY = Args[0]
	}
	if len(Args) > 1 {
		Settings.DDL_FILENAME = Args[1]
	}
}

// Getenv - возвращает переменную окружения
func Getenv(Name string, IsRequired bool) string {
	TextError := "Need fill OS environment variable: "
	Otvet := os.Getenv(Name)
	if IsRequired == true && Otvet == "" {
		log.Error(TextError + Name)
	}

	return Otvet
}
