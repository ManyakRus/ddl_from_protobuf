package get_trading_status_response

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetTradingStatusResponse) ConvertFromProtobuf(i investapi.GetTradingStatusResponse)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LimitOrderAvailableFlag = i.LimitOrderAvailableFlag
	m.MarketOrderAvailableFlag = i.MarketOrderAvailableFlag
	m.TradingStatusID = int64(i.TradingStatus.Number())

	return
}
