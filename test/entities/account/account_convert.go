package account

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Account) ConvertFromProtobuf(i proto.Account)  {
	m.AccessLevelID = int64(i.AccessLevel.Number())
	m.ClosedDate = i.ClosedDate.AsTime()
	m.ID = i.Id
	m.Name = i.Name
	m.OpenedDate = i.OpenedDate.AsTime()
	m.StatusID = int64(i.Status.Number())
	m.TypeID = int64(i.Type.Number())

	return
}
