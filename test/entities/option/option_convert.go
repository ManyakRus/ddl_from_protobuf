package option

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Option) ConvertFromProtobuf(i proto.Option)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.AssetType = i.AssetType
	m.BasicAsset = i.BasicAsset
	m.BasicAssetPositionUid = i.BasicAssetPositionUid

	if i.BasicAssetSize != nil {
		m.BasicAssetSizeNano = i.BasicAssetSize.Nano
	} else {
		m.BasicAssetSizeNano = 0
	}


	if i.BasicAssetSize != nil {
		m.BasicAssetSizeUnits = i.BasicAssetSize.Units
	} else {
		m.BasicAssetSizeUnits = 0
	}

	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.BuyAvailableFlag = i.BuyAvailableFlag
	m.ClassCode = i.ClassCode
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
	m.Currency = i.Currency
	m.DirectionID = int64(i.Direction.Number())

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
	m.ExpirationDate = i.ExpirationDate.AsTime()
	m.First1DayCandleDate = i.First_1DayCandleDate.AsTime()
	m.First1MinCandleDate = i.First_1MinCandleDate.AsTime()
	m.FirstTradeDate = i.FirstTradeDate.AsTime()
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag

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

	m.LastTradeDate = i.LastTradeDate.AsTime()
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
	m.OtcFlag = i.OtcFlag
	m.PaymentTypeID = int64(i.PaymentType.Number())
	m.PositionUid = i.PositionUid
	m.RealExchangeID = int64(i.RealExchange.Number())
	m.Sector = i.Sector
	m.SellAvailableFlag = i.SellAvailableFlag
	m.SettlementCurrency = i.SettlementCurrency
	m.SettlementTypeID = int64(i.SettlementType.Number())
	m.ShortEnabledFlag = i.ShortEnabledFlag

	if i.StrikePrice != nil {
		m.StrikePriceCurrency = i.StrikePrice.Currency
	} else {
		m.StrikePriceCurrency = ""
	}


	if i.StrikePrice != nil {
		m.StrikePriceNano = i.StrikePrice.Nano
	} else {
		m.StrikePriceNano = 0
	}


	if i.StrikePrice != nil {
		m.StrikePriceUnits = i.StrikePrice.Units
	} else {
		m.StrikePriceUnits = 0
	}

	m.StyleID = int64(i.Style.Number())
	m.Ticker = i.Ticker
	m.TradingStatusID = int64(i.TradingStatus.Number())
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
