package last_price_subscription

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *LastPriceSubscription) ConvertFromProtobuf(i investapi.LastPriceSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.SubscriptionStatusID = int64(i.SubscriptionStatus)

	return
}
