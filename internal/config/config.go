package config

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/load_configs/load_configs_mapping"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"io/fs"
	"os"
	"strconv"
)

const DIRECTORY_DDL_DEFAULT = "ddl"

// Settings хранит все нужные переменные окружения
var Settings SettingsINI

// SettingsINI - структура для хранения всех нужных переменных окружения
type SettingsINI struct {
	PROTOBUF_DIRECTORY                             string
	DDL_FILENAME                                   string
	CONFIG_DIRECTORY_NAME                          string
	MapSQLTypes                                    map[string]load_configs_mapping.SQLMapping //map[ProtoType]SQLMapping
	TextEveryTableColumns                          string
	DB_SCHEMA_NAME                                 string
	MapMessages                                    map[string]*types.MessageElement
	MapEnums                                       map[string]*types.EnumElement
	MassIndexNames                                 []string
	PRIMARY_KEY_NAMES_FILENAME                     string
	FILE_PERMISSIONS                               fs.FileMode //= 0666
	ENUMS_ID_COLUMN_NAME                           string
	ENUMS_NAME_COLUMN_NAME                         string
	REPOSITORY_PROTO_URL                           string
	CONVERT_FOLDER_NAME                            string
	NEED_CREATE_CONVERT_FILES                      bool
	FILTER_MESSAGE_NAME                            string
	FILTER_ENUM_NAME                               string
	SUFFIX_CONVERT                                 string
	EXCLUDE_MESSAGE_NAME                           string
	NEED_IGNORE_MESSAGES_WITHOUT_PRIMARY_KEY       bool
	NEED_CREATE_ENUM_TABLES                        bool
	NEED_CREATE_MESSAGE_TABLES                     bool
	NEED_CREATE_MESSAGE_TABLES_WITH_PRIMARY_KEY    bool
	NEED_CREATE_MESSAGE_TABLES_WITHOUT_PRIMARY_KEY bool
}

// CreateSettings - создает структуру типа SettingsINI
func CreateSettings() SettingsINI {
	Otvet := SettingsINI{}
	Otvet.MapSQLTypes = make(map[string]load_configs_mapping.SQLMapping)
	Otvet.MapMessages = make(map[string]*types.MessageElement)
	Otvet.MapEnums = make(map[string]*types.EnumElement)
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
	Name = "PRIMARY_KEY_NAMES_FILENAME"
	s = Getenv(Name, true)
	Settings.PRIMARY_KEY_NAMES_FILENAME = s

	//
	Name = "FILE_PERMISSIONS"
	s = Getenv(Name, true)
	x, err := strconv.Atoi(s)
	if err != nil {
		x = 0666
		log.Error("FILE_PERMISSIONS error: ", err)
	}
	Settings.FILE_PERMISSIONS = fs.FileMode(x)

	//
	Name = "ENUMS_ID_COLUMN_NAME"
	s = Getenv(Name, true)
	Settings.ENUMS_ID_COLUMN_NAME = s

	//
	Name = "ENUMS_NAME_COLUMN_NAME"
	s = Getenv(Name, true)
	Settings.ENUMS_NAME_COLUMN_NAME = s

	//
	Name = "REPOSITORY_PROTO_URL"
	s = Getenv(Name, true)
	Settings.REPOSITORY_PROTO_URL = s

	//
	Name = "CONVERT_FOLDER_NAME"
	s = Getenv(Name, true)
	Settings.CONVERT_FOLDER_NAME = s

	//
	Name = "NEED_CREATE_CONVERT_FILES"
	s = Getenv(Name, true)
	Settings.NEED_CREATE_CONVERT_FILES = micro.BoolFromString(s)

	//
	Name = "FILTER_MESSAGE_NAME"
	s = Getenv(Name, false)
	Settings.FILTER_MESSAGE_NAME = s

	//
	Name = "FILTER_ENUM_NAME"
	s = Getenv(Name, false)
	Settings.FILTER_ENUM_NAME = s

	//
	Name = "SUFFIX_CONVERT"
	s = Getenv(Name, false)
	Settings.SUFFIX_CONVERT = s

	//
	Name = "EXCLUDE_MESSAGE_NAME"
	s = Getenv(Name, false)
	Settings.EXCLUDE_MESSAGE_NAME = s

	//
	Name = "NEED_IGNORE_MESSAGES_WITHOUT_PRIMARY_KEY"
	s = Getenv(Name, true)
	Settings.NEED_IGNORE_MESSAGES_WITHOUT_PRIMARY_KEY = micro.BoolFromString(s)

	//
	Name = "NEED_CREATE_ENUM_TABLES"
	s = Getenv(Name, true)
	Settings.NEED_CREATE_ENUM_TABLES = micro.BoolFromString(s)

	//
	Name = "NEED_CREATE_MESSAGE_TABLES"
	s = Getenv(Name, true)
	Settings.NEED_CREATE_MESSAGE_TABLES = micro.BoolFromString(s)

	//
	Name = "NEED_CREATE_MESSAGE_TABLES_WITH_PRIMARY_KEY"
	s = Getenv(Name, true)
	Settings.NEED_CREATE_MESSAGE_TABLES_WITH_PRIMARY_KEY = micro.BoolFromString(s)

	//
	Name = "NEED_CREATE_MESSAGE_TABLES_WITHOUT_PRIMARY_KEY"
	s = Getenv(Name, true)
	Settings.NEED_CREATE_MESSAGE_TABLES_WITHOUT_PRIMARY_KEY = micro.BoolFromString(s)

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
