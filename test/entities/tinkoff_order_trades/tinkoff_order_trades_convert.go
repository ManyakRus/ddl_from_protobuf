package tinkoff_order_trades

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffOrderTrades) ConvertFromProtobuf(i proto.TinkoffOrderTrades)  {
	m.AccountID = i.AccountId
	m.CreatedAt = micro.Date_from_TimestampReference(i.CreatedAt)
	m.DirectionID = int64(i.Direction.Number())
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.OrderID = i.OrderId

	return
}
