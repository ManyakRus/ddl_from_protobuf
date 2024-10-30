package load_configs

import (
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/constants"
	"github.com/ManyakRus/ddl_from_protobuf/internal/load_configs/load_configs_mapping"
	"github.com/ManyakRus/starter/micro"
	"log"
)

// StartAll - загружает все настройки
func StartAll(Settings *config.SettingsINI) {

	dir := micro.ProgramDir_bin()

	//MapMappings
	Filename := dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + constants.DATEBASE_TYPES_FILENAME
	MapMappings, err := load_configs_mapping.LoadMappings(Filename)
	if err != nil {
		err = fmt.Errorf("LoadMappings(%s) error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.MapMappings = MapMappings

	//TextEveryTableColumns
	Filename = dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + constants.COLUMNS_EVERY_TABLE_FILENAME
	s, err := LoadColumnsEveryTable(Filename)
	if err != nil {
		err = fmt.Errorf("LoadMappings(%s) error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.TextEveryTableColumns = s

	//MassIndexNames
	Filename = dir + Settings.CONFIG_DIRECTORY_NAME + micro.SeparatorFile() + Settings.PRIMARY_KEY_NAMES_FILENAME
	MassIndexNames, err := Load_IndexNames(Filename)
	if err != nil {
		err = fmt.Errorf("LoadMappings(%s) error: %w", Filename, err)
		log.Panic(err)
	}
	Settings.MassIndexNames = MassIndexNames

}
