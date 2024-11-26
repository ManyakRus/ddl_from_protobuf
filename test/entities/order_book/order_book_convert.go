package order_book

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderBook) ConvertFromProtobuf(i investapi.OrderBook)  {
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.IsConsistent = i.IsConsistent
	m.LimitDownNano = i.LimitDown.Nano
	m.LimitDownUnits = i.LimitDown.Units
	m.LimitUpNano = i.LimitUp.Nano
	m.LimitUpUnits = i.LimitUp.Units
	m.Time = i.Time.AsTime()

	return
}
