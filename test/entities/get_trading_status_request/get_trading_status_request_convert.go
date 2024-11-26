package get_trading_status_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetTradingStatusRequest) ConvertFromProtobuf(i investapi.GetTradingStatusRequest)  {
	m.InstrumentID = i.InstrumentId

	return
}
