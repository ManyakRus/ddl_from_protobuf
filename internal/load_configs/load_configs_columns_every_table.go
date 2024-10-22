package load_configs

import (
	"fmt"
	"github.com/ManyakRus/starter/log"
	"os"
)

// LoadColumnsEveryTable - загружает файл columns_every_table.sql
func LoadColumnsEveryTable(Filename string) (string, error) {
	Otvet := ""
	var err error

	byteValue, err := os.ReadFile(Filename)
	if err != nil {
		err = fmt.Errorf("ReadFile(%s) error: %w", Filename, err)
		log.Error(err)
		return Otvet, err
	}

	Otvet = string(byteValue)

	return Otvet, err
}
