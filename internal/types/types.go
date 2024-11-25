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
	MapColumns   map[string]*Column //map[SQLName]*Column
	NameGo       string
	IsEnum       bool
}

// Column - структура для хранения столбцов
type Column struct {
	SQLName                string
	SQLType                string
	ProtoName              string
	ProtoType              string
	ProtoForeignTableName  string
	ProtoForeignColumnName string
	ProtoForeignColumnType string
	//NameGo              string
	//TypeGo              string
	IsObject     bool
	IsPrimaryKey bool
}

// NewTable - создает новую структуру Table
func NewTable() Table {
	Otvet := Table{}
	Otvet.MapColumns = make(map[string]*Column)

	return Otvet
}
