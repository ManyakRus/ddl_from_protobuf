package get_accrued_interests_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetAccruedInterestsRequest) ConvertFromProtobuf(i investapi.GetAccruedInterestsRequest)  {
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.To = i.To.AsTime()

	return
}
