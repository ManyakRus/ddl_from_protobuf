package positions_options

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsOptions) ConvertFromProtobuf(i proto.PositionsOptions)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
