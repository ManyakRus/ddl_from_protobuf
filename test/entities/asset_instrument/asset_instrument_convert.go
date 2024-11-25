package asset_instrument

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetInstrument) ConvertFromProtobuf(i investapi.AssetInstrument)  {
	m.ClassCode = i.ClassCode
	m.Figi = i.Figi
	m.InstrumentKindID = int64(i.InstrumentKind)
	m.InstrumentType = i.InstrumentType
	m.LinksInstrumentUid = i.Links.InstrumentUid
	m.LinksType = i.Links.Type
	m.PositionUid = i.PositionUid
	m.Ticker = i.Ticker
	m.Uid = i.Uid

	return
}
