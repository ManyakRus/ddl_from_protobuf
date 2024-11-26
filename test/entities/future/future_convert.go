package future

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Future) ConvertFromProtobuf(i proto.Future)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.AssetType = i.AssetType
	m.BasicAsset = i.BasicAsset
	m.BasicAssetPositionUid = i.BasicAssetPositionUid
	m.BasicAssetSizeNano = i.BasicAssetSize.Nano
	m.BasicAssetSizeUnits = i.BasicAssetSize.Units
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.BuyAvailableFlag = i.BuyAvailableFlag
	m.ClassCode = i.ClassCode
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
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
	m.ExpirationDate = i.ExpirationDate.AsTime()
	m.Figi = i.Figi
	m.First1DayCandleDate = i.First_1DayCandleDate.AsTime()
	m.First1MinCandleDate = i.First_1MinCandleDate.AsTime()
	m.FirstTradeDate = i.FirstTradeDate.AsTime()
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag
	m.FuturesType = i.FuturesType
	m.KlongNano = i.Klong.Nano
	m.KlongUnits = i.Klong.Units
	m.KshortNano = i.Kshort.Nano
	m.KshortUnits = i.Kshort.Units
	m.LastTradeDate = i.LastTradeDate.AsTime()
	m.Lot = i.Lot
	m.MinPriceIncrementNano = i.MinPriceIncrement.Nano
	m.MinPriceIncrementUnits = i.MinPriceIncrement.Units
	m.Name = i.Name
	m.OtcFlag = i.OtcFlag
	m.PositionUid = i.PositionUid
	m.RealExchangeID = int64(i.RealExchange.Number())
	m.Sector = i.Sector
	m.SellAvailableFlag = i.SellAvailableFlag
	m.ShortEnabledFlag = i.ShortEnabledFlag
	m.Ticker = i.Ticker
	m.TradingStatusID = int64(i.TradingStatus.Number())
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
