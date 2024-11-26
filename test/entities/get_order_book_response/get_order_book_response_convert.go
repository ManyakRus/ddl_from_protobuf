package get_order_book_response

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetOrderBookResponse) ConvertFromProtobuf(i investapi.GetOrderBookResponse)  {
	m.ClosePriceNano = i.ClosePrice.Nano
	m.ClosePriceTs = i.ClosePriceTs.AsTime()
	m.ClosePriceUnits = i.ClosePrice.Units
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.LastPriceNano = i.LastPrice.Nano
	m.LastPriceTs = i.LastPriceTs.AsTime()
	m.LastPriceUnits = i.LastPrice.Units
	m.LimitDownNano = i.LimitDown.Nano
	m.LimitDownUnits = i.LimitDown.Units
	m.LimitUpNano = i.LimitUp.Nano
	m.LimitUpUnits = i.LimitUp.Units
	m.OrderbookTs = i.OrderbookTs.AsTime()

	return
}
