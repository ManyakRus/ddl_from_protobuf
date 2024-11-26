package candle_subscription

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *CandleSubscription) ConvertFromProtobuf(i proto.CandleSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.IntervalID = int64(i.Interval.Number())
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
