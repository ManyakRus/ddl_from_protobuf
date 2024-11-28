package asset_bond

import (
	"github.com/ManyakRus/starter/micro"
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetBond) ConvertFromProtobuf(i proto.AssetBond)  {
	m.AmortizationFlag = i.AmortizationFlag
	m.BorrowName = i.BorrowName
	m.CollateralFlag = i.CollateralFlag
	m.CouponQuantityPerYear = i.CouponQuantityPerYear

	if i.CurrentNominal != nil {
		m.CurrentNominalNano = i.CurrentNominal.Nano
	} else {
		m.CurrentNominalNano = 0
	}


	if i.CurrentNominal != nil {
		m.CurrentNominalUnits = i.CurrentNominal.Units
	} else {
		m.CurrentNominalUnits = 0
	}

	m.FloatingCouponFlag = i.FloatingCouponFlag
	m.IndexedNominalFlag = i.IndexedNominalFlag
	m.InterestKind = i.InterestKind
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

	m.PerpetualFlag = i.PerpetualFlag
	m.PlacementDate = micro.Date_from_TimestampReference(i.PlacementDate)

	if i.PlacementPrice != nil {
		m.PlacementPriceNano = i.PlacementPrice.Nano
	} else {
		m.PlacementPriceNano = 0
	}


	if i.PlacementPrice != nil {
		m.PlacementPriceUnits = i.PlacementPrice.Units
	} else {
		m.PlacementPriceUnits = 0
	}

	m.ReturnCondition = i.ReturnCondition
	m.StateRegDate = micro.Date_from_TimestampReference(i.StateRegDate)
	m.SubordinatedFlag = i.SubordinatedFlag
	m.TaxFreeFlag = i.TaxFreeFlag

	return
}
