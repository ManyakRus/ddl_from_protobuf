package types

// SQL_ForeignCount - структура для хранения SQL запросов, для сортировки по кол-ву внешних ключей
type SQL_ForeignCount struct {
	SQL          string
	ForeignCount int //кол-во внешних ключей
}

// Table - структура для хранения таблиц
type Table struct {
	NameSQL      string
	NameProtobuf string
	MapColumns   map[string]*Column //map[NameSQL]*Column
	NameGo       string
	IsEnum       bool
}

// Column - структура для хранения столбцов
type Column struct {
	NameSQL             string
	TypeSQL             string
	NameProtobuf        string
	TypeProtobuf        string
	NameForeignProtobuf string
	TypeForeignProtobuf string
	//NameGo              string
	//TypeGo              string
	IsObject bool
}

// NewTable - создает новую структуру Table
func NewTable() Table {
	Otvet := Table{}
	Otvet.MapColumns = make(map[string]*Column)

	return Otvet
}
