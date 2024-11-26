package candle

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Candle) ConvertFromProtobuf(i investapi.Candle)  {
	m.CloseNano = i.Close.Nano
	m.CloseUnits = i.Close.Units
	m.Figi = i.Figi
	m.HighNano = i.High.Nano
	m.HighUnits = i.High.Units
	m.InstrumentUid = i.InstrumentUid
	m.IntervalID = int64(i.Interval.Number())
	m.LastTradeTs = i.LastTradeTs.AsTime()
	m.LowNano = i.Low.Nano
	m.LowUnits = i.Low.Units
	m.OpenNano = i.Open.Nano
	m.OpenUnits = i.Open.Units
	m.Time = i.Time.AsTime()
	m.Volume = i.Volume

	return
}