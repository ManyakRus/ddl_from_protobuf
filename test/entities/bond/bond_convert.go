package bond

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Bond) ConvertFromProtobuf(i proto.Bond)  {

	if i.AciValue != nil {
		m.AciValueCurrency = i.AciValue.Currency
	} else {
		m.AciValueCurrency = ""
	}


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

	m.AmortizationFlag = i.AmortizationFlag
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.BuyAvailableFlag = i.BuyAvailableFlag
	m.ClassCode = i.ClassCode
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
	m.CouponQuantityPerYear = i.CouponQuantityPerYear
	m.Currency = i.Currency

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
	m.FloatingCouponFlag = i.FloatingCouponFlag
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag

	if i.InitialNominal != nil {
		m.InitialNominalCurrency = i.InitialNominal.Currency
	} else {
		m.InitialNominalCurrency = ""
	}


	if i.InitialNominal != nil {
		m.InitialNominalNano = i.InitialNominal.Nano
	} else {
		m.InitialNominalNano = 0
	}


	if i.InitialNominal != nil {
		m.InitialNominalUnits = i.InitialNominal.Units
	} else {
		m.InitialNominalUnits = 0
	}

	m.Isin = i.Isin
	m.IssueKind = i.IssueKind
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
	m.MaturityDate = micro.Date_from_TimestampReference(i.MaturityDate)

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
	m.PerpetualFlag = i.PerpetualFlag
	m.PlacementDate = micro.Date_from_TimestampReference(i.PlacementDate)

	if i.PlacementPrice != nil {
		m.PlacementPriceCurrency = i.PlacementPrice.Currency
	} else {
		m.PlacementPriceCurrency = ""
	}


	if i.PlacementPrice != nil {
		m.PlacementPriceNano = i.PlacementPrice.Nano
	} else {
		m.PlacementPriceNano = 0
	}


	if i.PlacementPrice != nil {
		m.PlacementPriceUnits = i.PlacementPrice.Units
	} else {
		m.PlacementPriceUnits = 0
	}

	m.PositionUid = i.PositionUid
	m.RealExchangeID = int64(i.RealExchange.Number())
	m.RiskLevelID = int64(i.RiskLevel.Number())
	m.Sector = i.Sector
	m.SellAvailableFlag = i.SellAvailableFlag
	m.ShortEnabledFlag = i.ShortEnabledFlag
	m.StateRegDate = micro.Date_from_TimestampReference(i.StateRegDate)
	m.SubordinatedFlag = i.SubordinatedFlag
	m.Ticker = i.Ticker
	m.TradingStatusID = int64(i.TradingStatus.Number())
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
