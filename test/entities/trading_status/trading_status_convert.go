package trading_status

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradingStatus) ConvertFromProtobuf(i investapi.TradingStatus)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LimitOrderAvailableFlag = i.LimitOrderAvailableFlag
	m.MarketOrderAvailableFlag = i.MarketOrderAvailableFlag
	m.Time = i.Time.AsTime()
	m.TradingStatusID = int64(i.TradingStatus)

	return
}
