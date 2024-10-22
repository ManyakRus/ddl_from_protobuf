package load_configs

import (
	"fmt"
	"os"
)

// LoadColumnsEveryTable - загружает файл columns_every_table.sql
func LoadColumnsEveryTable(Filename string) (string, error) {
	Otvet := ""
	var err error

	byteValue, err := os.ReadFile(Filename)
	if err != nil {
		fmt.Printf("ReadFile(%s) error: %v", Filename, err)
		return Otvet, err
	}

	Otvet = string(byteValue)

	return Otvet, err
}
