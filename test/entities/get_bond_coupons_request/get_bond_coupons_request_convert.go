package get_bond_coupons_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *GetBondCouponsRequest) ConvertFromProtobuf(i investapi.GetBondCouponsRequest)  {
	m.Figi = i.Figi
	m.From = i.From.AsTime()
	m.To = i.To.AsTime()

	return
}
