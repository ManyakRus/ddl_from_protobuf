package tinkoff_candle_subscription

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffCandleSubscription) ConvertFromProtobuf(i proto.TinkoffCandleSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.IntervalID = int64(i.Interval.Number())
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
