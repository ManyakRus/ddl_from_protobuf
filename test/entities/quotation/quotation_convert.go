package quotation

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Quotation) ConvertFromProtobuf(i proto.Quotation)  {
	m.Nano = i.Nano
	m.Units = i.Units

	return
}
