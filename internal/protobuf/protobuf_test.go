package protobuf

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/starter/config_main"
	"github.com/ManyakRus/starter/micro"
	"testing"
)

func TestFindProtobufAll(t *testing.T) {
	config_main.LoadEnv()

	//заполняем настройки из файла .env
	config.FillSettings()

	dir := micro.ProgramDir() + config.Settings.PROTOBUF_DIRECTORY
	FindProtobufAll(dir)
}
