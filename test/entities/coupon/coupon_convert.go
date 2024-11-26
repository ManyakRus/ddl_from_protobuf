package coupon

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Coupon) ConvertFromProtobuf(i proto.Coupon)  {
	m.CouponDate = i.CouponDate.AsTime()
	m.CouponEndDate = i.CouponEndDate.AsTime()
	m.CouponNumber = i.CouponNumber
	m.CouponPeriod = i.CouponPeriod
	m.CouponStartDate = i.CouponStartDate.AsTime()
	m.CouponTypeID = int64(i.CouponType.Number())
	m.Figi = i.Figi
	m.FixDate = i.FixDate.AsTime()
	m.PayOneBondCurrency = i.PayOneBond.Currency
	m.PayOneBondNano = i.PayOneBond.Nano
	m.PayOneBondUnits = i.PayOneBond.Units

	return
}
