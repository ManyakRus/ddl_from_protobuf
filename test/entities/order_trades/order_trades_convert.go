package order_trades

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderTrades) ConvertFromProtobuf(i proto.OrderTrades)  {
	m.AccountID = i.AccountId
	m.CreatedAt = i.CreatedAt.AsTime()
	m.DirectionID = int64(i.Direction.Number())
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.OrderID = i.OrderId

	return
}
