package tinkoff_account

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffAccount) ConvertFromProtobuf(i proto.TinkoffAccount)  {
	m.AccessLevelID = int64(i.AccessLevel.Number())
	m.ClosedDate = micro.Date_from_TimestampReference(i.ClosedDate)
	m.ID = i.Id
	m.Name = i.Name
	m.OpenedDate = micro.Date_from_TimestampReference(i.OpenedDate)
	m.StatusID = int64(i.Status.Number())
	m.TypeID = int64(i.Type.Number())

	return
}
