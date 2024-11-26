package info_instrument

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InfoInstrument) ConvertFromProtobuf(i proto.InfoInstrument)  {
	m.InstrumentID = i.InstrumentId

	return
}
