package tinkoff_positions_securities

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsSecurities) ConvertFromProtobuf(i proto.PositionsSecurities)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.ExchangeBlocked = i.ExchangeBlocked
	m.Figi = i.Figi
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
