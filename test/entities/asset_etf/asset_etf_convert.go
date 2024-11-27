package asset_etf

import (
	proto "github.com/tinkoff/invest-api-go-sdk/proto"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetEtf) ConvertFromProtobuf(i proto.AssetEtf)  {

	if i.BuyPremium != nil {
		m.BuyPremiumNano = i.BuyPremium.Nano
	} else {
		m.BuyPremiumNano = 0
	}


	if i.BuyPremium != nil {
		m.BuyPremiumUnits = i.BuyPremium.Units
	} else {
		m.BuyPremiumUnits = 0
	}

	m.Description = i.Description
	m.DivYieldFlag = i.DivYieldFlag

	if i.ExpenseCommission != nil {
		m.ExpenseCommissionNano = i.ExpenseCommission.Nano
	} else {
		m.ExpenseCommissionNano = 0
	}


	if i.ExpenseCommission != nil {
		m.ExpenseCommissionUnits = i.ExpenseCommission.Units
	} else {
		m.ExpenseCommissionUnits = 0
	}


	if i.FixedCommission != nil {
		m.FixedCommissionNano = i.FixedCommission.Nano
	} else {
		m.FixedCommissionNano = 0
	}


	if i.FixedCommission != nil {
		m.FixedCommissionUnits = i.FixedCommission.Units
	} else {
		m.FixedCommissionUnits = 0
	}

	m.FocusType = i.FocusType

	if i.HurdleRate != nil {
		m.HurdleRateNano = i.HurdleRate.Nano
	} else {
		m.HurdleRateNano = 0
	}


	if i.HurdleRate != nil {
		m.HurdleRateUnits = i.HurdleRate.Units
	} else {
		m.HurdleRateUnits = 0
	}

	m.InavCode = i.InavCode

	if i.IndexRecoveryPeriod != nil {
		m.IndexRecoveryPeriodNano = i.IndexRecoveryPeriod.Nano
	} else {
		m.IndexRecoveryPeriodNano = 0
	}


	if i.IndexRecoveryPeriod != nil {
		m.IndexRecoveryPeriodUnits = i.IndexRecoveryPeriod.Units
	} else {
		m.IndexRecoveryPeriodUnits = 0
	}

	m.IssueKind = i.IssueKind
	m.LeveragedFlag = i.LeveragedFlag
	m.ManagementType = i.ManagementType
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


	if i.NumShare != nil {
		m.NumShareNano = i.NumShare.Nano
	} else {
		m.NumShareNano = 0
	}


	if i.NumShare != nil {
		m.NumShareUnits = i.NumShare.Units
	} else {
		m.NumShareUnits = 0
	}

	m.PaymentType = i.PaymentType

	if i.PerformanceFee != nil {
		m.PerformanceFeeNano = i.PerformanceFee.Nano
	} else {
		m.PerformanceFeeNano = 0
	}


	if i.PerformanceFee != nil {
		m.PerformanceFeeUnits = i.PerformanceFee.Units
	} else {
		m.PerformanceFeeUnits = 0
	}

	m.PrimaryIndex = i.PrimaryIndex
	m.PrimaryIndexCompany = i.PrimaryIndexCompany
	m.PrimaryIndexDescription = i.PrimaryIndexDescription

	if i.PrimaryIndexTrackingError != nil {
		m.PrimaryIndexTrackingErrorNano = i.PrimaryIndexTrackingError.Nano
	} else {
		m.PrimaryIndexTrackingErrorNano = 0
	}


	if i.PrimaryIndexTrackingError != nil {
		m.PrimaryIndexTrackingErrorUnits = i.PrimaryIndexTrackingError.Units
	} else {
		m.PrimaryIndexTrackingErrorUnits = 0
	}

	m.RebalancingFlag = i.RebalancingFlag
	m.RebalancingFreq = i.RebalancingFreq
	m.RebalancingPlan = i.RebalancingPlan
	m.ReleasedDate = i.ReleasedDate.AsTime()

	if i.SellDiscount != nil {
		m.SellDiscountNano = i.SellDiscount.Nano
	} else {
		m.SellDiscountNano = 0
	}


	if i.SellDiscount != nil {
		m.SellDiscountUnits = i.SellDiscount.Units
	} else {
		m.SellDiscountUnits = 0
	}

	m.TaxRate = i.TaxRate

	if i.TotalExpense != nil {
		m.TotalExpenseNano = i.TotalExpense.Nano
	} else {
		m.TotalExpenseNano = 0
	}


	if i.TotalExpense != nil {
		m.TotalExpenseUnits = i.TotalExpense.Units
	} else {
		m.TotalExpenseUnits = 0
	}

	m.UcitsFlag = i.UcitsFlag
	m.WatermarkFlag = i.WatermarkFlag

	return
}
