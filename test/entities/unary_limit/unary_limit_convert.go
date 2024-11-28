package unary_limit

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *UnaryLimit) ConvertFromProtobuf(i proto.UnaryLimit)  {
	m.LimitPerMinute = i.LimitPerMinute

	return
}
