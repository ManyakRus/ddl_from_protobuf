package trade_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradeInstrument) ConvertFromProtobuf(i investapi.TradeInstrument)  {
	m.Figi = i.Figi
	m.InstrumentID = i.InstrumentId

	return
}
