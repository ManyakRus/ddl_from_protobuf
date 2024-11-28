package trading_status

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradingStatus) ConvertFromProtobuf(i proto.TradingStatus)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LimitOrderAvailableFlag = i.LimitOrderAvailableFlag
	m.MarketOrderAvailableFlag = i.MarketOrderAvailableFlag
	m.Time = micro.Date_from_TimestampReference(i.Time)
	m.TradingStatusID = int64(i.TradingStatus.Number())

	return
}
