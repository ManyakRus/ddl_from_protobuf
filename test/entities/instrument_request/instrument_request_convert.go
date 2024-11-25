package instrument_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *InstrumentRequest) ConvertFromProtobuf(i investapi.InstrumentRequest)  {
	m.ClassCode = i.ClassCode
	m.ID = i.Id
	m.IdTypeID = int64(i.IdType)

	return
}
