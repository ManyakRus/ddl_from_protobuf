package tinkoff_positions_futures

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffPositionsFutures) ConvertFromProtobuf(i proto.TinkoffPositionsFutures)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
