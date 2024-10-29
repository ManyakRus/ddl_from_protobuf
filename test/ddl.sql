
CREATE TABLE "public"."AccessLevel" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT AccessLevel_pk PRIMARY KEY (id)

)
	CREATE INDEX AccessLevel_id_idx ON public.AccessLevel USING btree (id);
	COMMENT ON TABLE "public"."AccessLevel" IS 'Уровень доступа к счёту.';
	INSERT INTO AccessLevel(id, name) VALUES (0, 'ACCOUNT_ACCESS_LEVEL_UNSPECIFIED');
	INSERT INTO AccessLevel(id, name) VALUES (1, 'ACCOUNT_ACCESS_LEVEL_FULL_ACCESS');
	INSERT INTO AccessLevel(id, name) VALUES (2, 'ACCOUNT_ACCESS_LEVEL_READ_ONLY');
	INSERT INTO AccessLevel(id, name) VALUES (3, 'ACCOUNT_ACCESS_LEVEL_NO_ACCESS');


CREATE TABLE "public"."AccountStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT AccountStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX AccountStatus_id_idx ON public.AccountStatus USING btree (id);
	COMMENT ON TABLE "public"."AccountStatus" IS 'Статус счёта.';
	INSERT INTO AccountStatus(id, name) VALUES (0, 'ACCOUNT_STATUS_UNSPECIFIED');
	INSERT INTO AccountStatus(id, name) VALUES (1, 'ACCOUNT_STATUS_NEW');
	INSERT INTO AccountStatus(id, name) VALUES (2, 'ACCOUNT_STATUS_OPEN');
	INSERT INTO AccountStatus(id, name) VALUES (3, 'ACCOUNT_STATUS_CLOSED');


CREATE TABLE "public"."AccountType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT AccountType_pk PRIMARY KEY (id)

)
	CREATE INDEX AccountType_id_idx ON public.AccountType USING btree (id);
	COMMENT ON TABLE "public"."AccountType" IS 'Тип счёта.';
	INSERT INTO AccountType(id, name) VALUES (0, 'ACCOUNT_TYPE_UNSPECIFIED');
	INSERT INTO AccountType(id, name) VALUES (1, 'ACCOUNT_TYPE_TINKOFF');
	INSERT INTO AccountType(id, name) VALUES (2, 'ACCOUNT_TYPE_TINKOFF_IIS');
	INSERT INTO AccountType(id, name) VALUES (3, 'ACCOUNT_TYPE_INVEST_BOX');


CREATE TABLE "public"."AssetType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT AssetType_pk PRIMARY KEY (id)

)
	CREATE INDEX AssetType_id_idx ON public.AssetType USING btree (id);
	COMMENT ON TABLE "public"."AssetType" IS 'Тип актива.';
	INSERT INTO AssetType(id, name) VALUES (0, 'ASSET_TYPE_UNSPECIFIED');
	INSERT INTO AssetType(id, name) VALUES (1, 'ASSET_TYPE_CURRENCY');
	INSERT INTO AssetType(id, name) VALUES (2, 'ASSET_TYPE_COMMODITY');
	INSERT INTO AssetType(id, name) VALUES (3, 'ASSET_TYPE_INDEX');
	INSERT INTO AssetType(id, name) VALUES (4, 'ASSET_TYPE_SECURITY');


CREATE TABLE "public"."CandleInterval" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT CandleInterval_pk PRIMARY KEY (id)

)
	CREATE INDEX CandleInterval_id_idx ON public.CandleInterval USING btree (id);
	COMMENT ON TABLE "public"."CandleInterval" IS 'Интервал свечей.';
	INSERT INTO CandleInterval(id, name) VALUES (0, 'CANDLE_INTERVAL_UNSPECIFIED');
	INSERT INTO CandleInterval(id, name) VALUES (1, 'CANDLE_INTERVAL_1_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (2, 'CANDLE_INTERVAL_5_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (3, 'CANDLE_INTERVAL_15_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (4, 'CANDLE_INTERVAL_HOUR');
	INSERT INTO CandleInterval(id, name) VALUES (5, 'CANDLE_INTERVAL_DAY');
	INSERT INTO CandleInterval(id, name) VALUES (6, 'CANDLE_INTERVAL_2_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (7, 'CANDLE_INTERVAL_3_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (8, 'CANDLE_INTERVAL_10_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (9, 'CANDLE_INTERVAL_30_MIN');
	INSERT INTO CandleInterval(id, name) VALUES (10, 'CANDLE_INTERVAL_2_HOUR');
	INSERT INTO CandleInterval(id, name) VALUES (11, 'CANDLE_INTERVAL_4_HOUR');
	INSERT INTO CandleInterval(id, name) VALUES (12, 'CANDLE_INTERVAL_WEEK');
	INSERT INTO CandleInterval(id, name) VALUES (13, 'CANDLE_INTERVAL_MONTH');


CREATE TABLE "public"."CouponType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT CouponType_pk PRIMARY KEY (id)

)
	CREATE INDEX CouponType_id_idx ON public.CouponType USING btree (id);
	COMMENT ON TABLE "public"."CouponType" IS 'Тип купонов.';
	INSERT INTO CouponType(id, name) VALUES (0, 'COUPON_TYPE_UNSPECIFIED');
	INSERT INTO CouponType(id, name) VALUES (1, 'COUPON_TYPE_CONSTANT');
	INSERT INTO CouponType(id, name) VALUES (2, 'COUPON_TYPE_FLOATING');
	INSERT INTO CouponType(id, name) VALUES (3, 'COUPON_TYPE_DISCOUNT');
	INSERT INTO CouponType(id, name) VALUES (4, 'COUPON_TYPE_MORTGAGE');
	INSERT INTO CouponType(id, name) VALUES (5, 'COUPON_TYPE_FIX');
	INSERT INTO CouponType(id, name) VALUES (6, 'COUPON_TYPE_VARIABLE');
	INSERT INTO CouponType(id, name) VALUES (7, 'COUPON_TYPE_OTHER');


CREATE TABLE "public"."CurrencyRequest" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT CurrencyRequest_pk PRIMARY KEY (id)

)
	CREATE INDEX CurrencyRequest_id_idx ON public.CurrencyRequest USING btree (id);
	COMMENT ON TABLE "public"."CurrencyRequest" IS '';
	INSERT INTO CurrencyRequest(id, name) VALUES (0, 'RUB');
	INSERT INTO CurrencyRequest(id, name) VALUES (1, 'USD');
	INSERT INTO CurrencyRequest(id, name) VALUES (2, 'EUR');


CREATE TABLE "public"."EditFavoritesActionType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT EditFavoritesActionType_pk PRIMARY KEY (id)

)
	CREATE INDEX EditFavoritesActionType_id_idx ON public.EditFavoritesActionType USING btree (id);
	COMMENT ON TABLE "public"."EditFavoritesActionType" IS 'Тип действия со списком избранных инструментов.';
	INSERT INTO EditFavoritesActionType(id, name) VALUES (0, 'EDIT_FAVORITES_ACTION_TYPE_UNSPECIFIED');
	INSERT INTO EditFavoritesActionType(id, name) VALUES (1, 'EDIT_FAVORITES_ACTION_TYPE_ADD');
	INSERT INTO EditFavoritesActionType(id, name) VALUES (2, 'EDIT_FAVORITES_ACTION_TYPE_DEL');


CREATE TABLE "public"."InstrumentIdType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT InstrumentIdType_pk PRIMARY KEY (id)

)
	CREATE INDEX InstrumentIdType_id_idx ON public.InstrumentIdType USING btree (id);
	COMMENT ON TABLE "public"."InstrumentIdType" IS 'Тип идентификатора инструмента. Подробнее об идентификации инструментов: [Идентификация инструментов](https://tinkoff.github.io/investAPI/faq_identification/)';
	INSERT INTO InstrumentIdType(id, name) VALUES (0, 'INSTRUMENT_ID_UNSPECIFIED');
	INSERT INTO InstrumentIdType(id, name) VALUES (1, 'INSTRUMENT_ID_TYPE_FIGI');
	INSERT INTO InstrumentIdType(id, name) VALUES (2, 'INSTRUMENT_ID_TYPE_TICKER');
	INSERT INTO InstrumentIdType(id, name) VALUES (3, 'INSTRUMENT_ID_TYPE_UID');
	INSERT INTO InstrumentIdType(id, name) VALUES (4, 'INSTRUMENT_ID_TYPE_POSITION_UID');


CREATE TABLE "public"."InstrumentStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT InstrumentStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX InstrumentStatus_id_idx ON public.InstrumentStatus USING btree (id);
	COMMENT ON TABLE "public"."InstrumentStatus" IS 'Статус запрашиваемых инструментов.';
	INSERT INTO InstrumentStatus(id, name) VALUES (0, 'INSTRUMENT_STATUS_UNSPECIFIED');
	INSERT INTO InstrumentStatus(id, name) VALUES (1, 'INSTRUMENT_STATUS_BASE');
	INSERT INTO InstrumentStatus(id, name) VALUES (2, 'INSTRUMENT_STATUS_ALL');


CREATE TABLE "public"."InstrumentType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT InstrumentType_pk PRIMARY KEY (id)

)
	CREATE INDEX InstrumentType_id_idx ON public.InstrumentType USING btree (id);
	COMMENT ON TABLE "public"."InstrumentType" IS 'Тип инструмента.';
	INSERT INTO InstrumentType(id, name) VALUES (0, 'INSTRUMENT_TYPE_UNSPECIFIED');
	INSERT INTO InstrumentType(id, name) VALUES (1, 'INSTRUMENT_TYPE_BOND');
	INSERT INTO InstrumentType(id, name) VALUES (2, 'INSTRUMENT_TYPE_SHARE');
	INSERT INTO InstrumentType(id, name) VALUES (3, 'INSTRUMENT_TYPE_CURRENCY');
	INSERT INTO InstrumentType(id, name) VALUES (4, 'INSTRUMENT_TYPE_ETF');
	INSERT INTO InstrumentType(id, name) VALUES (5, 'INSTRUMENT_TYPE_FUTURES');
	INSERT INTO InstrumentType(id, name) VALUES (6, 'INSTRUMENT_TYPE_SP');
	INSERT INTO InstrumentType(id, name) VALUES (7, 'INSTRUMENT_TYPE_OPTION');
	INSERT INTO InstrumentType(id, name) VALUES (8, 'INSTRUMENT_TYPE_CLEARING_CERTIFICATE');


CREATE TABLE "public"."OperationState" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OperationState_pk PRIMARY KEY (id)

)
	CREATE INDEX OperationState_id_idx ON public.OperationState USING btree (id);
	COMMENT ON TABLE "public"."OperationState" IS 'Статус запрашиваемых операций.';
	INSERT INTO OperationState(id, name) VALUES (0, 'OPERATION_STATE_UNSPECIFIED');
	INSERT INTO OperationState(id, name) VALUES (1, 'OPERATION_STATE_EXECUTED');
	INSERT INTO OperationState(id, name) VALUES (2, 'OPERATION_STATE_CANCELED');
	INSERT INTO OperationState(id, name) VALUES (3, 'OPERATION_STATE_PROGRESS');


CREATE TABLE "public"."OperationType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OperationType_pk PRIMARY KEY (id)

)
	CREATE INDEX OperationType_id_idx ON public.OperationType USING btree (id);
	COMMENT ON TABLE "public"."OperationType" IS 'Тип операции.';
	INSERT INTO OperationType(id, name) VALUES (0, 'OPERATION_TYPE_UNSPECIFIED');
	INSERT INTO OperationType(id, name) VALUES (1, 'OPERATION_TYPE_INPUT');
	INSERT INTO OperationType(id, name) VALUES (2, 'OPERATION_TYPE_BOND_TAX');
	INSERT INTO OperationType(id, name) VALUES (3, 'OPERATION_TYPE_OUTPUT_SECURITIES');
	INSERT INTO OperationType(id, name) VALUES (4, 'OPERATION_TYPE_OVERNIGHT');
	INSERT INTO OperationType(id, name) VALUES (5, 'OPERATION_TYPE_TAX');
	INSERT INTO OperationType(id, name) VALUES (6, 'OPERATION_TYPE_BOND_REPAYMENT_FULL');
	INSERT INTO OperationType(id, name) VALUES (7, 'OPERATION_TYPE_SELL_CARD');
	INSERT INTO OperationType(id, name) VALUES (8, 'OPERATION_TYPE_DIVIDEND_TAX');
	INSERT INTO OperationType(id, name) VALUES (9, 'OPERATION_TYPE_OUTPUT');
	INSERT INTO OperationType(id, name) VALUES (10, 'OPERATION_TYPE_BOND_REPAYMENT');
	INSERT INTO OperationType(id, name) VALUES (11, 'OPERATION_TYPE_TAX_CORRECTION');
	INSERT INTO OperationType(id, name) VALUES (12, 'OPERATION_TYPE_SERVICE_FEE');
	INSERT INTO OperationType(id, name) VALUES (13, 'OPERATION_TYPE_BENEFIT_TAX');
	INSERT INTO OperationType(id, name) VALUES (14, 'OPERATION_TYPE_MARGIN_FEE');
	INSERT INTO OperationType(id, name) VALUES (15, 'OPERATION_TYPE_BUY');
	INSERT INTO OperationType(id, name) VALUES (16, 'OPERATION_TYPE_BUY_CARD');
	INSERT INTO OperationType(id, name) VALUES (17, 'OPERATION_TYPE_INPUT_SECURITIES');
	INSERT INTO OperationType(id, name) VALUES (18, 'OPERATION_TYPE_SELL_MARGIN');
	INSERT INTO OperationType(id, name) VALUES (19, 'OPERATION_TYPE_BROKER_FEE');
	INSERT INTO OperationType(id, name) VALUES (20, 'OPERATION_TYPE_BUY_MARGIN');
	INSERT INTO OperationType(id, name) VALUES (21, 'OPERATION_TYPE_DIVIDEND');
	INSERT INTO OperationType(id, name) VALUES (22, 'OPERATION_TYPE_SELL');
	INSERT INTO OperationType(id, name) VALUES (23, 'OPERATION_TYPE_COUPON');
	INSERT INTO OperationType(id, name) VALUES (24, 'OPERATION_TYPE_SUCCESS_FEE');
	INSERT INTO OperationType(id, name) VALUES (25, 'OPERATION_TYPE_DIVIDEND_TRANSFER');
	INSERT INTO OperationType(id, name) VALUES (26, 'OPERATION_TYPE_ACCRUING_VARMARGIN');
	INSERT INTO OperationType(id, name) VALUES (27, 'OPERATION_TYPE_WRITING_OFF_VARMARGIN');
	INSERT INTO OperationType(id, name) VALUES (28, 'OPERATION_TYPE_DELIVERY_BUY');
	INSERT INTO OperationType(id, name) VALUES (29, 'OPERATION_TYPE_DELIVERY_SELL');
	INSERT INTO OperationType(id, name) VALUES (30, 'OPERATION_TYPE_TRACK_MFEE');
	INSERT INTO OperationType(id, name) VALUES (31, 'OPERATION_TYPE_TRACK_PFEE');
	INSERT INTO OperationType(id, name) VALUES (32, 'OPERATION_TYPE_TAX_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (33, 'OPERATION_TYPE_BOND_TAX_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (34, 'OPERATION_TYPE_DIVIDEND_TAX_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (35, 'OPERATION_TYPE_BENEFIT_TAX_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (36, 'OPERATION_TYPE_TAX_CORRECTION_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (37, 'OPERATION_TYPE_TAX_REPO_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (38, 'OPERATION_TYPE_TAX_REPO');
	INSERT INTO OperationType(id, name) VALUES (39, 'OPERATION_TYPE_TAX_REPO_HOLD');
	INSERT INTO OperationType(id, name) VALUES (40, 'OPERATION_TYPE_TAX_REPO_REFUND');
	INSERT INTO OperationType(id, name) VALUES (41, 'OPERATION_TYPE_TAX_REPO_HOLD_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (42, 'OPERATION_TYPE_TAX_REPO_REFUND_PROGRESSIVE');
	INSERT INTO OperationType(id, name) VALUES (43, 'OPERATION_TYPE_DIV_EXT');
	INSERT INTO OperationType(id, name) VALUES (44, 'OPERATION_TYPE_TAX_CORRECTION_COUPON');
	INSERT INTO OperationType(id, name) VALUES (45, 'OPERATION_TYPE_CASH_FEE');
	INSERT INTO OperationType(id, name) VALUES (46, 'OPERATION_TYPE_OUT_FEE');
	INSERT INTO OperationType(id, name) VALUES (47, 'OPERATION_TYPE_OUT_STAMP_DUTY');
	INSERT INTO OperationType(id, name) VALUES (50, 'OPERATION_TYPE_OUTPUT_SWIFT');
	INSERT INTO OperationType(id, name) VALUES (51, 'OPERATION_TYPE_INPUT_SWIFT');
	INSERT INTO OperationType(id, name) VALUES (53, 'OPERATION_TYPE_OUTPUT_ACQUIRING');
	INSERT INTO OperationType(id, name) VALUES (54, 'OPERATION_TYPE_INPUT_ACQUIRING');
	INSERT INTO OperationType(id, name) VALUES (55, 'OPERATION_TYPE_OUTPUT_PENALTY');
	INSERT INTO OperationType(id, name) VALUES (56, 'OPERATION_TYPE_ADVICE_FEE');
	INSERT INTO OperationType(id, name) VALUES (57, 'OPERATION_TYPE_TRANS_IIS_BS');
	INSERT INTO OperationType(id, name) VALUES (58, 'OPERATION_TYPE_TRANS_BS_BS');
	INSERT INTO OperationType(id, name) VALUES (59, 'OPERATION_TYPE_OUT_MULTI');
	INSERT INTO OperationType(id, name) VALUES (60, 'OPERATION_TYPE_INP_MULTI');
	INSERT INTO OperationType(id, name) VALUES (61, 'OPERATION_TYPE_OVER_PLACEMENT');
	INSERT INTO OperationType(id, name) VALUES (62, 'OPERATION_TYPE_OVER_COM');
	INSERT INTO OperationType(id, name) VALUES (63, 'OPERATION_TYPE_OVER_INCOME');
	INSERT INTO OperationType(id, name) VALUES (64, 'OPERATION_TYPE_OPTION_EXPIRATION');


CREATE TABLE "public"."OptionDirection" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OptionDirection_pk PRIMARY KEY (id)

)
	CREATE INDEX OptionDirection_id_idx ON public.OptionDirection USING btree (id);
	COMMENT ON TABLE "public"."OptionDirection" IS 'Тип опциона по направлению сделки.';
	INSERT INTO OptionDirection(id, name) VALUES (0, 'OPTION_DIRECTION_UNSPECIFIED');
	INSERT INTO OptionDirection(id, name) VALUES (1, 'OPTION_DIRECTION_PUT');
	INSERT INTO OptionDirection(id, name) VALUES (2, 'OPTION_DIRECTION_CALL');


CREATE TABLE "public"."OptionPaymentType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OptionPaymentType_pk PRIMARY KEY (id)

)
	CREATE INDEX OptionPaymentType_id_idx ON public.OptionPaymentType USING btree (id);
	COMMENT ON TABLE "public"."OptionPaymentType" IS 'Тип расчетов по опциону.';
	INSERT INTO OptionPaymentType(id, name) VALUES (0, 'OPTION_PAYMENT_TYPE_UNSPECIFIED');
	INSERT INTO OptionPaymentType(id, name) VALUES (1, 'OPTION_PAYMENT_TYPE_PREMIUM');
	INSERT INTO OptionPaymentType(id, name) VALUES (2, 'OPTION_PAYMENT_TYPE_MARGINAL');


CREATE TABLE "public"."OptionSettlementType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OptionSettlementType_pk PRIMARY KEY (id)

)
	CREATE INDEX OptionSettlementType_id_idx ON public.OptionSettlementType USING btree (id);
	COMMENT ON TABLE "public"."OptionSettlementType" IS 'Тип опциона по способу исполнения.';
	INSERT INTO OptionSettlementType(id, name) VALUES (0, 'OPTION_EXECUTION_TYPE_UNSPECIFIED');
	INSERT INTO OptionSettlementType(id, name) VALUES (1, 'OPTION_EXECUTION_TYPE_PHYSICAL_DELIVERY');
	INSERT INTO OptionSettlementType(id, name) VALUES (2, 'OPTION_EXECUTION_TYPE_CASH_SETTLEMENT');


CREATE TABLE "public"."OptionStyle" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OptionStyle_pk PRIMARY KEY (id)

)
	CREATE INDEX OptionStyle_id_idx ON public.OptionStyle USING btree (id);
	COMMENT ON TABLE "public"."OptionStyle" IS 'Тип опциона по стилю.';
	INSERT INTO OptionStyle(id, name) VALUES (0, 'OPTION_STYLE_UNSPECIFIED');
	INSERT INTO OptionStyle(id, name) VALUES (1, 'OPTION_STYLE_AMERICAN');
	INSERT INTO OptionStyle(id, name) VALUES (2, 'OPTION_STYLE_EUROPEAN');


CREATE TABLE "public"."OrderDirection" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OrderDirection_pk PRIMARY KEY (id)

)
	CREATE INDEX OrderDirection_id_idx ON public.OrderDirection USING btree (id);
	COMMENT ON TABLE "public"."OrderDirection" IS 'Направление операции.';
	INSERT INTO OrderDirection(id, name) VALUES (0, 'ORDER_DIRECTION_UNSPECIFIED');
	INSERT INTO OrderDirection(id, name) VALUES (1, 'ORDER_DIRECTION_BUY');
	INSERT INTO OrderDirection(id, name) VALUES (2, 'ORDER_DIRECTION_SELL');


CREATE TABLE "public"."OrderExecutionReportStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OrderExecutionReportStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX OrderExecutionReportStatus_id_idx ON public.OrderExecutionReportStatus USING btree (id);
	COMMENT ON TABLE "public"."OrderExecutionReportStatus" IS 'Текущий статус заявки (поручения)';
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (0, 'EXECUTION_REPORT_STATUS_UNSPECIFIED');
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (1, 'EXECUTION_REPORT_STATUS_FILL');
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (2, 'EXECUTION_REPORT_STATUS_REJECTED');
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (3, 'EXECUTION_REPORT_STATUS_CANCELLED');
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (4, 'EXECUTION_REPORT_STATUS_NEW');
	INSERT INTO OrderExecutionReportStatus(id, name) VALUES (5, 'EXECUTION_REPORT_STATUS_PARTIALLYFILL');


CREATE TABLE "public"."OrderType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT OrderType_pk PRIMARY KEY (id)

)
	CREATE INDEX OrderType_id_idx ON public.OrderType USING btree (id);
	COMMENT ON TABLE "public"."OrderType" IS 'Тип заявки.';
	INSERT INTO OrderType(id, name) VALUES (0, 'ORDER_TYPE_UNSPECIFIED');
	INSERT INTO OrderType(id, name) VALUES (1, 'ORDER_TYPE_LIMIT');
	INSERT INTO OrderType(id, name) VALUES (2, 'ORDER_TYPE_MARKET');
	INSERT INTO OrderType(id, name) VALUES (3, 'ORDER_TYPE_BESTPRICE');


CREATE TABLE "public"."PortfolioSubscriptionStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT PortfolioSubscriptionStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX PortfolioSubscriptionStatus_id_idx ON public.PortfolioSubscriptionStatus USING btree (id);
	COMMENT ON TABLE "public"."PortfolioSubscriptionStatus" IS 'Результат подписки.';
	INSERT INTO PortfolioSubscriptionStatus(id, name) VALUES (0, 'PORTFOLIO_SUBSCRIPTION_STATUS_UNSPECIFIED');
	INSERT INTO PortfolioSubscriptionStatus(id, name) VALUES (1, 'PORTFOLIO_SUBSCRIPTION_STATUS_SUCCESS');
	INSERT INTO PortfolioSubscriptionStatus(id, name) VALUES (2, 'PORTFOLIO_SUBSCRIPTION_STATUS_ACCOUNT_NOT_FOUND');
	INSERT INTO PortfolioSubscriptionStatus(id, name) VALUES (3, 'PORTFOLIO_SUBSCRIPTION_STATUS_INTERNAL_ERROR');


CREATE TABLE "public"."PositionsAccountSubscriptionStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT PositionsAccountSubscriptionStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX PositionsAccountSubscriptionStatus_id_idx ON public.PositionsAccountSubscriptionStatus USING btree (id);
	COMMENT ON TABLE "public"."PositionsAccountSubscriptionStatus" IS 'Результат подписки.';
	INSERT INTO PositionsAccountSubscriptionStatus(id, name) VALUES (0, 'POSITIONS_SUBSCRIPTION_STATUS_UNSPECIFIED');
	INSERT INTO PositionsAccountSubscriptionStatus(id, name) VALUES (1, 'POSITIONS_SUBSCRIPTION_STATUS_SUCCESS');
	INSERT INTO PositionsAccountSubscriptionStatus(id, name) VALUES (2, 'POSITIONS_SUBSCRIPTION_STATUS_ACCOUNT_NOT_FOUND');
	INSERT INTO PositionsAccountSubscriptionStatus(id, name) VALUES (3, 'POSITIONS_SUBSCRIPTION_STATUS_INTERNAL_ERROR');


CREATE TABLE "public"."PriceType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT PriceType_pk PRIMARY KEY (id)

)
	CREATE INDEX PriceType_id_idx ON public.PriceType USING btree (id);
	COMMENT ON TABLE "public"."PriceType" IS 'Тип цены.';
	INSERT INTO PriceType(id, name) VALUES (0, 'PRICE_TYPE_UNSPECIFIED');
	INSERT INTO PriceType(id, name) VALUES (1, 'PRICE_TYPE_POINT');
	INSERT INTO PriceType(id, name) VALUES (2, 'PRICE_TYPE_CURRENCY');


CREATE TABLE "public"."RealExchange" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT RealExchange_pk PRIMARY KEY (id)

)
	CREATE INDEX RealExchange_id_idx ON public.RealExchange USING btree (id);
	COMMENT ON TABLE "public"."RealExchange" IS 'Реальная площадка исполнения расчётов.';
	INSERT INTO RealExchange(id, name) VALUES (0, 'REAL_EXCHANGE_UNSPECIFIED');
	INSERT INTO RealExchange(id, name) VALUES (1, 'REAL_EXCHANGE_MOEX');
	INSERT INTO RealExchange(id, name) VALUES (2, 'REAL_EXCHANGE_RTS');
	INSERT INTO RealExchange(id, name) VALUES (3, 'REAL_EXCHANGE_OTC');


CREATE TABLE "public"."RiskLevel" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT RiskLevel_pk PRIMARY KEY (id)

)
	CREATE INDEX RiskLevel_id_idx ON public.RiskLevel USING btree (id);
	COMMENT ON TABLE "public"."RiskLevel" IS 'Уровень риска облигации.';
	INSERT INTO RiskLevel(id, name) VALUES (0, 'RISK_LEVEL_UNSPECIFIED');
	INSERT INTO RiskLevel(id, name) VALUES (1, 'RISK_LEVEL_LOW');
	INSERT INTO RiskLevel(id, name) VALUES (2, 'RISK_LEVEL_MODERATE');
	INSERT INTO RiskLevel(id, name) VALUES (3, 'RISK_LEVEL_HIGH');


CREATE TABLE "public"."SecurityTradingStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT SecurityTradingStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX SecurityTradingStatus_id_idx ON public.SecurityTradingStatus USING btree (id);
	COMMENT ON TABLE "public"."SecurityTradingStatus" IS 'Режим торгов инструмента';
	INSERT INTO SecurityTradingStatus(id, name) VALUES (0, 'SECURITY_TRADING_STATUS_UNSPECIFIED');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (1, 'SECURITY_TRADING_STATUS_NOT_AVAILABLE_FOR_TRADING');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (2, 'SECURITY_TRADING_STATUS_OPENING_PERIOD');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (3, 'SECURITY_TRADING_STATUS_CLOSING_PERIOD');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (4, 'SECURITY_TRADING_STATUS_BREAK_IN_TRADING');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (5, 'SECURITY_TRADING_STATUS_NORMAL_TRADING');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (6, 'SECURITY_TRADING_STATUS_CLOSING_AUCTION');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (7, 'SECURITY_TRADING_STATUS_DARK_POOL_AUCTION');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (8, 'SECURITY_TRADING_STATUS_DISCRETE_AUCTION');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (9, 'SECURITY_TRADING_STATUS_OPENING_AUCTION_PERIOD');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (10, 'SECURITY_TRADING_STATUS_TRADING_AT_CLOSING_AUCTION_PRICE');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (11, 'SECURITY_TRADING_STATUS_SESSION_ASSIGNED');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (12, 'SECURITY_TRADING_STATUS_SESSION_CLOSE');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (13, 'SECURITY_TRADING_STATUS_SESSION_OPEN');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (14, 'SECURITY_TRADING_STATUS_DEALER_NORMAL_TRADING');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (15, 'SECURITY_TRADING_STATUS_DEALER_BREAK_IN_TRADING');
	INSERT INTO SecurityTradingStatus(id, name) VALUES (16, 'SECURITY_TRADING_STATUS_DEALER_NOT_AVAILABLE_FOR_TRADING');


CREATE TABLE "public"."ShareType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT ShareType_pk PRIMARY KEY (id)

)
	CREATE INDEX ShareType_id_idx ON public.ShareType USING btree (id);
	COMMENT ON TABLE "public"."ShareType" IS 'Тип акций.';
	INSERT INTO ShareType(id, name) VALUES (0, 'SHARE_TYPE_UNSPECIFIED');
	INSERT INTO ShareType(id, name) VALUES (1, 'SHARE_TYPE_COMMON');
	INSERT INTO ShareType(id, name) VALUES (2, 'SHARE_TYPE_PREFERRED');
	INSERT INTO ShareType(id, name) VALUES (3, 'SHARE_TYPE_ADR');
	INSERT INTO ShareType(id, name) VALUES (4, 'SHARE_TYPE_GDR');
	INSERT INTO ShareType(id, name) VALUES (5, 'SHARE_TYPE_MLP');
	INSERT INTO ShareType(id, name) VALUES (6, 'SHARE_TYPE_NY_REG_SHRS');
	INSERT INTO ShareType(id, name) VALUES (7, 'SHARE_TYPE_CLOSED_END_FUND');
	INSERT INTO ShareType(id, name) VALUES (8, 'SHARE_TYPE_REIT');


CREATE TABLE "public"."StopOrderDirection" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT StopOrderDirection_pk PRIMARY KEY (id)

)
	CREATE INDEX StopOrderDirection_id_idx ON public.StopOrderDirection USING btree (id);
	COMMENT ON TABLE "public"."StopOrderDirection" IS 'Направление сделки стоп-заявки.';
	INSERT INTO StopOrderDirection(id, name) VALUES (0, 'STOP_ORDER_DIRECTION_UNSPECIFIED');
	INSERT INTO StopOrderDirection(id, name) VALUES (1, 'STOP_ORDER_DIRECTION_BUY');
	INSERT INTO StopOrderDirection(id, name) VALUES (2, 'STOP_ORDER_DIRECTION_SELL');


CREATE TABLE "public"."StopOrderExpirationType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT StopOrderExpirationType_pk PRIMARY KEY (id)

)
	CREATE INDEX StopOrderExpirationType_id_idx ON public.StopOrderExpirationType USING btree (id);
	COMMENT ON TABLE "public"."StopOrderExpirationType" IS 'Тип экспирации стоп-заявке.';
	INSERT INTO StopOrderExpirationType(id, name) VALUES (0, 'STOP_ORDER_EXPIRATION_TYPE_UNSPECIFIED');
	INSERT INTO StopOrderExpirationType(id, name) VALUES (1, 'STOP_ORDER_EXPIRATION_TYPE_GOOD_TILL_CANCEL');
	INSERT INTO StopOrderExpirationType(id, name) VALUES (2, 'STOP_ORDER_EXPIRATION_TYPE_GOOD_TILL_DATE');


CREATE TABLE "public"."StopOrderType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT StopOrderType_pk PRIMARY KEY (id)

)
	CREATE INDEX StopOrderType_id_idx ON public.StopOrderType USING btree (id);
	COMMENT ON TABLE "public"."StopOrderType" IS 'Тип стоп-заявки.';
	INSERT INTO StopOrderType(id, name) VALUES (0, 'STOP_ORDER_TYPE_UNSPECIFIED');
	INSERT INTO StopOrderType(id, name) VALUES (1, 'STOP_ORDER_TYPE_TAKE_PROFIT');
	INSERT INTO StopOrderType(id, name) VALUES (2, 'STOP_ORDER_TYPE_STOP_LOSS');
	INSERT INTO StopOrderType(id, name) VALUES (3, 'STOP_ORDER_TYPE_STOP_LIMIT');


CREATE TABLE "public"."StructuredProductType" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT StructuredProductType_pk PRIMARY KEY (id)

)
	CREATE INDEX StructuredProductType_id_idx ON public.StructuredProductType USING btree (id);
	COMMENT ON TABLE "public"."StructuredProductType" IS 'Тип структурной ноты.';
	INSERT INTO StructuredProductType(id, name) VALUES (0, 'SP_TYPE_UNSPECIFIED');
	INSERT INTO StructuredProductType(id, name) VALUES (1, 'SP_TYPE_DELIVERABLE');
	INSERT INTO StructuredProductType(id, name) VALUES (2, 'SP_TYPE_NON_DELIVERABLE');


CREATE TABLE "public"."SubscriptionAction" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT SubscriptionAction_pk PRIMARY KEY (id)

)
	CREATE INDEX SubscriptionAction_id_idx ON public.SubscriptionAction USING btree (id);
	COMMENT ON TABLE "public"."SubscriptionAction" IS 'Тип операции со списком подписок.';
	INSERT INTO SubscriptionAction(id, name) VALUES (0, 'SUBSCRIPTION_ACTION_UNSPECIFIED');
	INSERT INTO SubscriptionAction(id, name) VALUES (1, 'SUBSCRIPTION_ACTION_SUBSCRIBE');
	INSERT INTO SubscriptionAction(id, name) VALUES (2, 'SUBSCRIPTION_ACTION_UNSUBSCRIBE');


CREATE TABLE "public"."SubscriptionInterval" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT SubscriptionInterval_pk PRIMARY KEY (id)

)
	CREATE INDEX SubscriptionInterval_id_idx ON public.SubscriptionInterval USING btree (id);
	COMMENT ON TABLE "public"."SubscriptionInterval" IS 'Интервал свечи.';
	INSERT INTO SubscriptionInterval(id, name) VALUES (0, 'SUBSCRIPTION_INTERVAL_UNSPECIFIED');
	INSERT INTO SubscriptionInterval(id, name) VALUES (1, 'SUBSCRIPTION_INTERVAL_ONE_MINUTE');
	INSERT INTO SubscriptionInterval(id, name) VALUES (2, 'SUBSCRIPTION_INTERVAL_FIVE_MINUTES');


CREATE TABLE "public"."SubscriptionStatus" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT SubscriptionStatus_pk PRIMARY KEY (id)

)
	CREATE INDEX SubscriptionStatus_id_idx ON public.SubscriptionStatus USING btree (id);
	COMMENT ON TABLE "public"."SubscriptionStatus" IS 'Результат подписки.';
	INSERT INTO SubscriptionStatus(id, name) VALUES (0, 'SUBSCRIPTION_STATUS_UNSPECIFIED');
	INSERT INTO SubscriptionStatus(id, name) VALUES (1, 'SUBSCRIPTION_STATUS_SUCCESS');
	INSERT INTO SubscriptionStatus(id, name) VALUES (2, 'SUBSCRIPTION_STATUS_INSTRUMENT_NOT_FOUND');
	INSERT INTO SubscriptionStatus(id, name) VALUES (3, 'SUBSCRIPTION_STATUS_SUBSCRIPTION_ACTION_IS_INVALID');
	INSERT INTO SubscriptionStatus(id, name) VALUES (4, 'SUBSCRIPTION_STATUS_DEPTH_IS_INVALID');
	INSERT INTO SubscriptionStatus(id, name) VALUES (5, 'SUBSCRIPTION_STATUS_INTERVAL_IS_INVALID');
	INSERT INTO SubscriptionStatus(id, name) VALUES (6, 'SUBSCRIPTION_STATUS_LIMIT_IS_EXCEEDED');
	INSERT INTO SubscriptionStatus(id, name) VALUES (7, 'SUBSCRIPTION_STATUS_INTERNAL_ERROR');
	INSERT INTO SubscriptionStatus(id, name) VALUES (8, 'SUBSCRIPTION_STATUS_TOO_MANY_REQUESTS');


CREATE TABLE "public"."TradeDirection" (
	"id" int64 ,
	"name" text ,
	CONSTRAINT TradeDirection_pk PRIMARY KEY (id)

)
	CREATE INDEX TradeDirection_id_idx ON public.TradeDirection USING btree (id);
	COMMENT ON TABLE "public"."TradeDirection" IS 'Направление сделки.';
	INSERT INTO TradeDirection(id, name) VALUES (0, 'TRADE_DIRECTION_UNSPECIFIED');
	INSERT INTO TradeDirection(id, name) VALUES (1, 'TRADE_DIRECTION_BUY');
	INSERT INTO TradeDirection(id, name) VALUES (2, 'TRADE_DIRECTION_SELL');


CREATE TABLE "public"."Account" (
	"id" text NOT NULL,
	"type_id" AccountType NULL,
	"name" text NOT NULL,
	"status_id" AccountStatus NULL,
	"opened_date" timestamptz NULL,
	"closed_date" timestamptz NULL,
	"access_level_id" AccessLevel NULL,
	CONSTRAINT Account_pk PRIMARY KEY (id)
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
	CONSTRAINT AssetInstrument_pk PRIMARY KEY (uid)
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
	CONSTRAINT AssetShare_pk PRIMARY KEY (primary_index)
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
	CONSTRAINT Bond_pk PRIMARY KEY (uid)
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
	CONSTRAINT Currency_pk PRIMARY KEY (uid)
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
	CONSTRAINT Etf_pk PRIMARY KEY (uid)
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
	CONSTRAINT Future_pk PRIMARY KEY (uid)
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
	CONSTRAINT Instrument_pk PRIMARY KEY (uid)
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
	CONSTRAINT InstrumentRequest_pk PRIMARY KEY (id)
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
	CONSTRAINT InstrumentShort_pk PRIMARY KEY (uid)
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
	CONSTRAINT Operation_pk PRIMARY KEY (id)
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
	CONSTRAINT OperationItem_pk PRIMARY KEY (id)
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
	CONSTRAINT Option_pk PRIMARY KEY (uid)
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
	CONSTRAINT Share_pk PRIMARY KEY (uid)
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






























