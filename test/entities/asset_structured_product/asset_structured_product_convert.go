package asset_structured_product

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetStructuredProduct) ConvertFromProtobuf(i proto.AssetStructuredProduct)  {
	m.AssetTypeID = int64(i.AssetType.Number())
	m.BasicAsset = i.BasicAsset
	m.BorrowName = i.BorrowName
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

	m.LogicPortfolio = i.LogicPortfolio
	m.MaturityDate = micro.Date_from_TimestampReference(i.MaturityDate)
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

	m.PlacementDate = micro.Date_from_TimestampReference(i.PlacementDate)

	if i.SafetyBarrier != nil {
		m.SafetyBarrierNano = i.SafetyBarrier.Nano
	} else {
		m.SafetyBarrierNano = 0
	}


	if i.SafetyBarrier != nil {
		m.SafetyBarrierUnits = i.SafetyBarrier.Units
	} else {
		m.SafetyBarrierUnits = 0
	}

	m.TypeID = int64(i.Type.Number())

	return
}
