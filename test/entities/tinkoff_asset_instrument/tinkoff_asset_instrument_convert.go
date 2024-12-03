package tinkoff_asset_instrument

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetInstrument) ConvertFromProtobuf(i proto.AssetInstrument)  {
	m.ClassCode = i.ClassCode
	m.Figi = i.Figi
	m.InstrumentKindID = int64(i.InstrumentKind.Number())
	m.InstrumentType = i.InstrumentType
	m.PositionUid = i.PositionUid
	m.Ticker = i.Ticker
	m.Uid = i.Uid

	return
}
