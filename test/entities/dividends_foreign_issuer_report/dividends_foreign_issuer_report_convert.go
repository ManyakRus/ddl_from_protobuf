package dividends_foreign_issuer_report

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *DividendsForeignIssuerReport) ConvertFromProtobuf(i proto.DividendsForeignIssuerReport)  {
	m.Currency = i.Currency

	if i.DividendAmount != nil {
		m.DividendAmountNano = i.DividendAmount.Nano
	} else {
		m.DividendAmountNano = 0
	}


	if i.DividendAmount != nil {
		m.DividendAmountUnits = i.DividendAmount.Units
	} else {
		m.DividendAmountUnits = 0
	}


	if i.DividendGross != nil {
		m.DividendGrossNano = i.DividendGross.Nano
	} else {
		m.DividendGrossNano = 0
	}


	if i.DividendGross != nil {
		m.DividendGrossUnits = i.DividendGross.Units
	} else {
		m.DividendGrossUnits = 0
	}


	if i.Dividend != nil {
		m.DividendNano = i.Dividend.Nano
	} else {
		m.DividendNano = 0
	}


	if i.Dividend != nil {
		m.DividendUnits = i.Dividend.Units
	} else {
		m.DividendUnits = 0
	}


	if i.ExternalCommission != nil {
		m.ExternalCommissionNano = i.ExternalCommission.Nano
	} else {
		m.ExternalCommissionNano = 0
	}


	if i.ExternalCommission != nil {
		m.ExternalCommissionUnits = i.ExternalCommission.Units
	} else {
		m.ExternalCommissionUnits = 0
	}

	m.Isin = i.Isin
	m.IssuerCountry = i.IssuerCountry
	m.PaymentDate = micro.Date_from_TimestampReference(i.PaymentDate)
	m.Quantity = i.Quantity
	m.RecordDate = micro.Date_from_TimestampReference(i.RecordDate)
	m.SecurityName = i.SecurityName

	if i.Tax != nil {
		m.TaxNano = i.Tax.Nano
	} else {
		m.TaxNano = 0
	}


	if i.Tax != nil {
		m.TaxUnits = i.Tax.Units
	} else {
		m.TaxUnits = 0
	}


	return
}
