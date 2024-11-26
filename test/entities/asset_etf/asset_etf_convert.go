package asset_etf

import (
	"github.com/ManyakRus/tinkoff_invest/api/invest_api/investapi"
)

// ConvertFromProtobuf - создаёт модель protobuf из модели crud
func (m *AssetEtf) ConvertFromProtobuf(i investapi.AssetEtf)  {
	m.BuyPremiumNano = i.BuyPremium.Nano
	m.BuyPremiumUnits = i.BuyPremium.Units
	m.Description = i.Description
	m.DivYieldFlag = i.DivYieldFlag
	m.ExpenseCommissionNano = i.ExpenseCommission.Nano
	m.ExpenseCommissionUnits = i.ExpenseCommission.Units
	m.FixedCommissionNano = i.FixedCommission.Nano
	m.FixedCommissionUnits = i.FixedCommission.Units
	m.FocusType = i.FocusType
	m.HurdleRateNano = i.HurdleRate.Nano
	m.HurdleRateUnits = i.HurdleRate.Units
	m.InavCode = i.InavCode
	m.IndexRecoveryPeriodNano = i.IndexRecoveryPeriod.Nano
	m.IndexRecoveryPeriodUnits = i.IndexRecoveryPeriod.Units
	m.IssueKind = i.IssueKind
	m.LeveragedFlag = i.LeveragedFlag
	m.ManagementType = i.ManagementType
	m.NominalCurrency = i.NominalCurrency
	m.NominalNano = i.Nominal.Nano
	m.NominalUnits = i.Nominal.Units
	m.NumShareNano = i.NumShare.Nano
	m.NumShareUnits = i.NumShare.Units
	m.PaymentType = i.PaymentType
	m.PerformanceFeeNano = i.PerformanceFee.Nano
	m.PerformanceFeeUnits = i.PerformanceFee.Units
	m.PrimaryIndex = i.PrimaryIndex
	m.PrimaryIndexCompany = i.PrimaryIndexCompany
	m.PrimaryIndexDescription = i.PrimaryIndexDescription
	m.PrimaryIndexTrackingErrorNano = i.PrimaryIndexTrackingError.Nano
	m.PrimaryIndexTrackingErrorUnits = i.PrimaryIndexTrackingError.Units
	m.RebalancingFlag = i.RebalancingFlag
	m.RebalancingFreq = i.RebalancingFreq
	m.RebalancingPlan = i.RebalancingPlan
	m.ReleasedDate = i.ReleasedDate.AsTime()
	m.SellDiscountNano = i.SellDiscount.Nano
	m.SellDiscountUnits = i.SellDiscount.Units
	m.TaxRate = i.TaxRate
	m.TotalExpenseNano = i.TotalExpense.Nano
	m.TotalExpenseUnits = i.TotalExpense.Units
	m.UcitsFlag = i.UcitsFlag
	m.WatermarkFlag = i.WatermarkFlag

	return
}
