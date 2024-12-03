package tinkoff_order_trade

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderTrade) ConvertFromProtobuf(i proto.OrderTrade)  {
	m.DateTime = micro.Date_from_TimestampReference(i.DateTime)

	if i.Price != nil {
		m.PriceNano = i.Price.Nano
	} else {
		m.PriceNano = 0
	}


	if i.Price != nil {
		m.PriceUnits = i.Price.Units
	} else {
		m.PriceUnits = 0
	}

	m.Quantity = i.Quantity
	m.TradeID = i.TradeId

	return
}
