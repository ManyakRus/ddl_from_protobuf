package trade

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Trade) ConvertFromProtobuf(i investapi.Trade)  {
	m.DirectionID = int64(i.Direction)
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.Time = i.Time.AsTime()

	return
}
