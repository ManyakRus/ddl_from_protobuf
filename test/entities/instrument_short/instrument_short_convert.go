package instrument_short

import (
	"github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InstrumentShort) ConvertFromProtobuf(i proto.InstrumentShort)  {
	m.ApiTradeAvailableFlag = i.ApiTradeAvailableFlag
	m.BlockedTcaFlag = i.BlockedTcaFlag
	m.ClassCode = i.ClassCode
	m.Figi = i.Figi
	m.First1DayCandleDate = i.First_1DayCandleDate.AsTime()
	m.First1MinCandleDate = i.First_1MinCandleDate.AsTime()
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
