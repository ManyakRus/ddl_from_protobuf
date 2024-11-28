package operation

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Operation) ConvertFromProtobuf(i proto.Operation)  {
	m.AssetUid = i.AssetUid
	m.Currency = i.Currency
	m.Date = micro.Date_from_TimestampReference(i.Date)
	m.Figi = i.Figi
	m.ID = i.Id
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.OperationTypeID = int64(i.OperationType.Number())
	m.ParentOperationID = i.ParentOperationId

	if i.Payment != nil {
		m.PaymentCurrency = i.Payment.Currency
	} else {
		m.PaymentCurrency = ""
	}


	if i.Payment != nil {
		m.PaymentNano = i.Payment.Nano
	} else {
		m.PaymentNano = 0
	}


	if i.Payment != nil {
		m.PaymentUnits = i.Payment.Units
	} else {
		m.PaymentUnits = 0
	}

	m.PositionUid = i.PositionUid

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
	m.QuantityRest = i.QuantityRest
	m.StateID = int64(i.State.Number())
	m.Type = i.Type

	return
}
