package share

import (
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
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag
	m.IpoDate = i.IpoDate.AsTime()
	m.Isin = i.Isin
	m.IssueSize = i.IssueSize
	m.IssueSizePlan = i.IssueSizePlan
	m.KlongNano = i.Klong.Nano
	m.KlongUnits = i.Klong.Units
	m.KshortNano = i.Kshort.Nano
	m.KshortUnits = i.Kshort.Units
	m.LiquidityFlag = i.LiquidityFlag
	m.Lot = i.Lot
	m.MinPriceIncrementNano = i.MinPriceIncrement.Nano
	m.MinPriceIncrementUnits = i.MinPriceIncrement.Units
	m.Name = i.Name
	m.NominalCurrency = i.Nominal.Currency
	m.NominalNano = i.Nominal.Nano
	m.NominalUnits = i.Nominal.Units
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
