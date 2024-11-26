package info_subscription

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InfoSubscription) ConvertFromProtobuf(i proto.InfoSubscription)  {
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
