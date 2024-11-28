package dividend

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Dividend) ConvertFromProtobuf(i proto.Dividend)  {

	if i.ClosePrice != nil {
		m.ClosePriceCurrency = i.ClosePrice.Currency
	} else {
		m.ClosePriceCurrency = ""
	}


	if i.ClosePrice != nil {
		m.ClosePriceNano = i.ClosePrice.Nano
	} else {
		m.ClosePriceNano = 0
	}


	if i.ClosePrice != nil {
		m.ClosePriceUnits = i.ClosePrice.Units
	} else {
		m.ClosePriceUnits = 0
	}

	m.CreatedAt = micro.Date_from_TimestampReference(i.CreatedAt)
	m.DeclaredDate = micro.Date_from_TimestampReference(i.DeclaredDate)

	if i.DividendNet != nil {
		m.DividendNetCurrency = i.DividendNet.Currency
	} else {
		m.DividendNetCurrency = ""
	}


	if i.DividendNet != nil {
		m.DividendNetNano = i.DividendNet.Nano
	} else {
		m.DividendNetNano = 0
	}


	if i.DividendNet != nil {
		m.DividendNetUnits = i.DividendNet.Units
	} else {
		m.DividendNetUnits = 0
	}

	m.DividendType = i.DividendType
	m.LastBuyDate = micro.Date_from_TimestampReference(i.LastBuyDate)
	m.PaymentDate = micro.Date_from_TimestampReference(i.PaymentDate)
	m.RecordDate = micro.Date_from_TimestampReference(i.RecordDate)
	m.Regularity = i.Regularity

	if i.YieldValue != nil {
		m.YieldValueNano = i.YieldValue.Nano
	} else {
		m.YieldValueNano = 0
	}


	if i.YieldValue != nil {
		m.YieldValueUnits = i.YieldValue.Units
	} else {
		m.YieldValueUnits = 0
	}


	return
}
