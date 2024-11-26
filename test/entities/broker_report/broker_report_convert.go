package broker_report

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *BrokerReport) ConvertFromProtobuf(i proto.BrokerReport)  {
	m.AciValueNano = i.AciValue.Nano
	m.AciValueUnits = i.AciValue.Units
	m.BrokerCommissionCurrency = i.BrokerCommission.Currency
	m.BrokerCommissionNano = i.BrokerCommission.Nano
	m.BrokerCommissionUnits = i.BrokerCommission.Units
	m.BrokerStatus = i.BrokerStatus
	m.ClassCode = i.ClassCode
	m.ClearValueDate = i.ClearValueDate.AsTime()
	m.DeliveryType = i.DeliveryType
	m.Direction = i.Direction
	m.Exchange = i.Exchange
	m.ExchangeClearingCommissionCurrency = i.ExchangeClearingCommission.Currency
	m.ExchangeClearingCommissionNano = i.ExchangeClearingCommission.Nano
	m.ExchangeClearingCommissionUnits = i.ExchangeClearingCommission.Units
	m.ExchangeCommissionCurrency = i.ExchangeCommission.Currency
	m.ExchangeCommissionNano = i.ExchangeCommission.Nano
	m.ExchangeCommissionUnits = i.ExchangeCommission.Units
	m.ExecuteSign = i.ExecuteSign
	m.Figi = i.Figi
	m.Name = i.Name
	m.OrderAmountCurrency = i.OrderAmount.Currency
	m.OrderAmountNano = i.OrderAmount.Nano
	m.OrderAmountUnits = i.OrderAmount.Units
	m.OrderID = i.OrderId
	m.Party = i.Party
	m.PriceCurrency = i.Price.Currency
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.RepoRateNano = i.RepoRate.Nano
	m.RepoRateUnits = i.RepoRate.Units
	m.SecValueDate = i.SecValueDate.AsTime()
	m.SeparateAgreementDate = i.SeparateAgreementDate
	m.SeparateAgreementNumber = i.SeparateAgreementNumber
	m.SeparateAgreementType = i.SeparateAgreementType
	m.Ticker = i.Ticker
	m.TotalOrderAmountCurrency = i.TotalOrderAmount.Currency
	m.TotalOrderAmountNano = i.TotalOrderAmount.Nano
	m.TotalOrderAmountUnits = i.TotalOrderAmount.Units
	m.TradeDatetime = i.TradeDatetime.AsTime()
	m.TradeID = i.TradeId

	return
}
