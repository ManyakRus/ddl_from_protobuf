package candle_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *CandleInstrument) ConvertFromProtobuf(i investapi.CandleInstrument)  {
	m.Figi = i.Figi
	m.InstrumentID = i.InstrumentId
	m.IntervalID = int64(i.Interval)

	return
}
