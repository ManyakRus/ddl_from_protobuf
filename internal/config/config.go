package config

import (
	"github.com/ManyakRus/starter/log"
	"os"
)

const DIRECTORY_DDL_DEFAULT = "ddl"

// Settings хранит все нужные переменные окружения
var Settings SettingsINI

// SettingsINI - структура для хранения всех нужных переменных окружения
type SettingsINI struct {
	DIRECTORY_PROTOBUF string
	DIRECTORY_DDL      string
}

// FillSettings загружает переменные окружения в структуру из переменных окружения
func FillSettings() {
	//сменим текущую директорию чтоб работали локальные пути
	ChangeCurrentDirectory()

	//
	Settings = SettingsINI{}
	Settings.DIRECTORY_PROTOBUF = os.Getenv("DIRECTORY_PROTOBUF")
	Settings.DIRECTORY_DDL = os.Getenv("DIRECTORY_DDL")

	if Settings.DIRECTORY_PROTOBUF == "" {
		Settings.DIRECTORY_PROTOBUF = CurrentDirectory()
		//log.Panicln("Need fill DIRECTORY_PROTOBUF ! in os.ENV ")
	}

	if Settings.DIRECTORY_DDL == "" {
		Settings.DIRECTORY_DDL = DIRECTORY_DDL_DEFAULT
	}

	//
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
		Settings.DIRECTORY_PROTOBUF = Args[0]
	}
	if len(Args) > 1 {
		Settings.DIRECTORY_DDL = Args[1]
	}
}
