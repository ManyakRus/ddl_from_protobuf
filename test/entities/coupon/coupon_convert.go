package coupon

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Coupon) ConvertFromProtobuf(i proto.Coupon)  {
	m.CouponDate = micro.Date_from_TimestampReference(i.CouponDate)
	m.CouponEndDate = micro.Date_from_TimestampReference(i.CouponEndDate)
	m.CouponNumber = i.CouponNumber
	m.CouponPeriod = i.CouponPeriod
	m.CouponStartDate = micro.Date_from_TimestampReference(i.CouponStartDate)
	m.CouponTypeID = int64(i.CouponType.Number())
	m.Figi = i.Figi
	m.FixDate = micro.Date_from_TimestampReference(i.FixDate)

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
