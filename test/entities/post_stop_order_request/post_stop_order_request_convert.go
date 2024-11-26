package post_stop_order_request

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *PostStopOrderRequest) ConvertFromProtobuf(i investapi.PostStopOrderRequest)  {
	m.AccountID = i.AccountId
	m.DirectionID = int64(i.Direction.Number())
	m.ExpirationTypeID = int64(i.ExpirationType.Number())
	m.ExpireDate = i.ExpireDate.AsTime()
	m.InstrumentID = i.InstrumentId
	m.PriceNano = i.Price.Nano
	m.PriceUnits = i.Price.Units
	m.Quantity = i.Quantity
	m.StopOrderTypeID = int64(i.StopOrderType.Number())
	m.StopPriceNano = i.StopPrice.Nano
	m.StopPriceUnits = i.StopPrice.Units

	return
}
