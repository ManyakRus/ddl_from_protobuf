package trading_status

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradingStatus) ConvertFromProtobuf(i proto.TradingStatus)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LimitOrderAvailableFlag = i.LimitOrderAvailableFlag
	m.MarketOrderAvailableFlag = i.MarketOrderAvailableFlag
	m.Time = i.Time.AsTime()
	m.TradingStatusID = int64(i.TradingStatus.Number())

	return
}
