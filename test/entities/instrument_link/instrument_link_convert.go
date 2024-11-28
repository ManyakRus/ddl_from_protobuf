package instrument_link

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InstrumentLink) ConvertFromProtobuf(i proto.InstrumentLink)  {
	m.InstrumentUid = i.InstrumentUid
	m.Type = i.Type

	return
}
