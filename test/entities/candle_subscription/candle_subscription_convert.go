package candle_subscription

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *CandleSubscription) ConvertFromProtobuf(i investapi.CandleSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.IntervalID = int64(i.Interval.Number())
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
