package stream_limit

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *StreamLimit) ConvertFromProtobuf(i proto.StreamLimit)  {
	m.Limit = i.Limit
	m.Open = i.Open

	return
}
