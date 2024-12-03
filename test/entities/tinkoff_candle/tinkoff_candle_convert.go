package tinkoff_candle

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Candle) ConvertFromProtobuf(i proto.Candle)  {

	if i.Close != nil {
		m.CloseNano = i.Close.Nano
	} else {
		m.CloseNano = 0
	}


	if i.Close != nil {
		m.CloseUnits = i.Close.Units
	} else {
		m.CloseUnits = 0
	}

	m.Figi = i.Figi

	if i.High != nil {
		m.HighNano = i.High.Nano
	} else {
		m.HighNano = 0
	}


	if i.High != nil {
		m.HighUnits = i.High.Units
	} else {
		m.HighUnits = 0
	}

	m.InstrumentUid = i.InstrumentUid
	m.IntervalID = int64(i.Interval.Number())
	m.LastTradeTs = micro.Date_from_TimestampReference(i.LastTradeTs)

	if i.Low != nil {
		m.LowNano = i.Low.Nano
	} else {
		m.LowNano = 0
	}


	if i.Low != nil {
		m.LowUnits = i.Low.Units
	} else {
		m.LowUnits = 0
	}


	if i.Open != nil {
		m.OpenNano = i.Open.Nano
	} else {
		m.OpenNano = 0
	}


	if i.Open != nil {
		m.OpenUnits = i.Open.Units
	} else {
		m.OpenUnits = 0
	}

	m.Time = micro.Date_from_TimestampReference(i.Time)
	m.Volume = i.Volume

	return
}
