package money_value

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *MoneyValue) ConvertFromProtobuf(i proto.MoneyValue)  {
	m.Currency = i.Currency
	m.Nano = i.Nano
	m.Units = i.Units

	return
}
