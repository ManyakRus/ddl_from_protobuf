package post_order_response

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PostOrderResponse) ConvertFromProtobuf(i investapi.PostOrderResponse)  {
	m.AciValueCurrency = i.AciValue.Currency
	m.AciValueNano = i.AciValue.Nano
	m.AciValueUnits = i.AciValue.Units
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
	m.InitialOrderPricePtNano = i.InitialOrderPricePt.Nano
	m.InitialOrderPricePtUnits = i.InitialOrderPricePt.Units
	m.InitialOrderPriceUnits = i.InitialOrderPrice.Units
	m.InitialSecurityPriceCurrency = i.InitialSecurityPrice.Currency
	m.InitialSecurityPriceNano = i.InitialSecurityPrice.Nano
	m.InitialSecurityPriceUnits = i.InitialSecurityPrice.Units
	m.InstrumentUid = i.InstrumentUid
	m.LotsExecuted = i.LotsExecuted
	m.LotsRequested = i.LotsRequested
	m.Message = i.Message
	m.OrderID = i.OrderId
	m.OrderTypeID = int64(i.OrderType.Number())
	m.TotalOrderAmountCurrency = i.TotalOrderAmount.Currency
	m.TotalOrderAmountNano = i.TotalOrderAmount.Nano
	m.TotalOrderAmountUnits = i.TotalOrderAmount.Units

	return
}
