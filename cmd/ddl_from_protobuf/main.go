package main

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
	"github.com/ManyakRus/ddl_from_protobuf/internal/load_configs"
	"github.com/ManyakRus/ddl_from_protobuf/internal/logic"
	"github.com/ManyakRus/starter/config_main"
)

// main - запуск приложения, все функции
func main() {
	StartApp()
}

// StartApp - запуск приложения
func StartApp() {
	config_main.LoadEnv()

	//заполняем настройки из файла .env
	config.FillSettings()

	//загружаем настройки из файлов
	load_configs.StartAll(&config.Settings)

	//запускаем логику
	logic.StartAll()
}
