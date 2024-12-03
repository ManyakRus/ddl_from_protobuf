package tinkoff_brand

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *Brand) ConvertFromProtobuf(i proto.Brand)  {
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
