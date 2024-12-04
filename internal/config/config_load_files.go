package config

import (
	"fmt"
	"github.com/ManyakRus/starter/log"
	"github.com/ManyakRus/starter/micro"
	"os"
)

func LoadFiles(Settings *SettingsINI) {
	LoadFiles_TextEveryTable(Settings)
	LoadFiles_TextAfterEveryTable(Settings)
}

// LoadFiles_TextEveryTable - загружает текст для каждой таблицы
func LoadFiles_TextEveryTable(Settings *SettingsINI) {
	Filename := Settings.TEXT_EVERY_TABLE_FILENAME
	if Filename == "" {
		return
	}
	Dir := micro.ProgramDir_bin()
	DirConfig := Dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile()
	Filename = DirConfig + Filename

	//
	ok, _ := micro.FileExists(Filename)
	if ok == false {
		log.Errorln("File not found: " + Filename)
		return
	}

	//
	bytes, err := os.ReadFile(Filename)
	if err != nil {
		err = fmt.Errorf("ReadFile() filename: %s error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.TEXT_EVERY_TABLE = string(bytes)
}

// LoadFiles_TextAfterEveryTable - загружает текст для каждой таблицы
func LoadFiles_TextAfterEveryTable(Settings *SettingsINI) {
	Filename := Settings.TEXT_AFTER_EVERY_TABLE_FILENAME
	if Filename == "" {
		return
	}

	Dir := micro.ProgramDir_bin()
	DirConfig := Dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile()
	Filename = DirConfig + Filename

	//
	ok, _ := micro.FileExists(Filename)
	if ok == false {
		log.Errorln("File not found: " + Filename)
		return
	}
	//
	bytes, err := os.ReadFile(Filename)
	if err != nil {
		err = fmt.Errorf("ReadFile() filename: %s error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.TEXT_AFTER_EVERY_TABLE = string(bytes)
}
