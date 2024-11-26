package order_state

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderState) ConvertFromProtobuf(i proto.OrderState)  {
	m.AveragePositionPriceCurrency = i.AveragePositionPrice.Currency
	m.AveragePositionPriceNano = i.AveragePositionPrice.Nano
	m.AveragePositionPriceUnits = i.AveragePositionPrice.Units
	m.Currency = i.Currency
	m.DirectionID = int64(i.Direction.Number())
	m.ExecutedCommissionCurrency = i.ExecutedCommission.Currency
	m.ExecutedCommissionNano = i.ExecutedCommission.Nano
	m.ExecutedCommissionUnits = i.ExecutedCommission.Units
	m.ExecutedOrderPriceCurrency = i.ExecutedOrderPrice.Currency
	m.ExecutedOrderPriceNano = i.ExecutedOrderPrice.Nano
	m.ExecutedOrderPriceUnits = i.ExecutedOrderPrice.Units
	m.ExecutionReportStatusID = int64(i.ExecutionReportStatus.Number())
	m.Figi = i.Figi
	m.InitialCommissionCurrency = i.InitialCommission.Currency
	m.InitialCommissionNano = i.InitialCommission.Nano
	m.InitialCommissionUnits = i.InitialCommission.Units
	m.InitialOrderPriceCurrency = i.InitialOrderPrice.Currency
	m.InitialOrderPriceNano = i.InitialOrderPrice.Nano
	m.InitialOrderPriceUnits = i.InitialOrderPrice.Units
	m.InitialSecurityPriceCurrency = i.InitialSecurityPrice.Currency
	m.InitialSecurityPriceNano = i.InitialSecurityPrice.Nano
	m.InitialSecurityPriceUnits = i.InitialSecurityPrice.Units
	m.InstrumentUid = i.InstrumentUid
	m.LotsExecuted = i.LotsExecuted
	m.LotsRequested = i.LotsRequested
	m.OrderDate = i.OrderDate.AsTime()
	m.OrderID = i.OrderId
	m.OrderRequestID = i.OrderRequestId
	m.OrderTypeID = int64(i.OrderType.Number())
	m.ServiceCommissionCurrency = i.ServiceCommission.Currency
	m.ServiceCommissionNano = i.ServiceCommission.Nano
	m.ServiceCommissionUnits = i.ServiceCommission.Units
	m.TotalOrderAmountCurrency = i.TotalOrderAmount.Currency
	m.TotalOrderAmountNano = i.TotalOrderAmount.Nano
	m.TotalOrderAmountUnits = i.TotalOrderAmount.Units

	return
}
