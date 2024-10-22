package load_configs

import (
	"encoding/json"
	"fmt"
	"os"
)

// SQLMappings mappings for sql types to json, go etc
type SQLMappings struct {
	SQLMappings []*SQLMapping `json:"mappings"`
}

// SQLMapping mapping
type SQLMapping struct {
	// SQLType sql type reported from db
	SQLType string `json:"sql_type"`

	// GoType mapped go type
	GoType string `json:"go_type"`

	// JSONType mapped json type
	JSONType string `json:"json_type"`

	// ProtobufType mapped protobuf type
	ProtobufType string `json:"protobuf_type"`

	// GureguType mapped go type using Guregu
	GureguType string `json:"guregu_type"`

	// GoNullableType mapped go type using nullable
	GoNullableType string `json:"go_nullable_type"`

	// SwaggerType mapped type
	SwaggerType string `json:"swagger_type"`
}

// LoadMappings process the json for mappings to load sql mappings
func LoadMappings(Filename string) (map[string]SQLMapping, error) {
	var Otvet = make(map[string]SQLMapping, 0)
	var err error

	byteValue, err := os.ReadFile(Filename)
	if err != nil {
		fmt.Printf("Error loading mapping file %s error: %v\n", Filename, err)
		return Otvet, err
	}

	var Mappings = &SQLMappings{}
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
