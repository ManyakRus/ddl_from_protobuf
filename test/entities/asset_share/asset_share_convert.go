package asset_share

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetShare) ConvertFromProtobuf(i proto.AssetShare)  {
	m.DivYieldFlag = i.DivYieldFlag
	m.DividendRateNano = i.DividendRate.Nano
	m.DividendRateUnits = i.DividendRate.Units
	m.IpoDate = i.IpoDate.AsTime()
	m.IssueKind = i.IssueKind
	m.IssueSizeNano = i.IssueSize.Nano
	m.IssueSizePlanNano = i.IssueSizePlan.Nano
	m.IssueSizePlanUnits = i.IssueSizePlan.Units
	m.IssueSizeUnits = i.IssueSize.Units
	m.NominalCurrency = i.NominalCurrency
	m.NominalNano = i.Nominal.Nano
	m.NominalUnits = i.Nominal.Units
	m.PlacementDate = i.PlacementDate.AsTime()
	m.PreferredShareType = i.PreferredShareType
	m.PrimaryIndex = i.PrimaryIndex
	m.RegistryDate = i.RegistryDate.AsTime()
	m.RepresIsin = i.RepresIsin
	m.TotalFloatNano = i.TotalFloat.Nano
	m.TotalFloatUnits = i.TotalFloat.Units
	m.TypeID = int64(i.Type.Number())

	return
}
