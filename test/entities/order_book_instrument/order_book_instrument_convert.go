package order_book_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderBookInstrument) ConvertFromProtobuf(i investapi.OrderBookInstrument)  {
	m.Depth = i.Depth
	m.InstrumentID = i.InstrumentId

	return
}
