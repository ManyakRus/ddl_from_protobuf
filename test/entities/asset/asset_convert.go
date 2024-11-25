package asset

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Asset) ConvertFromProtobuf(i investapi.Asset)  {
	m.Instruments = i.Instruments
	m.Name = i.Name
	m.TypeID = int64(i.Type)
	m.Uid = i.Uid

	return
}
