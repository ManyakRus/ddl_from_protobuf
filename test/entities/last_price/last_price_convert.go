package last_price

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *LastPrice) ConvertFromProtobuf(i investapi.LastPrice)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Time = i.Time.AsTime()

	return
}
