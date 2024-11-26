package stop_order

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *StopOrder) ConvertFromProtobuf(i investapi.StopOrder)  {
	m.ActivationDateTime = i.ActivationDateTime.AsTime()
	m.CreateDate = i.CreateDate.AsTime()
	m.Currency = i.Currency
	m.DirectionID = int64(i.Direction.Number())
	m.ExpirationTime = i.ExpirationTime.AsTime()
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LotsRequested = i.LotsRequested
	m.OrderTypeID = int64(i.OrderType.Number())
	m.PriceCurrency = i.Price.Currency
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.StopOrderID = i.StopOrderId
	m.StopPriceCurrency = i.StopPrice.Currency
	m.StopPriceNano = i.StopPrice.Nano
	m.StopPriceUnits = i.StopPrice.Units

	return
}
