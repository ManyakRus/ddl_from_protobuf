package asset_security

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetSecurity) ConvertFromProtobuf(i proto.AssetSecurity)  {
	m.InstrumentKindID = int64(i.InstrumentKind.Number())
	m.Isin = i.Isin
	m.Type = i.Type

	return
}
