package positions_securities

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsSecurities) ConvertFromProtobuf(i investapi.PositionsSecurities)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.ExchangeBlocked = i.ExchangeBlocked
	m.Figi = i.Figi
	m.InstrumentType = i.InstrumentType
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
