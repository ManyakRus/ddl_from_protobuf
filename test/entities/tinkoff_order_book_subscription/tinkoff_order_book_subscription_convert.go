package tinkoff_order_book_subscription

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffOrderBookSubscription) ConvertFromProtobuf(i proto.TinkoffOrderBookSubscription)  {
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
