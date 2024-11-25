package trade_subscription

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradeSubscription) ConvertFromProtobuf(i investapi.TradeSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.SubscriptionStatusID = int64(i.SubscriptionStatus)

	return
}
