
CREATE TABLE "public"."AccessLevel" (
	"id" int64,
	"name" text,
	CONSTRAINT AccessLevel_pk PRIMARY KEY (id)
);
CREATE INDEX AccessLevel_id_idx ON public.AccessLevel USING btree (id);
COMMENT ON TABLE "public"."AccessLevel" IS 'Уровень доступа к счёту.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ACCOUNT_ACCESS_LEVEL_UNSPECIFIED'),
(1, 'ACCOUNT_ACCESS_LEVEL_FULL_ACCESS'),
(2, 'ACCOUNT_ACCESS_LEVEL_READ_ONLY'),
(3, 'ACCOUNT_ACCESS_LEVEL_NO_ACCESS');


CREATE TABLE "public"."AccountStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT AccountStatus_pk PRIMARY KEY (id)
);
CREATE INDEX AccountStatus_id_idx ON public.AccountStatus USING btree (id);
COMMENT ON TABLE "public"."AccountStatus" IS 'Статус счёта.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ACCOUNT_STATUS_UNSPECIFIED'),
(1, 'ACCOUNT_STATUS_NEW'),
(2, 'ACCOUNT_STATUS_OPEN'),
(3, 'ACCOUNT_STATUS_CLOSED');


CREATE TABLE "public"."AccountType" (
	"id" int64,
	"name" text,
	CONSTRAINT AccountType_pk PRIMARY KEY (id)
);
CREATE INDEX AccountType_id_idx ON public.AccountType USING btree (id);
COMMENT ON TABLE "public"."AccountType" IS 'Тип счёта.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ACCOUNT_TYPE_UNSPECIFIED'),
(1, 'ACCOUNT_TYPE_TINKOFF'),
(2, 'ACCOUNT_TYPE_TINKOFF_IIS'),
(3, 'ACCOUNT_TYPE_INVEST_BOX');


CREATE TABLE "public"."AssetType" (
	"id" int64,
	"name" text,
	CONSTRAINT AssetType_pk PRIMARY KEY (id)
);
CREATE INDEX AssetType_id_idx ON public.AssetType USING btree (id);
COMMENT ON TABLE "public"."AssetType" IS 'Тип актива.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ASSET_TYPE_UNSPECIFIED'),
(1, 'ASSET_TYPE_CURRENCY'),
(2, 'ASSET_TYPE_COMMODITY'),
(3, 'ASSET_TYPE_INDEX'),
(4, 'ASSET_TYPE_SECURITY');


CREATE TABLE "public"."CandleInterval" (
	"id" int64,
	"name" text,
	CONSTRAINT CandleInterval_pk PRIMARY KEY (id)
);
CREATE INDEX CandleInterval_id_idx ON public.CandleInterval USING btree (id);
COMMENT ON TABLE "public"."CandleInterval" IS 'Интервал свечей.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'CANDLE_INTERVAL_UNSPECIFIED'),
(1, 'CANDLE_INTERVAL_1_MIN'),
(2, 'CANDLE_INTERVAL_5_MIN'),
(3, 'CANDLE_INTERVAL_15_MIN'),
(4, 'CANDLE_INTERVAL_HOUR'),
(5, 'CANDLE_INTERVAL_DAY'),
(6, 'CANDLE_INTERVAL_2_MIN'),
(7, 'CANDLE_INTERVAL_3_MIN'),
(8, 'CANDLE_INTERVAL_10_MIN'),
(9, 'CANDLE_INTERVAL_30_MIN'),
(10, 'CANDLE_INTERVAL_2_HOUR'),
(11, 'CANDLE_INTERVAL_4_HOUR'),
(12, 'CANDLE_INTERVAL_WEEK'),
(13, 'CANDLE_INTERVAL_MONTH');


CREATE TABLE "public"."CouponType" (
	"id" int64,
	"name" text,
	CONSTRAINT CouponType_pk PRIMARY KEY (id)
);
CREATE INDEX CouponType_id_idx ON public.CouponType USING btree (id);
COMMENT ON TABLE "public"."CouponType" IS 'Тип купонов.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'COUPON_TYPE_UNSPECIFIED'),
(1, 'COUPON_TYPE_CONSTANT'),
(2, 'COUPON_TYPE_FLOATING'),
(3, 'COUPON_TYPE_DISCOUNT'),
(4, 'COUPON_TYPE_MORTGAGE'),
(5, 'COUPON_TYPE_FIX'),
(6, 'COUPON_TYPE_VARIABLE'),
(7, 'COUPON_TYPE_OTHER');


CREATE TABLE "public"."CurrencyRequest" (
	"id" int64,
	"name" text,
	CONSTRAINT CurrencyRequest_pk PRIMARY KEY (id)
);
CREATE INDEX CurrencyRequest_id_idx ON public.CurrencyRequest USING btree (id);
COMMENT ON TABLE "public"."CurrencyRequest" IS '';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'RUB'),
(1, 'USD'),
(2, 'EUR');


CREATE TABLE "public"."EditFavoritesActionType" (
	"id" int64,
	"name" text,
	CONSTRAINT EditFavoritesActionType_pk PRIMARY KEY (id)
);
CREATE INDEX EditFavoritesActionType_id_idx ON public.EditFavoritesActionType USING btree (id);
COMMENT ON TABLE "public"."EditFavoritesActionType" IS 'Тип действия со списком избранных инструментов.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'EDIT_FAVORITES_ACTION_TYPE_UNSPECIFIED'),
(1, 'EDIT_FAVORITES_ACTION_TYPE_ADD'),
(2, 'EDIT_FAVORITES_ACTION_TYPE_DEL');


CREATE TABLE "public"."InstrumentIdType" (
	"id" int64,
	"name" text,
	CONSTRAINT InstrumentIdType_pk PRIMARY KEY (id)
);
CREATE INDEX InstrumentIdType_id_idx ON public.InstrumentIdType USING btree (id);
COMMENT ON TABLE "public"."InstrumentIdType" IS 'Тип идентификатора инструмента. Подробнее об идентификации инструментов: [Идентификация инструментов](https://tinkoff.github.io/investAPI/faq_identification/)';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'INSTRUMENT_ID_UNSPECIFIED'),
(1, 'INSTRUMENT_ID_TYPE_FIGI'),
(2, 'INSTRUMENT_ID_TYPE_TICKER'),
(3, 'INSTRUMENT_ID_TYPE_UID'),
(4, 'INSTRUMENT_ID_TYPE_POSITION_UID');


CREATE TABLE "public"."InstrumentStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT InstrumentStatus_pk PRIMARY KEY (id)
);
CREATE INDEX InstrumentStatus_id_idx ON public.InstrumentStatus USING btree (id);
COMMENT ON TABLE "public"."InstrumentStatus" IS 'Статус запрашиваемых инструментов.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'INSTRUMENT_STATUS_UNSPECIFIED'),
(1, 'INSTRUMENT_STATUS_BASE'),
(2, 'INSTRUMENT_STATUS_ALL');


CREATE TABLE "public"."InstrumentType" (
	"id" int64,
	"name" text,
	CONSTRAINT InstrumentType_pk PRIMARY KEY (id)
);
CREATE INDEX InstrumentType_id_idx ON public.InstrumentType USING btree (id);
COMMENT ON TABLE "public"."InstrumentType" IS 'Тип инструмента.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'INSTRUMENT_TYPE_UNSPECIFIED'),
(1, 'INSTRUMENT_TYPE_BOND'),
(2, 'INSTRUMENT_TYPE_SHARE'),
(3, 'INSTRUMENT_TYPE_CURRENCY'),
(4, 'INSTRUMENT_TYPE_ETF'),
(5, 'INSTRUMENT_TYPE_FUTURES'),
(6, 'INSTRUMENT_TYPE_SP'),
(7, 'INSTRUMENT_TYPE_OPTION'),
(8, 'INSTRUMENT_TYPE_CLEARING_CERTIFICATE');


CREATE TABLE "public"."OperationState" (
	"id" int64,
	"name" text,
	CONSTRAINT OperationState_pk PRIMARY KEY (id)
);
CREATE INDEX OperationState_id_idx ON public.OperationState USING btree (id);
COMMENT ON TABLE "public"."OperationState" IS 'Статус запрашиваемых операций.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPERATION_STATE_UNSPECIFIED'),
(1, 'OPERATION_STATE_EXECUTED'),
(2, 'OPERATION_STATE_CANCELED'),
(3, 'OPERATION_STATE_PROGRESS');


CREATE TABLE "public"."OperationType" (
	"id" int64,
	"name" text,
	CONSTRAINT OperationType_pk PRIMARY KEY (id)
);
CREATE INDEX OperationType_id_idx ON public.OperationType USING btree (id);
COMMENT ON TABLE "public"."OperationType" IS 'Тип операции.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPERATION_TYPE_UNSPECIFIED'),
(1, 'OPERATION_TYPE_INPUT'),
(2, 'OPERATION_TYPE_BOND_TAX'),
(3, 'OPERATION_TYPE_OUTPUT_SECURITIES'),
(4, 'OPERATION_TYPE_OVERNIGHT'),
(5, 'OPERATION_TYPE_TAX'),
(6, 'OPERATION_TYPE_BOND_REPAYMENT_FULL'),
(7, 'OPERATION_TYPE_SELL_CARD'),
(8, 'OPERATION_TYPE_DIVIDEND_TAX'),
(9, 'OPERATION_TYPE_OUTPUT'),
(10, 'OPERATION_TYPE_BOND_REPAYMENT'),
(11, 'OPERATION_TYPE_TAX_CORRECTION'),
(12, 'OPERATION_TYPE_SERVICE_FEE'),
(13, 'OPERATION_TYPE_BENEFIT_TAX'),
(14, 'OPERATION_TYPE_MARGIN_FEE'),
(15, 'OPERATION_TYPE_BUY'),
(16, 'OPERATION_TYPE_BUY_CARD'),
(17, 'OPERATION_TYPE_INPUT_SECURITIES'),
(18, 'OPERATION_TYPE_SELL_MARGIN'),
(19, 'OPERATION_TYPE_BROKER_FEE'),
(20, 'OPERATION_TYPE_BUY_MARGIN'),
(21, 'OPERATION_TYPE_DIVIDEND'),
(22, 'OPERATION_TYPE_SELL'),
(23, 'OPERATION_TYPE_COUPON'),
(24, 'OPERATION_TYPE_SUCCESS_FEE'),
(25, 'OPERATION_TYPE_DIVIDEND_TRANSFER'),
(26, 'OPERATION_TYPE_ACCRUING_VARMARGIN'),
(27, 'OPERATION_TYPE_WRITING_OFF_VARMARGIN'),
(28, 'OPERATION_TYPE_DELIVERY_BUY'),
(29, 'OPERATION_TYPE_DELIVERY_SELL'),
(30, 'OPERATION_TYPE_TRACK_MFEE'),
(31, 'OPERATION_TYPE_TRACK_PFEE'),
(32, 'OPERATION_TYPE_TAX_PROGRESSIVE'),
(33, 'OPERATION_TYPE_BOND_TAX_PROGRESSIVE'),
(34, 'OPERATION_TYPE_DIVIDEND_TAX_PROGRESSIVE'),
(35, 'OPERATION_TYPE_BENEFIT_TAX_PROGRESSIVE'),
(36, 'OPERATION_TYPE_TAX_CORRECTION_PROGRESSIVE'),
(37, 'OPERATION_TYPE_TAX_REPO_PROGRESSIVE'),
(38, 'OPERATION_TYPE_TAX_REPO'),
(39, 'OPERATION_TYPE_TAX_REPO_HOLD'),
(40, 'OPERATION_TYPE_TAX_REPO_REFUND'),
(41, 'OPERATION_TYPE_TAX_REPO_HOLD_PROGRESSIVE'),
(42, 'OPERATION_TYPE_TAX_REPO_REFUND_PROGRESSIVE'),
(43, 'OPERATION_TYPE_DIV_EXT'),
(44, 'OPERATION_TYPE_TAX_CORRECTION_COUPON'),
(45, 'OPERATION_TYPE_CASH_FEE'),
(46, 'OPERATION_TYPE_OUT_FEE'),
(47, 'OPERATION_TYPE_OUT_STAMP_DUTY'),
(50, 'OPERATION_TYPE_OUTPUT_SWIFT'),
(51, 'OPERATION_TYPE_INPUT_SWIFT'),
(53, 'OPERATION_TYPE_OUTPUT_ACQUIRING'),
(54, 'OPERATION_TYPE_INPUT_ACQUIRING'),
(55, 'OPERATION_TYPE_OUTPUT_PENALTY'),
(56, 'OPERATION_TYPE_ADVICE_FEE'),
(57, 'OPERATION_TYPE_TRANS_IIS_BS'),
(58, 'OPERATION_TYPE_TRANS_BS_BS'),
(59, 'OPERATION_TYPE_OUT_MULTI'),
(60, 'OPERATION_TYPE_INP_MULTI'),
(61, 'OPERATION_TYPE_OVER_PLACEMENT'),
(62, 'OPERATION_TYPE_OVER_COM'),
(63, 'OPERATION_TYPE_OVER_INCOME'),
(64, 'OPERATION_TYPE_OPTION_EXPIRATION');


CREATE TABLE "public"."OptionDirection" (
	"id" int64,
	"name" text,
	CONSTRAINT OptionDirection_pk PRIMARY KEY (id)
);
CREATE INDEX OptionDirection_id_idx ON public.OptionDirection USING btree (id);
COMMENT ON TABLE "public"."OptionDirection" IS 'Тип опциона по направлению сделки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPTION_DIRECTION_UNSPECIFIED'),
(1, 'OPTION_DIRECTION_PUT'),
(2, 'OPTION_DIRECTION_CALL');


CREATE TABLE "public"."OptionPaymentType" (
	"id" int64,
	"name" text,
	CONSTRAINT OptionPaymentType_pk PRIMARY KEY (id)
);
CREATE INDEX OptionPaymentType_id_idx ON public.OptionPaymentType USING btree (id);
COMMENT ON TABLE "public"."OptionPaymentType" IS 'Тип расчетов по опциону.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPTION_PAYMENT_TYPE_UNSPECIFIED'),
(1, 'OPTION_PAYMENT_TYPE_PREMIUM'),
(2, 'OPTION_PAYMENT_TYPE_MARGINAL');


CREATE TABLE "public"."OptionSettlementType" (
	"id" int64,
	"name" text,
	CONSTRAINT OptionSettlementType_pk PRIMARY KEY (id)
);
CREATE INDEX OptionSettlementType_id_idx ON public.OptionSettlementType USING btree (id);
COMMENT ON TABLE "public"."OptionSettlementType" IS 'Тип опциона по способу исполнения.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPTION_EXECUTION_TYPE_UNSPECIFIED'),
(1, 'OPTION_EXECUTION_TYPE_PHYSICAL_DELIVERY'),
(2, 'OPTION_EXECUTION_TYPE_CASH_SETTLEMENT');


CREATE TABLE "public"."OptionStyle" (
	"id" int64,
	"name" text,
	CONSTRAINT OptionStyle_pk PRIMARY KEY (id)
);
CREATE INDEX OptionStyle_id_idx ON public.OptionStyle USING btree (id);
COMMENT ON TABLE "public"."OptionStyle" IS 'Тип опциона по стилю.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'OPTION_STYLE_UNSPECIFIED'),
(1, 'OPTION_STYLE_AMERICAN'),
(2, 'OPTION_STYLE_EUROPEAN');


CREATE TABLE "public"."OrderDirection" (
	"id" int64,
	"name" text,
	CONSTRAINT OrderDirection_pk PRIMARY KEY (id)
);
CREATE INDEX OrderDirection_id_idx ON public.OrderDirection USING btree (id);
COMMENT ON TABLE "public"."OrderDirection" IS 'Направление операции.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ORDER_DIRECTION_UNSPECIFIED'),
(1, 'ORDER_DIRECTION_BUY'),
(2, 'ORDER_DIRECTION_SELL');


CREATE TABLE "public"."OrderExecutionReportStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT OrderExecutionReportStatus_pk PRIMARY KEY (id)
);
CREATE INDEX OrderExecutionReportStatus_id_idx ON public.OrderExecutionReportStatus USING btree (id);
COMMENT ON TABLE "public"."OrderExecutionReportStatus" IS 'Текущий статус заявки (поручения)';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'EXECUTION_REPORT_STATUS_UNSPECIFIED'),
(1, 'EXECUTION_REPORT_STATUS_FILL'),
(2, 'EXECUTION_REPORT_STATUS_REJECTED'),
(3, 'EXECUTION_REPORT_STATUS_CANCELLED'),
(4, 'EXECUTION_REPORT_STATUS_NEW'),
(5, 'EXECUTION_REPORT_STATUS_PARTIALLYFILL');


CREATE TABLE "public"."OrderType" (
	"id" int64,
	"name" text,
	CONSTRAINT OrderType_pk PRIMARY KEY (id)
);
CREATE INDEX OrderType_id_idx ON public.OrderType USING btree (id);
COMMENT ON TABLE "public"."OrderType" IS 'Тип заявки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'ORDER_TYPE_UNSPECIFIED'),
(1, 'ORDER_TYPE_LIMIT'),
(2, 'ORDER_TYPE_MARKET'),
(3, 'ORDER_TYPE_BESTPRICE');


CREATE TABLE "public"."PortfolioSubscriptionStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT PortfolioSubscriptionStatus_pk PRIMARY KEY (id)
);
CREATE INDEX PortfolioSubscriptionStatus_id_idx ON public.PortfolioSubscriptionStatus USING btree (id);
COMMENT ON TABLE "public"."PortfolioSubscriptionStatus" IS 'Результат подписки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'PORTFOLIO_SUBSCRIPTION_STATUS_UNSPECIFIED'),
(1, 'PORTFOLIO_SUBSCRIPTION_STATUS_SUCCESS'),
(2, 'PORTFOLIO_SUBSCRIPTION_STATUS_ACCOUNT_NOT_FOUND'),
(3, 'PORTFOLIO_SUBSCRIPTION_STATUS_INTERNAL_ERROR');


CREATE TABLE "public"."PositionsAccountSubscriptionStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT PositionsAccountSubscriptionStatus_pk PRIMARY KEY (id)
);
CREATE INDEX PositionsAccountSubscriptionStatus_id_idx ON public.PositionsAccountSubscriptionStatus USING btree (id);
COMMENT ON TABLE "public"."PositionsAccountSubscriptionStatus" IS 'Результат подписки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'POSITIONS_SUBSCRIPTION_STATUS_UNSPECIFIED'),
(1, 'POSITIONS_SUBSCRIPTION_STATUS_SUCCESS'),
(2, 'POSITIONS_SUBSCRIPTION_STATUS_ACCOUNT_NOT_FOUND'),
(3, 'POSITIONS_SUBSCRIPTION_STATUS_INTERNAL_ERROR');


CREATE TABLE "public"."PriceType" (
	"id" int64,
	"name" text,
	CONSTRAINT PriceType_pk PRIMARY KEY (id)
);
CREATE INDEX PriceType_id_idx ON public.PriceType USING btree (id);
COMMENT ON TABLE "public"."PriceType" IS 'Тип цены.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'PRICE_TYPE_UNSPECIFIED'),
(1, 'PRICE_TYPE_POINT'),
(2, 'PRICE_TYPE_CURRENCY');


CREATE TABLE "public"."RealExchange" (
	"id" int64,
	"name" text,
	CONSTRAINT RealExchange_pk PRIMARY KEY (id)
);
CREATE INDEX RealExchange_id_idx ON public.RealExchange USING btree (id);
COMMENT ON TABLE "public"."RealExchange" IS 'Реальная площадка исполнения расчётов.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'REAL_EXCHANGE_UNSPECIFIED'),
(1, 'REAL_EXCHANGE_MOEX'),
(2, 'REAL_EXCHANGE_RTS'),
(3, 'REAL_EXCHANGE_OTC');


CREATE TABLE "public"."RiskLevel" (
	"id" int64,
	"name" text,
	CONSTRAINT RiskLevel_pk PRIMARY KEY (id)
);
CREATE INDEX RiskLevel_id_idx ON public.RiskLevel USING btree (id);
COMMENT ON TABLE "public"."RiskLevel" IS 'Уровень риска облигации.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'RISK_LEVEL_UNSPECIFIED'),
(1, 'RISK_LEVEL_LOW'),
(2, 'RISK_LEVEL_MODERATE'),
(3, 'RISK_LEVEL_HIGH');


CREATE TABLE "public"."SecurityTradingStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT SecurityTradingStatus_pk PRIMARY KEY (id)
);
CREATE INDEX SecurityTradingStatus_id_idx ON public.SecurityTradingStatus USING btree (id);
COMMENT ON TABLE "public"."SecurityTradingStatus" IS 'Режим торгов инструмента';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SECURITY_TRADING_STATUS_UNSPECIFIED'),
(1, 'SECURITY_TRADING_STATUS_NOT_AVAILABLE_FOR_TRADING'),
(2, 'SECURITY_TRADING_STATUS_OPENING_PERIOD'),
(3, 'SECURITY_TRADING_STATUS_CLOSING_PERIOD'),
(4, 'SECURITY_TRADING_STATUS_BREAK_IN_TRADING'),
(5, 'SECURITY_TRADING_STATUS_NORMAL_TRADING'),
(6, 'SECURITY_TRADING_STATUS_CLOSING_AUCTION'),
(7, 'SECURITY_TRADING_STATUS_DARK_POOL_AUCTION'),
(8, 'SECURITY_TRADING_STATUS_DISCRETE_AUCTION'),
(9, 'SECURITY_TRADING_STATUS_OPENING_AUCTION_PERIOD'),
(10, 'SECURITY_TRADING_STATUS_TRADING_AT_CLOSING_AUCTION_PRICE'),
(11, 'SECURITY_TRADING_STATUS_SESSION_ASSIGNED'),
(12, 'SECURITY_TRADING_STATUS_SESSION_CLOSE'),
(13, 'SECURITY_TRADING_STATUS_SESSION_OPEN'),
(14, 'SECURITY_TRADING_STATUS_DEALER_NORMAL_TRADING'),
(15, 'SECURITY_TRADING_STATUS_DEALER_BREAK_IN_TRADING'),
(16, 'SECURITY_TRADING_STATUS_DEALER_NOT_AVAILABLE_FOR_TRADING');


CREATE TABLE "public"."ShareType" (
	"id" int64,
	"name" text,
	CONSTRAINT ShareType_pk PRIMARY KEY (id)
);
CREATE INDEX ShareType_id_idx ON public.ShareType USING btree (id);
COMMENT ON TABLE "public"."ShareType" IS 'Тип акций.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SHARE_TYPE_UNSPECIFIED'),
(1, 'SHARE_TYPE_COMMON'),
(2, 'SHARE_TYPE_PREFERRED'),
(3, 'SHARE_TYPE_ADR'),
(4, 'SHARE_TYPE_GDR'),
(5, 'SHARE_TYPE_MLP'),
(6, 'SHARE_TYPE_NY_REG_SHRS'),
(7, 'SHARE_TYPE_CLOSED_END_FUND'),
(8, 'SHARE_TYPE_REIT');


CREATE TABLE "public"."StopOrderDirection" (
	"id" int64,
	"name" text,
	CONSTRAINT StopOrderDirection_pk PRIMARY KEY (id)
);
CREATE INDEX StopOrderDirection_id_idx ON public.StopOrderDirection USING btree (id);
COMMENT ON TABLE "public"."StopOrderDirection" IS 'Направление сделки стоп-заявки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'STOP_ORDER_DIRECTION_UNSPECIFIED'),
(1, 'STOP_ORDER_DIRECTION_BUY'),
(2, 'STOP_ORDER_DIRECTION_SELL');


CREATE TABLE "public"."StopOrderExpirationType" (
	"id" int64,
	"name" text,
	CONSTRAINT StopOrderExpirationType_pk PRIMARY KEY (id)
);
CREATE INDEX StopOrderExpirationType_id_idx ON public.StopOrderExpirationType USING btree (id);
COMMENT ON TABLE "public"."StopOrderExpirationType" IS 'Тип экспирации стоп-заявке.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'STOP_ORDER_EXPIRATION_TYPE_UNSPECIFIED'),
(1, 'STOP_ORDER_EXPIRATION_TYPE_GOOD_TILL_CANCEL'),
(2, 'STOP_ORDER_EXPIRATION_TYPE_GOOD_TILL_DATE');


CREATE TABLE "public"."StopOrderType" (
	"id" int64,
	"name" text,
	CONSTRAINT StopOrderType_pk PRIMARY KEY (id)
);
CREATE INDEX StopOrderType_id_idx ON public.StopOrderType USING btree (id);
COMMENT ON TABLE "public"."StopOrderType" IS 'Тип стоп-заявки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'STOP_ORDER_TYPE_UNSPECIFIED'),
(1, 'STOP_ORDER_TYPE_TAKE_PROFIT'),
(2, 'STOP_ORDER_TYPE_STOP_LOSS'),
(3, 'STOP_ORDER_TYPE_STOP_LIMIT');


CREATE TABLE "public"."StructuredProductType" (
	"id" int64,
	"name" text,
	CONSTRAINT StructuredProductType_pk PRIMARY KEY (id)
);
CREATE INDEX StructuredProductType_id_idx ON public.StructuredProductType USING btree (id);
COMMENT ON TABLE "public"."StructuredProductType" IS 'Тип структурной ноты.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SP_TYPE_UNSPECIFIED'),
(1, 'SP_TYPE_DELIVERABLE'),
(2, 'SP_TYPE_NON_DELIVERABLE');


CREATE TABLE "public"."SubscriptionAction" (
	"id" int64,
	"name" text,
	CONSTRAINT SubscriptionAction_pk PRIMARY KEY (id)
);
CREATE INDEX SubscriptionAction_id_idx ON public.SubscriptionAction USING btree (id);
COMMENT ON TABLE "public"."SubscriptionAction" IS 'Тип операции со списком подписок.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SUBSCRIPTION_ACTION_UNSPECIFIED'),
(1, 'SUBSCRIPTION_ACTION_SUBSCRIBE'),
(2, 'SUBSCRIPTION_ACTION_UNSUBSCRIBE');


CREATE TABLE "public"."SubscriptionInterval" (
	"id" int64,
	"name" text,
	CONSTRAINT SubscriptionInterval_pk PRIMARY KEY (id)
);
CREATE INDEX SubscriptionInterval_id_idx ON public.SubscriptionInterval USING btree (id);
COMMENT ON TABLE "public"."SubscriptionInterval" IS 'Интервал свечи.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SUBSCRIPTION_INTERVAL_UNSPECIFIED'),
(1, 'SUBSCRIPTION_INTERVAL_ONE_MINUTE'),
(2, 'SUBSCRIPTION_INTERVAL_FIVE_MINUTES');


CREATE TABLE "public"."SubscriptionStatus" (
	"id" int64,
	"name" text,
	CONSTRAINT SubscriptionStatus_pk PRIMARY KEY (id)
);
CREATE INDEX SubscriptionStatus_id_idx ON public.SubscriptionStatus USING btree (id);
COMMENT ON TABLE "public"."SubscriptionStatus" IS 'Результат подписки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'SUBSCRIPTION_STATUS_UNSPECIFIED'),
(1, 'SUBSCRIPTION_STATUS_SUCCESS'),
(2, 'SUBSCRIPTION_STATUS_INSTRUMENT_NOT_FOUND'),
(3, 'SUBSCRIPTION_STATUS_SUBSCRIPTION_ACTION_IS_INVALID'),
(4, 'SUBSCRIPTION_STATUS_DEPTH_IS_INVALID'),
(5, 'SUBSCRIPTION_STATUS_INTERVAL_IS_INVALID'),
(6, 'SUBSCRIPTION_STATUS_LIMIT_IS_EXCEEDED'),
(7, 'SUBSCRIPTION_STATUS_INTERNAL_ERROR'),
(8, 'SUBSCRIPTION_STATUS_TOO_MANY_REQUESTS');


CREATE TABLE "public"."TradeDirection" (
	"id" int64,
	"name" text,
	CONSTRAINT TradeDirection_pk PRIMARY KEY (id)
);
CREATE INDEX TradeDirection_id_idx ON public.TradeDirection USING btree (id);
COMMENT ON TABLE "public"."TradeDirection" IS 'Направление сделки.';
INSERT INTO " + TableName + "(id, name) VALUES
(0, 'TRADE_DIRECTION_UNSPECIFIED'),
(1, 'TRADE_DIRECTION_BUY'),
(2, 'TRADE_DIRECTION_SELL');


CREATE TABLE "public"."Account" (
	"id" text NOT NULL,
	"type_id" AccountType NULL,
	"name" text NOT NULL,
	"status_id" AccountStatus NULL,
	"opened_date" timestamptz NULL,
	"closed_date" timestamptz NULL,
	"access_level_id" AccessLevel NULL,
	CONSTRAINT Account_pk PRIMARY KEY (id),
	CONSTRAINT Account_type_id_fk FOREIGN KEY (type_id) REFERENCES public.AccountType (id),
	CONSTRAINT Account_status_id_fk FOREIGN KEY (status_id) REFERENCES public.AccountStatus (id),
	CONSTRAINT Account_access_level_id_fk FOREIGN KEY (access_level_id) REFERENCES public.AccessLevel (id)
);
CREATE INDEX Account_type_id_idx ON public.Account USING btree (type_id);
CREATE INDEX Account_status_id_idx ON public.Account USING btree (status_id);
CREATE INDEX Account_access_level_id_idx ON public.Account USING btree (access_level_id);
COMMENT ON TABLE "public"."Account" IS 'Информация о счёте.';
COMMENT ON COLUMN "public"."Account"."id" IS ' Идентификатор счёта.';
COMMENT ON COLUMN "public"."Account"."type_id" IS ' Тип счёта.';
COMMENT ON COLUMN "public"."Account"."name" IS ' Название счёта.';
COMMENT ON COLUMN "public"."Account"."status_id" IS ' Статус счёта.';
COMMENT ON COLUMN "public"."Account"."opened_date" IS ' Дата открытия счёта в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Account"."closed_date" IS ' Дата закрытия счёта в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Account"."access_level_id" IS ' Уровень доступа к текущему счёту (определяется токеном).';

CREATE TABLE "public"."Asset" (
	"uid" text NOT NULL,
	"type_id" AssetType NULL,
	"name" text NOT NULL,
	"instruments_id" AssetInstrument NULL,
	CONSTRAINT Asset_pk PRIMARY KEY (uid),
	CONSTRAINT Asset_type_id_fk FOREIGN KEY (type_id) REFERENCES public.AssetType (id),
	CONSTRAINT Asset_instruments_id_fk FOREIGN KEY (instruments_id) REFERENCES public.AssetInstrument (uid)
);
CREATE INDEX Asset_type_id_idx ON public.Asset USING btree (type_id);
CREATE INDEX Asset_instruments_id_idx ON public.Asset USING btree (instruments_id);
COMMENT ON TABLE "public"."Asset" IS 'Информация об активе.';
COMMENT ON COLUMN "public"."Asset"."uid" IS 'Уникальный идентификатор актива.';
COMMENT ON COLUMN "public"."Asset"."type_id" IS 'Тип актива.';
COMMENT ON COLUMN "public"."Asset"."name" IS 'Наименование актива.';
COMMENT ON COLUMN "public"."Asset"."instruments_id" IS 'Массив идентификаторов инструментов.';

CREATE TABLE "public"."AssetEtf" (
	"total_expense_id" Quotation NULL,
	"hurdle_rate_id" Quotation NULL,
	"performance_fee_id" Quotation NULL,
	"fixed_commission_id" Quotation NULL,
	"payment_type" text NOT NULL,
	"watermark_flag" bool NOT NULL,
	"buy_premium_id" Quotation NULL,
	"sell_discount_id" Quotation NULL,
	"rebalancing_flag" bool NOT NULL,
	"rebalancing_freq" text NOT NULL,
	"management_type" text NOT NULL,
	"primary_index" text NOT NULL,
	"focus_type" text NOT NULL,
	"leveraged_flag" bool NOT NULL,
	"num_share_id" Quotation NULL,
	"ucits_flag" bool NOT NULL,
	"released_date" timestamptz NULL,
	"description" text NOT NULL,
	"primary_index_description" text NOT NULL,
	"primary_index_company" text NOT NULL,
	"index_recovery_period_id" Quotation NULL,
	"inav_code" text NOT NULL,
	"div_yield_flag" bool NOT NULL,
	"expense_commission_id" Quotation NULL,
	"primary_index_tracking_error_id" Quotation NULL,
	"rebalancing_plan" text NOT NULL,
	"tax_rate" text NOT NULL,
	"rebalancing_dates" timestamptz NULL,
	"issue_kind" text NOT NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency" text NOT NULL,
	CONSTRAINT AssetEtf_pk PRIMARY KEY (primary_index)
);
CREATE INDEX AssetEtf_total_expense_id_idx ON public.AssetEtf USING btree (total_expense_id);
CREATE INDEX AssetEtf_hurdle_rate_id_idx ON public.AssetEtf USING btree (hurdle_rate_id);
CREATE INDEX AssetEtf_performance_fee_id_idx ON public.AssetEtf USING btree (performance_fee_id);
CREATE INDEX AssetEtf_fixed_commission_id_idx ON public.AssetEtf USING btree (fixed_commission_id);
CREATE INDEX AssetEtf_buy_premium_id_idx ON public.AssetEtf USING btree (buy_premium_id);
CREATE INDEX AssetEtf_sell_discount_id_idx ON public.AssetEtf USING btree (sell_discount_id);
CREATE INDEX AssetEtf_num_share_id_idx ON public.AssetEtf USING btree (num_share_id);
CREATE INDEX AssetEtf_index_recovery_period_id_idx ON public.AssetEtf USING btree (index_recovery_period_id);
CREATE INDEX AssetEtf_expense_commission_id_idx ON public.AssetEtf USING btree (expense_commission_id);
CREATE INDEX AssetEtf_primary_index_tracking_error_id_idx ON public.AssetEtf USING btree (primary_index_tracking_error_id);
CREATE INDEX AssetEtf_nominal_id_idx ON public.AssetEtf USING btree (nominal_id);
COMMENT ON TABLE "public"."AssetEtf" IS 'Фонд.';
COMMENT ON COLUMN "public"."AssetEtf"."total_expense_id" IS 'Суммарные расходы фонда (в %).';
COMMENT ON COLUMN "public"."AssetEtf"."hurdle_rate_id" IS 'Барьерная ставка доходности после которой фонд имеет право на perfomance fee (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."performance_fee_id" IS 'Комиссия за успешные результаты фонда (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."fixed_commission_id" IS 'Фиксированная комиссия за управление (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."payment_type" IS 'Тип распределения доходов от выплат по бумагам.';
COMMENT ON COLUMN "public"."AssetEtf"."watermark_flag" IS 'Признак необходимости выхода фонда в плюс для получения комиссии.';
COMMENT ON COLUMN "public"."AssetEtf"."buy_premium_id" IS 'Премия (надбавка к цене) при покупке доли в фонде (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."sell_discount_id" IS 'Ставка дисконта (вычет из цены) при продаже доли в фонде (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_flag" IS 'Признак ребалансируемости портфеля фонда.';
COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_freq" IS 'Периодичность ребалансировки.';
COMMENT ON COLUMN "public"."AssetEtf"."management_type" IS 'Тип управления.';
COMMENT ON COLUMN "public"."AssetEtf"."primary_index" IS 'Индекс, который реплицирует (старается копировать) фонд.';
COMMENT ON COLUMN "public"."AssetEtf"."focus_type" IS 'База ETF.';
COMMENT ON COLUMN "public"."AssetEtf"."leveraged_flag" IS 'Признак использования заемных активов (плечо).';
COMMENT ON COLUMN "public"."AssetEtf"."num_share_id" IS 'Количество акций в обращении.';
COMMENT ON COLUMN "public"."AssetEtf"."ucits_flag" IS 'Признак обязательства по отчетности перед регулятором.';
COMMENT ON COLUMN "public"."AssetEtf"."released_date" IS 'Дата выпуска.';
COMMENT ON COLUMN "public"."AssetEtf"."description" IS 'Описание фонда.';
COMMENT ON COLUMN "public"."AssetEtf"."primary_index_description" IS 'Описание индекса, за которым следует фонд.';
COMMENT ON COLUMN "public"."AssetEtf"."primary_index_company" IS 'Основные компании, в которые вкладывается фонд.';
COMMENT ON COLUMN "public"."AssetEtf"."index_recovery_period_id" IS 'Срок восстановления индекса (после просадки).';
COMMENT ON COLUMN "public"."AssetEtf"."inav_code" IS 'IVAV-код.';
COMMENT ON COLUMN "public"."AssetEtf"."div_yield_flag" IS 'Признак наличия дивидендной доходности.';
COMMENT ON COLUMN "public"."AssetEtf"."expense_commission_id" IS 'Комиссия на покрытие расходов фонда (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."primary_index_tracking_error_id" IS 'Ошибка следования за индексом (в процентах).';
COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_plan" IS 'Плановая ребалансировка портфеля.';
COMMENT ON COLUMN "public"."AssetEtf"."tax_rate" IS 'Ставки налогообложения дивидендов и купонов.';
COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_dates" IS 'Даты ребалансировок.';
COMMENT ON COLUMN "public"."AssetEtf"."issue_kind" IS 'Форма выпуска.';
COMMENT ON COLUMN "public"."AssetEtf"."nominal_id" IS 'Номинал.';
COMMENT ON COLUMN "public"."AssetEtf"."nominal_currency" IS 'Валюта номинала.';

CREATE TABLE "public"."AssetFull" (
	"uid" text NOT NULL,
	"type_id" AssetType NULL,
	"name" text NOT NULL,
	"name_brief" text NOT NULL,
	"description" text NOT NULL,
	"deleted_at" timestamptz NULL,
	"required_tests" text NOT NULL,
	"gos_reg_code" text NOT NULL,
	"cfi" text NOT NULL,
	"code_nsd" text NOT NULL,
	"status" text NOT NULL,
	"brand_id" Brand NULL,
	"updated_at" timestamptz NULL,
	"br_code" text NOT NULL,
	"br_code_name" text NOT NULL,
	"instruments_id" AssetInstrument NULL,
	CONSTRAINT AssetFull_pk PRIMARY KEY (uid),
	CONSTRAINT AssetFull_type_id_fk FOREIGN KEY (type_id) REFERENCES public.AssetType (id),
	CONSTRAINT AssetFull_brand_id_fk FOREIGN KEY (brand_id) REFERENCES public.Brand (uid),
	CONSTRAINT AssetFull_instruments_id_fk FOREIGN KEY (instruments_id) REFERENCES public.AssetInstrument (uid)
);
CREATE INDEX AssetFull_type_id_idx ON public.AssetFull USING btree (type_id);
CREATE INDEX AssetFull_brand_id_idx ON public.AssetFull USING btree (brand_id);
CREATE INDEX AssetFull_instruments_id_idx ON public.AssetFull USING btree (instruments_id);
COMMENT ON TABLE "public"."AssetFull" IS '';
COMMENT ON COLUMN "public"."AssetFull"."uid" IS 'Уникальный идентификатор актива.';
COMMENT ON COLUMN "public"."AssetFull"."type_id" IS 'Тип актива.';
COMMENT ON COLUMN "public"."AssetFull"."name" IS 'Наименование актива.';
COMMENT ON COLUMN "public"."AssetFull"."name_brief" IS 'Короткое наименование актива.';
COMMENT ON COLUMN "public"."AssetFull"."description" IS 'Описание актива.';
COMMENT ON COLUMN "public"."AssetFull"."deleted_at" IS 'Дата и время удаления актива.';
COMMENT ON COLUMN "public"."AssetFull"."required_tests" IS 'Тестирование клиентов.';
COMMENT ON COLUMN "public"."AssetFull"."gos_reg_code" IS 'Номер государственной регистрации.';
COMMENT ON COLUMN "public"."AssetFull"."cfi" IS 'Код CFI.';
COMMENT ON COLUMN "public"."AssetFull"."code_nsd" IS 'Код НРД инструмента.';
COMMENT ON COLUMN "public"."AssetFull"."status" IS 'Статус актива.';
COMMENT ON COLUMN "public"."AssetFull"."brand_id" IS 'Бренд.';
COMMENT ON COLUMN "public"."AssetFull"."updated_at" IS 'Дата и время последнего обновления записи.';
COMMENT ON COLUMN "public"."AssetFull"."br_code" IS 'Код типа ц.б. по классификации Банка России.';
COMMENT ON COLUMN "public"."AssetFull"."br_code_name" IS 'Наименование кода типа ц.б. по классификации Банка России.';
COMMENT ON COLUMN "public"."AssetFull"."instruments_id" IS 'Массив идентификаторов инструментов.';

CREATE TABLE "public"."AssetInstrument" (
	"uid" text NOT NULL,
	"figi" text NOT NULL,
	"instrument_type" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"links_id" InstrumentLink NULL,
	"instrument_kind_id" InstrumentType NULL,
	"position_uid" text NOT NULL,
	CONSTRAINT AssetInstrument_pk PRIMARY KEY (uid),
	CONSTRAINT AssetInstrument_instrument_kind_id_fk FOREIGN KEY (instrument_kind_id) REFERENCES public.InstrumentType (id)
);
CREATE INDEX AssetInstrument_links_id_idx ON public.AssetInstrument USING btree (links_id);
CREATE INDEX AssetInstrument_instrument_kind_id_idx ON public.AssetInstrument USING btree (instrument_kind_id);
COMMENT ON TABLE "public"."AssetInstrument" IS 'Идентификаторы инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."uid" IS 'uid идентификатор инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."figi" IS 'figi идентификатор инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."instrument_type" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."AssetInstrument"."links_id" IS 'Массив связанных инструментов.';
COMMENT ON COLUMN "public"."AssetInstrument"."instrument_kind_id" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."AssetInstrument"."position_uid" IS 'id позиции.';

CREATE TABLE "public"."AssetShare" (
	"type_id" ShareType NULL,
	"issue_size_id" Quotation NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency" text NOT NULL,
	"primary_index" text NOT NULL,
	"dividend_rate_id" Quotation NULL,
	"preferred_share_type" text NOT NULL,
	"ipo_date" timestamptz NULL,
	"registry_date" timestamptz NULL,
	"div_yield_flag" bool NOT NULL,
	"issue_kind" text NOT NULL,
	"placement_date" timestamptz NULL,
	"repres_isin" text NOT NULL,
	"issue_size_plan_id" Quotation NULL,
	"total_float_id" Quotation NULL,
	CONSTRAINT AssetShare_pk PRIMARY KEY (primary_index),
	CONSTRAINT AssetShare_type_id_fk FOREIGN KEY (type_id) REFERENCES public.ShareType (id)
);
CREATE INDEX AssetShare_type_id_idx ON public.AssetShare USING btree (type_id);
CREATE INDEX AssetShare_issue_size_id_idx ON public.AssetShare USING btree (issue_size_id);
CREATE INDEX AssetShare_nominal_id_idx ON public.AssetShare USING btree (nominal_id);
CREATE INDEX AssetShare_dividend_rate_id_idx ON public.AssetShare USING btree (dividend_rate_id);
CREATE INDEX AssetShare_issue_size_plan_id_idx ON public.AssetShare USING btree (issue_size_plan_id);
CREATE INDEX AssetShare_total_float_id_idx ON public.AssetShare USING btree (total_float_id);
COMMENT ON TABLE "public"."AssetShare" IS 'Акция.';
COMMENT ON COLUMN "public"."AssetShare"."type_id" IS 'Тип акции.';
COMMENT ON COLUMN "public"."AssetShare"."issue_size_id" IS 'Объем выпуска (шт.).';
COMMENT ON COLUMN "public"."AssetShare"."nominal_id" IS 'Номинал.';
COMMENT ON COLUMN "public"."AssetShare"."nominal_currency" IS 'Валюта номинала.';
COMMENT ON COLUMN "public"."AssetShare"."primary_index" IS 'Индекс (Bloomberg).';
COMMENT ON COLUMN "public"."AssetShare"."dividend_rate_id" IS 'Ставка дивиденда (для привилегированных акций).';
COMMENT ON COLUMN "public"."AssetShare"."preferred_share_type" IS 'Тип привилегированных акций.';
COMMENT ON COLUMN "public"."AssetShare"."ipo_date" IS 'Дата IPO.';
COMMENT ON COLUMN "public"."AssetShare"."registry_date" IS 'Дата регистрации.';
COMMENT ON COLUMN "public"."AssetShare"."div_yield_flag" IS 'Признак наличия дивидендной доходности.';
COMMENT ON COLUMN "public"."AssetShare"."issue_kind" IS 'Форма выпуска ФИ.';
COMMENT ON COLUMN "public"."AssetShare"."placement_date" IS 'Дата размещения акции.';
COMMENT ON COLUMN "public"."AssetShare"."repres_isin" IS 'ISIN базового актива.';
COMMENT ON COLUMN "public"."AssetShare"."issue_size_plan_id" IS 'Объявленное количество шт.';
COMMENT ON COLUMN "public"."AssetShare"."total_float_id" IS 'Количество акций в свободном обращении.';

CREATE TABLE "public"."Bond" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"isin" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"coupon_quantity_per_year" integer NOT NULL,
	"maturity_date" timestamptz NULL,
	"nominal_id" MoneyValue NULL,
	"initial_nominal_id" MoneyValue NULL,
	"state_reg_date" timestamptz NULL,
	"placement_date" timestamptz NULL,
	"placement_price_id" MoneyValue NULL,
	"aci_value_id" MoneyValue NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"sector" text NOT NULL,
	"issue_kind" text NOT NULL,
	"issue_size" bigint NOT NULL,
	"issue_size_plan" bigint NOT NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"floating_coupon_flag" bool NOT NULL,
	"perpetual_flag" bool NOT NULL,
	"amortization_flag" bool NOT NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"subordinated_flag" bool NOT NULL,
	"liquidity_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	"risk_level_id" RiskLevel NULL,
	CONSTRAINT Bond_pk PRIMARY KEY (uid),
	CONSTRAINT Bond_nominal_id_fk FOREIGN KEY (nominal_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Bond_initial_nominal_id_fk FOREIGN KEY (initial_nominal_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Bond_placement_price_id_fk FOREIGN KEY (placement_price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Bond_aci_value_id_fk FOREIGN KEY (aci_value_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Bond_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Bond_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id),
	CONSTRAINT Bond_risk_level_id_fk FOREIGN KEY (risk_level_id) REFERENCES public.RiskLevel (id)
);
CREATE INDEX Bond_klong_id_idx ON public.Bond USING btree (klong_id);
CREATE INDEX Bond_kshort_id_idx ON public.Bond USING btree (kshort_id);
CREATE INDEX Bond_dlong_id_idx ON public.Bond USING btree (dlong_id);
CREATE INDEX Bond_dshort_id_idx ON public.Bond USING btree (dshort_id);
CREATE INDEX Bond_dlong_min_id_idx ON public.Bond USING btree (dlong_min_id);
CREATE INDEX Bond_dshort_min_id_idx ON public.Bond USING btree (dshort_min_id);
CREATE INDEX Bond_nominal_id_idx ON public.Bond USING btree (nominal_id);
CREATE INDEX Bond_initial_nominal_id_idx ON public.Bond USING btree (initial_nominal_id);
CREATE INDEX Bond_placement_price_id_idx ON public.Bond USING btree (placement_price_id);
CREATE INDEX Bond_aci_value_id_idx ON public.Bond USING btree (aci_value_id);
CREATE INDEX Bond_trading_status_id_idx ON public.Bond USING btree (trading_status_id);
CREATE INDEX Bond_min_price_increment_id_idx ON public.Bond USING btree (min_price_increment_id);
CREATE INDEX Bond_real_exchange_id_idx ON public.Bond USING btree (real_exchange_id);
CREATE INDEX Bond_risk_level_id_idx ON public.Bond USING btree (risk_level_id);
COMMENT ON TABLE "public"."Bond" IS 'Объект передачи информации об облигации.';
COMMENT ON COLUMN "public"."Bond"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Bond"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Bond"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."Bond"."isin" IS 'Isin-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Bond"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Bond"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Bond"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
COMMENT ON COLUMN "public"."Bond"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
COMMENT ON COLUMN "public"."Bond"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Bond"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Bond"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Bond"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Bond"."short_enabled_flag" IS 'Признак доступности для операций в шорт.';
COMMENT ON COLUMN "public"."Bond"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Bond"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Bond"."coupon_quantity_per_year" IS 'Количество выплат по купонам в год.';
COMMENT ON COLUMN "public"."Bond"."maturity_date" IS 'Дата погашения облигации в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Bond"."nominal_id" IS 'Номинал облигации.';
COMMENT ON COLUMN "public"."Bond"."initial_nominal_id" IS 'Первоначальный номинал облигации.';
COMMENT ON COLUMN "public"."Bond"."state_reg_date" IS 'Дата выпуска облигации в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Bond"."placement_date" IS 'Дата размещения в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Bond"."placement_price_id" IS 'Цена размещения.';
COMMENT ON COLUMN "public"."Bond"."aci_value_id" IS 'Значение НКД (накопленного купонного дохода) на дату.';
COMMENT ON COLUMN "public"."Bond"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Bond"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Bond"."sector" IS 'Сектор экономики.';
COMMENT ON COLUMN "public"."Bond"."issue_kind" IS 'Форма выпуска. Возможные значения: </br>**documentary** — документарная; </br>**non_documentary** — бездокументарная.';
COMMENT ON COLUMN "public"."Bond"."issue_size" IS 'Размер выпуска.';
COMMENT ON COLUMN "public"."Bond"."issue_size_plan" IS 'Плановый размер выпуска.';
COMMENT ON COLUMN "public"."Bond"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Bond"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Bond"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Bond"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Bond"."floating_coupon_flag" IS 'Признак облигации с плавающим купоном.';
COMMENT ON COLUMN "public"."Bond"."perpetual_flag" IS 'Признак бессрочной облигации.';
COMMENT ON COLUMN "public"."Bond"."amortization_flag" IS 'Признак облигации с амортизацией долга.';
COMMENT ON COLUMN "public"."Bond"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Bond"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Bond"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Bond"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Bond"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Bond"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Bond"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Bond"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным';
COMMENT ON COLUMN "public"."Bond"."blocked_tca_flag" IS 'Флаг заблокированного ТКС';
COMMENT ON COLUMN "public"."Bond"."subordinated_flag" IS 'Признак субординированной облигации.';
COMMENT ON COLUMN "public"."Bond"."liquidity_flag" IS 'Флаг достаточной ликвидности';
COMMENT ON COLUMN "public"."Bond"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Bond"."first_1day_candle_date" IS 'Дата первой дневной свечи.';
COMMENT ON COLUMN "public"."Bond"."risk_level_id" IS 'Уровень риска.';

CREATE TABLE "public"."Brand" (
	"uid" text NOT NULL,
	"name" text NOT NULL,
	"description" text NOT NULL,
	"info" text NOT NULL,
	"company" text NOT NULL,
	"sector" text NOT NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	CONSTRAINT Brand_pk PRIMARY KEY (uid)
);
COMMENT ON TABLE "public"."Brand" IS 'Бренд.';
COMMENT ON COLUMN "public"."Brand"."uid" IS 'uid идентификатор бренда.';
COMMENT ON COLUMN "public"."Brand"."name" IS 'Наименование бренда.';
COMMENT ON COLUMN "public"."Brand"."description" IS 'Описание.';
COMMENT ON COLUMN "public"."Brand"."info" IS 'Информация о бренде.';
COMMENT ON COLUMN "public"."Brand"."company" IS 'Компания.';
COMMENT ON COLUMN "public"."Brand"."sector" IS 'Сектор.';
COMMENT ON COLUMN "public"."Brand"."country_of_risk" IS 'Код страны риска.';
COMMENT ON COLUMN "public"."Brand"."country_of_risk_name" IS 'Наименование страны риска.';

CREATE TABLE "public"."Currency" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"isin" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"nominal_id" MoneyValue NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"iso_currency_name" text NOT NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Currency_pk PRIMARY KEY (uid),
	CONSTRAINT Currency_nominal_id_fk FOREIGN KEY (nominal_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Currency_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Currency_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id)
);
CREATE INDEX Currency_klong_id_idx ON public.Currency USING btree (klong_id);
CREATE INDEX Currency_kshort_id_idx ON public.Currency USING btree (kshort_id);
CREATE INDEX Currency_dlong_id_idx ON public.Currency USING btree (dlong_id);
CREATE INDEX Currency_dshort_id_idx ON public.Currency USING btree (dshort_id);
CREATE INDEX Currency_dlong_min_id_idx ON public.Currency USING btree (dlong_min_id);
CREATE INDEX Currency_dshort_min_id_idx ON public.Currency USING btree (dshort_min_id);
CREATE INDEX Currency_nominal_id_idx ON public.Currency USING btree (nominal_id);
CREATE INDEX Currency_trading_status_id_idx ON public.Currency USING btree (trading_status_id);
CREATE INDEX Currency_min_price_increment_id_idx ON public.Currency USING btree (min_price_increment_id);
CREATE INDEX Currency_real_exchange_id_idx ON public.Currency USING btree (real_exchange_id);
COMMENT ON TABLE "public"."Currency" IS 'Объект передачи информации о валюте.';
COMMENT ON COLUMN "public"."Currency"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Currency"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Currency"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."Currency"."isin" IS 'Isin-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Currency"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Currency"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Currency"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
COMMENT ON COLUMN "public"."Currency"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
COMMENT ON COLUMN "public"."Currency"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Currency"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Currency"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Currency"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Currency"."short_enabled_flag" IS 'Признак доступности для операций в шорт.';
COMMENT ON COLUMN "public"."Currency"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Currency"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Currency"."nominal_id" IS 'Номинал.';
COMMENT ON COLUMN "public"."Currency"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Currency"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Currency"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Currency"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Currency"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Currency"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Currency"."iso_currency_name" IS 'Строковый ISO-код валюты.';
COMMENT ON COLUMN "public"."Currency"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Currency"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Currency"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Currency"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Currency"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Currency"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Currency"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Currency"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
COMMENT ON COLUMN "public"."Currency"."blocked_tca_flag" IS 'Флаг заблокированного ТКС.';
COMMENT ON COLUMN "public"."Currency"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Currency"."first_1day_candle_date" IS 'Дата первой дневной свечи.';

CREATE TABLE "public"."DividendsForeignIssuerReport" (
	"record_date" timestamptz NULL,
	"payment_date" timestamptz NULL,
	"security_name" text NOT NULL,
	"isin" text NOT NULL,
	"issuer_country" text NOT NULL,
	"quantity" bigint NOT NULL,
	"dividend_id" Quotation NULL,
	"external_commission_id" Quotation NULL,
	"dividend_gross_id" Quotation NULL,
	"tax_id" Quotation NULL,
	"dividend_amount_id" Quotation NULL,
	"currency" text NOT NULL,
	CONSTRAINT DividendsForeignIssuerReport_pk PRIMARY KEY (currency)
);
CREATE INDEX DividendsForeignIssuerReport_dividend_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_id);
CREATE INDEX DividendsForeignIssuerReport_external_commission_id_idx ON public.DividendsForeignIssuerReport USING btree (external_commission_id);
CREATE INDEX DividendsForeignIssuerReport_dividend_gross_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_gross_id);
CREATE INDEX DividendsForeignIssuerReport_tax_id_idx ON public.DividendsForeignIssuerReport USING btree (tax_id);
CREATE INDEX DividendsForeignIssuerReport_dividend_amount_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_amount_id);
COMMENT ON TABLE "public"."DividendsForeignIssuerReport" IS ' Отчёт "Справка о доходах за пределами РФ".';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."record_date" IS 'Дата фиксации реестра.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."payment_date" IS 'Дата выплаты.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."security_name" IS 'Наименование ценной бумаги.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."isin" IS 'ISIN-идентификатор ценной бумаги.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."issuer_country" IS 'Страна эмитента. Для депозитарных расписок указывается страна эмитента базового актива.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."quantity" IS 'Количество ценных бумаг.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_id" IS 'Выплаты на одну бумагу';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."external_commission_id" IS 'Комиссия внешних платёжных агентов.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_gross_id" IS 'Сумма до удержания налога.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."tax_id" IS 'Сумма налога, удержанного агентом.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_amount_id" IS 'Итоговая сумма выплаты.';
COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."currency" IS 'Валюта.';

CREATE TABLE "public"."Etf" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"isin" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"fixed_commission_id" Quotation NULL,
	"focus_type" text NOT NULL,
	"released_date" timestamptz NULL,
	"num_shares_id" Quotation NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"sector" text NOT NULL,
	"rebalancing_freq" text NOT NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"liquidity_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Etf_pk PRIMARY KEY (uid),
	CONSTRAINT Etf_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Etf_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id)
);
CREATE INDEX Etf_klong_id_idx ON public.Etf USING btree (klong_id);
CREATE INDEX Etf_kshort_id_idx ON public.Etf USING btree (kshort_id);
CREATE INDEX Etf_dlong_id_idx ON public.Etf USING btree (dlong_id);
CREATE INDEX Etf_dshort_id_idx ON public.Etf USING btree (dshort_id);
CREATE INDEX Etf_dlong_min_id_idx ON public.Etf USING btree (dlong_min_id);
CREATE INDEX Etf_dshort_min_id_idx ON public.Etf USING btree (dshort_min_id);
CREATE INDEX Etf_fixed_commission_id_idx ON public.Etf USING btree (fixed_commission_id);
CREATE INDEX Etf_num_shares_id_idx ON public.Etf USING btree (num_shares_id);
CREATE INDEX Etf_trading_status_id_idx ON public.Etf USING btree (trading_status_id);
CREATE INDEX Etf_min_price_increment_id_idx ON public.Etf USING btree (min_price_increment_id);
CREATE INDEX Etf_real_exchange_id_idx ON public.Etf USING btree (real_exchange_id);
COMMENT ON TABLE "public"."Etf" IS 'Объект передачи информации об инвестиционном фонде.';
COMMENT ON COLUMN "public"."Etf"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Etf"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Etf"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."Etf"."isin" IS 'Isin-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Etf"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Etf"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Etf"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
COMMENT ON COLUMN "public"."Etf"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
COMMENT ON COLUMN "public"."Etf"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Etf"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Etf"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Etf"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Etf"."short_enabled_flag" IS 'Признак доступности для операций в шорт.';
COMMENT ON COLUMN "public"."Etf"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Etf"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Etf"."fixed_commission_id" IS 'Размер фиксированной комиссии фонда.';
COMMENT ON COLUMN "public"."Etf"."focus_type" IS 'Возможные значения: </br>**equity** — акции;</br>**fixed_income** — облигации;</br>**mixed_allocation** — смешанный;</br>**money_market** — денежный рынок;</br>**real_estate** — недвижимость;</br>**commodity** — товары;</br>**specialty** — специальный;</br>**private_equity** — private equity;</br>**alternative_investment** — альтернативные инвестиции.';
COMMENT ON COLUMN "public"."Etf"."released_date" IS 'Дата выпуска в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Etf"."num_shares_id" IS 'Количество акций фонда в обращении.';
COMMENT ON COLUMN "public"."Etf"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Etf"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Etf"."sector" IS 'Сектор экономики.';
COMMENT ON COLUMN "public"."Etf"."rebalancing_freq" IS 'Частота ребалансировки.';
COMMENT ON COLUMN "public"."Etf"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Etf"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Etf"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Etf"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Etf"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Etf"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Etf"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Etf"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Etf"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Etf"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Etf"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Etf"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
COMMENT ON COLUMN "public"."Etf"."blocked_tca_flag" IS 'Флаг заблокированного ТКС.';
COMMENT ON COLUMN "public"."Etf"."liquidity_flag" IS 'Флаг достаточной ликвидности';
COMMENT ON COLUMN "public"."Etf"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Etf"."first_1day_candle_date" IS 'Дата первой дневной свечи.';

CREATE TABLE "public"."Future" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"first_trade_date" timestamptz NULL,
	"last_trade_date" timestamptz NULL,
	"futures_type" text NOT NULL,
	"asset_type" text NOT NULL,
	"basic_asset" text NOT NULL,
	"basic_asset_size_id" Quotation NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"sector" text NOT NULL,
	"expiration_date" timestamptz NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"basic_asset_position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Future_pk PRIMARY KEY (uid),
	CONSTRAINT Future_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Future_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id)
);
CREATE INDEX Future_klong_id_idx ON public.Future USING btree (klong_id);
CREATE INDEX Future_kshort_id_idx ON public.Future USING btree (kshort_id);
CREATE INDEX Future_dlong_id_idx ON public.Future USING btree (dlong_id);
CREATE INDEX Future_dshort_id_idx ON public.Future USING btree (dshort_id);
CREATE INDEX Future_dlong_min_id_idx ON public.Future USING btree (dlong_min_id);
CREATE INDEX Future_dshort_min_id_idx ON public.Future USING btree (dshort_min_id);
CREATE INDEX Future_basic_asset_size_id_idx ON public.Future USING btree (basic_asset_size_id);
CREATE INDEX Future_trading_status_id_idx ON public.Future USING btree (trading_status_id);
CREATE INDEX Future_min_price_increment_id_idx ON public.Future USING btree (min_price_increment_id);
CREATE INDEX Future_real_exchange_id_idx ON public.Future USING btree (real_exchange_id);
COMMENT ON TABLE "public"."Future" IS 'Объект передачи информации о фьючерсе.';
COMMENT ON COLUMN "public"."Future"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Future"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Future"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."Future"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Future"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Future"."klong_id" IS 'Коэффициент ставки риска длинной позиции по клиенту.';
COMMENT ON COLUMN "public"."Future"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по клиенту.';
COMMENT ON COLUMN "public"."Future"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Future"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Future"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Future"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Future"."short_enabled_flag" IS 'Признак доступности для операций шорт.';
COMMENT ON COLUMN "public"."Future"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Future"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Future"."first_trade_date" IS 'Дата начала обращения контракта в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Future"."last_trade_date" IS 'Дата в часовом поясе UTC, до которой возможно проведение операций с фьючерсом.';
COMMENT ON COLUMN "public"."Future"."futures_type" IS 'Тип фьючерса. Возможные значения: </br>**physical_delivery** — физические поставки; </br>**cash_settlement** — денежный эквивалент.';
COMMENT ON COLUMN "public"."Future"."asset_type" IS 'Тип актива. Возможные значения: </br>**commodity** — товар; </br>**currency** — валюта; </br>**security** — ценная бумага; </br>**index** — индекс.';
COMMENT ON COLUMN "public"."Future"."basic_asset" IS 'Основной актив.';
COMMENT ON COLUMN "public"."Future"."basic_asset_size_id" IS 'Размер основного актива.';
COMMENT ON COLUMN "public"."Future"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Future"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Future"."sector" IS 'Сектор экономики.';
COMMENT ON COLUMN "public"."Future"."expiration_date" IS 'Дата истечения срока в часов поясе UTC.';
COMMENT ON COLUMN "public"."Future"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Future"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Future"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Future"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Future"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Future"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Future"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Future"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Future"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Future"."basic_asset_position_uid" IS 'Уникальный идентификатор позиции основного инструмента.';
COMMENT ON COLUMN "public"."Future"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Future"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Future"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
COMMENT ON COLUMN "public"."Future"."blocked_tca_flag" IS 'Флаг заблокированного ТКС.';
COMMENT ON COLUMN "public"."Future"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Future"."first_1day_candle_date" IS 'Дата первой дневной свечи.';

CREATE TABLE "public"."Instrument" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"isin" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"instrument_type" text NOT NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"instrument_kind_id" InstrumentType NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Instrument_pk PRIMARY KEY (uid),
	CONSTRAINT Instrument_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Instrument_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id),
	CONSTRAINT Instrument_instrument_kind_id_fk FOREIGN KEY (instrument_kind_id) REFERENCES public.InstrumentType (id)
);
CREATE INDEX Instrument_klong_id_idx ON public.Instrument USING btree (klong_id);
CREATE INDEX Instrument_kshort_id_idx ON public.Instrument USING btree (kshort_id);
CREATE INDEX Instrument_dlong_id_idx ON public.Instrument USING btree (dlong_id);
CREATE INDEX Instrument_dshort_id_idx ON public.Instrument USING btree (dshort_id);
CREATE INDEX Instrument_dlong_min_id_idx ON public.Instrument USING btree (dlong_min_id);
CREATE INDEX Instrument_dshort_min_id_idx ON public.Instrument USING btree (dshort_min_id);
CREATE INDEX Instrument_trading_status_id_idx ON public.Instrument USING btree (trading_status_id);
CREATE INDEX Instrument_min_price_increment_id_idx ON public.Instrument USING btree (min_price_increment_id);
CREATE INDEX Instrument_real_exchange_id_idx ON public.Instrument USING btree (real_exchange_id);
CREATE INDEX Instrument_instrument_kind_id_idx ON public.Instrument USING btree (instrument_kind_id);
COMMENT ON TABLE "public"."Instrument" IS 'Объект передачи основной информации об инструменте.';
COMMENT ON COLUMN "public"."Instrument"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Instrument"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Instrument"."class_code" IS 'Класс-код инструмента.';
COMMENT ON COLUMN "public"."Instrument"."isin" IS 'Isin-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Instrument"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Instrument"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Instrument"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
COMMENT ON COLUMN "public"."Instrument"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
COMMENT ON COLUMN "public"."Instrument"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Instrument"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Instrument"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Instrument"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Instrument"."short_enabled_flag" IS 'Признак доступности для операций в шорт.';
COMMENT ON COLUMN "public"."Instrument"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Instrument"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Instrument"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Instrument"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Instrument"."instrument_type" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."Instrument"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Instrument"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Instrument"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Instrument"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Instrument"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Instrument"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Instrument"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Instrument"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Instrument"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Instrument"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Instrument"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Instrument"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным';
COMMENT ON COLUMN "public"."Instrument"."blocked_tca_flag" IS 'Флаг заблокированного ТКС';
COMMENT ON COLUMN "public"."Instrument"."instrument_kind_id" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."Instrument"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Instrument"."first_1day_candle_date" IS 'Дата первой дневной свечи.';

CREATE TABLE "public"."InstrumentRequest" (
	"id_type_id" InstrumentIdType NULL,
	"class_code" text NOT NULL,
	"id" text NOT NULL,
	CONSTRAINT InstrumentRequest_pk PRIMARY KEY (id),
	CONSTRAINT InstrumentRequest_id_type_id_fk FOREIGN KEY (id_type_id) REFERENCES public.InstrumentIdType (id)
);
CREATE INDEX InstrumentRequest_id_type_id_idx ON public.InstrumentRequest USING btree (id_type_id);
COMMENT ON TABLE "public"."InstrumentRequest" IS 'Запрос получения инструмента по идентификатору.';
COMMENT ON COLUMN "public"."InstrumentRequest"."id_type_id" IS ' Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: [Идентификация инструментов](https://tinkoff.github.io/investAPI/faq_identification/)';
COMMENT ON COLUMN "public"."InstrumentRequest"."class_code" IS ' Идентификатор class_code. Обязателен при id_type = ticker.';
COMMENT ON COLUMN "public"."InstrumentRequest"."id" IS ' Идентификатор запрашиваемого инструмента.';

CREATE TABLE "public"."InstrumentShort" (
	"isin" text NOT NULL,
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"instrument_type" text NOT NULL,
	"name" text NOT NULL,
	"uid" text NOT NULL,
	"position_uid" text NOT NULL,
	"instrument_kind_id" InstrumentType NULL,
	"api_trade_available_flag" bool NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	CONSTRAINT InstrumentShort_pk PRIMARY KEY (uid),
	CONSTRAINT InstrumentShort_instrument_kind_id_fk FOREIGN KEY (instrument_kind_id) REFERENCES public.InstrumentType (id)
);
CREATE INDEX InstrumentShort_instrument_kind_id_idx ON public.InstrumentShort USING btree (instrument_kind_id);
COMMENT ON TABLE "public"."InstrumentShort" IS 'Краткая информация об инструменте.';
COMMENT ON COLUMN "public"."InstrumentShort"."isin" IS 'Isin инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."figi" IS 'Figi инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."ticker" IS 'Ticker инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."class_code" IS 'ClassCode инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."instrument_type" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."instrument_kind_id" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."InstrumentShort"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."InstrumentShort"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."InstrumentShort"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."InstrumentShort"."first_1day_candle_date" IS 'Дата первой дневной свечи.';
COMMENT ON COLUMN "public"."InstrumentShort"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."InstrumentShort"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным';
COMMENT ON COLUMN "public"."InstrumentShort"."blocked_tca_flag" IS 'Флаг заблокированного ТКС';

CREATE TABLE "public"."MoneyValue" (
	"currency" text NOT NULL,
	"units" bigint NOT NULL,
	"nano" integer NOT NULL,
	CONSTRAINT MoneyValue_pk PRIMARY KEY (currency)
);
COMMENT ON TABLE "public"."MoneyValue" IS 'Денежная сумма в определенной валюте';
COMMENT ON COLUMN "public"."MoneyValue"."currency" IS ' строковый ISO-код валюты';
COMMENT ON COLUMN "public"."MoneyValue"."units" IS ' целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "public"."MoneyValue"."nano" IS ' дробная часть суммы, может быть отрицательным числом';

CREATE TABLE "public"."Operation" (
	"id" text NOT NULL,
	"parent_operation_id" text NOT NULL,
	"currency" text NOT NULL,
	"payment_id" MoneyValue NULL,
	"price_id" MoneyValue NULL,
	"state_id" OperationState NULL,
	"quantity" bigint NOT NULL,
	"quantity_rest" bigint NOT NULL,
	"figi" text NOT NULL,
	"instrument_type" text NOT NULL,
	"date" timestamptz NULL,
	"type" text NOT NULL,
	"operation_type_id" OperationType NULL,
	"trades_id" OperationTrade NULL,
	"asset_uid" text NOT NULL,
	"position_uid" text NOT NULL,
	"instrument_uid" text NOT NULL,
	CONSTRAINT Operation_pk PRIMARY KEY (id),
	CONSTRAINT Operation_payment_id_fk FOREIGN KEY (payment_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Operation_price_id_fk FOREIGN KEY (price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Operation_state_id_fk FOREIGN KEY (state_id) REFERENCES public.OperationState (id),
	CONSTRAINT Operation_operation_type_id_fk FOREIGN KEY (operation_type_id) REFERENCES public.OperationType (id)
);
CREATE INDEX Operation_payment_id_idx ON public.Operation USING btree (payment_id);
CREATE INDEX Operation_price_id_idx ON public.Operation USING btree (price_id);
CREATE INDEX Operation_state_id_idx ON public.Operation USING btree (state_id);
CREATE INDEX Operation_operation_type_id_idx ON public.Operation USING btree (operation_type_id);
CREATE INDEX Operation_trades_id_idx ON public.Operation USING btree (trades_id);
COMMENT ON TABLE "public"."Operation" IS 'Данные по операции.';
COMMENT ON COLUMN "public"."Operation"."id" IS 'Идентификатор операции.';
COMMENT ON COLUMN "public"."Operation"."parent_operation_id" IS 'Идентификатор родительской операции.';
COMMENT ON COLUMN "public"."Operation"."currency" IS 'Валюта операции.';
COMMENT ON COLUMN "public"."Operation"."payment_id" IS 'Сумма операции.';
COMMENT ON COLUMN "public"."Operation"."price_id" IS 'Цена операции за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
COMMENT ON COLUMN "public"."Operation"."state_id" IS 'Статус операции.';
COMMENT ON COLUMN "public"."Operation"."quantity" IS 'Количество единиц инструмента.';
COMMENT ON COLUMN "public"."Operation"."quantity_rest" IS 'Неисполненный остаток по сделке.';
COMMENT ON COLUMN "public"."Operation"."figi" IS 'Figi-идентификатор инструмента, связанного с операцией.';
COMMENT ON COLUMN "public"."Operation"."instrument_type" IS 'Тип инструмента. Возможные значения: </br>**bond** — облигация; </br>**share** — акция; </br>**currency** — валюта; </br>**etf** — фонд; </br>**futures** — фьючерс.';
COMMENT ON COLUMN "public"."Operation"."date" IS 'Дата и время операции в формате часовом поясе UTC.';
COMMENT ON COLUMN "public"."Operation"."type" IS 'Текстовое описание типа операции.';
COMMENT ON COLUMN "public"."Operation"."operation_type_id" IS 'Тип операции.';
COMMENT ON COLUMN "public"."Operation"."trades_id" IS 'Массив сделок.';
COMMENT ON COLUMN "public"."Operation"."asset_uid" IS 'Идентификатор актива';
COMMENT ON COLUMN "public"."Operation"."position_uid" IS 'position_uid-идентификатора инструмента.';
COMMENT ON COLUMN "public"."Operation"."instrument_uid" IS 'Уникальный идентификатор инструмента.';

CREATE TABLE "public"."OperationItem" (
	"cursor" text NOT NULL,
	"broker_account_id" text NOT NULL,
	"id" text NOT NULL,
	"parent_operation_id" text NOT NULL,
	"name" text NOT NULL,
	"date" timestamptz NULL,
	"type_id" OperationType NULL,
	"description" text NOT NULL,
	"state_id" OperationState NULL,
	"instrument_uid" text NOT NULL,
	"figi" text NOT NULL,
	"instrument_type" text NOT NULL,
	"instrument_kind_id" InstrumentType NULL,
	"position_uid" text NOT NULL,
	"payment_id" MoneyValue NULL,
	"price_id" MoneyValue NULL,
	"commission_id" MoneyValue NULL,
	"yield_id" MoneyValue NULL,
	"yield_relative_id" Quotation NULL,
	"accrued_int_id" MoneyValue NULL,
	"quantity" bigint NOT NULL,
	"quantity_rest" bigint NOT NULL,
	"quantity_done" bigint NOT NULL,
	"cancel_date_time" timestamptz NULL,
	"cancel_reason" text NOT NULL,
	"trades_info_id" OperationItemTrades NULL,
	"asset_uid" text NOT NULL,
	CONSTRAINT OperationItem_pk PRIMARY KEY (id),
	CONSTRAINT OperationItem_type_id_fk FOREIGN KEY (type_id) REFERENCES public.OperationType (id),
	CONSTRAINT OperationItem_state_id_fk FOREIGN KEY (state_id) REFERENCES public.OperationState (id),
	CONSTRAINT OperationItem_instrument_kind_id_fk FOREIGN KEY (instrument_kind_id) REFERENCES public.InstrumentType (id),
	CONSTRAINT OperationItem_payment_id_fk FOREIGN KEY (payment_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OperationItem_price_id_fk FOREIGN KEY (price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OperationItem_commission_id_fk FOREIGN KEY (commission_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OperationItem_yield_id_fk FOREIGN KEY (yield_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OperationItem_accrued_int_id_fk FOREIGN KEY (accrued_int_id) REFERENCES public.MoneyValue (currency)
);
CREATE INDEX OperationItem_type_id_idx ON public.OperationItem USING btree (type_id);
CREATE INDEX OperationItem_state_id_idx ON public.OperationItem USING btree (state_id);
CREATE INDEX OperationItem_instrument_kind_id_idx ON public.OperationItem USING btree (instrument_kind_id);
CREATE INDEX OperationItem_payment_id_idx ON public.OperationItem USING btree (payment_id);
CREATE INDEX OperationItem_price_id_idx ON public.OperationItem USING btree (price_id);
CREATE INDEX OperationItem_commission_id_idx ON public.OperationItem USING btree (commission_id);
CREATE INDEX OperationItem_yield_id_idx ON public.OperationItem USING btree (yield_id);
CREATE INDEX OperationItem_yield_relative_id_idx ON public.OperationItem USING btree (yield_relative_id);
CREATE INDEX OperationItem_accrued_int_id_idx ON public.OperationItem USING btree (accrued_int_id);
CREATE INDEX OperationItem_trades_info_id_idx ON public.OperationItem USING btree (trades_info_id);
COMMENT ON TABLE "public"."OperationItem" IS 'Данные об операции.';
COMMENT ON COLUMN "public"."OperationItem"."cursor" IS 'Курсор.';
COMMENT ON COLUMN "public"."OperationItem"."broker_account_id" IS 'Номер счета клиента.';
COMMENT ON COLUMN "public"."OperationItem"."id" IS 'Идентификатор операции, может меняться с течением времени.';
COMMENT ON COLUMN "public"."OperationItem"."parent_operation_id" IS 'Идентификатор родительской операции, может измениться, если изменился id родительской операции.';
COMMENT ON COLUMN "public"."OperationItem"."name" IS 'Название операции.';
COMMENT ON COLUMN "public"."OperationItem"."date" IS 'Дата поручения.';
COMMENT ON COLUMN "public"."OperationItem"."type_id" IS 'Тип операции.';
COMMENT ON COLUMN "public"."OperationItem"."description" IS 'Описание операции.';
COMMENT ON COLUMN "public"."OperationItem"."state_id" IS 'Статус поручения.';
COMMENT ON COLUMN "public"."OperationItem"."instrument_uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."OperationItem"."figi" IS 'Figi.';
COMMENT ON COLUMN "public"."OperationItem"."instrument_type" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."OperationItem"."instrument_kind_id" IS 'Тип инструмента.';
COMMENT ON COLUMN "public"."OperationItem"."position_uid" IS 'position_uid-идентификатора инструмента.';
COMMENT ON COLUMN "public"."OperationItem"."payment_id" IS 'Сумма операции.';
COMMENT ON COLUMN "public"."OperationItem"."price_id" IS 'Цена операции за 1 инструмент.';
COMMENT ON COLUMN "public"."OperationItem"."commission_id" IS 'Комиссия.';
COMMENT ON COLUMN "public"."OperationItem"."yield_id" IS 'Доходность.';
COMMENT ON COLUMN "public"."OperationItem"."yield_relative_id" IS 'Относительная доходность.';
COMMENT ON COLUMN "public"."OperationItem"."accrued_int_id" IS 'Накопленный купонный доход.';
COMMENT ON COLUMN "public"."OperationItem"."quantity" IS 'Количество единиц инструмента.';
COMMENT ON COLUMN "public"."OperationItem"."quantity_rest" IS 'Неисполненный остаток по сделке.';
COMMENT ON COLUMN "public"."OperationItem"."quantity_done" IS 'Исполненный остаток.';
COMMENT ON COLUMN "public"."OperationItem"."cancel_date_time" IS 'Дата и время снятия заявки.';
COMMENT ON COLUMN "public"."OperationItem"."cancel_reason" IS 'Причина отмены операции.';
COMMENT ON COLUMN "public"."OperationItem"."trades_info_id" IS 'Массив сделок.';
COMMENT ON COLUMN "public"."OperationItem"."asset_uid" IS 'Идентификатор актива';

CREATE TABLE "public"."Option" (
	"uid" text NOT NULL,
	"position_uid" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"basic_asset_position_uid" text NOT NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"real_exchange_id" RealExchange NULL,
	"direction_id" OptionDirection NULL,
	"payment_type_id" OptionPaymentType NULL,
	"style_id" OptionStyle NULL,
	"settlement_type_id" OptionSettlementType NULL,
	"name" text NOT NULL,
	"currency" text NOT NULL,
	"settlement_currency" text NOT NULL,
	"asset_type" text NOT NULL,
	"basic_asset" text NOT NULL,
	"exchange" text NOT NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"sector" text NOT NULL,
	"lot" integer NOT NULL,
	"basic_asset_size_id" Quotation NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"min_price_increment_id" Quotation NULL,
	"strike_price_id" MoneyValue NULL,
	"expiration_date" timestamptz NULL,
	"first_trade_date" timestamptz NULL,
	"last_trade_date" timestamptz NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	"short_enabled_flag" bool NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"api_trade_available_flag" bool NOT NULL,
	CONSTRAINT Option_pk PRIMARY KEY (uid),
	CONSTRAINT Option_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Option_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id),
	CONSTRAINT Option_direction_id_fk FOREIGN KEY (direction_id) REFERENCES public.OptionDirection (id),
	CONSTRAINT Option_payment_type_id_fk FOREIGN KEY (payment_type_id) REFERENCES public.OptionPaymentType (id),
	CONSTRAINT Option_style_id_fk FOREIGN KEY (style_id) REFERENCES public.OptionStyle (id),
	CONSTRAINT Option_settlement_type_id_fk FOREIGN KEY (settlement_type_id) REFERENCES public.OptionSettlementType (id),
	CONSTRAINT Option_strike_price_id_fk FOREIGN KEY (strike_price_id) REFERENCES public.MoneyValue (currency)
);
CREATE INDEX Option_trading_status_id_idx ON public.Option USING btree (trading_status_id);
CREATE INDEX Option_real_exchange_id_idx ON public.Option USING btree (real_exchange_id);
CREATE INDEX Option_direction_id_idx ON public.Option USING btree (direction_id);
CREATE INDEX Option_payment_type_id_idx ON public.Option USING btree (payment_type_id);
CREATE INDEX Option_style_id_idx ON public.Option USING btree (style_id);
CREATE INDEX Option_settlement_type_id_idx ON public.Option USING btree (settlement_type_id);
CREATE INDEX Option_basic_asset_size_id_idx ON public.Option USING btree (basic_asset_size_id);
CREATE INDEX Option_klong_id_idx ON public.Option USING btree (klong_id);
CREATE INDEX Option_kshort_id_idx ON public.Option USING btree (kshort_id);
CREATE INDEX Option_dlong_id_idx ON public.Option USING btree (dlong_id);
CREATE INDEX Option_dshort_id_idx ON public.Option USING btree (dshort_id);
CREATE INDEX Option_dlong_min_id_idx ON public.Option USING btree (dlong_min_id);
CREATE INDEX Option_dshort_min_id_idx ON public.Option USING btree (dshort_min_id);
CREATE INDEX Option_min_price_increment_id_idx ON public.Option USING btree (min_price_increment_id);
CREATE INDEX Option_strike_price_id_idx ON public.Option USING btree (strike_price_id);
COMMENT ON TABLE "public"."Option" IS 'Опцион.';
COMMENT ON COLUMN "public"."Option"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Option"."position_uid" IS 'Уникальный идентификатор позиции.';
COMMENT ON COLUMN "public"."Option"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Option"."class_code" IS 'Класс-код.';
COMMENT ON COLUMN "public"."Option"."basic_asset_position_uid" IS 'Уникальный идентификатор позиции основного инструмента.';
COMMENT ON COLUMN "public"."Option"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Option"."real_exchange_id" IS 'Реальная площадка исполнения расчётов. Допустимые значения: [REAL_EXCHANGE_MOEX, REAL_EXCHANGE_RTS]';
COMMENT ON COLUMN "public"."Option"."direction_id" IS 'Направление опциона.';
COMMENT ON COLUMN "public"."Option"."payment_type_id" IS 'Тип расчетов по опциону.';
COMMENT ON COLUMN "public"."Option"."style_id" IS 'Стиль опциона.';
COMMENT ON COLUMN "public"."Option"."settlement_type_id" IS 'Способ исполнения опциона.';
COMMENT ON COLUMN "public"."Option"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Option"."currency" IS 'Валюта.';
COMMENT ON COLUMN "public"."Option"."settlement_currency" IS 'Валюта, в которой оценивается контракт.';
COMMENT ON COLUMN "public"."Option"."asset_type" IS 'Тип актива.';
COMMENT ON COLUMN "public"."Option"."basic_asset" IS 'Основной актив.';
COMMENT ON COLUMN "public"."Option"."exchange" IS 'Биржа.';
COMMENT ON COLUMN "public"."Option"."country_of_risk" IS 'Код страны рисков.';
COMMENT ON COLUMN "public"."Option"."country_of_risk_name" IS 'Наименование страны рисков.';
COMMENT ON COLUMN "public"."Option"."sector" IS 'Сектор экономики.';
COMMENT ON COLUMN "public"."Option"."lot" IS 'Количество бумаг в лоте.';
COMMENT ON COLUMN "public"."Option"."basic_asset_size_id" IS 'Размер основного актива.';
COMMENT ON COLUMN "public"."Option"."klong_id" IS 'Коэффициент ставки риска длинной позиции по клиенту.';
COMMENT ON COLUMN "public"."Option"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по клиенту.';
COMMENT ON COLUMN "public"."Option"."dlong_id" IS 'Ставка риска минимальной маржи лонг.';
COMMENT ON COLUMN "public"."Option"."dshort_id" IS 'Ставка риска минимальной маржи шорт.';
COMMENT ON COLUMN "public"."Option"."dlong_min_id" IS 'Ставка риска начальной маржи лонг.';
COMMENT ON COLUMN "public"."Option"."dshort_min_id" IS 'Ставка риска начальной маржи шорт.';
COMMENT ON COLUMN "public"."Option"."min_price_increment_id" IS 'Минимальный шаг цены.';
COMMENT ON COLUMN "public"."Option"."strike_price_id" IS 'Цена страйка.';
COMMENT ON COLUMN "public"."Option"."expiration_date" IS 'Дата истечения срока в формате UTC.';
COMMENT ON COLUMN "public"."Option"."first_trade_date" IS 'Дата начала обращения контракта в формате UTC.';
COMMENT ON COLUMN "public"."Option"."last_trade_date" IS 'Дата исполнения в формате UTC.';
COMMENT ON COLUMN "public"."Option"."first_1min_candle_date" IS 'Дата первой минутной свечи в формате UTC.';
COMMENT ON COLUMN "public"."Option"."first_1day_candle_date" IS 'Дата первой дневной свечи в формате UTC.';
COMMENT ON COLUMN "public"."Option"."short_enabled_flag" IS 'Признак доступности для операций шорт.';
COMMENT ON COLUMN "public"."Option"."for_iis_flag" IS 'Возможность покупки/продажи на ИИС.';
COMMENT ON COLUMN "public"."Option"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Option"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Option"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Option"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Option"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
COMMENT ON COLUMN "public"."Option"."blocked_tca_flag" IS 'Флаг заблокированного ТКС.';
COMMENT ON COLUMN "public"."Option"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';

CREATE TABLE "public"."OrderState" (
	"order_id" text NOT NULL,
	"execution_report_status_id" OrderExecutionReportStatus NULL,
	"lots_requested" bigint NOT NULL,
	"lots_executed" bigint NOT NULL,
	"initial_order_price_id" MoneyValue NULL,
	"executed_order_price_id" MoneyValue NULL,
	"total_order_amount_id" MoneyValue NULL,
	"average_position_price_id" MoneyValue NULL,
	"initial_commission_id" MoneyValue NULL,
	"executed_commission_id" MoneyValue NULL,
	"figi" text NOT NULL,
	"direction_id" OrderDirection NULL,
	"initial_security_price_id" MoneyValue NULL,
	"stages_id" OrderStage NULL,
	"service_commission_id" MoneyValue NULL,
	"currency" text NOT NULL,
	"order_type_id" OrderType NULL,
	"order_date" timestamptz NULL,
	"instrument_uid" text NOT NULL,
	"order_request_id" text NOT NULL,
	CONSTRAINT OrderState_pk PRIMARY KEY (currency),
	CONSTRAINT OrderState_execution_report_status_id_fk FOREIGN KEY (execution_report_status_id) REFERENCES public.OrderExecutionReportStatus (id),
	CONSTRAINT OrderState_initial_order_price_id_fk FOREIGN KEY (initial_order_price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_executed_order_price_id_fk FOREIGN KEY (executed_order_price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_total_order_amount_id_fk FOREIGN KEY (total_order_amount_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_average_position_price_id_fk FOREIGN KEY (average_position_price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_initial_commission_id_fk FOREIGN KEY (initial_commission_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_executed_commission_id_fk FOREIGN KEY (executed_commission_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_direction_id_fk FOREIGN KEY (direction_id) REFERENCES public.OrderDirection (id),
	CONSTRAINT OrderState_initial_security_price_id_fk FOREIGN KEY (initial_security_price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_service_commission_id_fk FOREIGN KEY (service_commission_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT OrderState_order_type_id_fk FOREIGN KEY (order_type_id) REFERENCES public.OrderType (id)
);
CREATE INDEX OrderState_execution_report_status_id_idx ON public.OrderState USING btree (execution_report_status_id);
CREATE INDEX OrderState_initial_order_price_id_idx ON public.OrderState USING btree (initial_order_price_id);
CREATE INDEX OrderState_executed_order_price_id_idx ON public.OrderState USING btree (executed_order_price_id);
CREATE INDEX OrderState_total_order_amount_id_idx ON public.OrderState USING btree (total_order_amount_id);
CREATE INDEX OrderState_average_position_price_id_idx ON public.OrderState USING btree (average_position_price_id);
CREATE INDEX OrderState_initial_commission_id_idx ON public.OrderState USING btree (initial_commission_id);
CREATE INDEX OrderState_executed_commission_id_idx ON public.OrderState USING btree (executed_commission_id);
CREATE INDEX OrderState_direction_id_idx ON public.OrderState USING btree (direction_id);
CREATE INDEX OrderState_initial_security_price_id_idx ON public.OrderState USING btree (initial_security_price_id);
CREATE INDEX OrderState_stages_id_idx ON public.OrderState USING btree (stages_id);
CREATE INDEX OrderState_service_commission_id_idx ON public.OrderState USING btree (service_commission_id);
CREATE INDEX OrderState_order_type_id_idx ON public.OrderState USING btree (order_type_id);
COMMENT ON TABLE "public"."OrderState" IS 'Информация о торговом поручении.';
COMMENT ON COLUMN "public"."OrderState"."order_id" IS 'Биржевой идентификатор заявки.';
COMMENT ON COLUMN "public"."OrderState"."execution_report_status_id" IS 'Текущий статус заявки.';
COMMENT ON COLUMN "public"."OrderState"."lots_requested" IS 'Запрошено лотов.';
COMMENT ON COLUMN "public"."OrderState"."lots_executed" IS 'Исполнено лотов.';
COMMENT ON COLUMN "public"."OrderState"."initial_order_price_id" IS 'Начальная цена заявки. Произведение количества запрошенных лотов на цену.';
COMMENT ON COLUMN "public"."OrderState"."executed_order_price_id" IS 'Исполненная цена заявки. Произведение средней цены покупки на количество лотов.';
COMMENT ON COLUMN "public"."OrderState"."total_order_amount_id" IS 'Итоговая стоимость заявки, включающая все комиссии.';
COMMENT ON COLUMN "public"."OrderState"."average_position_price_id" IS 'Средняя цена позиции по сделке.';
COMMENT ON COLUMN "public"."OrderState"."initial_commission_id" IS 'Начальная комиссия. Комиссия, рассчитанная на момент подачи заявки.';
COMMENT ON COLUMN "public"."OrderState"."executed_commission_id" IS 'Фактическая комиссия по итогам исполнения заявки.';
COMMENT ON COLUMN "public"."OrderState"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."OrderState"."direction_id" IS 'Направление заявки.';
COMMENT ON COLUMN "public"."OrderState"."initial_security_price_id" IS 'Начальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
COMMENT ON COLUMN "public"."OrderState"."stages_id" IS 'Стадии выполнения заявки.';
COMMENT ON COLUMN "public"."OrderState"."service_commission_id" IS 'Сервисная комиссия.';
COMMENT ON COLUMN "public"."OrderState"."currency" IS 'Валюта заявки.';
COMMENT ON COLUMN "public"."OrderState"."order_type_id" IS 'Тип заявки.';
COMMENT ON COLUMN "public"."OrderState"."order_date" IS 'Дата и время выставления заявки в часовом поясе UTC.';
COMMENT ON COLUMN "public"."OrderState"."instrument_uid" IS 'UID идентификатор инструмента.';
COMMENT ON COLUMN "public"."OrderState"."order_request_id" IS 'Идентификатор ключа идемпотентности, переданный клиентом.';

CREATE TABLE "public"."PortfolioRequest" (
	"account_id" text NOT NULL,
	"currency_id" CurrencyRequest NULL,
	CONSTRAINT PortfolioRequest_pk PRIMARY KEY (currency),
	CONSTRAINT PortfolioRequest_currency_id_fk FOREIGN KEY (currency_id) REFERENCES public.CurrencyRequest (id)
);
CREATE INDEX PortfolioRequest_currency_id_idx ON public.PortfolioRequest USING btree (currency_id);
COMMENT ON TABLE "public"."PortfolioRequest" IS 'Запрос получения текущего портфеля по счёту.';
COMMENT ON COLUMN "public"."PortfolioRequest"."account_id" IS 'Идентификатор счёта пользователя.';
COMMENT ON COLUMN "public"."PortfolioRequest"."currency_id" IS 'Валюта, в которой требуется рассчитать портфель';

CREATE TABLE "public"."Share" (
	"figi" text NOT NULL,
	"ticker" text NOT NULL,
	"class_code" text NOT NULL,
	"isin" text NOT NULL,
	"lot" integer NOT NULL,
	"currency" text NOT NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag" bool NOT NULL,
	"name" text NOT NULL,
	"exchange" text NOT NULL,
	"ipo_date" timestamptz NULL,
	"issue_size" bigint NOT NULL,
	"country_of_risk" text NOT NULL,
	"country_of_risk_name" text NOT NULL,
	"sector" text NOT NULL,
	"issue_size_plan" bigint NOT NULL,
	"nominal_id" MoneyValue NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag" bool NOT NULL,
	"buy_available_flag" bool NOT NULL,
	"sell_available_flag" bool NOT NULL,
	"div_yield_flag" bool NOT NULL,
	"share_type_id" ShareType NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag" bool NOT NULL,
	"uid" text NOT NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid" text NOT NULL,
	"for_iis_flag" bool NOT NULL,
	"for_qual_investor_flag" bool NOT NULL,
	"weekend_flag" bool NOT NULL,
	"blocked_tca_flag" bool NOT NULL,
	"liquidity_flag" bool NOT NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Share_pk PRIMARY KEY (uid),
	CONSTRAINT Share_nominal_id_fk FOREIGN KEY (nominal_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT Share_trading_status_id_fk FOREIGN KEY (trading_status_id) REFERENCES public.SecurityTradingStatus (id),
	CONSTRAINT Share_share_type_id_fk FOREIGN KEY (share_type_id) REFERENCES public.ShareType (id),
	CONSTRAINT Share_real_exchange_id_fk FOREIGN KEY (real_exchange_id) REFERENCES public.RealExchange (id)
);
CREATE INDEX Share_klong_id_idx ON public.Share USING btree (klong_id);
CREATE INDEX Share_kshort_id_idx ON public.Share USING btree (kshort_id);
CREATE INDEX Share_dlong_id_idx ON public.Share USING btree (dlong_id);
CREATE INDEX Share_dshort_id_idx ON public.Share USING btree (dshort_id);
CREATE INDEX Share_dlong_min_id_idx ON public.Share USING btree (dlong_min_id);
CREATE INDEX Share_dshort_min_id_idx ON public.Share USING btree (dshort_min_id);
CREATE INDEX Share_nominal_id_idx ON public.Share USING btree (nominal_id);
CREATE INDEX Share_trading_status_id_idx ON public.Share USING btree (trading_status_id);
CREATE INDEX Share_share_type_id_idx ON public.Share USING btree (share_type_id);
CREATE INDEX Share_min_price_increment_id_idx ON public.Share USING btree (min_price_increment_id);
CREATE INDEX Share_real_exchange_id_idx ON public.Share USING btree (real_exchange_id);
COMMENT ON TABLE "public"."Share" IS 'Объект передачи информации об акции.';
COMMENT ON COLUMN "public"."Share"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Share"."ticker" IS 'Тикер инструмента.';
COMMENT ON COLUMN "public"."Share"."class_code" IS 'Класс-код (секция торгов).';
COMMENT ON COLUMN "public"."Share"."isin" IS 'Isin-идентификатор инструмента.';
COMMENT ON COLUMN "public"."Share"."lot" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
COMMENT ON COLUMN "public"."Share"."currency" IS 'Валюта расчётов.';
COMMENT ON COLUMN "public"."Share"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
COMMENT ON COLUMN "public"."Share"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
COMMENT ON COLUMN "public"."Share"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Share"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Share"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
COMMENT ON COLUMN "public"."Share"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
COMMENT ON COLUMN "public"."Share"."short_enabled_flag" IS 'Признак доступности для операций в шорт.';
COMMENT ON COLUMN "public"."Share"."name" IS 'Название инструмента.';
COMMENT ON COLUMN "public"."Share"."exchange" IS 'Торговая площадка.';
COMMENT ON COLUMN "public"."Share"."ipo_date" IS 'Дата IPO акции в часовом поясе UTC.';
COMMENT ON COLUMN "public"."Share"."issue_size" IS 'Размер выпуска.';
COMMENT ON COLUMN "public"."Share"."country_of_risk" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Share"."country_of_risk_name" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
COMMENT ON COLUMN "public"."Share"."sector" IS 'Сектор экономики.';
COMMENT ON COLUMN "public"."Share"."issue_size_plan" IS 'Плановый размер выпуска.';
COMMENT ON COLUMN "public"."Share"."nominal_id" IS 'Номинал.';
COMMENT ON COLUMN "public"."Share"."trading_status_id" IS 'Текущий режим торгов инструмента.';
COMMENT ON COLUMN "public"."Share"."otc_flag" IS 'Признак внебиржевой ценной бумаги.';
COMMENT ON COLUMN "public"."Share"."buy_available_flag" IS 'Признак доступности для покупки.';
COMMENT ON COLUMN "public"."Share"."sell_available_flag" IS 'Признак доступности для продажи.';
COMMENT ON COLUMN "public"."Share"."div_yield_flag" IS 'Признак наличия дивидендной доходности.';
COMMENT ON COLUMN "public"."Share"."share_type_id" IS 'Тип акции. Возможные значения: [ShareType](https://tinkoff.github.io/investAPI/instruments#sharetype)';
COMMENT ON COLUMN "public"."Share"."min_price_increment_id" IS 'Шаг цены.';
COMMENT ON COLUMN "public"."Share"."api_trade_available_flag" IS 'Параметр указывает на возможность торговать инструментом через API.';
COMMENT ON COLUMN "public"."Share"."uid" IS 'Уникальный идентификатор инструмента.';
COMMENT ON COLUMN "public"."Share"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
COMMENT ON COLUMN "public"."Share"."position_uid" IS 'Уникальный идентификатор позиции инструмента.';
COMMENT ON COLUMN "public"."Share"."for_iis_flag" IS 'Признак доступности для ИИС.';
COMMENT ON COLUMN "public"."Share"."for_qual_investor_flag" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
COMMENT ON COLUMN "public"."Share"."weekend_flag" IS 'Флаг отображающий доступность торговли инструментом по выходным';
COMMENT ON COLUMN "public"."Share"."blocked_tca_flag" IS 'Флаг заблокированного ТКС';
COMMENT ON COLUMN "public"."Share"."liquidity_flag" IS 'Флаг достаточной ликвидности';
COMMENT ON COLUMN "public"."Share"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
COMMENT ON COLUMN "public"."Share"."first_1day_candle_date" IS 'Дата первой дневной свечи.';

CREATE TABLE "public"."StopOrder" (
	"stop_order_id" text NOT NULL,
	"lots_requested" bigint NOT NULL,
	"figi" text NOT NULL,
	"direction_id" StopOrderDirection NULL,
	"currency" text NOT NULL,
	"order_type_id" StopOrderType NULL,
	"create_date" timestamptz NULL,
	"activation_date_time" timestamptz NULL,
	"expiration_time" timestamptz NULL,
	"price_id" MoneyValue NULL,
	"stop_price_id" MoneyValue NULL,
	"instrument_uid" text NOT NULL,
	CONSTRAINT StopOrder_pk PRIMARY KEY (currency),
	CONSTRAINT StopOrder_direction_id_fk FOREIGN KEY (direction_id) REFERENCES public.StopOrderDirection (id),
	CONSTRAINT StopOrder_order_type_id_fk FOREIGN KEY (order_type_id) REFERENCES public.StopOrderType (id),
	CONSTRAINT StopOrder_price_id_fk FOREIGN KEY (price_id) REFERENCES public.MoneyValue (currency),
	CONSTRAINT StopOrder_stop_price_id_fk FOREIGN KEY (stop_price_id) REFERENCES public.MoneyValue (currency)
);
CREATE INDEX StopOrder_direction_id_idx ON public.StopOrder USING btree (direction_id);
CREATE INDEX StopOrder_order_type_id_idx ON public.StopOrder USING btree (order_type_id);
CREATE INDEX StopOrder_price_id_idx ON public.StopOrder USING btree (price_id);
CREATE INDEX StopOrder_stop_price_id_idx ON public.StopOrder USING btree (stop_price_id);
COMMENT ON TABLE "public"."StopOrder" IS 'Информация о стоп-заявке.';
COMMENT ON COLUMN "public"."StopOrder"."stop_order_id" IS 'Идентификатор-идентификатор стоп-заявки.';
COMMENT ON COLUMN "public"."StopOrder"."lots_requested" IS 'Запрошено лотов.';
COMMENT ON COLUMN "public"."StopOrder"."figi" IS 'Figi-идентификатор инструмента.';
COMMENT ON COLUMN "public"."StopOrder"."direction_id" IS 'Направление операции.';
COMMENT ON COLUMN "public"."StopOrder"."currency" IS 'Валюта стоп-заявки.';
COMMENT ON COLUMN "public"."StopOrder"."order_type_id" IS 'Тип стоп-заявки.';
COMMENT ON COLUMN "public"."StopOrder"."create_date" IS 'Дата и время выставления заявки в часовом поясе UTC.';
COMMENT ON COLUMN "public"."StopOrder"."activation_date_time" IS 'Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.';
COMMENT ON COLUMN "public"."StopOrder"."expiration_time" IS 'Дата и время снятия заявки в часовом поясе UTC.';
COMMENT ON COLUMN "public"."StopOrder"."price_id" IS 'Цена заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
COMMENT ON COLUMN "public"."StopOrder"."stop_price_id" IS 'Цена активации стоп-заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
COMMENT ON COLUMN "public"."StopOrder"."instrument_uid" IS 'instrument_uid идентификатор инструмента.';

