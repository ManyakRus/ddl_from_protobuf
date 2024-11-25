package get_dividends_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetDividendsRequest) ConvertFromProtobuf(i investapi.GetDividendsRequest)  {
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.To = i.To.AsTime()

	return
}
