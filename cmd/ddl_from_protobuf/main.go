package main

import (
	"github.com/ManyakRus/ddl_from_protobuf/internal/config"
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

	config.FillSettings()

	logic.StartAll()
}
