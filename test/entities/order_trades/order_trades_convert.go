package order_trades

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderTrades) ConvertFromProtobuf(i investapi.OrderTrades)  {
	m.AccountID = i.AccountId
	m.CreatedAt = i.CreatedAt.AsTime()
	m.DirectionID = int64(i.Direction.Number())
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.OrderID = i.OrderId

	return
}
