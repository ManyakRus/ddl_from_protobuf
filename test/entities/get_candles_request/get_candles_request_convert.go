package get_candles_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetCandlesRequest) ConvertFromProtobuf(i investapi.GetCandlesRequest)  {
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.InstrumentID = i.InstrumentId
	m.IntervalID = int64(i.Interval)
	m.To = i.To.AsTime()

	return
}
