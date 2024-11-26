package portfolio_position

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PortfolioPosition) ConvertFromProtobuf(i investapi.PortfolioPosition)  {
	m.AveragePositionPriceCurrency = i.AveragePositionPrice.Currency
	m.AveragePositionPriceFifoCurrency = i.AveragePositionPriceFifo.Currency
	m.AveragePositionPriceFifoNano = i.AveragePositionPriceFifo.Nano
	m.AveragePositionPriceFifoUnits = i.AveragePositionPriceFifo.Units
	m.AveragePositionPriceNano = i.AveragePositionPrice.Nano
	m.AveragePositionPriceUnits = i.AveragePositionPrice.Units
	m.Blocked = i.Blocked
	m.BlockedLotsNano = i.BlockedLots.Nano
	m.BlockedLotsUnits = i.BlockedLots.Units
	m.CurrentNkdCurrency = i.CurrentNkd.Currency
	m.CurrentNkdNano = i.CurrentNkd.Nano
	m.CurrentNkdUnits = i.CurrentNkd.Units
	m.CurrentPriceCurrency = i.CurrentPrice.Currency
	m.CurrentPriceNano = i.CurrentPrice.Nano
	m.CurrentPriceUnits = i.CurrentPrice.Units
	m.ExpectedYieldFifoNano = i.ExpectedYieldFifo.Nano
	m.ExpectedYieldFifoUnits = i.ExpectedYieldFifo.Units
	m.ExpectedYieldNano = i.ExpectedYield.Nano
	m.ExpectedYieldUnits = i.ExpectedYield.Units
	m.Figi = i.Figi
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid
	m.QuantityNano = i.Quantity.Nano
	m.QuantityUnits = i.Quantity.Units
	m.VarMarginCurrency = i.VarMargin.Currency
	m.VarMarginNano = i.VarMargin.Nano
	m.VarMarginUnits = i.VarMargin.Units

	return
}
