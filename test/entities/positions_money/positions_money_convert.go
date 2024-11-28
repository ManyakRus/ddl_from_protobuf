package positions_money

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsMoney) ConvertFromProtobuf(i proto.PositionsMoney)  {

	if i.AvailableValue != nil {
		m.AvailableValueCurrency = i.AvailableValue.Currency
	} else {
		m.AvailableValueCurrency = ""
	}


	if i.AvailableValue != nil {
		m.AvailableValueNano = i.AvailableValue.Nano
	} else {
		m.AvailableValueNano = 0
	}


	if i.AvailableValue != nil {
		m.AvailableValueUnits = i.AvailableValue.Units
	} else {
		m.AvailableValueUnits = 0
	}


	if i.BlockedValue != nil {
		m.BlockedValueCurrency = i.BlockedValue.Currency
	} else {
		m.BlockedValueCurrency = ""
	}


	if i.BlockedValue != nil {
		m.BlockedValueNano = i.BlockedValue.Nano
	} else {
		m.BlockedValueNano = 0
	}


	if i.BlockedValue != nil {
		m.BlockedValueUnits = i.BlockedValue.Units
	} else {
		m.BlockedValueUnits = 0
	}


	return
}
