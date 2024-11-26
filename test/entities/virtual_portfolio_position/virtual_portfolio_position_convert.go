package virtual_portfolio_position

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *VirtualPortfolioPosition) ConvertFromProtobuf(i proto.VirtualPortfolioPosition)  {
	m.AveragePositionPriceCurrency = i.AveragePositionPrice.Currency
	m.AveragePositionPriceFifoCurrency = i.AveragePositionPriceFifo.Currency
	m.AveragePositionPriceFifoNano = i.AveragePositionPriceFifo.Nano
	m.AveragePositionPriceFifoUnits = i.AveragePositionPriceFifo.Units
	m.AveragePositionPriceNano = i.AveragePositionPrice.Nano
	m.AveragePositionPriceUnits = i.AveragePositionPrice.Units
	m.CurrentPriceCurrency = i.CurrentPrice.Currency
	m.CurrentPriceNano = i.CurrentPrice.Nano
	m.CurrentPriceUnits = i.CurrentPrice.Units
	m.ExpectedYieldFifoNano = i.ExpectedYieldFifo.Nano
	m.ExpectedYieldFifoUnits = i.ExpectedYieldFifo.Units
	m.ExpectedYieldNano = i.ExpectedYield.Nano
	m.ExpectedYieldUnits = i.ExpectedYield.Units
	m.ExpireDate = i.ExpireDate.AsTime()
	m.Figi = i.Figi
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid
	m.QuantityNano = i.Quantity.Nano
	m.QuantityUnits = i.Quantity.Units

	return
}
