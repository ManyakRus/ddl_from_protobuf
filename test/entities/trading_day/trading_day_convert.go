package trading_day

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *TradingDay) ConvertFromProtobuf(i proto.TradingDay)  {
	m.ClearingEndTime = micro.Date_from_TimestampReference(i.ClearingEndTime)
	m.ClearingStartTime = micro.Date_from_TimestampReference(i.ClearingStartTime)
	m.ClosingAuctionEndTime = micro.Date_from_TimestampReference(i.ClosingAuctionEndTime)
	m.ClosingAuctionStartTime = micro.Date_from_TimestampReference(i.ClosingAuctionStartTime)
	m.Date = micro.Date_from_TimestampReference(i.Date)
	m.EndTime = micro.Date_from_TimestampReference(i.EndTime)
	m.EveningEndTime = micro.Date_from_TimestampReference(i.EveningEndTime)
	m.EveningOpeningAuctionStartTime = micro.Date_from_TimestampReference(i.EveningOpeningAuctionStartTime)
	m.EveningStartTime = micro.Date_from_TimestampReference(i.EveningStartTime)
	m.IsTradingDay = i.IsTradingDay
	m.OpeningAuctionEndTime = micro.Date_from_TimestampReference(i.OpeningAuctionEndTime)
	m.OpeningAuctionStartTime = micro.Date_from_TimestampReference(i.OpeningAuctionStartTime)
	m.PremarketEndTime = micro.Date_from_TimestampReference(i.PremarketEndTime)
	m.PremarketStartTime = micro.Date_from_TimestampReference(i.PremarketStartTime)
	m.StartTime = micro.Date_from_TimestampReference(i.StartTime)

	return
}
