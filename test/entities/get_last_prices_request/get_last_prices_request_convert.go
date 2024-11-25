package get_last_prices_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetLastPricesRequest) ConvertFromProtobuf(i investapi.GetLastPricesRequest)  {
	m.Figi = i.Figi
	m.InstrumentID = i.InstrumentId

	return
}
