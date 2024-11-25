package operation

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Operation) ConvertFromProtobuf(i investapi.Operation)  {
	m.AssetUid = i.AssetUid
	m.Currency = i.Currency
	m.Date = i.Date.AsTime()
	m.Figi = i.Figi
	m.ID = i.Id
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.OperationTypeID = int64(i.OperationType)
	m.ParentOperationID = i.ParentOperationId
	m.PaymentCurrency = i.Payment.Currency
	m.PaymentNano = i.Payment.Nano
	m.PaymentUnits = i.Payment.Units
	m.PositionUid = i.PositionUid
	m.PriceCurrency = i.Price.Currency
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.QuantityRest = i.QuantityRest
	m.StateID = int64(i.State)
	m.Trades = i.Trades
	m.Type = i.Type

	return
}
