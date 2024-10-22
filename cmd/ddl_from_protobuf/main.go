package main

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/load_configs"
	"github.com/ManyakRus/ddl_from_protobuf/internal/logic"
	"github.com/ManyakRus/ddl_from_protobuf/pkg/version"
	"github.com/ManyakRus/starter/config_main"
	"github.com/ManyakRus/starter/micro"
)

// main - запуск приложения, все функции
func main() {
	StartApp()
}

// StartApp - запуск приложения
func StartApp() {
	micro.Show_Version(version.Version)

	config_main.LoadEnv()

	//заполняем настройки из файла .env
	config.FillSettings()
	Settings := config.Settings

	//загружаем настройки из файлов
	load_configs.StartAll(&Settings)

	//запускаем логику
	logic.StartAll(Settings)
}
