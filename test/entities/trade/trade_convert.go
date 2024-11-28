package trade

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Trade) ConvertFromProtobuf(i proto.Trade)  {
	m.DirectionID = int64(i.Direction.Number())
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid

	if i.Price != nil {
		m.PriceNano = i.Price.Nano
	} else {
		m.PriceNano = 0
	}


	if i.Price != nil {
		m.PriceUnits = i.Price.Units
	} else {
		m.PriceUnits = 0
	}

	m.Quantity = i.Quantity
	m.Time = micro.Date_from_TimestampReference(i.Time)

	return
}
