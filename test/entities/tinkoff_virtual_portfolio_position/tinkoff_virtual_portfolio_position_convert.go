package tinkoff_virtual_portfolio_position

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *VirtualPortfolioPosition) ConvertFromProtobuf(i proto.VirtualPortfolioPosition)  {

	if i.AveragePositionPrice != nil {
		m.AveragePositionPriceCurrency = i.AveragePositionPrice.Currency
	} else {
		m.AveragePositionPriceCurrency = ""
	}


	if i.AveragePositionPriceFifo != nil {
		m.AveragePositionPriceFifoCurrency = i.AveragePositionPriceFifo.Currency
	} else {
		m.AveragePositionPriceFifoCurrency = ""
	}


	if i.AveragePositionPriceFifo != nil {
		m.AveragePositionPriceFifoNano = i.AveragePositionPriceFifo.Nano
	} else {
		m.AveragePositionPriceFifoNano = 0
	}


	if i.AveragePositionPriceFifo != nil {
		m.AveragePositionPriceFifoUnits = i.AveragePositionPriceFifo.Units
	} else {
		m.AveragePositionPriceFifoUnits = 0
	}


	if i.AveragePositionPrice != nil {
		m.AveragePositionPriceNano = i.AveragePositionPrice.Nano
	} else {
		m.AveragePositionPriceNano = 0
	}


	if i.AveragePositionPrice != nil {
		m.AveragePositionPriceUnits = i.AveragePositionPrice.Units
	} else {
		m.AveragePositionPriceUnits = 0
	}


	if i.CurrentPrice != nil {
		m.CurrentPriceCurrency = i.CurrentPrice.Currency
	} else {
		m.CurrentPriceCurrency = ""
	}


	if i.CurrentPrice != nil {
		m.CurrentPriceNano = i.CurrentPrice.Nano
	} else {
		m.CurrentPriceNano = 0
	}


	if i.CurrentPrice != nil {
		m.CurrentPriceUnits = i.CurrentPrice.Units
	} else {
		m.CurrentPriceUnits = 0
	}


	if i.ExpectedYieldFifo != nil {
		m.ExpectedYieldFifoNano = i.ExpectedYieldFifo.Nano
	} else {
		m.ExpectedYieldFifoNano = 0
	}


	if i.ExpectedYieldFifo != nil {
		m.ExpectedYieldFifoUnits = i.ExpectedYieldFifo.Units
	} else {
		m.ExpectedYieldFifoUnits = 0
	}


	if i.ExpectedYield != nil {
		m.ExpectedYieldNano = i.ExpectedYield.Nano
	} else {
		m.ExpectedYieldNano = 0
	}


	if i.ExpectedYield != nil {
		m.ExpectedYieldUnits = i.ExpectedYield.Units
	} else {
		m.ExpectedYieldUnits = 0
	}

	m.ExpireDate = micro.Date_from_TimestampReference(i.ExpireDate)
	m.Figi = i.Figi
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	if i.Quantity != nil {
		m.QuantityNano = i.Quantity.Nano
	} else {
		m.QuantityNano = 0
	}


	if i.Quantity != nil {
		m.QuantityUnits = i.Quantity.Units
	} else {
		m.QuantityUnits = 0
	}


	return
}
