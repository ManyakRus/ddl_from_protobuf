package last_price_instrument

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *LastPriceInstrument) ConvertFromProtobuf(i proto.LastPriceInstrument)  {
	m.InstrumentID = i.InstrumentId

	return
}
