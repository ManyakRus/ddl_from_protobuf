package position_data

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionData) ConvertFromProtobuf(i proto.PositionData)  {
	m.AccountID = i.AccountId
	m.Date = micro.Date_from_TimestampReference(i.Date)

	return
}
