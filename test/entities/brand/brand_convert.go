package brand

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Brand) ConvertFromProtobuf(i investapi.Brand)  {
	m.Company = i.Company
	m.CountryOfRisk = i.CountryOfRisk
	m.CountryOfRiskName = i.CountryOfRiskName
	m.Description = i.Description
	m.Info = i.Info
	m.Name = i.Name
	m.Sector = i.Sector
	m.Uid = i.Uid

	return
}
