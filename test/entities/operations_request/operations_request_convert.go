package operations_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *OperationsRequest) ConvertFromProtobuf(i investapi.OperationsRequest)  {
	m.AccountID = i.AccountId
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.StateID = int64(i.State)
	m.To = i.To.AsTime()

	return
}
