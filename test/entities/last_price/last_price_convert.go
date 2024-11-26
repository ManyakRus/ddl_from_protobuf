package last_price

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *LastPrice) ConvertFromProtobuf(i proto.LastPrice)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Time = i.Time.AsTime()

	return
}
