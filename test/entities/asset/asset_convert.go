package asset

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Asset) ConvertFromProtobuf(i proto.Asset)  {
	m.Name = i.Name
	m.TypeID = int64(i.Type.Number())
	m.Uid = i.Uid

	return
}
