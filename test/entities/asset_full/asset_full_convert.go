package asset_full

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetFull) ConvertFromProtobuf(i investapi.AssetFull)  {
	m.BrCode = i.BrCode
	m.BrCodeName = i.BrCodeName
	m.BrandID = i.Brand.Uid
	m.Cfi = i.Cfi
	m.CodeNsd = i.CodeNsd
	m.DeletedAt = i.DeletedAt.AsTime()
	m.Description = i.Description
	m.GosRegCode = i.GosRegCode
	m.Name = i.Name
	m.NameBrief = i.NameBrief
	m.Status = i.Status
	m.TypeID = int64(i.Type.Number())
	m.Uid = i.Uid
	m.UpdatedAt = i.UpdatedAt.AsTime()

	return
}
