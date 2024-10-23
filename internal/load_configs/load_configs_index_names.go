package load_configs

import (
	"encoding/json"
	"fmt"
	"github.com/ManyakRus/starter/log"
	"os"
)

// Load_IndexNames - загружает файл index_names.sql
func Load_IndexNames(Filename string) ([]string, error) {
	Otvet := make([]string, 0)
	var err error

	//загрузка из файла
	byteValue, err := os.ReadFile(Filename)
	if err != nil {
		err = fmt.Errorf("ReadFile(%s) error: %w", Filename, err)
		log.Error(err)
		return Otvet, err
	}

	//парсинг
	err = json.Unmarshal(byteValue, &Otvet)
	if err != nil {
		err = fmt.Errorf("Unmarshal() error: %w", err)
		log.Error(err)
		return Otvet, err
	}

	return Otvet, err
}
