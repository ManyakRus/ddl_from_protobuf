package tinkoff_favorite_instrument

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *FavoriteInstrument) ConvertFromProtobuf(i proto.FavoriteInstrument)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.ClassCode = i.ClassCode
	m.Figi = i.Figi
	m.InstrumentKindID = int64(i.InstrumentKind.Number())
	m.InstrumentType = i.InstrumentType
	m.Isin = i.Isin
	m.OtcFlag = i.OtcFlag
	m.Ticker = i.Ticker

	return
}
