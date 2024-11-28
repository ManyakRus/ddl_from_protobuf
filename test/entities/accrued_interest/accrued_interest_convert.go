package accrued_interest

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AccruedInterest) ConvertFromProtobuf(i proto.AccruedInterest)  {
	m.Date = micro.Date_from_TimestampReference(i.Date)

	if i.Nominal != nil {
		m.NominalNano = i.Nominal.Nano
	} else {
		m.NominalNano = 0
	}


	if i.Nominal != nil {
		m.NominalUnits = i.Nominal.Units
	} else {
		m.NominalUnits = 0
	}


	if i.Value != nil {
		m.ValueNano = i.Value.Nano
	} else {
		m.ValueNano = 0
	}


	if i.ValuePercent != nil {
		m.ValuePercentNano = i.ValuePercent.Nano
	} else {
		m.ValuePercentNano = 0
	}


	if i.ValuePercent != nil {
		m.ValuePercentUnits = i.ValuePercent.Units
	} else {
		m.ValuePercentUnits = 0
	}


	if i.Value != nil {
		m.ValueUnits = i.Value.Units
	} else {
		m.ValueUnits = 0
	}


	return
}
