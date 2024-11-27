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

	if i.PayOneBond != nil {
		m.PayOneBondCurrency = i.PayOneBond.Currency
	} else {
		m.PayOneBondCurrency = ""
	}


	if i.PayOneBond != nil {
		m.PayOneBondNano = i.PayOneBond.Nano
	} else {
		m.PayOneBondNano = 0
	}


	if i.PayOneBond != nil {
		m.PayOneBondUnits = i.PayOneBond.Units
	} else {
		m.PayOneBondUnits = 0
	}


	return
}
