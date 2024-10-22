package load_configs

import (
	"encoding/json"
	"fmt"
	"github.com/ManyakRus/ddl_from_protobuf/internal/types"
	"os"
)

// LoadMappings process the json for mappings to load sql mappings
func LoadMappings(Filename string) (map[string]types.SQLMapping, error) {
	var Otvet = make(map[string]types.SQLMapping, 0)
	var err error

	byteValue, err := os.ReadFile(Filename)
	if err != nil {
		fmt.Printf("Error loading mapping file %s error: %v\n", Filename, err)
		return Otvet, err
	}

	var Mappings = &types.SQLMappings{}
	err = json.Unmarshal(byteValue, Mappings)
	if err != nil {
		fmt.Printf("Unmarshal() error: %v\n", err)
		return Otvet, err
	}

	for _, value := range Mappings.SQLMappings {
		Otvet[value.SQLType] = *value
	}

	return Otvet, err
}
