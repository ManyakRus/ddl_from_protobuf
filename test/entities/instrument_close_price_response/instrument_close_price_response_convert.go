package instrument_close_price_response

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InstrumentClosePriceResponse) ConvertFromProtobuf(i investapi.InstrumentClosePriceResponse)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Time = i.Time.AsTime()

	return
}
