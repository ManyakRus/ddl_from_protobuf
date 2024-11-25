package account

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Account) ConvertFromProtobuf(i investapi.Account)  {
	m.AccessLevelID = int64(i.AccessLevel)
	m.ClosedDate = i.ClosedDate.AsTime()
	m.ID = i.Id
	m.Name = i.Name
	m.OpenedDate = i.OpenedDate.AsTime()
	m.StatusID = int64(i.Status)
	m.TypeID = int64(i.Type)

	return
}
