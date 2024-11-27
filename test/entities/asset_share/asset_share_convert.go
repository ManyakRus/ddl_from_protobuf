package asset_share

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetShare) ConvertFromProtobuf(i proto.AssetShare)  {
	m.DivYieldFlag = i.DivYieldFlag

	if i.DividendRate != nil {
		m.DividendRateNano = i.DividendRate.Nano
	} else {
		m.DividendRateNano = 0
	}


	if i.DividendRate != nil {
		m.DividendRateUnits = i.DividendRate.Units
	} else {
		m.DividendRateUnits = 0
	}

	m.IpoDate = i.IpoDate.AsTime()
	m.IssueKind = i.IssueKind

	if i.IssueSize != nil {
		m.IssueSizeNano = i.IssueSize.Nano
	} else {
		m.IssueSizeNano = 0
	}


	if i.IssueSizePlan != nil {
		m.IssueSizePlanNano = i.IssueSizePlan.Nano
	} else {
		m.IssueSizePlanNano = 0
	}


	if i.IssueSizePlan != nil {
		m.IssueSizePlanUnits = i.IssueSizePlan.Units
	} else {
		m.IssueSizePlanUnits = 0
	}


	if i.IssueSize != nil {
		m.IssueSizeUnits = i.IssueSize.Units
	} else {
		m.IssueSizeUnits = 0
	}

	m.NominalCurrency = i.NominalCurrency

	if i.Nominal != nil {
		m.NominalNano = i.Nominal.Nano
	} else {
		m.NominalNano = 0
	}


	if i.Nominal != nil {
		m.NominalUnits = i.Nominal.Units
	} else {
		m.NominalUnits = 0
	}

	m.PlacementDate = i.PlacementDate.AsTime()
	m.PreferredShareType = i.PreferredShareType
	m.PrimaryIndex = i.PrimaryIndex
	m.RegistryDate = i.RegistryDate.AsTime()
	m.RepresIsin = i.RepresIsin

	if i.TotalFloat != nil {
		m.TotalFloatNano = i.TotalFloat.Nano
	} else {
		m.TotalFloatNano = 0
	}


	if i.TotalFloat != nil {
		m.TotalFloatUnits = i.TotalFloat.Units
	} else {
		m.TotalFloatUnits = 0
	}

	m.TypeID = int64(i.Type.Number())

	return
}
