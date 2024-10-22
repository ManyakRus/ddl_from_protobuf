package load_configs

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/constants"
	"github.com/ManyakRus/starter/micro"
	"log"
)

// StartAll - загружает все настройки
func StartAll(Settings *config.SettingsINI) {

	dir := micro.ProgramDir_bin()

	//
	Filename := Settings.PROTOBUF_DIRECTORY + micro.SeparatorFile() + constants.DATEBASE_TYPES_FILENAME
	MapMappings, err := LoadMappings(Filename)
	if err != nil {
		err = fmt.Errorf("LoadMappings(%s) error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.MapMappings = MapMappings

	//
	Filename = dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + constants.COLUMNS_EVERY_TABLE_FILENAME
	s, err := LoadColumnsEveryTable(Filename)
	if err != nil {
		err = fmt.Errorf("LoadMappings(%s) error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.ColumnsEveryTable = s
}
