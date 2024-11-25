package positions_futures

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PositionsFutures) ConvertFromProtobuf(i investapi.PositionsFutures)  {
	m.Balance = i.Balance
	m.Blocked = i.Blocked
	m.Figi = i.Figi
	m.InstrumentUid = i.InstrumentUid
	m.PositionUid = i.PositionUid

	return
}
