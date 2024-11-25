package post_order_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PostOrderRequest) ConvertFromProtobuf(i investapi.PostOrderRequest)  {
	m.AccountID = i.AccountId
	m.DirectionID = int64(i.Direction)
	m.Figi = i.Figi
	m.InstrumentID = i.InstrumentId
	m.OrderID = i.OrderId
	m.OrderTypeID = int64(i.OrderType)
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity

	return
}
