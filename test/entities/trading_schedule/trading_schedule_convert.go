package trading_schedule

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradingSchedule) ConvertFromProtobuf(i proto.TradingSchedule)  {
	m.Exchange = i.Exchange

	return
}
