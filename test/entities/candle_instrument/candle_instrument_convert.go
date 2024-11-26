package candle_instrument

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *CandleInstrument) ConvertFromProtobuf(i proto.CandleInstrument)  {
	m.InstrumentID = i.InstrumentId
	m.IntervalID = int64(i.Interval.Number())

	return
}
