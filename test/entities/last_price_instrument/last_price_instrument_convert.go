package last_price_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *LastPriceInstrument) ConvertFromProtobuf(i investapi.LastPriceInstrument)  {
	m.InstrumentID = i.InstrumentId

	return
}
