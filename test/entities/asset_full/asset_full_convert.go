package asset_full

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetFull) ConvertFromProtobuf(i proto.AssetFull)  {
	m.BrCode = i.BrCode
	m.BrCodeName = i.BrCodeName

	if i.Brand != nil {
		m.BrandID = i.Brand.Uid
	} else {
		m.BrandID = ""
	}

	m.Cfi = i.Cfi
	m.CodeNsd = i.CodeNsd
	m.DeletedAt = micro.Date_from_TimestampReference(i.DeletedAt)
	m.Description = i.Description
	m.GosRegCode = i.GosRegCode
	m.Name = i.Name
	m.NameBrief = i.NameBrief
	m.Status = i.Status
	m.TypeID = int64(i.Type.Number())
	m.Uid = i.Uid
	m.UpdatedAt = micro.Date_from_TimestampReference(i.UpdatedAt)

	return
}
