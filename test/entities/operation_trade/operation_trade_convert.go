package operation_trade

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OperationTrade) ConvertFromProtobuf(i investapi.OperationTrade)  {
	m.DateTime = i.DateTime.AsTime()
	m.PriceCurrency = i.Price.Currency
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.TradeID = i.TradeId

	return
}
