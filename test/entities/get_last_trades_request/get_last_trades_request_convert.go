package get_last_trades_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetLastTradesRequest) ConvertFromProtobuf(i investapi.GetLastTradesRequest)  {
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.InstrumentID = i.InstrumentId
	m.To = i.To.AsTime()

	return
}
