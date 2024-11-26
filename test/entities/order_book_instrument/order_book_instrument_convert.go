package order_book_instrument

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderBookInstrument) ConvertFromProtobuf(i proto.OrderBookInstrument)  {
	m.Depth = i.Depth
	m.InstrumentID = i.InstrumentId

	return
}
