package stop_order

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *StopOrder) ConvertFromProtobuf(i proto.StopOrder)  {
	m.ActivationDateTime = i.ActivationDateTime.AsTime()
	m.CreateDate = i.CreateDate.AsTime()
	m.Currency = i.Currency
	m.DirectionID = int64(i.Direction.Number())
	m.ExpirationTime = i.ExpirationTime.AsTime()
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LotsRequested = i.LotsRequested
	m.OrderTypeID = int64(i.OrderType.Number())

	if i.Price != nil {
		m.PriceCurrency = i.Price.Currency
	} else {
		m.PriceCurrency = ""
	}


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

	m.StopOrderID = i.StopOrderId

	if i.StopPrice != nil {
		m.StopPriceCurrency = i.StopPrice.Currency
	} else {
		m.StopPriceCurrency = ""
	}


	if i.StopPrice != nil {
		m.StopPriceNano = i.StopPrice.Nano
	} else {
		m.StopPriceNano = 0
	}


	if i.StopPrice != nil {
		m.StopPriceUnits = i.StopPrice.Units
	} else {
		m.StopPriceUnits = 0
	}


	return
}
