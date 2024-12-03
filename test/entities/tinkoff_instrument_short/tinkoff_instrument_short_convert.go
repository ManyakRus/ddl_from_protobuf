package tinkoff_instrument_short

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TinkoffInstrumentShort) ConvertFromProtobuf(i proto.TinkoffInstrumentShort)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.ClassCode = i.ClassCode
	m.Figi = i.Figi
	m.First1DayCandleDate = micro.Date_from_TimestampReference(i.First_1DayCandleDate)
	m.First1MinCandleDate = micro.Date_from_TimestampReference(i.First_1MinCandleDate)
	m.ForIisFlag = i.ForIisFlag
	m.ForQualInvestorFlag = i.ForQualInvestorFlag
	m.InstrumentKindID = int64(i.InstrumentKind.Number())
	m.InstrumentType = i.InstrumentType
	m.Isin = i.Isin
	m.Name = i.Name
	m.PositionUid = i.PositionUid
	m.Ticker = i.Ticker
	m.Uid = i.Uid
	m.WeekendFlag = i.WeekendFlag

	return
}
