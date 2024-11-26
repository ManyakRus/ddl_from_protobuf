package operation_trade

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OperationTrade) ConvertFromProtobuf(i proto.OperationTrade)  {
	m.DateTime = i.DateTime.AsTime()
	m.PriceCurrency = i.Price.Currency
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.TradeID = i.TradeId

	return
}
