package trade_instrument

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradeInstrument) ConvertFromProtobuf(i proto.TradeInstrument)  {
	m.InstrumentID = i.InstrumentId

	return
}
