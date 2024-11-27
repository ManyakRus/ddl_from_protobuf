package order_state

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderState) ConvertFromProtobuf(i proto.OrderState)  {

	if i.AveragePositionPrice != nil {
		m.AveragePositionPriceCurrency = i.AveragePositionPrice.Currency
	} else {
		m.AveragePositionPriceCurrency = ""
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

	m.Currency = i.Currency
	m.DirectionID = int64(i.Direction.Number())

	if i.ExecutedCommission != nil {
		m.ExecutedCommissionCurrency = i.ExecutedCommission.Currency
	} else {
		m.ExecutedCommissionCurrency = ""
	}


	if i.ExecutedCommission != nil {
		m.ExecutedCommissionNano = i.ExecutedCommission.Nano
	} else {
		m.ExecutedCommissionNano = 0
	}


	if i.ExecutedCommission != nil {
		m.ExecutedCommissionUnits = i.ExecutedCommission.Units
	} else {
		m.ExecutedCommissionUnits = 0
	}


	if i.ExecutedOrderPrice != nil {
		m.ExecutedOrderPriceCurrency = i.ExecutedOrderPrice.Currency
	} else {
		m.ExecutedOrderPriceCurrency = ""
	}


	if i.ExecutedOrderPrice != nil {
		m.ExecutedOrderPriceNano = i.ExecutedOrderPrice.Nano
	} else {
		m.ExecutedOrderPriceNano = 0
	}


	if i.ExecutedOrderPrice != nil {
		m.ExecutedOrderPriceUnits = i.ExecutedOrderPrice.Units
	} else {
		m.ExecutedOrderPriceUnits = 0
	}

	m.ExecutionReportStatusID = int64(i.ExecutionReportStatus.Number())
	m.Figi = i.Figi

	if i.InitialCommission != nil {
		m.InitialCommissionCurrency = i.InitialCommission.Currency
	} else {
		m.InitialCommissionCurrency = ""
	}


	if i.InitialCommission != nil {
		m.InitialCommissionNano = i.InitialCommission.Nano
	} else {
		m.InitialCommissionNano = 0
	}


	if i.InitialCommission != nil {
		m.InitialCommissionUnits = i.InitialCommission.Units
	} else {
		m.InitialCommissionUnits = 0
	}


	if i.InitialOrderPrice != nil {
		m.InitialOrderPriceCurrency = i.InitialOrderPrice.Currency
	} else {
		m.InitialOrderPriceCurrency = ""
	}


	if i.InitialOrderPrice != nil {
		m.InitialOrderPriceNano = i.InitialOrderPrice.Nano
	} else {
		m.InitialOrderPriceNano = 0
	}


	if i.InitialOrderPrice != nil {
		m.InitialOrderPriceUnits = i.InitialOrderPrice.Units
	} else {
		m.InitialOrderPriceUnits = 0
	}


	if i.InitialSecurityPrice != nil {
		m.InitialSecurityPriceCurrency = i.InitialSecurityPrice.Currency
	} else {
		m.InitialSecurityPriceCurrency = ""
	}


	if i.InitialSecurityPrice != nil {
		m.InitialSecurityPriceNano = i.InitialSecurityPrice.Nano
	} else {
		m.InitialSecurityPriceNano = 0
	}


	if i.InitialSecurityPrice != nil {
		m.InitialSecurityPriceUnits = i.InitialSecurityPrice.Units
	} else {
		m.InitialSecurityPriceUnits = 0
	}

	m.InstrumentUid = i.InstrumentUid
	m.LotsExecuted = i.LotsExecuted
	m.LotsRequested = i.LotsRequested
	m.OrderDate = i.OrderDate.AsTime()
	m.OrderID = i.OrderId
	m.OrderRequestID = i.OrderRequestId
	m.OrderTypeID = int64(i.OrderType.Number())

	if i.ServiceCommission != nil {
		m.ServiceCommissionCurrency = i.ServiceCommission.Currency
	} else {
		m.ServiceCommissionCurrency = ""
	}


	if i.ServiceCommission != nil {
		m.ServiceCommissionNano = i.ServiceCommission.Nano
	} else {
		m.ServiceCommissionNano = 0
	}


	if i.ServiceCommission != nil {
		m.ServiceCommissionUnits = i.ServiceCommission.Units
	} else {
		m.ServiceCommissionUnits = 0
	}


	if i.TotalOrderAmount != nil {
		m.TotalOrderAmountCurrency = i.TotalOrderAmount.Currency
	} else {
		m.TotalOrderAmountCurrency = ""
	}


	if i.TotalOrderAmount != nil {
		m.TotalOrderAmountNano = i.TotalOrderAmount.Nano
	} else {
		m.TotalOrderAmountNano = 0
	}


	if i.TotalOrderAmount != nil {
		m.TotalOrderAmountUnits = i.TotalOrderAmount.Units
	} else {
		m.TotalOrderAmountUnits = 0
	}


	return
}
