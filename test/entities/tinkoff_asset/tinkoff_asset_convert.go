package tinkoff_asset

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffAsset) ConvertFromProtobuf(i proto.TinkoffAsset)  {
	m.Name = i.Name
	m.TypeID = int64(i.Type.Number())
	m.Uid = i.Uid

	return
}
