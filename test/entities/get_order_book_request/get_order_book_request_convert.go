package get_order_book_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetOrderBookRequest) ConvertFromProtobuf(i investapi.GetOrderBookRequest)  {
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentID = i.InstrumentId

	return
}
