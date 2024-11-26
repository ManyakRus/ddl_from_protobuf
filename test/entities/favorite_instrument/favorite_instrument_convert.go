package favorite_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *FavoriteInstrument) ConvertFromProtobuf(i investapi.FavoriteInstrument)  {
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
