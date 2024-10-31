package types

// SQL_ForeignCount - структура для хранения SQL запросов, для сортировки по кол-ву внешних ключей
type SQL_ForeignCount struct {
	SQL          string
	ForeignCount int //кол-во внешних ключей
}
