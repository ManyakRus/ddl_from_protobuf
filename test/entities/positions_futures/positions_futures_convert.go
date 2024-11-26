package positions_futures

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsFutures) ConvertFromProtobuf(i proto.PositionsFutures)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
