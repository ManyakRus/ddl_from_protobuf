package trade

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Trade) ConvertFromProtobuf(i proto.Trade)  {
	m.DirectionID = int64(i.Direction.Number())
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.Time = i.Time.AsTime()

	return
}
