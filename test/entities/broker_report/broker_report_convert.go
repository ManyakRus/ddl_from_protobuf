package broker_report

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *BrokerReport) ConvertFromProtobuf(i proto.BrokerReport)  {

	if i.AciValue != nil {
		m.AciValueNano = i.AciValue.Nano
	} else {
		m.AciValueNano = 0
	}


	if i.AciValue != nil {
		m.AciValueUnits = i.AciValue.Units
	} else {
		m.AciValueUnits = 0
	}


	if i.BrokerCommission != nil {
		m.BrokerCommissionCurrency = i.BrokerCommission.Currency
	} else {
		m.BrokerCommissionCurrency = ""
	}


	if i.BrokerCommission != nil {
		m.BrokerCommissionNano = i.BrokerCommission.Nano
	} else {
		m.BrokerCommissionNano = 0
	}


	if i.BrokerCommission != nil {
		m.BrokerCommissionUnits = i.BrokerCommission.Units
	} else {
		m.BrokerCommissionUnits = 0
	}

	m.BrokerStatus = i.BrokerStatus
	m.ClassCode = i.ClassCode
	m.ClearValueDate = micro.Date_from_TimestampReference(i.ClearValueDate)
	m.DeliveryType = i.DeliveryType
	m.Direction = i.Direction
	m.Exchange = i.Exchange

	if i.ExchangeClearingCommission != nil {
		m.ExchangeClearingCommissionCurrency = i.ExchangeClearingCommission.Currency
	} else {
		m.ExchangeClearingCommissionCurrency = ""
	}


	if i.ExchangeClearingCommission != nil {
		m.ExchangeClearingCommissionNano = i.ExchangeClearingCommission.Nano
	} else {
		m.ExchangeClearingCommissionNano = 0
	}


	if i.ExchangeClearingCommission != nil {
		m.ExchangeClearingCommissionUnits = i.ExchangeClearingCommission.Units
	} else {
		m.ExchangeClearingCommissionUnits = 0
	}


	if i.ExchangeCommission != nil {
		m.ExchangeCommissionCurrency = i.ExchangeCommission.Currency
	} else {
		m.ExchangeCommissionCurrency = ""
	}


	if i.ExchangeCommission != nil {
		m.ExchangeCommissionNano = i.ExchangeCommission.Nano
	} else {
		m.ExchangeCommissionNano = 0
	}


	if i.ExchangeCommission != nil {
		m.ExchangeCommissionUnits = i.ExchangeCommission.Units
	} else {
		m.ExchangeCommissionUnits = 0
	}

	m.ExecuteSign = i.ExecuteSign
	m.Figi = i.Figi
	m.Name = i.Name

	if i.OrderAmount != nil {
		m.OrderAmountCurrency = i.OrderAmount.Currency
	} else {
		m.OrderAmountCurrency = ""
	}


	if i.OrderAmount != nil {
		m.OrderAmountNano = i.OrderAmount.Nano
	} else {
		m.OrderAmountNano = 0
	}


	if i.OrderAmount != nil {
		m.OrderAmountUnits = i.OrderAmount.Units
	} else {
		m.OrderAmountUnits = 0
	}

	m.OrderID = i.OrderId
	m.Party = i.Party

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

	if i.RepoRate != nil {
		m.RepoRateNano = i.RepoRate.Nano
	} else {
		m.RepoRateNano = 0
	}


	if i.RepoRate != nil {
		m.RepoRateUnits = i.RepoRate.Units
	} else {
		m.RepoRateUnits = 0
	}

	m.SecValueDate = micro.Date_from_TimestampReference(i.SecValueDate)
	m.SeparateAgreementDate = i.SeparateAgreementDate
	m.SeparateAgreementNumber = i.SeparateAgreementNumber
	m.SeparateAgreementType = i.SeparateAgreementType
	m.Ticker = i.Ticker

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

	m.TradeDatetime = micro.Date_from_TimestampReference(i.TradeDatetime)
	m.TradeID = i.TradeId

	return
}
