package order_book

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderBook) ConvertFromProtobuf(i proto.OrderBook)  {
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.IsConsistent = i.IsConsistent

	if i.LimitDown != nil {
		m.LimitDownNano = i.LimitDown.Nano
	} else {
		m.LimitDownNano = 0
	}


	if i.LimitDown != nil {
		m.LimitDownUnits = i.LimitDown.Units
	} else {
		m.LimitDownUnits = 0
	}


	if i.LimitUp != nil {
		m.LimitUpNano = i.LimitUp.Nano
	} else {
		m.LimitUpNano = 0
	}


	if i.LimitUp != nil {
		m.LimitUpUnits = i.LimitUp.Units
	} else {
		m.LimitUpUnits = 0
	}

	m.Time = i.Time.AsTime()

	return
}
