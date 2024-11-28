package positions_subscription_status

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsSubscriptionStatus) ConvertFromProtobuf(i proto.PositionsSubscriptionStatus)  {
	m.AccountID = i.AccountId
	m.SubscriptionStatusID = int64(i.SubscriptionStatus.Number())

	return
}
