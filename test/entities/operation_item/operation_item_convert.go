package operation_item

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OperationItem) ConvertFromProtobuf(i proto.OperationItem)  {

	if i.AccruedInt != nil {
		m.AccruedIntCurrency = i.AccruedInt.Currency
	} else {
		m.AccruedIntCurrency = ""
	}


	if i.AccruedInt != nil {
		m.AccruedIntNano = i.AccruedInt.Nano
	} else {
		m.AccruedIntNano = 0
	}


	if i.AccruedInt != nil {
		m.AccruedIntUnits = i.AccruedInt.Units
	} else {
		m.AccruedIntUnits = 0
	}

	m.AssetUid = i.AssetUid
	m.BrokerAccountID = i.BrokerAccountId
	m.CancelDateTime = micro.Date_from_TimestampReference(i.CancelDateTime)
	m.CancelReason = i.CancelReason

	if i.Commission != nil {
		m.CommissionCurrency = i.Commission.Currency
	} else {
		m.CommissionCurrency = ""
	}


	if i.Commission != nil {
		m.CommissionNano = i.Commission.Nano
	} else {
		m.CommissionNano = 0
	}


	if i.Commission != nil {
		m.CommissionUnits = i.Commission.Units
	} else {
		m.CommissionUnits = 0
	}

	m.Cursor = i.Cursor
	m.Date = micro.Date_from_TimestampReference(i.Date)
	m.Description = i.Description
	m.Figi = i.Figi
	m.ID = i.Id
	m.InstrumentKindID = int64(i.InstrumentKind.Number())
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.Name = i.Name
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
	m.QuantityDone = i.QuantityDone
	m.QuantityRest = i.QuantityRest
	m.StateID = int64(i.State.Number())
	m.TypeID = int64(i.Type.Number())

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
