package order_trade

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderTrade) ConvertFromProtobuf(i proto.OrderTrade)  {
	m.DateTime = i.DateTime.AsTime()
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.TradeID = i.TradeId

	return
}
