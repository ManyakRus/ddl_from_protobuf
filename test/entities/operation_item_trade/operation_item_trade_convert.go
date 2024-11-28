package operation_item_trade

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OperationItemTrade) ConvertFromProtobuf(i proto.OperationItemTrade)  {
	m.Date = micro.Date_from_TimestampReference(i.Date)
	m.Num = i.Num

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

	m.Quantity = i.Quantity

	if i.Yield != nil {
		m.YieldCurrency = i.Yield.Currency
	} else {
		m.YieldCurrency = ""
	}


	if i.Yield != nil {
		m.YieldNano = i.Yield.Nano
	} else {
		m.YieldNano = 0
	}


	if i.YieldRelative != nil {
		m.YieldRelativeNano = i.YieldRelative.Nano
	} else {
		m.YieldRelativeNano = 0
	}


	if i.YieldRelative != nil {
		m.YieldRelativeUnits = i.YieldRelative.Units
	} else {
		m.YieldRelativeUnits = 0
	}


	if i.Yield != nil {
		m.YieldUnits = i.Yield.Units
	} else {
		m.YieldUnits = 0
	}


	return
}
