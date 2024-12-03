package tinkoff_share

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Share) ConvertFromProtobuf(i proto.Share)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.BuyAvailableFlag = i.BuyAvailableFlag
	m.ClassCode = i.ClassCode
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
	m.Currency = i.Currency
	m.DivYieldFlag = i.DivYieldFlag

	if i.DlongMin != nil {
		m.DlongMinNano = i.DlongMin.Nano
	} else {
		m.DlongMinNano = 0
	}


	if i.DlongMin != nil {
		m.DlongMinUnits = i.DlongMin.Units
	} else {
		m.DlongMinUnits = 0
	}


	if i.Dlong != nil {
		m.DlongNano = i.Dlong.Nano
	} else {
		m.DlongNano = 0
	}


	if i.Dlong != nil {
		m.DlongUnits = i.Dlong.Units
	} else {
		m.DlongUnits = 0
	}


	if i.DshortMin != nil {
		m.DshortMinNano = i.DshortMin.Nano
	} else {
		m.DshortMinNano = 0
	}


	if i.DshortMin != nil {
		m.DshortMinUnits = i.DshortMin.Units
	} else {
		m.DshortMinUnits = 0
	}


	if i.Dshort != nil {
		m.DshortNano = i.Dshort.Nano
	} else {
		m.DshortNano = 0
	}


	if i.Dshort != nil {
		m.DshortUnits = i.Dshort.Units
	} else {
		m.DshortUnits = 0
	}

	m.Exchange = i.Exchange
	m.Figi = i.Figi
	m.First1DayCandleDate = micro.Date_from_TimestampReference(i.First_1DayCandleDate)
	m.First1MinCandleDate = micro.Date_from_TimestampReference(i.First_1MinCandleDate)
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag
	m.IpoDate = micro.Date_from_TimestampReference(i.IpoDate)
	m.Isin = i.Isin
	m.IssueSize = i.IssueSize
	m.IssueSizePlan = i.IssueSizePlan

	if i.Klong != nil {
		m.KlongNano = i.Klong.Nano
	} else {
		m.KlongNano = 0
	}


	if i.Klong != nil {
		m.KlongUnits = i.Klong.Units
	} else {
		m.KlongUnits = 0
	}


	if i.Kshort != nil {
		m.KshortNano = i.Kshort.Nano
	} else {
		m.KshortNano = 0
	}


	if i.Kshort != nil {
		m.KshortUnits = i.Kshort.Units
	} else {
		m.KshortUnits = 0
	}

	m.LiquidityFlag = i.LiquidityFlag
	m.Lot = i.Lot

	if i.MinPriceIncrement != nil {
		m.MinPriceIncrementNano = i.MinPriceIncrement.Nano
	} else {
		m.MinPriceIncrementNano = 0
	}


	if i.MinPriceIncrement != nil {
		m.MinPriceIncrementUnits = i.MinPriceIncrement.Units
	} else {
		m.MinPriceIncrementUnits = 0
	}

	m.Name = i.Name

	if i.Nominal != nil {
		m.NominalCurrency = i.Nominal.Currency
	} else {
		m.NominalCurrency = ""
	}


	if i.Nominal != nil {
		m.NominalNano = i.Nominal.Nano
	} else {
		m.NominalNano = 0
	}


	if i.Nominal != nil {
		m.NominalUnits = i.Nominal.Units
	} else {
		m.NominalUnits = 0
	}

	m.OtcFlag = i.OtcFlag
	m.PositionUid = i.PositionUid
	m.RealExchangeID = int64(i.RealExchange.Number())
	m.Sector = i.Sector
	m.SellAvailableFlag = i.SellAvailableFlag
	m.ShareTypeID = int64(i.ShareType.Number())
	m.ShortEnabledFlag = i.ShortEnabledFlag
	m.Ticker = i.Ticker
	m.TradingStatusID = int64(i.TradingStatus.Number())
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
