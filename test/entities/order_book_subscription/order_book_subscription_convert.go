package order_book_subscription

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OrderBookSubscription) ConvertFromProtobuf(i investapi.OrderBookSubscription)  {
	m.Depth = i.Depth
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.SubscriptionStatusID = int64(i.SubscriptionStatus)

	return
}
