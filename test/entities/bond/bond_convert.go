package bond

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Bond) ConvertFromProtobuf(i investapi.Bond)  {
	m.AciValueCurrency = i.AciValue.Currency
	m.AciValueNano = i.AciValue.Nano
	m.AciValueUnits = i.AciValue.Units
	m.AmortizationFlag = i.AmortizationFlag
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.BuyAvailableFlag = i.BuyAvailableFlag
	m.ClassCode = i.ClassCode
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
	m.CouponQuantityPerYear = i.CouponQuantityPerYear
	m.Currency = i.Currency
	m.DlongMinNano = i.DlongMin.Nano
	m.DlongMinUnits = i.DlongMin.Units
	m.DlongNano = i.Dlong.Nano
	m.DlongUnits = i.Dlong.Units
	m.DshortMinNano = i.DshortMin.Nano
	m.DshortMinUnits = i.DshortMin.Units
	m.DshortNano = i.Dshort.Nano
	m.DshortUnits = i.Dshort.Units
	m.Exchange = i.Exchange
	m.Figi = i.Figi
	m.First1DayCandleDate = i.First_1DayCandleDate.AsTime()
	m.First1MinCandleDate = i.First_1MinCandleDate.AsTime()
	m.FloatingCouponFlag = i.FloatingCouponFlag
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag
	m.InitialNominalCurrency = i.InitialNominal.Currency
	m.InitialNominalNano = i.InitialNominal.Nano
	m.InitialNominalUnits = i.InitialNominal.Units
	m.Isin = i.Isin
	m.IssueKind = i.IssueKind
	m.IssueSize = i.IssueSize
	m.IssueSizePlan = i.IssueSizePlan
	m.KlongNano = i.Klong.Nano
	m.KlongUnits = i.Klong.Units
	m.KshortNano = i.Kshort.Nano
	m.KshortUnits = i.Kshort.Units
	m.LiquidityFlag = i.LiquidityFlag
	m.Lot = i.Lot
	m.MaturityDate = i.MaturityDate.AsTime()
	m.MinPriceIncrementNano = i.MinPriceIncrement.Nano
	m.MinPriceIncrementUnits = i.MinPriceIncrement.Units
	m.Name = i.Name
	m.NominalCurrency = i.Nominal.Currency
	m.NominalNano = i.Nominal.Nano
	m.NominalUnits = i.Nominal.Units
	m.OtcFlag = i.OtcFlag
	m.PerpetualFlag = i.PerpetualFlag
	m.PlacementDate = i.PlacementDate.AsTime()
	m.PlacementPriceCurrency = i.PlacementPrice.Currency
	m.PlacementPriceNano = i.PlacementPrice.Nano
	m.PlacementPriceUnits = i.PlacementPrice.Units
	m.PositionUid = i.PositionUid
	m.RealExchangeID = int64(i.RealExchange)
	m.RiskLevelID = int64(i.RiskLevel)
	m.Sector = i.Sector
	m.SellAvailableFlag = i.SellAvailableFlag
	m.ShortEnabledFlag = i.ShortEnabledFlag
	m.StateRegDate = i.StateRegDate.AsTime()
	m.SubordinatedFlag = i.SubordinatedFlag
	m.Ticker = i.Ticker
	m.TradingStatusID = int64(i.TradingStatus)
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
