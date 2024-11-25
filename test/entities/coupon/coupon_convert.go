package coupon

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Coupon) ConvertFromProtobuf(i investapi.Coupon)  {
	m.CouponDate = i.CouponDate.AsTime()
	m.CouponEndDate = i.CouponEndDate.AsTime()
	m.CouponNumber = i.CouponNumber
	m.CouponPeriod = i.CouponPeriod
	m.CouponStartDate = i.CouponStartDate.AsTime()
	m.CouponTypeID = int64(i.CouponType)
	m.Figi = i.Figi
	m.FixDate = i.FixDate.AsTime()
	m.PayOneBondCurrency = i.PayOneBond.Currency
	m.PayOneBondNano = i.PayOneBond.Nano
	m.PayOneBondUnits = i.PayOneBond.Units

	return
}
