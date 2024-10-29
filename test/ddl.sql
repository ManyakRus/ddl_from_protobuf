
CREATE TABLE "public"."Account" (
	"id_id" text NULL,
	"type_id" AccountType NULL,
	"name_id" text NULL,
	"status_id" AccountStatus NULL,
	"opened_date" timestamptz NULL,
	"closed_date" timestamptz NULL,
	"access_level_id" AccessLevel NULL,
	CONSTRAINT Account_pk PRIMARY KEY (id)
);
	CREATE INDEX Account_id_id_idx ON public.Account USING btree (id_id);
	CREATE INDEX Account_type_id_idx ON public.Account USING btree (type_id);
	CREATE INDEX Account_name_id_idx ON public.Account USING btree (name_id);
	CREATE INDEX Account_status_id_idx ON public.Account USING btree (status_id);
	CREATE INDEX Account_access_level_id_idx ON public.Account USING btree (access_level_id);
	COMMENT ON TABLE "public"."Account" IS 'Информация о счёте.';
	COMMENT ON COLUMN "public"."Account"."id_id" IS ' Идентификатор счёта.';
	COMMENT ON COLUMN "public"."Account"."type_id" IS ' Тип счёта.';
	COMMENT ON COLUMN "public"."Account"."name_id" IS ' Название счёта.';
	COMMENT ON COLUMN "public"."Account"."status_id" IS ' Статус счёта.';
	COMMENT ON COLUMN "public"."Account"."opened_date" IS ' Дата открытия счёта в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Account"."closed_date" IS ' Дата закрытия счёта в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Account"."access_level_id" IS ' Уровень доступа к текущему счёту (определяется токеном).';


CREATE TABLE "public"."AccountSubscriptionStatus" (
	"account_id" text NULL,
	"subscription_status_id" PortfolioSubscriptionStatus NULL
);
	CREATE INDEX AccountSubscriptionStatus_account_id_idx ON public.AccountSubscriptionStatus USING btree (account_id);
	CREATE INDEX AccountSubscriptionStatus_subscription_status_id_idx ON public.AccountSubscriptionStatus USING btree (subscription_status_id);
	COMMENT ON TABLE "public"."AccountSubscriptionStatus" IS 'Счет клиента.';
	COMMENT ON COLUMN "public"."AccountSubscriptionStatus"."account_id" IS 'Идентификатор счёта';
	COMMENT ON COLUMN "public"."AccountSubscriptionStatus"."subscription_status_id" IS 'Результат подписки.';


CREATE TABLE "public"."AccruedInterest" (
	"date" timestamptz NULL,
	"value_id" Quotation NULL,
	"value_percent_id" Quotation NULL,
	"nominal_id" Quotation NULL
);
	CREATE INDEX AccruedInterest_value_id_idx ON public.AccruedInterest USING btree (value_id);
	CREATE INDEX AccruedInterest_value_percent_id_idx ON public.AccruedInterest USING btree (value_percent_id);
	CREATE INDEX AccruedInterest_nominal_id_idx ON public.AccruedInterest USING btree (nominal_id);
	COMMENT ON TABLE "public"."AccruedInterest" IS 'Операция начисления купонов.';
	COMMENT ON COLUMN "public"."AccruedInterest"."date" IS 'Дата и время выплаты в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."AccruedInterest"."value_id" IS 'Величина выплаты.';
	COMMENT ON COLUMN "public"."AccruedInterest"."value_percent_id" IS 'Величина выплаты в процентах от номинала.';
	COMMENT ON COLUMN "public"."AccruedInterest"."nominal_id" IS 'Номинал облигации.';


CREATE TABLE "public"."Asset" (
	"uid_id" text NULL,
	"type_id" AssetType NULL,
	"name_id" text NULL,
	"instruments_id" AssetInstrument NULL,
	CONSTRAINT Asset_pk PRIMARY KEY (uid),
	CONSTRAINT Asset_instruments_id_fk FOREIGN KEY (instruments_id) REFERENCES public.AssetInstrument (uid)
);
	CREATE INDEX Asset_uid_id_idx ON public.Asset USING btree (uid_id);
	CREATE INDEX Asset_type_id_idx ON public.Asset USING btree (type_id);
	CREATE INDEX Asset_name_id_idx ON public.Asset USING btree (name_id);
	CREATE INDEX Asset_instruments_id_idx ON public.Asset USING btree (instruments_id);
	COMMENT ON TABLE "public"."Asset" IS 'Информация об активе.';
	COMMENT ON COLUMN "public"."Asset"."uid_id" IS 'Уникальный идентификатор актива.';
	COMMENT ON COLUMN "public"."Asset"."type_id" IS 'Тип актива.';
	COMMENT ON COLUMN "public"."Asset"."name_id" IS 'Наименование актива.';
	COMMENT ON COLUMN "public"."Asset"."instruments_id" IS 'Массив идентификаторов инструментов.';


CREATE TABLE "public"."AssetBond" (
	"current_nominal_id" Quotation NULL,
	"borrow_name_id" text NULL,
	"issue_size_id" Quotation NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency_id" text NULL,
	"issue_kind_id" text NULL,
	"interest_kind_id" text NULL,
	"coupon_quantity_per_year_id" integer NULL,
	"indexed_nominal_flag_id" bool NULL,
	"subordinated_flag_id" bool NULL,
	"collateral_flag_id" bool NULL,
	"tax_free_flag_id" bool NULL,
	"amortization_flag_id" bool NULL,
	"floating_coupon_flag_id" bool NULL,
	"perpetual_flag_id" bool NULL,
	"maturity_date" timestamptz NULL,
	"return_condition_id" text NULL,
	"state_reg_date" timestamptz NULL,
	"placement_date" timestamptz NULL,
	"placement_price_id" Quotation NULL,
	"issue_size_plan_id" Quotation NULL
);
	CREATE INDEX AssetBond_current_nominal_id_idx ON public.AssetBond USING btree (current_nominal_id);
	CREATE INDEX AssetBond_borrow_name_id_idx ON public.AssetBond USING btree (borrow_name_id);
	CREATE INDEX AssetBond_issue_size_id_idx ON public.AssetBond USING btree (issue_size_id);
	CREATE INDEX AssetBond_nominal_id_idx ON public.AssetBond USING btree (nominal_id);
	CREATE INDEX AssetBond_nominal_currency_id_idx ON public.AssetBond USING btree (nominal_currency_id);
	CREATE INDEX AssetBond_issue_kind_id_idx ON public.AssetBond USING btree (issue_kind_id);
	CREATE INDEX AssetBond_interest_kind_id_idx ON public.AssetBond USING btree (interest_kind_id);
	CREATE INDEX AssetBond_coupon_quantity_per_year_id_idx ON public.AssetBond USING btree (coupon_quantity_per_year_id);
	CREATE INDEX AssetBond_indexed_nominal_flag_id_idx ON public.AssetBond USING btree (indexed_nominal_flag_id);
	CREATE INDEX AssetBond_subordinated_flag_id_idx ON public.AssetBond USING btree (subordinated_flag_id);
	CREATE INDEX AssetBond_collateral_flag_id_idx ON public.AssetBond USING btree (collateral_flag_id);
	CREATE INDEX AssetBond_tax_free_flag_id_idx ON public.AssetBond USING btree (tax_free_flag_id);
	CREATE INDEX AssetBond_amortization_flag_id_idx ON public.AssetBond USING btree (amortization_flag_id);
	CREATE INDEX AssetBond_floating_coupon_flag_id_idx ON public.AssetBond USING btree (floating_coupon_flag_id);
	CREATE INDEX AssetBond_perpetual_flag_id_idx ON public.AssetBond USING btree (perpetual_flag_id);
	CREATE INDEX AssetBond_return_condition_id_idx ON public.AssetBond USING btree (return_condition_id);
	CREATE INDEX AssetBond_placement_price_id_idx ON public.AssetBond USING btree (placement_price_id);
	CREATE INDEX AssetBond_issue_size_plan_id_idx ON public.AssetBond USING btree (issue_size_plan_id);
	COMMENT ON TABLE "public"."AssetBond" IS 'Облигация.';
	COMMENT ON COLUMN "public"."AssetBond"."current_nominal_id" IS 'Текущий номинал.';
	COMMENT ON COLUMN "public"."AssetBond"."borrow_name_id" IS 'Наименование заемщика.';
	COMMENT ON COLUMN "public"."AssetBond"."issue_size_id" IS 'Объем эмиссии облигации (стоимость).';
	COMMENT ON COLUMN "public"."AssetBond"."nominal_id" IS 'Номинал облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."nominal_currency_id" IS 'Валюта номинала.';
	COMMENT ON COLUMN "public"."AssetBond"."issue_kind_id" IS 'Форма выпуска облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."interest_kind_id" IS 'Форма дохода облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."coupon_quantity_per_year_id" IS 'Количество выплат в год.';
	COMMENT ON COLUMN "public"."AssetBond"."indexed_nominal_flag_id" IS 'Признак облигации с индексируемым номиналом.';
	COMMENT ON COLUMN "public"."AssetBond"."subordinated_flag_id" IS 'Признак субординированной облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."collateral_flag_id" IS 'Признак обеспеченной облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."tax_free_flag_id" IS 'Признак показывает, что купоны облигации не облагаются налогом (для mass market).';
	COMMENT ON COLUMN "public"."AssetBond"."amortization_flag_id" IS 'Признак облигации с амортизацией долга.';
	COMMENT ON COLUMN "public"."AssetBond"."floating_coupon_flag_id" IS 'Признак облигации с плавающим купоном.';
	COMMENT ON COLUMN "public"."AssetBond"."perpetual_flag_id" IS 'Признак бессрочной облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."maturity_date" IS 'Дата погашения облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."return_condition_id" IS 'Описание и условия получения дополнительного дохода.';
	COMMENT ON COLUMN "public"."AssetBond"."state_reg_date" IS 'Дата выпуска облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."placement_date" IS 'Дата размещения облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."placement_price_id" IS 'Цена размещения облигации.';
	COMMENT ON COLUMN "public"."AssetBond"."issue_size_plan_id" IS 'Объявленное количество шт.';


CREATE TABLE "public"."AssetClearingCertificate" (
	"nominal_id" Quotation NULL,
	"nominal_currency_id" text NULL
);
	CREATE INDEX AssetClearingCertificate_nominal_id_idx ON public.AssetClearingCertificate USING btree (nominal_id);
	CREATE INDEX AssetClearingCertificate_nominal_currency_id_idx ON public.AssetClearingCertificate USING btree (nominal_currency_id);
	COMMENT ON TABLE "public"."AssetClearingCertificate" IS 'Клиринговый сертификат участия.';
	COMMENT ON COLUMN "public"."AssetClearingCertificate"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."AssetClearingCertificate"."nominal_currency_id" IS 'Валюта номинала.';



CREATE TABLE "public"."AssetEtf" (
	"total_expense_id" Quotation NULL,
	"hurdle_rate_id" Quotation NULL,
	"performance_fee_id" Quotation NULL,
	"fixed_commission_id" Quotation NULL,
	"payment_type_id" text NULL,
	"watermark_flag_id" bool NULL,
	"buy_premium_id" Quotation NULL,
	"sell_discount_id" Quotation NULL,
	"rebalancing_flag_id" bool NULL,
	"rebalancing_freq_id" text NULL,
	"management_type_id" text NULL,
	"primary_index_id" text NULL,
	"focus_type_id" text NULL,
	"leveraged_flag_id" bool NULL,
	"num_share_id" Quotation NULL,
	"ucits_flag_id" bool NULL,
	"released_date" timestamptz NULL,
	"description_id" text NULL,
	"primary_index_description_id" text NULL,
	"primary_index_company_id" text NULL,
	"index_recovery_period_id" Quotation NULL,
	"inav_code_id" text NULL,
	"div_yield_flag_id" bool NULL,
	"expense_commission_id" Quotation NULL,
	"primary_index_tracking_error_id" Quotation NULL,
	"rebalancing_plan_id" text NULL,
	"tax_rate_id" text NULL,
	"rebalancing_dates" timestamptz NULL,
	"issue_kind_id" text NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency_id" text NULL,
	CONSTRAINT AssetEtf_pk PRIMARY KEY (primary_index)
);
	CREATE INDEX AssetEtf_total_expense_id_idx ON public.AssetEtf USING btree (total_expense_id);
	CREATE INDEX AssetEtf_hurdle_rate_id_idx ON public.AssetEtf USING btree (hurdle_rate_id);
	CREATE INDEX AssetEtf_performance_fee_id_idx ON public.AssetEtf USING btree (performance_fee_id);
	CREATE INDEX AssetEtf_fixed_commission_id_idx ON public.AssetEtf USING btree (fixed_commission_id);
	CREATE INDEX AssetEtf_payment_type_id_idx ON public.AssetEtf USING btree (payment_type_id);
	CREATE INDEX AssetEtf_watermark_flag_id_idx ON public.AssetEtf USING btree (watermark_flag_id);
	CREATE INDEX AssetEtf_buy_premium_id_idx ON public.AssetEtf USING btree (buy_premium_id);
	CREATE INDEX AssetEtf_sell_discount_id_idx ON public.AssetEtf USING btree (sell_discount_id);
	CREATE INDEX AssetEtf_rebalancing_flag_id_idx ON public.AssetEtf USING btree (rebalancing_flag_id);
	CREATE INDEX AssetEtf_rebalancing_freq_id_idx ON public.AssetEtf USING btree (rebalancing_freq_id);
	CREATE INDEX AssetEtf_management_type_id_idx ON public.AssetEtf USING btree (management_type_id);
	CREATE INDEX AssetEtf_primary_index_id_idx ON public.AssetEtf USING btree (primary_index_id);
	CREATE INDEX AssetEtf_focus_type_id_idx ON public.AssetEtf USING btree (focus_type_id);
	CREATE INDEX AssetEtf_leveraged_flag_id_idx ON public.AssetEtf USING btree (leveraged_flag_id);
	CREATE INDEX AssetEtf_num_share_id_idx ON public.AssetEtf USING btree (num_share_id);
	CREATE INDEX AssetEtf_ucits_flag_id_idx ON public.AssetEtf USING btree (ucits_flag_id);
	CREATE INDEX AssetEtf_description_id_idx ON public.AssetEtf USING btree (description_id);
	CREATE INDEX AssetEtf_primary_index_description_id_idx ON public.AssetEtf USING btree (primary_index_description_id);
	CREATE INDEX AssetEtf_primary_index_company_id_idx ON public.AssetEtf USING btree (primary_index_company_id);
	CREATE INDEX AssetEtf_index_recovery_period_id_idx ON public.AssetEtf USING btree (index_recovery_period_id);
	CREATE INDEX AssetEtf_inav_code_id_idx ON public.AssetEtf USING btree (inav_code_id);
	CREATE INDEX AssetEtf_div_yield_flag_id_idx ON public.AssetEtf USING btree (div_yield_flag_id);
	CREATE INDEX AssetEtf_expense_commission_id_idx ON public.AssetEtf USING btree (expense_commission_id);
	CREATE INDEX AssetEtf_primary_index_tracking_error_id_idx ON public.AssetEtf USING btree (primary_index_tracking_error_id);
	CREATE INDEX AssetEtf_rebalancing_plan_id_idx ON public.AssetEtf USING btree (rebalancing_plan_id);
	CREATE INDEX AssetEtf_tax_rate_id_idx ON public.AssetEtf USING btree (tax_rate_id);
	CREATE INDEX AssetEtf_issue_kind_id_idx ON public.AssetEtf USING btree (issue_kind_id);
	CREATE INDEX AssetEtf_nominal_id_idx ON public.AssetEtf USING btree (nominal_id);
	CREATE INDEX AssetEtf_nominal_currency_id_idx ON public.AssetEtf USING btree (nominal_currency_id);
	COMMENT ON TABLE "public"."AssetEtf" IS 'Фонд.';
	COMMENT ON COLUMN "public"."AssetEtf"."total_expense_id" IS 'Суммарные расходы фонда (в %).';
	COMMENT ON COLUMN "public"."AssetEtf"."hurdle_rate_id" IS 'Барьерная ставка доходности после которой фонд имеет право на perfomance fee (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."performance_fee_id" IS 'Комиссия за успешные результаты фонда (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."fixed_commission_id" IS 'Фиксированная комиссия за управление (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."payment_type_id" IS 'Тип распределения доходов от выплат по бумагам.';
	COMMENT ON COLUMN "public"."AssetEtf"."watermark_flag_id" IS 'Признак необходимости выхода фонда в плюс для получения комиссии.';
	COMMENT ON COLUMN "public"."AssetEtf"."buy_premium_id" IS 'Премия (надбавка к цене) при покупке доли в фонде (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."sell_discount_id" IS 'Ставка дисконта (вычет из цены) при продаже доли в фонде (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_flag_id" IS 'Признак ребалансируемости портфеля фонда.';
	COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_freq_id" IS 'Периодичность ребалансировки.';
	COMMENT ON COLUMN "public"."AssetEtf"."management_type_id" IS 'Тип управления.';
	COMMENT ON COLUMN "public"."AssetEtf"."primary_index_id" IS 'Индекс, который реплицирует (старается копировать) фонд.';
	COMMENT ON COLUMN "public"."AssetEtf"."focus_type_id" IS 'База ETF.';
	COMMENT ON COLUMN "public"."AssetEtf"."leveraged_flag_id" IS 'Признак использования заемных активов (плечо).';
	COMMENT ON COLUMN "public"."AssetEtf"."num_share_id" IS 'Количество акций в обращении.';
	COMMENT ON COLUMN "public"."AssetEtf"."ucits_flag_id" IS 'Признак обязательства по отчетности перед регулятором.';
	COMMENT ON COLUMN "public"."AssetEtf"."released_date" IS 'Дата выпуска.';
	COMMENT ON COLUMN "public"."AssetEtf"."description_id" IS 'Описание фонда.';
	COMMENT ON COLUMN "public"."AssetEtf"."primary_index_description_id" IS 'Описание индекса, за которым следует фонд.';
	COMMENT ON COLUMN "public"."AssetEtf"."primary_index_company_id" IS 'Основные компании, в которые вкладывается фонд.';
	COMMENT ON COLUMN "public"."AssetEtf"."index_recovery_period_id" IS 'Срок восстановления индекса (после просадки).';
	COMMENT ON COLUMN "public"."AssetEtf"."inav_code_id" IS 'IVAV-код.';
	COMMENT ON COLUMN "public"."AssetEtf"."div_yield_flag_id" IS 'Признак наличия дивидендной доходности.';
	COMMENT ON COLUMN "public"."AssetEtf"."expense_commission_id" IS 'Комиссия на покрытие расходов фонда (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."primary_index_tracking_error_id" IS 'Ошибка следования за индексом (в процентах).';
	COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_plan_id" IS 'Плановая ребалансировка портфеля.';
	COMMENT ON COLUMN "public"."AssetEtf"."tax_rate_id" IS 'Ставки налогообложения дивидендов и купонов.';
	COMMENT ON COLUMN "public"."AssetEtf"."rebalancing_dates" IS 'Даты ребалансировок.';
	COMMENT ON COLUMN "public"."AssetEtf"."issue_kind_id" IS 'Форма выпуска.';
	COMMENT ON COLUMN "public"."AssetEtf"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."AssetEtf"."nominal_currency_id" IS 'Валюта номинала.';


CREATE TABLE "public"."AssetFull" (
	"uid_id" text NULL,
	"type_id" AssetType NULL,
	"name_id" text NULL,
	"name_brief_id" text NULL,
	"description_id" text NULL,
	"deleted_at" timestamptz NULL,
	"required_tests_id" text NULL,
	"gos_reg_code_id" text NULL,
	"cfi_id" text NULL,
	"code_nsd_id" text NULL,
	"status_id" text NULL,
	"brand_id" Brand NULL,
	"updated_at" timestamptz NULL,
	"br_code_id" text NULL,
	"br_code_name_id" text NULL,
	"instruments_id" AssetInstrument NULL,
	CONSTRAINT AssetFull_pk PRIMARY KEY (uid),
	CONSTRAINT AssetFull_brand_id_fk FOREIGN KEY (brand_id) REFERENCES public.Brand (uid),
	CONSTRAINT AssetFull_instruments_id_fk FOREIGN KEY (instruments_id) REFERENCES public.AssetInstrument (uid)
);
	CREATE INDEX AssetFull_uid_id_idx ON public.AssetFull USING btree (uid_id);
	CREATE INDEX AssetFull_type_id_idx ON public.AssetFull USING btree (type_id);
	CREATE INDEX AssetFull_name_id_idx ON public.AssetFull USING btree (name_id);
	CREATE INDEX AssetFull_name_brief_id_idx ON public.AssetFull USING btree (name_brief_id);
	CREATE INDEX AssetFull_description_id_idx ON public.AssetFull USING btree (description_id);
	CREATE INDEX AssetFull_required_tests_id_idx ON public.AssetFull USING btree (required_tests_id);
	CREATE INDEX AssetFull_gos_reg_code_id_idx ON public.AssetFull USING btree (gos_reg_code_id);
	CREATE INDEX AssetFull_cfi_id_idx ON public.AssetFull USING btree (cfi_id);
	CREATE INDEX AssetFull_code_nsd_id_idx ON public.AssetFull USING btree (code_nsd_id);
	CREATE INDEX AssetFull_status_id_idx ON public.AssetFull USING btree (status_id);
	CREATE INDEX AssetFull_brand_id_idx ON public.AssetFull USING btree (brand_id);
	CREATE INDEX AssetFull_br_code_id_idx ON public.AssetFull USING btree (br_code_id);
	CREATE INDEX AssetFull_br_code_name_id_idx ON public.AssetFull USING btree (br_code_name_id);
	CREATE INDEX AssetFull_instruments_id_idx ON public.AssetFull USING btree (instruments_id);
	COMMENT ON TABLE "public"."AssetFull" IS '';
	COMMENT ON COLUMN "public"."AssetFull"."uid_id" IS 'Уникальный идентификатор актива.';
	COMMENT ON COLUMN "public"."AssetFull"."type_id" IS 'Тип актива.';
	COMMENT ON COLUMN "public"."AssetFull"."name_id" IS 'Наименование актива.';
	COMMENT ON COLUMN "public"."AssetFull"."name_brief_id" IS 'Короткое наименование актива.';
	COMMENT ON COLUMN "public"."AssetFull"."description_id" IS 'Описание актива.';
	COMMENT ON COLUMN "public"."AssetFull"."deleted_at" IS 'Дата и время удаления актива.';
	COMMENT ON COLUMN "public"."AssetFull"."required_tests_id" IS 'Тестирование клиентов.';
	COMMENT ON COLUMN "public"."AssetFull"."gos_reg_code_id" IS 'Номер государственной регистрации.';
	COMMENT ON COLUMN "public"."AssetFull"."cfi_id" IS 'Код CFI.';
	COMMENT ON COLUMN "public"."AssetFull"."code_nsd_id" IS 'Код НРД инструмента.';
	COMMENT ON COLUMN "public"."AssetFull"."status_id" IS 'Статус актива.';
	COMMENT ON COLUMN "public"."AssetFull"."brand_id" IS 'Бренд.';
	COMMENT ON COLUMN "public"."AssetFull"."updated_at" IS 'Дата и время последнего обновления записи.';
	COMMENT ON COLUMN "public"."AssetFull"."br_code_id" IS 'Код типа ц.б. по классификации Банка России.';
	COMMENT ON COLUMN "public"."AssetFull"."br_code_name_id" IS 'Наименование кода типа ц.б. по классификации Банка России.';
	COMMENT ON COLUMN "public"."AssetFull"."instruments_id" IS 'Массив идентификаторов инструментов.';


CREATE TABLE "public"."AssetInstrument" (
	"uid_id" text NULL,
	"figi_id" text NULL,
	"instrument_type_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"links_id" InstrumentLink NULL,
	"instrument_kind_id" InstrumentType NULL,
	"position_uid_id" text NULL,
	CONSTRAINT AssetInstrument_pk PRIMARY KEY (uid)
);
	CREATE INDEX AssetInstrument_uid_id_idx ON public.AssetInstrument USING btree (uid_id);
	CREATE INDEX AssetInstrument_figi_id_idx ON public.AssetInstrument USING btree (figi_id);
	CREATE INDEX AssetInstrument_instrument_type_id_idx ON public.AssetInstrument USING btree (instrument_type_id);
	CREATE INDEX AssetInstrument_ticker_id_idx ON public.AssetInstrument USING btree (ticker_id);
	CREATE INDEX AssetInstrument_class_code_id_idx ON public.AssetInstrument USING btree (class_code_id);
	CREATE INDEX AssetInstrument_links_id_idx ON public.AssetInstrument USING btree (links_id);
	CREATE INDEX AssetInstrument_instrument_kind_id_idx ON public.AssetInstrument USING btree (instrument_kind_id);
	CREATE INDEX AssetInstrument_position_uid_id_idx ON public.AssetInstrument USING btree (position_uid_id);
	COMMENT ON TABLE "public"."AssetInstrument" IS 'Идентификаторы инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."uid_id" IS 'uid идентификатор инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."figi_id" IS 'figi идентификатор инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."AssetInstrument"."links_id" IS 'Массив связанных инструментов.';
	COMMENT ON COLUMN "public"."AssetInstrument"."instrument_kind_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."AssetInstrument"."position_uid_id" IS 'id позиции.';




CREATE TABLE "public"."AssetSecurity" (
	"isin_id" text NULL,
	"type_id" text NULL,
	"instrument_kind_id" InstrumentType NULL
);
	CREATE INDEX AssetSecurity_isin_id_idx ON public.AssetSecurity USING btree (isin_id);
	CREATE INDEX AssetSecurity_type_id_idx ON public.AssetSecurity USING btree (type_id);
	CREATE INDEX AssetSecurity_instrument_kind_id_idx ON public.AssetSecurity USING btree (instrument_kind_id);
	COMMENT ON TABLE "public"."AssetSecurity" IS 'Ценная бумага.';
	COMMENT ON COLUMN "public"."AssetSecurity"."isin_id" IS 'ISIN-идентификатор ценной бумаги.';
	COMMENT ON COLUMN "public"."AssetSecurity"."type_id" IS 'Тип ценной бумаги.';
	COMMENT ON COLUMN "public"."AssetSecurity"."instrument_kind_id" IS 'Тип инструмента.';


CREATE TABLE "public"."AssetShare" (
	"type_id" ShareType NULL,
	"issue_size_id" Quotation NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency_id" text NULL,
	"primary_index_id" text NULL,
	"dividend_rate_id" Quotation NULL,
	"preferred_share_type_id" text NULL,
	"ipo_date" timestamptz NULL,
	"registry_date" timestamptz NULL,
	"div_yield_flag_id" bool NULL,
	"issue_kind_id" text NULL,
	"placement_date" timestamptz NULL,
	"repres_isin_id" text NULL,
	"issue_size_plan_id" Quotation NULL,
	"total_float_id" Quotation NULL,
	CONSTRAINT AssetShare_pk PRIMARY KEY (primary_index)
);
	CREATE INDEX AssetShare_type_id_idx ON public.AssetShare USING btree (type_id);
	CREATE INDEX AssetShare_issue_size_id_idx ON public.AssetShare USING btree (issue_size_id);
	CREATE INDEX AssetShare_nominal_id_idx ON public.AssetShare USING btree (nominal_id);
	CREATE INDEX AssetShare_nominal_currency_id_idx ON public.AssetShare USING btree (nominal_currency_id);
	CREATE INDEX AssetShare_primary_index_id_idx ON public.AssetShare USING btree (primary_index_id);
	CREATE INDEX AssetShare_dividend_rate_id_idx ON public.AssetShare USING btree (dividend_rate_id);
	CREATE INDEX AssetShare_preferred_share_type_id_idx ON public.AssetShare USING btree (preferred_share_type_id);
	CREATE INDEX AssetShare_div_yield_flag_id_idx ON public.AssetShare USING btree (div_yield_flag_id);
	CREATE INDEX AssetShare_issue_kind_id_idx ON public.AssetShare USING btree (issue_kind_id);
	CREATE INDEX AssetShare_repres_isin_id_idx ON public.AssetShare USING btree (repres_isin_id);
	CREATE INDEX AssetShare_issue_size_plan_id_idx ON public.AssetShare USING btree (issue_size_plan_id);
	CREATE INDEX AssetShare_total_float_id_idx ON public.AssetShare USING btree (total_float_id);
	COMMENT ON TABLE "public"."AssetShare" IS 'Акция.';
	COMMENT ON COLUMN "public"."AssetShare"."type_id" IS 'Тип акции.';
	COMMENT ON COLUMN "public"."AssetShare"."issue_size_id" IS 'Объем выпуска (шт.).';
	COMMENT ON COLUMN "public"."AssetShare"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."AssetShare"."nominal_currency_id" IS 'Валюта номинала.';
	COMMENT ON COLUMN "public"."AssetShare"."primary_index_id" IS 'Индекс (Bloomberg).';
	COMMENT ON COLUMN "public"."AssetShare"."dividend_rate_id" IS 'Ставка дивиденда (для привилегированных акций).';
	COMMENT ON COLUMN "public"."AssetShare"."preferred_share_type_id" IS 'Тип привилегированных акций.';
	COMMENT ON COLUMN "public"."AssetShare"."ipo_date" IS 'Дата IPO.';
	COMMENT ON COLUMN "public"."AssetShare"."registry_date" IS 'Дата регистрации.';
	COMMENT ON COLUMN "public"."AssetShare"."div_yield_flag_id" IS 'Признак наличия дивидендной доходности.';
	COMMENT ON COLUMN "public"."AssetShare"."issue_kind_id" IS 'Форма выпуска ФИ.';
	COMMENT ON COLUMN "public"."AssetShare"."placement_date" IS 'Дата размещения акции.';
	COMMENT ON COLUMN "public"."AssetShare"."repres_isin_id" IS 'ISIN базового актива.';
	COMMENT ON COLUMN "public"."AssetShare"."issue_size_plan_id" IS 'Объявленное количество шт.';
	COMMENT ON COLUMN "public"."AssetShare"."total_float_id" IS 'Количество акций в свободном обращении.';


CREATE TABLE "public"."AssetStructuredProduct" (
	"borrow_name_id" text NULL,
	"nominal_id" Quotation NULL,
	"nominal_currency_id" text NULL,
	"type_id" StructuredProductType NULL,
	"logic_portfolio_id" text NULL,
	"asset_type_id" AssetType NULL,
	"basic_asset_id" text NULL,
	"safety_barrier_id" Quotation NULL,
	"maturity_date" timestamptz NULL,
	"issue_size_plan_id" Quotation NULL,
	"issue_size_id" Quotation NULL,
	"placement_date" timestamptz NULL,
	"issue_kind_id" text NULL
);
	CREATE INDEX AssetStructuredProduct_borrow_name_id_idx ON public.AssetStructuredProduct USING btree (borrow_name_id);
	CREATE INDEX AssetStructuredProduct_nominal_id_idx ON public.AssetStructuredProduct USING btree (nominal_id);
	CREATE INDEX AssetStructuredProduct_nominal_currency_id_idx ON public.AssetStructuredProduct USING btree (nominal_currency_id);
	CREATE INDEX AssetStructuredProduct_type_id_idx ON public.AssetStructuredProduct USING btree (type_id);
	CREATE INDEX AssetStructuredProduct_logic_portfolio_id_idx ON public.AssetStructuredProduct USING btree (logic_portfolio_id);
	CREATE INDEX AssetStructuredProduct_asset_type_id_idx ON public.AssetStructuredProduct USING btree (asset_type_id);
	CREATE INDEX AssetStructuredProduct_basic_asset_id_idx ON public.AssetStructuredProduct USING btree (basic_asset_id);
	CREATE INDEX AssetStructuredProduct_safety_barrier_id_idx ON public.AssetStructuredProduct USING btree (safety_barrier_id);
	CREATE INDEX AssetStructuredProduct_issue_size_plan_id_idx ON public.AssetStructuredProduct USING btree (issue_size_plan_id);
	CREATE INDEX AssetStructuredProduct_issue_size_id_idx ON public.AssetStructuredProduct USING btree (issue_size_id);
	CREATE INDEX AssetStructuredProduct_issue_kind_id_idx ON public.AssetStructuredProduct USING btree (issue_kind_id);
	COMMENT ON TABLE "public"."AssetStructuredProduct" IS 'Структурная нота.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."borrow_name_id" IS 'Наименование заемщика.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."nominal_currency_id" IS 'Валюта номинала.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."type_id" IS 'Тип структурной ноты.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."logic_portfolio_id" IS 'Стратегия портфеля.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."asset_type_id" IS 'Тип базового актива.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."basic_asset_id" IS 'Вид базового актива в зависимости от типа базового актива.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."safety_barrier_id" IS 'Барьер сохранности (в процентах).';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."maturity_date" IS 'Дата погашения.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."issue_size_plan_id" IS 'Объявленное количество шт.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."issue_size_id" IS 'Объем размещения.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."placement_date" IS 'Дата размещения ноты.';
	COMMENT ON COLUMN "public"."AssetStructuredProduct"."issue_kind_id" IS 'Форма выпуска.';




CREATE TABLE "public"."Bond" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"coupon_quantity_per_year_id" integer NULL,
	"maturity_date" timestamptz NULL,
	"nominal_id" MoneyValue NULL,
	"initial_nominal_id" MoneyValue NULL,
	"state_reg_date" timestamptz NULL,
	"placement_date" timestamptz NULL,
	"placement_price_id" MoneyValue NULL,
	"aci_value_id" MoneyValue NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"sector_id" text NULL,
	"issue_kind_id" text NULL,
	"issue_size_id" bigint NULL,
	"issue_size_plan_id" bigint NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"floating_coupon_flag_id" bool NULL,
	"perpetual_flag_id" bool NULL,
	"amortization_flag_id" bool NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"subordinated_flag_id" bool NULL,
	"liquidity_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	"risk_level_id" RiskLevel NULL,
	CONSTRAINT Bond_pk PRIMARY KEY (uid)
);
	CREATE INDEX Bond_figi_id_idx ON public.Bond USING btree (figi_id);
	CREATE INDEX Bond_ticker_id_idx ON public.Bond USING btree (ticker_id);
	CREATE INDEX Bond_class_code_id_idx ON public.Bond USING btree (class_code_id);
	CREATE INDEX Bond_isin_id_idx ON public.Bond USING btree (isin_id);
	CREATE INDEX Bond_lot_id_idx ON public.Bond USING btree (lot_id);
	CREATE INDEX Bond_currency_id_idx ON public.Bond USING btree (currency_id);
	CREATE INDEX Bond_klong_id_idx ON public.Bond USING btree (klong_id);
	CREATE INDEX Bond_kshort_id_idx ON public.Bond USING btree (kshort_id);
	CREATE INDEX Bond_dlong_id_idx ON public.Bond USING btree (dlong_id);
	CREATE INDEX Bond_dshort_id_idx ON public.Bond USING btree (dshort_id);
	CREATE INDEX Bond_dlong_min_id_idx ON public.Bond USING btree (dlong_min_id);
	CREATE INDEX Bond_dshort_min_id_idx ON public.Bond USING btree (dshort_min_id);
	CREATE INDEX Bond_short_enabled_flag_id_idx ON public.Bond USING btree (short_enabled_flag_id);
	CREATE INDEX Bond_name_id_idx ON public.Bond USING btree (name_id);
	CREATE INDEX Bond_exchange_id_idx ON public.Bond USING btree (exchange_id);
	CREATE INDEX Bond_coupon_quantity_per_year_id_idx ON public.Bond USING btree (coupon_quantity_per_year_id);
	CREATE INDEX Bond_nominal_id_idx ON public.Bond USING btree (nominal_id);
	CREATE INDEX Bond_initial_nominal_id_idx ON public.Bond USING btree (initial_nominal_id);
	CREATE INDEX Bond_placement_price_id_idx ON public.Bond USING btree (placement_price_id);
	CREATE INDEX Bond_aci_value_id_idx ON public.Bond USING btree (aci_value_id);
	CREATE INDEX Bond_country_of_risk_id_idx ON public.Bond USING btree (country_of_risk_id);
	CREATE INDEX Bond_country_of_risk_name_id_idx ON public.Bond USING btree (country_of_risk_name_id);
	CREATE INDEX Bond_sector_id_idx ON public.Bond USING btree (sector_id);
	CREATE INDEX Bond_issue_kind_id_idx ON public.Bond USING btree (issue_kind_id);
	CREATE INDEX Bond_issue_size_id_idx ON public.Bond USING btree (issue_size_id);
	CREATE INDEX Bond_issue_size_plan_id_idx ON public.Bond USING btree (issue_size_plan_id);
	CREATE INDEX Bond_trading_status_id_idx ON public.Bond USING btree (trading_status_id);
	CREATE INDEX Bond_otc_flag_id_idx ON public.Bond USING btree (otc_flag_id);
	CREATE INDEX Bond_buy_available_flag_id_idx ON public.Bond USING btree (buy_available_flag_id);
	CREATE INDEX Bond_sell_available_flag_id_idx ON public.Bond USING btree (sell_available_flag_id);
	CREATE INDEX Bond_floating_coupon_flag_id_idx ON public.Bond USING btree (floating_coupon_flag_id);
	CREATE INDEX Bond_perpetual_flag_id_idx ON public.Bond USING btree (perpetual_flag_id);
	CREATE INDEX Bond_amortization_flag_id_idx ON public.Bond USING btree (amortization_flag_id);
	CREATE INDEX Bond_min_price_increment_id_idx ON public.Bond USING btree (min_price_increment_id);
	CREATE INDEX Bond_api_trade_available_flag_id_idx ON public.Bond USING btree (api_trade_available_flag_id);
	CREATE INDEX Bond_uid_id_idx ON public.Bond USING btree (uid_id);
	CREATE INDEX Bond_real_exchange_id_idx ON public.Bond USING btree (real_exchange_id);
	CREATE INDEX Bond_position_uid_id_idx ON public.Bond USING btree (position_uid_id);
	CREATE INDEX Bond_for_iis_flag_id_idx ON public.Bond USING btree (for_iis_flag_id);
	CREATE INDEX Bond_for_qual_investor_flag_id_idx ON public.Bond USING btree (for_qual_investor_flag_id);
	CREATE INDEX Bond_weekend_flag_id_idx ON public.Bond USING btree (weekend_flag_id);
	CREATE INDEX Bond_blocked_tca_flag_id_idx ON public.Bond USING btree (blocked_tca_flag_id);
	CREATE INDEX Bond_subordinated_flag_id_idx ON public.Bond USING btree (subordinated_flag_id);
	CREATE INDEX Bond_liquidity_flag_id_idx ON public.Bond USING btree (liquidity_flag_id);
	CREATE INDEX Bond_risk_level_id_idx ON public.Bond USING btree (risk_level_id);
	COMMENT ON TABLE "public"."Bond" IS 'Объект передачи информации об облигации.';
	COMMENT ON COLUMN "public"."Bond"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Bond"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Bond"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."Bond"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Bond"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Bond"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Bond"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
	COMMENT ON COLUMN "public"."Bond"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
	COMMENT ON COLUMN "public"."Bond"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Bond"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Bond"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Bond"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Bond"."short_enabled_flag_id" IS 'Признак доступности для операций в шорт.';
	COMMENT ON COLUMN "public"."Bond"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Bond"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Bond"."coupon_quantity_per_year_id" IS 'Количество выплат по купонам в год.';
	COMMENT ON COLUMN "public"."Bond"."maturity_date" IS 'Дата погашения облигации в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Bond"."nominal_id" IS 'Номинал облигации.';
	COMMENT ON COLUMN "public"."Bond"."initial_nominal_id" IS 'Первоначальный номинал облигации.';
	COMMENT ON COLUMN "public"."Bond"."state_reg_date" IS 'Дата выпуска облигации в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Bond"."placement_date" IS 'Дата размещения в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Bond"."placement_price_id" IS 'Цена размещения.';
	COMMENT ON COLUMN "public"."Bond"."aci_value_id" IS 'Значение НКД (накопленного купонного дохода) на дату.';
	COMMENT ON COLUMN "public"."Bond"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Bond"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Bond"."sector_id" IS 'Сектор экономики.';
	COMMENT ON COLUMN "public"."Bond"."issue_kind_id" IS 'Форма выпуска. Возможные значения: </br>**documentary** — документарная; </br>**non_documentary** — бездокументарная.';
	COMMENT ON COLUMN "public"."Bond"."issue_size_id" IS 'Размер выпуска.';
	COMMENT ON COLUMN "public"."Bond"."issue_size_plan_id" IS 'Плановый размер выпуска.';
	COMMENT ON COLUMN "public"."Bond"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Bond"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Bond"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Bond"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Bond"."floating_coupon_flag_id" IS 'Признак облигации с плавающим купоном.';
	COMMENT ON COLUMN "public"."Bond"."perpetual_flag_id" IS 'Признак бессрочной облигации.';
	COMMENT ON COLUMN "public"."Bond"."amortization_flag_id" IS 'Признак облигации с амортизацией долга.';
	COMMENT ON COLUMN "public"."Bond"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Bond"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Bond"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Bond"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Bond"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Bond"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Bond"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Bond"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным';
	COMMENT ON COLUMN "public"."Bond"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС';
	COMMENT ON COLUMN "public"."Bond"."subordinated_flag_id" IS 'Признак субординированной облигации.';
	COMMENT ON COLUMN "public"."Bond"."liquidity_flag_id" IS 'Флаг достаточной ликвидности';
	COMMENT ON COLUMN "public"."Bond"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Bond"."first_1day_candle_date" IS 'Дата первой дневной свечи.';
	COMMENT ON COLUMN "public"."Bond"."risk_level_id" IS 'Уровень риска.';




CREATE TABLE "public"."Brand" (
	"uid_id" text NULL,
	"name_id" text NULL,
	"description_id" text NULL,
	"info_id" text NULL,
	"company_id" text NULL,
	"sector_id" text NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	CONSTRAINT Brand_pk PRIMARY KEY (uid)
);
	CREATE INDEX Brand_uid_id_idx ON public.Brand USING btree (uid_id);
	CREATE INDEX Brand_name_id_idx ON public.Brand USING btree (name_id);
	CREATE INDEX Brand_description_id_idx ON public.Brand USING btree (description_id);
	CREATE INDEX Brand_info_id_idx ON public.Brand USING btree (info_id);
	CREATE INDEX Brand_company_id_idx ON public.Brand USING btree (company_id);
	CREATE INDEX Brand_sector_id_idx ON public.Brand USING btree (sector_id);
	CREATE INDEX Brand_country_of_risk_id_idx ON public.Brand USING btree (country_of_risk_id);
	CREATE INDEX Brand_country_of_risk_name_id_idx ON public.Brand USING btree (country_of_risk_name_id);
	COMMENT ON TABLE "public"."Brand" IS 'Бренд.';
	COMMENT ON COLUMN "public"."Brand"."uid_id" IS 'uid идентификатор бренда.';
	COMMENT ON COLUMN "public"."Brand"."name_id" IS 'Наименование бренда.';
	COMMENT ON COLUMN "public"."Brand"."description_id" IS 'Описание.';
	COMMENT ON COLUMN "public"."Brand"."info_id" IS 'Информация о бренде.';
	COMMENT ON COLUMN "public"."Brand"."company_id" IS 'Компания.';
	COMMENT ON COLUMN "public"."Brand"."sector_id" IS 'Сектор.';
	COMMENT ON COLUMN "public"."Brand"."country_of_risk_id" IS 'Код страны риска.';
	COMMENT ON COLUMN "public"."Brand"."country_of_risk_name_id" IS 'Наименование страны риска.';


CREATE TABLE "public"."BrokerReport" (
	"trade_id" text NULL,
	"order_id" text NULL,
	"figi_id" text NULL,
	"execute_sign_id" text NULL,
	"trade_datetime" timestamptz NULL,
	"exchange_id" text NULL,
	"class_code_id" text NULL,
	"direction_id" text NULL,
	"name_id" text NULL,
	"ticker_id" text NULL,
	"price_id" MoneyValue NULL,
	"quantity_id" bigint NULL,
	"order_amount_id" MoneyValue NULL,
	"aci_value_id" Quotation NULL,
	"total_order_amount_id" MoneyValue NULL,
	"broker_commission_id" MoneyValue NULL,
	"exchange_commission_id" MoneyValue NULL,
	"exchange_clearing_commission_id" MoneyValue NULL,
	"repo_rate_id" Quotation NULL,
	"party_id" text NULL,
	"clear_value_date" timestamptz NULL,
	"sec_value_date" timestamptz NULL,
	"broker_status_id" text NULL,
	"separate_agreement_type_id" text NULL,
	"separate_agreement_number_id" text NULL,
	"separate_agreement_date_id" text NULL,
	"delivery_type_id" text NULL
);
	CREATE INDEX BrokerReport_trade_id_idx ON public.BrokerReport USING btree (trade_id);
	CREATE INDEX BrokerReport_order_id_idx ON public.BrokerReport USING btree (order_id);
	CREATE INDEX BrokerReport_figi_id_idx ON public.BrokerReport USING btree (figi_id);
	CREATE INDEX BrokerReport_execute_sign_id_idx ON public.BrokerReport USING btree (execute_sign_id);
	CREATE INDEX BrokerReport_exchange_id_idx ON public.BrokerReport USING btree (exchange_id);
	CREATE INDEX BrokerReport_class_code_id_idx ON public.BrokerReport USING btree (class_code_id);
	CREATE INDEX BrokerReport_direction_id_idx ON public.BrokerReport USING btree (direction_id);
	CREATE INDEX BrokerReport_name_id_idx ON public.BrokerReport USING btree (name_id);
	CREATE INDEX BrokerReport_ticker_id_idx ON public.BrokerReport USING btree (ticker_id);
	CREATE INDEX BrokerReport_price_id_idx ON public.BrokerReport USING btree (price_id);
	CREATE INDEX BrokerReport_quantity_id_idx ON public.BrokerReport USING btree (quantity_id);
	CREATE INDEX BrokerReport_order_amount_id_idx ON public.BrokerReport USING btree (order_amount_id);
	CREATE INDEX BrokerReport_aci_value_id_idx ON public.BrokerReport USING btree (aci_value_id);
	CREATE INDEX BrokerReport_total_order_amount_id_idx ON public.BrokerReport USING btree (total_order_amount_id);
	CREATE INDEX BrokerReport_broker_commission_id_idx ON public.BrokerReport USING btree (broker_commission_id);
	CREATE INDEX BrokerReport_exchange_commission_id_idx ON public.BrokerReport USING btree (exchange_commission_id);
	CREATE INDEX BrokerReport_exchange_clearing_commission_id_idx ON public.BrokerReport USING btree (exchange_clearing_commission_id);
	CREATE INDEX BrokerReport_repo_rate_id_idx ON public.BrokerReport USING btree (repo_rate_id);
	CREATE INDEX BrokerReport_party_id_idx ON public.BrokerReport USING btree (party_id);
	CREATE INDEX BrokerReport_broker_status_id_idx ON public.BrokerReport USING btree (broker_status_id);
	CREATE INDEX BrokerReport_separate_agreement_type_id_idx ON public.BrokerReport USING btree (separate_agreement_type_id);
	CREATE INDEX BrokerReport_separate_agreement_number_id_idx ON public.BrokerReport USING btree (separate_agreement_number_id);
	CREATE INDEX BrokerReport_separate_agreement_date_id_idx ON public.BrokerReport USING btree (separate_agreement_date_id);
	CREATE INDEX BrokerReport_delivery_type_id_idx ON public.BrokerReport USING btree (delivery_type_id);
	COMMENT ON TABLE "public"."BrokerReport" IS '';
	COMMENT ON COLUMN "public"."BrokerReport"."trade_id" IS 'Номер сделки.';
	COMMENT ON COLUMN "public"."BrokerReport"."order_id" IS 'Номер поручения.';
	COMMENT ON COLUMN "public"."BrokerReport"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."BrokerReport"."execute_sign_id" IS 'Признак исполнения.';
	COMMENT ON COLUMN "public"."BrokerReport"."trade_datetime" IS 'Дата и время заключения в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."BrokerReport"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."BrokerReport"."class_code_id" IS 'Режим торгов.';
	COMMENT ON COLUMN "public"."BrokerReport"."direction_id" IS 'Вид сделки.';
	COMMENT ON COLUMN "public"."BrokerReport"."name_id" IS 'Сокращённое наименование актива.';
	COMMENT ON COLUMN "public"."BrokerReport"."ticker_id" IS 'Код актива.';
	COMMENT ON COLUMN "public"."BrokerReport"."price_id" IS 'Цена за единицу.';
	COMMENT ON COLUMN "public"."BrokerReport"."quantity_id" IS 'Количество.';
	COMMENT ON COLUMN "public"."BrokerReport"."order_amount_id" IS 'Сумма (без НКД).';
	COMMENT ON COLUMN "public"."BrokerReport"."aci_value_id" IS 'НКД.';
	COMMENT ON COLUMN "public"."BrokerReport"."total_order_amount_id" IS 'Сумма сделки.';
	COMMENT ON COLUMN "public"."BrokerReport"."broker_commission_id" IS 'Комиссия брокера.';
	COMMENT ON COLUMN "public"."BrokerReport"."exchange_commission_id" IS 'Комиссия биржи.';
	COMMENT ON COLUMN "public"."BrokerReport"."exchange_clearing_commission_id" IS 'Комиссия клир. центра.';
	COMMENT ON COLUMN "public"."BrokerReport"."repo_rate_id" IS 'Ставка РЕПО (%).';
	COMMENT ON COLUMN "public"."BrokerReport"."party_id" IS 'Контрагент/Брокер.';
	COMMENT ON COLUMN "public"."BrokerReport"."clear_value_date" IS 'Дата расчётов в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."BrokerReport"."sec_value_date" IS 'Дата поставки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."BrokerReport"."broker_status_id" IS 'Статус брокера.';
	COMMENT ON COLUMN "public"."BrokerReport"."separate_agreement_type_id" IS 'Тип дог.';
	COMMENT ON COLUMN "public"."BrokerReport"."separate_agreement_number_id" IS 'Номер дог.';
	COMMENT ON COLUMN "public"."BrokerReport"."separate_agreement_date_id" IS 'Дата дог.';
	COMMENT ON COLUMN "public"."BrokerReport"."delivery_type_id" IS 'Тип расчёта по сделке.';




CREATE TABLE "public"."CancelOrderRequest" (
	"account_id" text NULL,
	"order_id" text NULL
);
	CREATE INDEX CancelOrderRequest_account_id_idx ON public.CancelOrderRequest USING btree (account_id);
	CREATE INDEX CancelOrderRequest_order_id_idx ON public.CancelOrderRequest USING btree (order_id);
	COMMENT ON TABLE "public"."CancelOrderRequest" IS 'Запрос отмены торгового поручения.';
	COMMENT ON COLUMN "public"."CancelOrderRequest"."account_id" IS 'Номер счёта.';
	COMMENT ON COLUMN "public"."CancelOrderRequest"."order_id" IS 'Идентификатор заявки.';



CREATE TABLE "public"."CancelStopOrderRequest" (
	"account_id" text NULL,
	"stop_order_id" text NULL
);
	CREATE INDEX CancelStopOrderRequest_account_id_idx ON public.CancelStopOrderRequest USING btree (account_id);
	CREATE INDEX CancelStopOrderRequest_stop_order_id_idx ON public.CancelStopOrderRequest USING btree (stop_order_id);
	COMMENT ON TABLE "public"."CancelStopOrderRequest" IS 'Запрос отмены выставленной стоп-заявки.';
	COMMENT ON COLUMN "public"."CancelStopOrderRequest"."account_id" IS 'Идентификатор счёта клиента.';
	COMMENT ON COLUMN "public"."CancelStopOrderRequest"."stop_order_id" IS 'Уникальный идентификатор стоп-заявки.';



CREATE TABLE "public"."Candle" (
	"figi_id" text NULL,
	"interval_id" SubscriptionInterval NULL,
	"open_id" Quotation NULL,
	"high_id" Quotation NULL,
	"low_id" Quotation NULL,
	"close_id" Quotation NULL,
	"volume_id" bigint NULL,
	"time" timestamptz NULL,
	"last_trade_ts" timestamptz NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX Candle_figi_id_idx ON public.Candle USING btree (figi_id);
	CREATE INDEX Candle_interval_id_idx ON public.Candle USING btree (interval_id);
	CREATE INDEX Candle_open_id_idx ON public.Candle USING btree (open_id);
	CREATE INDEX Candle_high_id_idx ON public.Candle USING btree (high_id);
	CREATE INDEX Candle_low_id_idx ON public.Candle USING btree (low_id);
	CREATE INDEX Candle_close_id_idx ON public.Candle USING btree (close_id);
	CREATE INDEX Candle_volume_id_idx ON public.Candle USING btree (volume_id);
	CREATE INDEX Candle_instrument_uid_id_idx ON public.Candle USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."Candle" IS 'Пакет свечей в рамках стрима.';
	COMMENT ON COLUMN "public"."Candle"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Candle"."interval_id" IS 'Интервал свечи.';
	COMMENT ON COLUMN "public"."Candle"."open_id" IS 'Цена открытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Candle"."high_id" IS 'Максимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Candle"."low_id" IS 'Минимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Candle"."close_id" IS 'Цена закрытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Candle"."volume_id" IS 'Объём сделок в лотах.';
	COMMENT ON COLUMN "public"."Candle"."time" IS 'Время начала интервала свечи в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Candle"."last_trade_ts" IS 'Время последней сделки, вошедшей в свечу в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Candle"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."CandleInstrument" (
	"figi_id" text NULL,
	"interval_id" SubscriptionInterval NULL,
	"instrument_id" text NULL
);
	CREATE INDEX CandleInstrument_figi_id_idx ON public.CandleInstrument USING btree (figi_id);
	CREATE INDEX CandleInstrument_interval_id_idx ON public.CandleInstrument USING btree (interval_id);
	CREATE INDEX CandleInstrument_instrument_id_idx ON public.CandleInstrument USING btree (instrument_id);
	COMMENT ON TABLE "public"."CandleInstrument" IS 'Запрос изменения статус подписки на свечи.';
	COMMENT ON COLUMN "public"."CandleInstrument"."figi_id" IS ' Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."CandleInstrument"."interval_id" IS 'Интервал свечей.';
	COMMENT ON COLUMN "public"."CandleInstrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';


CREATE TABLE "public"."CandleSubscription" (
	"figi_id" text NULL,
	"interval_id" SubscriptionInterval NULL,
	"subscription_status_id" SubscriptionStatus NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX CandleSubscription_figi_id_idx ON public.CandleSubscription USING btree (figi_id);
	CREATE INDEX CandleSubscription_interval_id_idx ON public.CandleSubscription USING btree (interval_id);
	CREATE INDEX CandleSubscription_subscription_status_id_idx ON public.CandleSubscription USING btree (subscription_status_id);
	CREATE INDEX CandleSubscription_instrument_uid_id_idx ON public.CandleSubscription USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."CandleSubscription" IS 'Статус подписки на свечи.';
	COMMENT ON COLUMN "public"."CandleSubscription"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."CandleSubscription"."interval_id" IS 'Интервал свечей.';
	COMMENT ON COLUMN "public"."CandleSubscription"."subscription_status_id" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."CandleSubscription"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."CountryResponse" (
	"alfa_two_id" text NULL,
	"alfa_three_id" text NULL,
	"name_id" text NULL,
	"name_brief_id" text NULL
);
	CREATE INDEX CountryResponse_alfa_two_id_idx ON public.CountryResponse USING btree (alfa_two_id);
	CREATE INDEX CountryResponse_alfa_three_id_idx ON public.CountryResponse USING btree (alfa_three_id);
	CREATE INDEX CountryResponse_name_id_idx ON public.CountryResponse USING btree (name_id);
	CREATE INDEX CountryResponse_name_brief_id_idx ON public.CountryResponse USING btree (name_brief_id);
	COMMENT ON TABLE "public"."CountryResponse" IS 'Данные о стране.';
	COMMENT ON COLUMN "public"."CountryResponse"."alfa_two_id" IS 'Двухбуквенный код страны.';
	COMMENT ON COLUMN "public"."CountryResponse"."alfa_three_id" IS 'Трёхбуквенный код страны.';
	COMMENT ON COLUMN "public"."CountryResponse"."name_id" IS 'Наименование страны.';
	COMMENT ON COLUMN "public"."CountryResponse"."name_brief_id" IS 'Краткое наименование страны.';


CREATE TABLE "public"."Coupon" (
	"figi_id" text NULL,
	"coupon_date" timestamptz NULL,
	"coupon_number_id" bigint NULL,
	"fix_date" timestamptz NULL,
	"pay_one_bond_id" MoneyValue NULL,
	"coupon_type_id" CouponType NULL,
	"coupon_start_date" timestamptz NULL,
	"coupon_end_date" timestamptz NULL,
	"coupon_period_id" integer NULL
);
	CREATE INDEX Coupon_figi_id_idx ON public.Coupon USING btree (figi_id);
	CREATE INDEX Coupon_coupon_number_id_idx ON public.Coupon USING btree (coupon_number_id);
	CREATE INDEX Coupon_pay_one_bond_id_idx ON public.Coupon USING btree (pay_one_bond_id);
	CREATE INDEX Coupon_coupon_type_id_idx ON public.Coupon USING btree (coupon_type_id);
	CREATE INDEX Coupon_coupon_period_id_idx ON public.Coupon USING btree (coupon_period_id);
	COMMENT ON TABLE "public"."Coupon" IS 'Объект передачи информации о купоне облигации.';
	COMMENT ON COLUMN "public"."Coupon"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_date" IS 'Дата выплаты купона.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_number_id" IS 'Номер купона.';
	COMMENT ON COLUMN "public"."Coupon"."fix_date" IS '(Опционально) Дата фиксации реестра для выплаты купона.';
	COMMENT ON COLUMN "public"."Coupon"."pay_one_bond_id" IS 'Выплата на одну облигацию.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_type_id" IS 'Тип купона.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_start_date" IS 'Начало купонного периода.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_end_date" IS 'Окончание купонного периода.';
	COMMENT ON COLUMN "public"."Coupon"."coupon_period_id" IS 'Купонный период в днях.';



CREATE TABLE "public"."Currency" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"nominal_id" MoneyValue NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"iso_currency_name_id" text NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Currency_pk PRIMARY KEY (uid)
);
	CREATE INDEX Currency_figi_id_idx ON public.Currency USING btree (figi_id);
	CREATE INDEX Currency_ticker_id_idx ON public.Currency USING btree (ticker_id);
	CREATE INDEX Currency_class_code_id_idx ON public.Currency USING btree (class_code_id);
	CREATE INDEX Currency_isin_id_idx ON public.Currency USING btree (isin_id);
	CREATE INDEX Currency_lot_id_idx ON public.Currency USING btree (lot_id);
	CREATE INDEX Currency_currency_id_idx ON public.Currency USING btree (currency_id);
	CREATE INDEX Currency_klong_id_idx ON public.Currency USING btree (klong_id);
	CREATE INDEX Currency_kshort_id_idx ON public.Currency USING btree (kshort_id);
	CREATE INDEX Currency_dlong_id_idx ON public.Currency USING btree (dlong_id);
	CREATE INDEX Currency_dshort_id_idx ON public.Currency USING btree (dshort_id);
	CREATE INDEX Currency_dlong_min_id_idx ON public.Currency USING btree (dlong_min_id);
	CREATE INDEX Currency_dshort_min_id_idx ON public.Currency USING btree (dshort_min_id);
	CREATE INDEX Currency_short_enabled_flag_id_idx ON public.Currency USING btree (short_enabled_flag_id);
	CREATE INDEX Currency_name_id_idx ON public.Currency USING btree (name_id);
	CREATE INDEX Currency_exchange_id_idx ON public.Currency USING btree (exchange_id);
	CREATE INDEX Currency_nominal_id_idx ON public.Currency USING btree (nominal_id);
	CREATE INDEX Currency_country_of_risk_id_idx ON public.Currency USING btree (country_of_risk_id);
	CREATE INDEX Currency_country_of_risk_name_id_idx ON public.Currency USING btree (country_of_risk_name_id);
	CREATE INDEX Currency_trading_status_id_idx ON public.Currency USING btree (trading_status_id);
	CREATE INDEX Currency_otc_flag_id_idx ON public.Currency USING btree (otc_flag_id);
	CREATE INDEX Currency_buy_available_flag_id_idx ON public.Currency USING btree (buy_available_flag_id);
	CREATE INDEX Currency_sell_available_flag_id_idx ON public.Currency USING btree (sell_available_flag_id);
	CREATE INDEX Currency_iso_currency_name_id_idx ON public.Currency USING btree (iso_currency_name_id);
	CREATE INDEX Currency_min_price_increment_id_idx ON public.Currency USING btree (min_price_increment_id);
	CREATE INDEX Currency_api_trade_available_flag_id_idx ON public.Currency USING btree (api_trade_available_flag_id);
	CREATE INDEX Currency_uid_id_idx ON public.Currency USING btree (uid_id);
	CREATE INDEX Currency_real_exchange_id_idx ON public.Currency USING btree (real_exchange_id);
	CREATE INDEX Currency_position_uid_id_idx ON public.Currency USING btree (position_uid_id);
	CREATE INDEX Currency_for_iis_flag_id_idx ON public.Currency USING btree (for_iis_flag_id);
	CREATE INDEX Currency_for_qual_investor_flag_id_idx ON public.Currency USING btree (for_qual_investor_flag_id);
	CREATE INDEX Currency_weekend_flag_id_idx ON public.Currency USING btree (weekend_flag_id);
	CREATE INDEX Currency_blocked_tca_flag_id_idx ON public.Currency USING btree (blocked_tca_flag_id);
	COMMENT ON TABLE "public"."Currency" IS 'Объект передачи информации о валюте.';
	COMMENT ON COLUMN "public"."Currency"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Currency"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Currency"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."Currency"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Currency"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Currency"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Currency"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
	COMMENT ON COLUMN "public"."Currency"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
	COMMENT ON COLUMN "public"."Currency"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Currency"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Currency"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Currency"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Currency"."short_enabled_flag_id" IS 'Признак доступности для операций в шорт.';
	COMMENT ON COLUMN "public"."Currency"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Currency"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Currency"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."Currency"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Currency"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Currency"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Currency"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Currency"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Currency"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Currency"."iso_currency_name_id" IS 'Строковый ISO-код валюты.';
	COMMENT ON COLUMN "public"."Currency"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Currency"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Currency"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Currency"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Currency"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Currency"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Currency"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Currency"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
	COMMENT ON COLUMN "public"."Currency"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС.';
	COMMENT ON COLUMN "public"."Currency"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Currency"."first_1day_candle_date" IS 'Дата первой дневной свечи.';



CREATE TABLE "public"."Dividend" (
	"dividend_net_id" MoneyValue NULL,
	"payment_date" timestamptz NULL,
	"declared_date" timestamptz NULL,
	"last_buy_date" timestamptz NULL,
	"dividend_type_id" text NULL,
	"record_date" timestamptz NULL,
	"regularity_id" text NULL,
	"close_price_id" MoneyValue NULL,
	"yield_value_id" Quotation NULL,
	"created_at" timestamptz NULL
);
	CREATE INDEX Dividend_dividend_net_id_idx ON public.Dividend USING btree (dividend_net_id);
	CREATE INDEX Dividend_dividend_type_id_idx ON public.Dividend USING btree (dividend_type_id);
	CREATE INDEX Dividend_regularity_id_idx ON public.Dividend USING btree (regularity_id);
	CREATE INDEX Dividend_close_price_id_idx ON public.Dividend USING btree (close_price_id);
	CREATE INDEX Dividend_yield_value_id_idx ON public.Dividend USING btree (yield_value_id);
	COMMENT ON TABLE "public"."Dividend" IS 'Информация о выплате.';
	COMMENT ON COLUMN "public"."Dividend"."dividend_net_id" IS 'Величина дивиденда на 1 ценную бумагу (включая валюту).';
	COMMENT ON COLUMN "public"."Dividend"."payment_date" IS 'Дата фактических выплат в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Dividend"."declared_date" IS 'Дата объявления дивидендов в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Dividend"."last_buy_date" IS 'Последний день (включительно) покупки для получения выплаты в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Dividend"."dividend_type_id" IS 'Тип выплаты. Возможные значения: Regular Cash – регулярные выплаты, Cancelled – выплата отменена, Daily Accrual – ежедневное начисление, Return of Capital – возврат капитала, прочие типы выплат.';
	COMMENT ON COLUMN "public"."Dividend"."record_date" IS 'Дата фиксации реестра в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Dividend"."regularity_id" IS 'Регулярность выплаты. Возможные значения: Annual – ежегодная, Semi-Anl – каждые полгода, прочие типы выплат.';
	COMMENT ON COLUMN "public"."Dividend"."close_price_id" IS 'Цена закрытия инструмента на момент ex_dividend_date.';
	COMMENT ON COLUMN "public"."Dividend"."yield_value_id" IS 'Величина доходности.';
	COMMENT ON COLUMN "public"."Dividend"."created_at" IS 'Дата и время создания записи в часовом поясе UTC.';


CREATE TABLE "public"."DividendsForeignIssuerReport" (
	"record_date" timestamptz NULL,
	"payment_date" timestamptz NULL,
	"security_name_id" text NULL,
	"isin_id" text NULL,
	"issuer_country_id" text NULL,
	"quantity_id" bigint NULL,
	"dividend_id" Quotation NULL,
	"external_commission_id" Quotation NULL,
	"dividend_gross_id" Quotation NULL,
	"tax_id" Quotation NULL,
	"dividend_amount_id" Quotation NULL,
	"currency_id" text NULL
);
	CREATE INDEX DividendsForeignIssuerReport_security_name_id_idx ON public.DividendsForeignIssuerReport USING btree (security_name_id);
	CREATE INDEX DividendsForeignIssuerReport_isin_id_idx ON public.DividendsForeignIssuerReport USING btree (isin_id);
	CREATE INDEX DividendsForeignIssuerReport_issuer_country_id_idx ON public.DividendsForeignIssuerReport USING btree (issuer_country_id);
	CREATE INDEX DividendsForeignIssuerReport_quantity_id_idx ON public.DividendsForeignIssuerReport USING btree (quantity_id);
	CREATE INDEX DividendsForeignIssuerReport_dividend_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_id);
	CREATE INDEX DividendsForeignIssuerReport_external_commission_id_idx ON public.DividendsForeignIssuerReport USING btree (external_commission_id);
	CREATE INDEX DividendsForeignIssuerReport_dividend_gross_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_gross_id);
	CREATE INDEX DividendsForeignIssuerReport_tax_id_idx ON public.DividendsForeignIssuerReport USING btree (tax_id);
	CREATE INDEX DividendsForeignIssuerReport_dividend_amount_id_idx ON public.DividendsForeignIssuerReport USING btree (dividend_amount_id);
	CREATE INDEX DividendsForeignIssuerReport_currency_id_idx ON public.DividendsForeignIssuerReport USING btree (currency_id);
	COMMENT ON TABLE "public"."DividendsForeignIssuerReport" IS ' Отчёт "Справка о доходах за пределами РФ".';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."record_date" IS 'Дата фиксации реестра.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."payment_date" IS 'Дата выплаты.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."security_name_id" IS 'Наименование ценной бумаги.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."isin_id" IS 'ISIN-идентификатор ценной бумаги.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."issuer_country_id" IS 'Страна эмитента. Для депозитарных расписок указывается страна эмитента базового актива.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."quantity_id" IS 'Количество ценных бумаг.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_id" IS 'Выплаты на одну бумагу';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."external_commission_id" IS 'Комиссия внешних платёжных агентов.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_gross_id" IS 'Сумма до удержания налога.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."tax_id" IS 'Сумма налога, удержанного агентом.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."dividend_amount_id" IS 'Итоговая сумма выплаты.';
	COMMENT ON COLUMN "public"."DividendsForeignIssuerReport"."currency_id" IS 'Валюта.';


CREATE TABLE "public"."EditFavoritesRequest" (
	"instruments_id" EditFavoritesRequestInstrument NULL,
	"action_type_id" EditFavoritesActionType NULL
);
	CREATE INDEX EditFavoritesRequest_instruments_id_idx ON public.EditFavoritesRequest USING btree (instruments_id);
	CREATE INDEX EditFavoritesRequest_action_type_id_idx ON public.EditFavoritesRequest USING btree (action_type_id);
	COMMENT ON TABLE "public"."EditFavoritesRequest" IS 'Запрос редактирования списка избранных инструментов.';
	COMMENT ON COLUMN "public"."EditFavoritesRequest"."instruments_id" IS 'Массив инструментов.';
	COMMENT ON COLUMN "public"."EditFavoritesRequest"."action_type_id" IS 'Тип действия со списком.';




CREATE TABLE "public"."Etf" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"fixed_commission_id" Quotation NULL,
	"focus_type_id" text NULL,
	"released_date" timestamptz NULL,
	"num_shares_id" Quotation NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"sector_id" text NULL,
	"rebalancing_freq_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"liquidity_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Etf_pk PRIMARY KEY (uid)
);
	CREATE INDEX Etf_figi_id_idx ON public.Etf USING btree (figi_id);
	CREATE INDEX Etf_ticker_id_idx ON public.Etf USING btree (ticker_id);
	CREATE INDEX Etf_class_code_id_idx ON public.Etf USING btree (class_code_id);
	CREATE INDEX Etf_isin_id_idx ON public.Etf USING btree (isin_id);
	CREATE INDEX Etf_lot_id_idx ON public.Etf USING btree (lot_id);
	CREATE INDEX Etf_currency_id_idx ON public.Etf USING btree (currency_id);
	CREATE INDEX Etf_klong_id_idx ON public.Etf USING btree (klong_id);
	CREATE INDEX Etf_kshort_id_idx ON public.Etf USING btree (kshort_id);
	CREATE INDEX Etf_dlong_id_idx ON public.Etf USING btree (dlong_id);
	CREATE INDEX Etf_dshort_id_idx ON public.Etf USING btree (dshort_id);
	CREATE INDEX Etf_dlong_min_id_idx ON public.Etf USING btree (dlong_min_id);
	CREATE INDEX Etf_dshort_min_id_idx ON public.Etf USING btree (dshort_min_id);
	CREATE INDEX Etf_short_enabled_flag_id_idx ON public.Etf USING btree (short_enabled_flag_id);
	CREATE INDEX Etf_name_id_idx ON public.Etf USING btree (name_id);
	CREATE INDEX Etf_exchange_id_idx ON public.Etf USING btree (exchange_id);
	CREATE INDEX Etf_fixed_commission_id_idx ON public.Etf USING btree (fixed_commission_id);
	CREATE INDEX Etf_focus_type_id_idx ON public.Etf USING btree (focus_type_id);
	CREATE INDEX Etf_num_shares_id_idx ON public.Etf USING btree (num_shares_id);
	CREATE INDEX Etf_country_of_risk_id_idx ON public.Etf USING btree (country_of_risk_id);
	CREATE INDEX Etf_country_of_risk_name_id_idx ON public.Etf USING btree (country_of_risk_name_id);
	CREATE INDEX Etf_sector_id_idx ON public.Etf USING btree (sector_id);
	CREATE INDEX Etf_rebalancing_freq_id_idx ON public.Etf USING btree (rebalancing_freq_id);
	CREATE INDEX Etf_trading_status_id_idx ON public.Etf USING btree (trading_status_id);
	CREATE INDEX Etf_otc_flag_id_idx ON public.Etf USING btree (otc_flag_id);
	CREATE INDEX Etf_buy_available_flag_id_idx ON public.Etf USING btree (buy_available_flag_id);
	CREATE INDEX Etf_sell_available_flag_id_idx ON public.Etf USING btree (sell_available_flag_id);
	CREATE INDEX Etf_min_price_increment_id_idx ON public.Etf USING btree (min_price_increment_id);
	CREATE INDEX Etf_api_trade_available_flag_id_idx ON public.Etf USING btree (api_trade_available_flag_id);
	CREATE INDEX Etf_uid_id_idx ON public.Etf USING btree (uid_id);
	CREATE INDEX Etf_real_exchange_id_idx ON public.Etf USING btree (real_exchange_id);
	CREATE INDEX Etf_position_uid_id_idx ON public.Etf USING btree (position_uid_id);
	CREATE INDEX Etf_for_iis_flag_id_idx ON public.Etf USING btree (for_iis_flag_id);
	CREATE INDEX Etf_for_qual_investor_flag_id_idx ON public.Etf USING btree (for_qual_investor_flag_id);
	CREATE INDEX Etf_weekend_flag_id_idx ON public.Etf USING btree (weekend_flag_id);
	CREATE INDEX Etf_blocked_tca_flag_id_idx ON public.Etf USING btree (blocked_tca_flag_id);
	CREATE INDEX Etf_liquidity_flag_id_idx ON public.Etf USING btree (liquidity_flag_id);
	COMMENT ON TABLE "public"."Etf" IS 'Объект передачи информации об инвестиционном фонде.';
	COMMENT ON COLUMN "public"."Etf"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Etf"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Etf"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."Etf"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Etf"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Etf"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Etf"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
	COMMENT ON COLUMN "public"."Etf"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
	COMMENT ON COLUMN "public"."Etf"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Etf"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Etf"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Etf"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Etf"."short_enabled_flag_id" IS 'Признак доступности для операций в шорт.';
	COMMENT ON COLUMN "public"."Etf"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Etf"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Etf"."fixed_commission_id" IS 'Размер фиксированной комиссии фонда.';
	COMMENT ON COLUMN "public"."Etf"."focus_type_id" IS 'Возможные значения: </br>**equity** — акции;</br>**fixed_income** — облигации;</br>**mixed_allocation** — смешанный;</br>**money_market** — денежный рынок;</br>**real_estate** — недвижимость;</br>**commodity** — товары;</br>**specialty** — специальный;</br>**private_equity** — private equity;</br>**alternative_investment** — альтернативные инвестиции.';
	COMMENT ON COLUMN "public"."Etf"."released_date" IS 'Дата выпуска в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Etf"."num_shares_id" IS 'Количество акций фонда в обращении.';
	COMMENT ON COLUMN "public"."Etf"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Etf"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Etf"."sector_id" IS 'Сектор экономики.';
	COMMENT ON COLUMN "public"."Etf"."rebalancing_freq_id" IS 'Частота ребалансировки.';
	COMMENT ON COLUMN "public"."Etf"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Etf"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Etf"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Etf"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Etf"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Etf"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Etf"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Etf"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Etf"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Etf"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Etf"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Etf"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
	COMMENT ON COLUMN "public"."Etf"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС.';
	COMMENT ON COLUMN "public"."Etf"."liquidity_flag_id" IS 'Флаг достаточной ликвидности';
	COMMENT ON COLUMN "public"."Etf"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Etf"."first_1day_candle_date" IS 'Дата первой дневной свечи.';




CREATE TABLE "public"."FavoriteInstrument" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"instrument_type_id" text NULL,
	"otc_flag_id" bool NULL,
	"api_trade_available_flag_id" bool NULL,
	"instrument_kind_id" InstrumentType NULL
);
	CREATE INDEX FavoriteInstrument_figi_id_idx ON public.FavoriteInstrument USING btree (figi_id);
	CREATE INDEX FavoriteInstrument_ticker_id_idx ON public.FavoriteInstrument USING btree (ticker_id);
	CREATE INDEX FavoriteInstrument_class_code_id_idx ON public.FavoriteInstrument USING btree (class_code_id);
	CREATE INDEX FavoriteInstrument_isin_id_idx ON public.FavoriteInstrument USING btree (isin_id);
	CREATE INDEX FavoriteInstrument_instrument_type_id_idx ON public.FavoriteInstrument USING btree (instrument_type_id);
	CREATE INDEX FavoriteInstrument_otc_flag_id_idx ON public.FavoriteInstrument USING btree (otc_flag_id);
	CREATE INDEX FavoriteInstrument_api_trade_available_flag_id_idx ON public.FavoriteInstrument USING btree (api_trade_available_flag_id);
	CREATE INDEX FavoriteInstrument_instrument_kind_id_idx ON public.FavoriteInstrument USING btree (instrument_kind_id);
	COMMENT ON TABLE "public"."FavoriteInstrument" IS 'Массив избранных инструментов.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."class_code_id" IS 'Класс-код инструмента.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."FavoriteInstrument"."instrument_kind_id" IS 'Тип инструмента.';


CREATE TABLE "public"."FilterOptionsRequest" (
	"basic_asset_uid_id" text NULL,
	"basic_asset_position_uid_id" text NULL
);
	CREATE INDEX FilterOptionsRequest_basic_asset_uid_id_idx ON public.FilterOptionsRequest USING btree (basic_asset_uid_id);
	CREATE INDEX FilterOptionsRequest_basic_asset_position_uid_id_idx ON public.FilterOptionsRequest USING btree (basic_asset_position_uid_id);
	COMMENT ON TABLE "public"."FilterOptionsRequest" IS 'Параметры фильтрации опционов';
	COMMENT ON COLUMN "public"."FilterOptionsRequest"."basic_asset_uid_id" IS 'Идентификатор базового актива опциона.  Обязательный параметр.';
	COMMENT ON COLUMN "public"."FilterOptionsRequest"."basic_asset_position_uid_id" IS 'Идентификатор позиции базового актива опциона';


CREATE TABLE "public"."FindInstrumentRequest" (
	"query_id" text NULL,
	"instrument_kind_id" InstrumentType NULL,
	"api_trade_available_flag_id" bool NULL
);
	CREATE INDEX FindInstrumentRequest_query_id_idx ON public.FindInstrumentRequest USING btree (query_id);
	CREATE INDEX FindInstrumentRequest_instrument_kind_id_idx ON public.FindInstrumentRequest USING btree (instrument_kind_id);
	CREATE INDEX FindInstrumentRequest_api_trade_available_flag_id_idx ON public.FindInstrumentRequest USING btree (api_trade_available_flag_id);
	COMMENT ON TABLE "public"."FindInstrumentRequest" IS 'Запрос на поиск инструментов.';
	COMMENT ON COLUMN "public"."FindInstrumentRequest"."query_id" IS 'Строка поиска.';
	COMMENT ON COLUMN "public"."FindInstrumentRequest"."instrument_kind_id" IS 'Фильтр по типу инструмента.';
	COMMENT ON COLUMN "public"."FindInstrumentRequest"."api_trade_available_flag_id" IS 'Фильтр для отображения только торговых инструментов.';



CREATE TABLE "public"."Future" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"first_trade_date" timestamptz NULL,
	"last_trade_date" timestamptz NULL,
	"futures_type_id" text NULL,
	"asset_type_id" text NULL,
	"basic_asset_id" text NULL,
	"basic_asset_size_id" Quotation NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"sector_id" text NULL,
	"expiration_date" timestamptz NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"basic_asset_position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Future_pk PRIMARY KEY (uid)
);
	CREATE INDEX Future_figi_id_idx ON public.Future USING btree (figi_id);
	CREATE INDEX Future_ticker_id_idx ON public.Future USING btree (ticker_id);
	CREATE INDEX Future_class_code_id_idx ON public.Future USING btree (class_code_id);
	CREATE INDEX Future_lot_id_idx ON public.Future USING btree (lot_id);
	CREATE INDEX Future_currency_id_idx ON public.Future USING btree (currency_id);
	CREATE INDEX Future_klong_id_idx ON public.Future USING btree (klong_id);
	CREATE INDEX Future_kshort_id_idx ON public.Future USING btree (kshort_id);
	CREATE INDEX Future_dlong_id_idx ON public.Future USING btree (dlong_id);
	CREATE INDEX Future_dshort_id_idx ON public.Future USING btree (dshort_id);
	CREATE INDEX Future_dlong_min_id_idx ON public.Future USING btree (dlong_min_id);
	CREATE INDEX Future_dshort_min_id_idx ON public.Future USING btree (dshort_min_id);
	CREATE INDEX Future_short_enabled_flag_id_idx ON public.Future USING btree (short_enabled_flag_id);
	CREATE INDEX Future_name_id_idx ON public.Future USING btree (name_id);
	CREATE INDEX Future_exchange_id_idx ON public.Future USING btree (exchange_id);
	CREATE INDEX Future_futures_type_id_idx ON public.Future USING btree (futures_type_id);
	CREATE INDEX Future_asset_type_id_idx ON public.Future USING btree (asset_type_id);
	CREATE INDEX Future_basic_asset_id_idx ON public.Future USING btree (basic_asset_id);
	CREATE INDEX Future_basic_asset_size_id_idx ON public.Future USING btree (basic_asset_size_id);
	CREATE INDEX Future_country_of_risk_id_idx ON public.Future USING btree (country_of_risk_id);
	CREATE INDEX Future_country_of_risk_name_id_idx ON public.Future USING btree (country_of_risk_name_id);
	CREATE INDEX Future_sector_id_idx ON public.Future USING btree (sector_id);
	CREATE INDEX Future_trading_status_id_idx ON public.Future USING btree (trading_status_id);
	CREATE INDEX Future_otc_flag_id_idx ON public.Future USING btree (otc_flag_id);
	CREATE INDEX Future_buy_available_flag_id_idx ON public.Future USING btree (buy_available_flag_id);
	CREATE INDEX Future_sell_available_flag_id_idx ON public.Future USING btree (sell_available_flag_id);
	CREATE INDEX Future_min_price_increment_id_idx ON public.Future USING btree (min_price_increment_id);
	CREATE INDEX Future_api_trade_available_flag_id_idx ON public.Future USING btree (api_trade_available_flag_id);
	CREATE INDEX Future_uid_id_idx ON public.Future USING btree (uid_id);
	CREATE INDEX Future_real_exchange_id_idx ON public.Future USING btree (real_exchange_id);
	CREATE INDEX Future_position_uid_id_idx ON public.Future USING btree (position_uid_id);
	CREATE INDEX Future_basic_asset_position_uid_id_idx ON public.Future USING btree (basic_asset_position_uid_id);
	CREATE INDEX Future_for_iis_flag_id_idx ON public.Future USING btree (for_iis_flag_id);
	CREATE INDEX Future_for_qual_investor_flag_id_idx ON public.Future USING btree (for_qual_investor_flag_id);
	CREATE INDEX Future_weekend_flag_id_idx ON public.Future USING btree (weekend_flag_id);
	CREATE INDEX Future_blocked_tca_flag_id_idx ON public.Future USING btree (blocked_tca_flag_id);
	COMMENT ON TABLE "public"."Future" IS 'Объект передачи информации о фьючерсе.';
	COMMENT ON COLUMN "public"."Future"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Future"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Future"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."Future"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Future"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Future"."klong_id" IS 'Коэффициент ставки риска длинной позиции по клиенту.';
	COMMENT ON COLUMN "public"."Future"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по клиенту.';
	COMMENT ON COLUMN "public"."Future"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Future"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Future"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Future"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Future"."short_enabled_flag_id" IS 'Признак доступности для операций шорт.';
	COMMENT ON COLUMN "public"."Future"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Future"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Future"."first_trade_date" IS 'Дата начала обращения контракта в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Future"."last_trade_date" IS 'Дата в часовом поясе UTC, до которой возможно проведение операций с фьючерсом.';
	COMMENT ON COLUMN "public"."Future"."futures_type_id" IS 'Тип фьючерса. Возможные значения: </br>**physical_delivery** — физические поставки; </br>**cash_settlement** — денежный эквивалент.';
	COMMENT ON COLUMN "public"."Future"."asset_type_id" IS 'Тип актива. Возможные значения: </br>**commodity** — товар; </br>**currency** — валюта; </br>**security** — ценная бумага; </br>**index** — индекс.';
	COMMENT ON COLUMN "public"."Future"."basic_asset_id" IS 'Основной актив.';
	COMMENT ON COLUMN "public"."Future"."basic_asset_size_id" IS 'Размер основного актива.';
	COMMENT ON COLUMN "public"."Future"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Future"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Future"."sector_id" IS 'Сектор экономики.';
	COMMENT ON COLUMN "public"."Future"."expiration_date" IS 'Дата истечения срока в часов поясе UTC.';
	COMMENT ON COLUMN "public"."Future"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Future"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Future"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Future"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Future"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Future"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Future"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Future"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Future"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Future"."basic_asset_position_uid_id" IS 'Уникальный идентификатор позиции основного инструмента.';
	COMMENT ON COLUMN "public"."Future"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Future"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Future"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
	COMMENT ON COLUMN "public"."Future"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС.';
	COMMENT ON COLUMN "public"."Future"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Future"."first_1day_candle_date" IS 'Дата первой дневной свечи.';




CREATE TABLE "public"."GenerateBrokerReportRequest" (
	"account_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX GenerateBrokerReportRequest_account_id_idx ON public.GenerateBrokerReportRequest USING btree (account_id);
	COMMENT ON TABLE "public"."GenerateBrokerReportRequest" IS '';
	COMMENT ON COLUMN "public"."GenerateBrokerReportRequest"."account_id" IS 'Идентификатор счёта клиента.';
	COMMENT ON COLUMN "public"."GenerateBrokerReportRequest"."from" IS 'Начало периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GenerateBrokerReportRequest"."to" IS 'Окончание периода в часовом поясе UTC.';



CREATE TABLE "public"."GenerateDividendsForeignIssuerReportRequest" (
	"account_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX GenerateDividendsForeignIssuerReportRequest_account_id_idx ON public.GenerateDividendsForeignIssuerReportRequest USING btree (account_id);
	COMMENT ON TABLE "public"."GenerateDividendsForeignIssuerReportRequest" IS 'Объект запроса формирования отчёта "Справка о доходах за пределами РФ".';
	COMMENT ON COLUMN "public"."GenerateDividendsForeignIssuerReportRequest"."account_id" IS 'Идентификатор счёта клиента.';
	COMMENT ON COLUMN "public"."GenerateDividendsForeignIssuerReportRequest"."from" IS 'Начало периода (по UTC).';
	COMMENT ON COLUMN "public"."GenerateDividendsForeignIssuerReportRequest"."to" IS 'Окончание периода (по UTC).';





CREATE TABLE "public"."GetAccruedInterestsRequest" (
	"figi_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX GetAccruedInterestsRequest_figi_id_idx ON public.GetAccruedInterestsRequest USING btree (figi_id);
	COMMENT ON TABLE "public"."GetAccruedInterestsRequest" IS 'Запрос НКД по облигации';
	COMMENT ON COLUMN "public"."GetAccruedInterestsRequest"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."GetAccruedInterestsRequest"."from" IS 'Начало запрашиваемого периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GetAccruedInterestsRequest"."to" IS 'Окончание запрашиваемого периода в часовом поясе UTC.';



CREATE TABLE "public"."GetBondCouponsRequest" (
	"figi_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX GetBondCouponsRequest_figi_id_idx ON public.GetBondCouponsRequest USING btree (figi_id);
	COMMENT ON TABLE "public"."GetBondCouponsRequest" IS 'Запрос купонов по облигации.';
	COMMENT ON COLUMN "public"."GetBondCouponsRequest"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."GetBondCouponsRequest"."from" IS 'Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по coupon_date (дата выплаты купона)';
	COMMENT ON COLUMN "public"."GetBondCouponsRequest"."to" IS 'Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по coupon_date (дата выплаты купона)';






CREATE TABLE "public"."GetBrokerReportRequest" (
	"task_id" text NULL,
	"page_id" integer NULL
);
	CREATE INDEX GetBrokerReportRequest_task_id_idx ON public.GetBrokerReportRequest USING btree (task_id);
	CREATE INDEX GetBrokerReportRequest_page_id_idx ON public.GetBrokerReportRequest USING btree (page_id);
	COMMENT ON TABLE "public"."GetBrokerReportRequest" IS '';
	COMMENT ON COLUMN "public"."GetBrokerReportRequest"."task_id" IS 'Идентификатор задачи формирования брокерского отчёта.';
	COMMENT ON COLUMN "public"."GetBrokerReportRequest"."page_id" IS 'Номер страницы отчета (начинается с 1), значение по умолчанию: 0.';


CREATE TABLE "public"."GetBrokerReportResponse" (
	"broker_report_id" BrokerReport NULL,
	"itemsCount_id" integer NULL,
	"pagesCount_id" integer NULL,
	"page_id" integer NULL
);
	CREATE INDEX GetBrokerReportResponse_broker_report_id_idx ON public.GetBrokerReportResponse USING btree (broker_report_id);
	CREATE INDEX GetBrokerReportResponse_itemsCount_id_idx ON public.GetBrokerReportResponse USING btree (itemsCount_id);
	CREATE INDEX GetBrokerReportResponse_pagesCount_id_idx ON public.GetBrokerReportResponse USING btree (pagesCount_id);
	CREATE INDEX GetBrokerReportResponse_page_id_idx ON public.GetBrokerReportResponse USING btree (page_id);
	COMMENT ON TABLE "public"."GetBrokerReportResponse" IS '';
	COMMENT ON COLUMN "public"."GetBrokerReportResponse"."broker_report_id" IS '';
	COMMENT ON COLUMN "public"."GetBrokerReportResponse"."itemsCount_id" IS 'Количество записей в отчете.';
	COMMENT ON COLUMN "public"."GetBrokerReportResponse"."pagesCount_id" IS 'Количество страниц с данными отчета (начинается с 0).';
	COMMENT ON COLUMN "public"."GetBrokerReportResponse"."page_id" IS 'Текущая страница (начинается с 0).';


CREATE TABLE "public"."GetCandlesRequest" (
	"figi_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL,
	"interval_id" CandleInterval NULL,
	"instrument_id" text NULL
);
	CREATE INDEX GetCandlesRequest_figi_id_idx ON public.GetCandlesRequest USING btree (figi_id);
	CREATE INDEX GetCandlesRequest_interval_id_idx ON public.GetCandlesRequest USING btree (interval_id);
	CREATE INDEX GetCandlesRequest_instrument_id_idx ON public.GetCandlesRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."GetCandlesRequest" IS 'Запрос исторических свечей.';
	COMMENT ON COLUMN "public"."GetCandlesRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."GetCandlesRequest"."from" IS 'Начало запрашиваемого периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GetCandlesRequest"."to" IS 'Окончание запрашиваемого периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GetCandlesRequest"."interval_id" IS 'Интервал запрошенных свечей.';
	COMMENT ON COLUMN "public"."GetCandlesRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid.';







CREATE TABLE "public"."GetDividendsForeignIssuerReportRequest" (
	"task_id" text NULL,
	"page_id" integer NULL
);
	CREATE INDEX GetDividendsForeignIssuerReportRequest_task_id_idx ON public.GetDividendsForeignIssuerReportRequest USING btree (task_id);
	CREATE INDEX GetDividendsForeignIssuerReportRequest_page_id_idx ON public.GetDividendsForeignIssuerReportRequest USING btree (page_id);
	COMMENT ON TABLE "public"."GetDividendsForeignIssuerReportRequest" IS ' Объект запроса сформированного отчёта "Справка о доходах за пределами РФ".';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportRequest"."task_id" IS 'Идентификатор задачи формирования отчёта.';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportRequest"."page_id" IS 'Номер страницы отчета (начинается с 0), значение по умолчанию: 0.';


CREATE TABLE "public"."GetDividendsForeignIssuerReportResponse" (
	"dividends_foreign_issuer_report_id" DividendsForeignIssuerReport NULL,
	"itemsCount_id" integer NULL,
	"pagesCount_id" integer NULL,
	"page_id" integer NULL
);
	CREATE INDEX GetDividendsForeignIssuerReportResponse_dividends_foreign_issuer_report_id_idx ON public.GetDividendsForeignIssuerReportResponse USING btree (dividends_foreign_issuer_report_id);
	CREATE INDEX GetDividendsForeignIssuerReportResponse_itemsCount_id_idx ON public.GetDividendsForeignIssuerReportResponse USING btree (itemsCount_id);
	CREATE INDEX GetDividendsForeignIssuerReportResponse_pagesCount_id_idx ON public.GetDividendsForeignIssuerReportResponse USING btree (pagesCount_id);
	CREATE INDEX GetDividendsForeignIssuerReportResponse_page_id_idx ON public.GetDividendsForeignIssuerReportResponse USING btree (page_id);
	COMMENT ON TABLE "public"."GetDividendsForeignIssuerReportResponse" IS '';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportResponse"."dividends_foreign_issuer_report_id" IS '';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportResponse"."itemsCount_id" IS 'Количество записей в отчете.';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportResponse"."pagesCount_id" IS 'Количество страниц с данными отчета (начинается с 0).';
	COMMENT ON COLUMN "public"."GetDividendsForeignIssuerReportResponse"."page_id" IS 'Текущая страница (начинается с 0).';




CREATE TABLE "public"."GetDividendsRequest" (
	"figi_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX GetDividendsRequest_figi_id_idx ON public.GetDividendsRequest USING btree (figi_id);
	COMMENT ON TABLE "public"."GetDividendsRequest" IS 'Запрос дивидендов.';
	COMMENT ON COLUMN "public"."GetDividendsRequest"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."GetDividendsRequest"."from" IS 'Начало запрашиваемого периода в часовом поясе UTC. Фильтрация происходит по параметру *record_date* (дата фиксации реестра).';
	COMMENT ON COLUMN "public"."GetDividendsRequest"."to" IS 'Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация происходит по параметру *record_date* (дата фиксации реестра).';






CREATE TABLE "public"."GetFuturesMarginResponse" (
	"initial_margin_on_buy_id" MoneyValue NULL,
	"initial_margin_on_sell_id" MoneyValue NULL,
	"min_price_increment_id" Quotation NULL,
	"min_price_increment_amount_id" Quotation NULL
);
	CREATE INDEX GetFuturesMarginResponse_initial_margin_on_buy_id_idx ON public.GetFuturesMarginResponse USING btree (initial_margin_on_buy_id);
	CREATE INDEX GetFuturesMarginResponse_initial_margin_on_sell_id_idx ON public.GetFuturesMarginResponse USING btree (initial_margin_on_sell_id);
	CREATE INDEX GetFuturesMarginResponse_min_price_increment_id_idx ON public.GetFuturesMarginResponse USING btree (min_price_increment_id);
	CREATE INDEX GetFuturesMarginResponse_min_price_increment_amount_id_idx ON public.GetFuturesMarginResponse USING btree (min_price_increment_amount_id);
	COMMENT ON TABLE "public"."GetFuturesMarginResponse" IS 'Данные по фьючерсу';
	COMMENT ON COLUMN "public"."GetFuturesMarginResponse"."initial_margin_on_buy_id" IS 'Гарантийное обеспечение при покупке.';
	COMMENT ON COLUMN "public"."GetFuturesMarginResponse"."initial_margin_on_sell_id" IS 'Гарантийное обеспечение при продаже.';
	COMMENT ON COLUMN "public"."GetFuturesMarginResponse"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."GetFuturesMarginResponse"."min_price_increment_amount_id" IS 'Стоимость шага цены.';



CREATE TABLE "public"."GetInfoResponse" (
	"prem_status_id" bool NULL,
	"qual_status_id" bool NULL,
	"qualified_for_work_with_id" text NULL,
	"tariff_id" text NULL
);
	CREATE INDEX GetInfoResponse_prem_status_id_idx ON public.GetInfoResponse USING btree (prem_status_id);
	CREATE INDEX GetInfoResponse_qual_status_id_idx ON public.GetInfoResponse USING btree (qual_status_id);
	CREATE INDEX GetInfoResponse_qualified_for_work_with_id_idx ON public.GetInfoResponse USING btree (qualified_for_work_with_id);
	CREATE INDEX GetInfoResponse_tariff_id_idx ON public.GetInfoResponse USING btree (tariff_id);
	COMMENT ON TABLE "public"."GetInfoResponse" IS 'Информация о пользователе.';
	COMMENT ON COLUMN "public"."GetInfoResponse"."prem_status_id" IS 'Признак премиум клиента.';
	COMMENT ON COLUMN "public"."GetInfoResponse"."qual_status_id" IS 'Признак квалифицированного инвестора.';
	COMMENT ON COLUMN "public"."GetInfoResponse"."qualified_for_work_with_id" IS 'Набор требующих тестирования инструментов и возможностей, с которыми может работать пользователь. [Подробнее](https://tinkoff.github.io/investAPI/faq_users/).';
	COMMENT ON COLUMN "public"."GetInfoResponse"."tariff_id" IS 'Наименование тарифа пользователя.';


CREATE TABLE "public"."GetLastPricesRequest" (
	"figi_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX GetLastPricesRequest_figi_id_idx ON public.GetLastPricesRequest USING btree (figi_id);
	CREATE INDEX GetLastPricesRequest_instrument_id_idx ON public.GetLastPricesRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."GetLastPricesRequest" IS 'Запрос получения цен последних сделок.';
	COMMENT ON COLUMN "public"."GetLastPricesRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."GetLastPricesRequest"."instrument_id" IS 'Массив идентификаторов инструмента, принимает значения figi или instrument_uid.';



CREATE TABLE "public"."GetLastTradesRequest" (
	"figi_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL,
	"instrument_id" text NULL
);
	CREATE INDEX GetLastTradesRequest_figi_id_idx ON public.GetLastTradesRequest USING btree (figi_id);
	CREATE INDEX GetLastTradesRequest_instrument_id_idx ON public.GetLastTradesRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."GetLastTradesRequest" IS 'Запрос обезличенных сделок за последний час.';
	COMMENT ON COLUMN "public"."GetLastTradesRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."GetLastTradesRequest"."from" IS 'Начало запрашиваемого периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GetLastTradesRequest"."to" IS 'Окончание запрашиваемого периода в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."GetLastTradesRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid.';




CREATE TABLE "public"."GetMarginAttributesResponse" (
	"liquid_portfolio_id" MoneyValue NULL,
	"starting_margin_id" MoneyValue NULL,
	"minimal_margin_id" MoneyValue NULL,
	"funds_sufficiency_level_id" Quotation NULL,
	"amount_of_missing_funds_id" MoneyValue NULL,
	"corrected_margin_id" MoneyValue NULL
);
	CREATE INDEX GetMarginAttributesResponse_liquid_portfolio_id_idx ON public.GetMarginAttributesResponse USING btree (liquid_portfolio_id);
	CREATE INDEX GetMarginAttributesResponse_starting_margin_id_idx ON public.GetMarginAttributesResponse USING btree (starting_margin_id);
	CREATE INDEX GetMarginAttributesResponse_minimal_margin_id_idx ON public.GetMarginAttributesResponse USING btree (minimal_margin_id);
	CREATE INDEX GetMarginAttributesResponse_funds_sufficiency_level_id_idx ON public.GetMarginAttributesResponse USING btree (funds_sufficiency_level_id);
	CREATE INDEX GetMarginAttributesResponse_amount_of_missing_funds_id_idx ON public.GetMarginAttributesResponse USING btree (amount_of_missing_funds_id);
	CREATE INDEX GetMarginAttributesResponse_corrected_margin_id_idx ON public.GetMarginAttributesResponse USING btree (corrected_margin_id);
	COMMENT ON TABLE "public"."GetMarginAttributesResponse" IS 'Маржинальные показатели по счёту.';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."liquid_portfolio_id" IS ' Ликвидная стоимость портфеля. Подробнее: [что такое ликвидный портфель?](https://help.tinkoff.ru/margin-trade/short/liquid-portfolio/).';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."starting_margin_id" IS ' Начальная маржа — начальное обеспечение для совершения новой сделки. Подробнее: [начальная и минимальная маржа](https://help.tinkoff.ru/margin-trade/short/initial-and-maintenance-margin/).';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."minimal_margin_id" IS ' Минимальная маржа — это минимальное обеспечение для поддержания позиции, которую вы уже открыли. Подробнее: [начальная и минимальная маржа](https://help.tinkoff.ru/margin-trade/short/initial-and-maintenance-margin/).';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."funds_sufficiency_level_id" IS ' Уровень достаточности средств. Соотношение стоимости ликвидного портфеля к начальной марже.';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."amount_of_missing_funds_id" IS ' Объем недостающих средств. Разница между стартовой маржой и ликвидной стоимости портфеля.';
	COMMENT ON COLUMN "public"."GetMarginAttributesResponse"."corrected_margin_id" IS ' Скорректированная маржа.Начальная маржа, в которой плановые позиции рассчитываются с учётом активных заявок на покупку позиций лонг или продажу позиций шорт.';



CREATE TABLE "public"."GetOperationsByCursorRequest" (
	"account_id" text NULL,
	"instrument_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL,
	"cursor_id" text NULL,
	"limit_id" integer NULL,
	"operation_types_id" OperationType NULL,
	"state_id" OperationState NULL,
	"without_commissions_id" bool NULL,
	"without_trades_id" bool NULL,
	"without_overnights_id" bool NULL
);
	CREATE INDEX GetOperationsByCursorRequest_account_id_idx ON public.GetOperationsByCursorRequest USING btree (account_id);
	CREATE INDEX GetOperationsByCursorRequest_instrument_id_idx ON public.GetOperationsByCursorRequest USING btree (instrument_id);
	CREATE INDEX GetOperationsByCursorRequest_cursor_id_idx ON public.GetOperationsByCursorRequest USING btree (cursor_id);
	CREATE INDEX GetOperationsByCursorRequest_limit_id_idx ON public.GetOperationsByCursorRequest USING btree (limit_id);
	CREATE INDEX GetOperationsByCursorRequest_operation_types_id_idx ON public.GetOperationsByCursorRequest USING btree (operation_types_id);
	CREATE INDEX GetOperationsByCursorRequest_state_id_idx ON public.GetOperationsByCursorRequest USING btree (state_id);
	CREATE INDEX GetOperationsByCursorRequest_without_commissions_id_idx ON public.GetOperationsByCursorRequest USING btree (without_commissions_id);
	CREATE INDEX GetOperationsByCursorRequest_without_trades_id_idx ON public.GetOperationsByCursorRequest USING btree (without_trades_id);
	CREATE INDEX GetOperationsByCursorRequest_without_overnights_id_idx ON public.GetOperationsByCursorRequest USING btree (without_overnights_id);
	COMMENT ON TABLE "public"."GetOperationsByCursorRequest" IS 'Запрос списка операций по счёту с пагинацией.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."account_id" IS 'Идентификатор счёта клиента. Обязательный параметр для данного метода, остальные параметры опциональны.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."instrument_id" IS 'Идентификатор инструмента (Figi инструмента или uid инструмента)';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."from" IS 'Начало периода (по UTC).';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."to" IS 'Окончание периода (по UTC).';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."cursor_id" IS 'Идентификатор элемента, с которого начать формировать ответ.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."limit_id" IS 'Лимит количества операций. По умолчанию устанавливается значение **100**, максимальное значение 1000.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."operation_types_id" IS 'Тип операции. Принимает значение из списка OperationType.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."state_id" IS 'Статус запрашиваемых операций, возможные значения указаны в OperationState.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."without_commissions_id" IS 'Флаг возвращать ли комиссии, по умолчанию false';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."without_trades_id" IS 'Флаг получения ответа без массива сделок.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorRequest"."without_overnights_id" IS 'Флаг не показывать overnight операций.';


CREATE TABLE "public"."GetOperationsByCursorResponse" (
	"has_next_id" bool NULL,
	"next_cursor_id" text NULL,
	"items_id" OperationItem NULL,
	CONSTRAINT GetOperationsByCursorResponse_items_id_fk FOREIGN KEY (items_id) REFERENCES public.OperationItem (id)
);
	CREATE INDEX GetOperationsByCursorResponse_has_next_id_idx ON public.GetOperationsByCursorResponse USING btree (has_next_id);
	CREATE INDEX GetOperationsByCursorResponse_next_cursor_id_idx ON public.GetOperationsByCursorResponse USING btree (next_cursor_id);
	CREATE INDEX GetOperationsByCursorResponse_items_id_idx ON public.GetOperationsByCursorResponse USING btree (items_id);
	COMMENT ON TABLE "public"."GetOperationsByCursorResponse" IS 'Список операций по счёту с пагинацией.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorResponse"."has_next_id" IS 'Признак, есть ли следующий элемент.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorResponse"."next_cursor_id" IS 'Следующий курсор.';
	COMMENT ON COLUMN "public"."GetOperationsByCursorResponse"."items_id" IS 'Список операций.';


CREATE TABLE "public"."GetOrderBookRequest" (
	"figi_id" text NULL,
	"depth_id" integer NULL,
	"instrument_id" text NULL
);
	CREATE INDEX GetOrderBookRequest_figi_id_idx ON public.GetOrderBookRequest USING btree (figi_id);
	CREATE INDEX GetOrderBookRequest_depth_id_idx ON public.GetOrderBookRequest USING btree (depth_id);
	CREATE INDEX GetOrderBookRequest_instrument_id_idx ON public.GetOrderBookRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."GetOrderBookRequest" IS 'Запрос стакана.';
	COMMENT ON COLUMN "public"."GetOrderBookRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."GetOrderBookRequest"."depth_id" IS 'Глубина стакана.';
	COMMENT ON COLUMN "public"."GetOrderBookRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid.';


CREATE TABLE "public"."GetOrderBookResponse" (
	"figi_id" text NULL,
	"depth_id" integer NULL,
	"bids_id" Order NULL,
	"asks_id" Order NULL,
	"last_price_id" Quotation NULL,
	"close_price_id" Quotation NULL,
	"limit_up_id" Quotation NULL,
	"limit_down_id" Quotation NULL,
	"last_price_ts" timestamptz NULL,
	"close_price_ts" timestamptz NULL,
	"orderbook_ts" timestamptz NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX GetOrderBookResponse_figi_id_idx ON public.GetOrderBookResponse USING btree (figi_id);
	CREATE INDEX GetOrderBookResponse_depth_id_idx ON public.GetOrderBookResponse USING btree (depth_id);
	CREATE INDEX GetOrderBookResponse_bids_id_idx ON public.GetOrderBookResponse USING btree (bids_id);
	CREATE INDEX GetOrderBookResponse_asks_id_idx ON public.GetOrderBookResponse USING btree (asks_id);
	CREATE INDEX GetOrderBookResponse_last_price_id_idx ON public.GetOrderBookResponse USING btree (last_price_id);
	CREATE INDEX GetOrderBookResponse_close_price_id_idx ON public.GetOrderBookResponse USING btree (close_price_id);
	CREATE INDEX GetOrderBookResponse_limit_up_id_idx ON public.GetOrderBookResponse USING btree (limit_up_id);
	CREATE INDEX GetOrderBookResponse_limit_down_id_idx ON public.GetOrderBookResponse USING btree (limit_down_id);
	CREATE INDEX GetOrderBookResponse_instrument_uid_id_idx ON public.GetOrderBookResponse USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."GetOrderBookResponse" IS 'Информация о стакане.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."depth_id" IS 'Глубина стакана.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."bids_id" IS 'Множество пар значений на покупку.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."asks_id" IS 'Множество пар значений на продажу.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."last_price_id" IS 'Цена последней сделки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."close_price_id" IS 'Цена закрытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."limit_up_id" IS 'Верхний лимит цены за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."limit_down_id" IS 'Нижний лимит цены за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."last_price_ts" IS 'Время получения цены последней сделки.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."close_price_ts" IS 'Время получения цены закрытия.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."orderbook_ts" IS 'Время формирования стакана на бирже.';
	COMMENT ON COLUMN "public"."GetOrderBookResponse"."instrument_uid_id" IS 'Uid инструмента.';


CREATE TABLE "public"."GetOrderStateRequest" (
	"account_id" text NULL,
	"order_id" text NULL
);
	CREATE INDEX GetOrderStateRequest_account_id_idx ON public.GetOrderStateRequest USING btree (account_id);
	CREATE INDEX GetOrderStateRequest_order_id_idx ON public.GetOrderStateRequest USING btree (order_id);
	COMMENT ON TABLE "public"."GetOrderStateRequest" IS 'Запрос получения статуса торгового поручения.';
	COMMENT ON COLUMN "public"."GetOrderStateRequest"."account_id" IS 'Номер счёта.';
	COMMENT ON COLUMN "public"."GetOrderStateRequest"."order_id" IS 'Идентификатор заявки.';






CREATE TABLE "public"."GetTradingStatusRequest" (
	"figi_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX GetTradingStatusRequest_figi_id_idx ON public.GetTradingStatusRequest USING btree (figi_id);
	CREATE INDEX GetTradingStatusRequest_instrument_id_idx ON public.GetTradingStatusRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."GetTradingStatusRequest" IS 'Запрос получения торгового статуса.';
	COMMENT ON COLUMN "public"."GetTradingStatusRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."GetTradingStatusRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid.';


CREATE TABLE "public"."GetTradingStatusResponse" (
	"figi_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"limit_order_available_flag_id" bool NULL,
	"market_order_available_flag_id" bool NULL,
	"api_trade_available_flag_id" bool NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX GetTradingStatusResponse_figi_id_idx ON public.GetTradingStatusResponse USING btree (figi_id);
	CREATE INDEX GetTradingStatusResponse_trading_status_id_idx ON public.GetTradingStatusResponse USING btree (trading_status_id);
	CREATE INDEX GetTradingStatusResponse_limit_order_available_flag_id_idx ON public.GetTradingStatusResponse USING btree (limit_order_available_flag_id);
	CREATE INDEX GetTradingStatusResponse_market_order_available_flag_id_idx ON public.GetTradingStatusResponse USING btree (market_order_available_flag_id);
	CREATE INDEX GetTradingStatusResponse_api_trade_available_flag_id_idx ON public.GetTradingStatusResponse USING btree (api_trade_available_flag_id);
	CREATE INDEX GetTradingStatusResponse_instrument_uid_id_idx ON public.GetTradingStatusResponse USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."GetTradingStatusResponse" IS 'Информация о торговом статусе.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."trading_status_id" IS 'Статус торговли инструментом.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."limit_order_available_flag_id" IS 'Признак доступности выставления лимитной заявки по инструменту.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."market_order_available_flag_id" IS 'Признак доступности выставления рыночной заявки по инструменту.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."api_trade_available_flag_id" IS 'Признак доступности торгов через API.';
	COMMENT ON COLUMN "public"."GetTradingStatusResponse"."instrument_uid_id" IS 'Uid инструмента.';





CREATE TABLE "public"."GetUserTariffResponse" (
	"unary_limits_id" UnaryLimit NULL,
	"stream_limits_id" StreamLimit NULL
);
	CREATE INDEX GetUserTariffResponse_unary_limits_id_idx ON public.GetUserTariffResponse USING btree (unary_limits_id);
	CREATE INDEX GetUserTariffResponse_stream_limits_id_idx ON public.GetUserTariffResponse USING btree (stream_limits_id);
	COMMENT ON TABLE "public"."GetUserTariffResponse" IS 'Текущие лимиты пользователя.';
	COMMENT ON COLUMN "public"."GetUserTariffResponse"."unary_limits_id" IS 'Массив лимитов пользователя по unary-запросам.';
	COMMENT ON COLUMN "public"."GetUserTariffResponse"."stream_limits_id" IS 'Массив лимитов пользователей для stream-соединений.';


CREATE TABLE "public"."HistoricCandle" (
	"open_id" Quotation NULL,
	"high_id" Quotation NULL,
	"low_id" Quotation NULL,
	"close_id" Quotation NULL,
	"volume_id" bigint NULL,
	"time" timestamptz NULL,
	"is_complete_id" bool NULL
);
	CREATE INDEX HistoricCandle_open_id_idx ON public.HistoricCandle USING btree (open_id);
	CREATE INDEX HistoricCandle_high_id_idx ON public.HistoricCandle USING btree (high_id);
	CREATE INDEX HistoricCandle_low_id_idx ON public.HistoricCandle USING btree (low_id);
	CREATE INDEX HistoricCandle_close_id_idx ON public.HistoricCandle USING btree (close_id);
	CREATE INDEX HistoricCandle_volume_id_idx ON public.HistoricCandle USING btree (volume_id);
	CREATE INDEX HistoricCandle_is_complete_id_idx ON public.HistoricCandle USING btree (is_complete_id);
	COMMENT ON TABLE "public"."HistoricCandle" IS 'Информация о свече.';
	COMMENT ON COLUMN "public"."HistoricCandle"."open_id" IS 'Цена открытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."HistoricCandle"."high_id" IS 'Максимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."HistoricCandle"."low_id" IS 'Минимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."HistoricCandle"."close_id" IS 'Цена закрытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."HistoricCandle"."volume_id" IS 'Объём торгов в лотах.';
	COMMENT ON COLUMN "public"."HistoricCandle"."time" IS 'Время свечи в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."HistoricCandle"."is_complete_id" IS 'Признак завершённости свечи. **false** значит, свеча за текущие интервал ещё сформирована не полностью.';


CREATE TABLE "public"."InfoInstrument" (
	"figi_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX InfoInstrument_figi_id_idx ON public.InfoInstrument USING btree (figi_id);
	CREATE INDEX InfoInstrument_instrument_id_idx ON public.InfoInstrument USING btree (instrument_id);
	COMMENT ON TABLE "public"."InfoInstrument" IS 'Запрос подписки на торговый статус.';
	COMMENT ON COLUMN "public"."InfoInstrument"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."InfoInstrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';


CREATE TABLE "public"."InfoSubscription" (
	"figi_id" text NULL,
	"subscription_status_id" SubscriptionStatus NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX InfoSubscription_figi_id_idx ON public.InfoSubscription USING btree (figi_id);
	CREATE INDEX InfoSubscription_subscription_status_id_idx ON public.InfoSubscription USING btree (subscription_status_id);
	CREATE INDEX InfoSubscription_instrument_uid_id_idx ON public.InfoSubscription USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."InfoSubscription" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."InfoSubscription"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."InfoSubscription"."subscription_status_id" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."InfoSubscription"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."Instrument" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"instrument_type_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"instrument_kind_id" InstrumentType NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Instrument_pk PRIMARY KEY (uid)
);
	CREATE INDEX Instrument_figi_id_idx ON public.Instrument USING btree (figi_id);
	CREATE INDEX Instrument_ticker_id_idx ON public.Instrument USING btree (ticker_id);
	CREATE INDEX Instrument_class_code_id_idx ON public.Instrument USING btree (class_code_id);
	CREATE INDEX Instrument_isin_id_idx ON public.Instrument USING btree (isin_id);
	CREATE INDEX Instrument_lot_id_idx ON public.Instrument USING btree (lot_id);
	CREATE INDEX Instrument_currency_id_idx ON public.Instrument USING btree (currency_id);
	CREATE INDEX Instrument_klong_id_idx ON public.Instrument USING btree (klong_id);
	CREATE INDEX Instrument_kshort_id_idx ON public.Instrument USING btree (kshort_id);
	CREATE INDEX Instrument_dlong_id_idx ON public.Instrument USING btree (dlong_id);
	CREATE INDEX Instrument_dshort_id_idx ON public.Instrument USING btree (dshort_id);
	CREATE INDEX Instrument_dlong_min_id_idx ON public.Instrument USING btree (dlong_min_id);
	CREATE INDEX Instrument_dshort_min_id_idx ON public.Instrument USING btree (dshort_min_id);
	CREATE INDEX Instrument_short_enabled_flag_id_idx ON public.Instrument USING btree (short_enabled_flag_id);
	CREATE INDEX Instrument_name_id_idx ON public.Instrument USING btree (name_id);
	CREATE INDEX Instrument_exchange_id_idx ON public.Instrument USING btree (exchange_id);
	CREATE INDEX Instrument_country_of_risk_id_idx ON public.Instrument USING btree (country_of_risk_id);
	CREATE INDEX Instrument_country_of_risk_name_id_idx ON public.Instrument USING btree (country_of_risk_name_id);
	CREATE INDEX Instrument_instrument_type_id_idx ON public.Instrument USING btree (instrument_type_id);
	CREATE INDEX Instrument_trading_status_id_idx ON public.Instrument USING btree (trading_status_id);
	CREATE INDEX Instrument_otc_flag_id_idx ON public.Instrument USING btree (otc_flag_id);
	CREATE INDEX Instrument_buy_available_flag_id_idx ON public.Instrument USING btree (buy_available_flag_id);
	CREATE INDEX Instrument_sell_available_flag_id_idx ON public.Instrument USING btree (sell_available_flag_id);
	CREATE INDEX Instrument_min_price_increment_id_idx ON public.Instrument USING btree (min_price_increment_id);
	CREATE INDEX Instrument_api_trade_available_flag_id_idx ON public.Instrument USING btree (api_trade_available_flag_id);
	CREATE INDEX Instrument_uid_id_idx ON public.Instrument USING btree (uid_id);
	CREATE INDEX Instrument_real_exchange_id_idx ON public.Instrument USING btree (real_exchange_id);
	CREATE INDEX Instrument_position_uid_id_idx ON public.Instrument USING btree (position_uid_id);
	CREATE INDEX Instrument_for_iis_flag_id_idx ON public.Instrument USING btree (for_iis_flag_id);
	CREATE INDEX Instrument_for_qual_investor_flag_id_idx ON public.Instrument USING btree (for_qual_investor_flag_id);
	CREATE INDEX Instrument_weekend_flag_id_idx ON public.Instrument USING btree (weekend_flag_id);
	CREATE INDEX Instrument_blocked_tca_flag_id_idx ON public.Instrument USING btree (blocked_tca_flag_id);
	CREATE INDEX Instrument_instrument_kind_id_idx ON public.Instrument USING btree (instrument_kind_id);
	COMMENT ON TABLE "public"."Instrument" IS 'Объект передачи основной информации об инструменте.';
	COMMENT ON COLUMN "public"."Instrument"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."class_code_id" IS 'Класс-код инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Instrument"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Instrument"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
	COMMENT ON COLUMN "public"."Instrument"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
	COMMENT ON COLUMN "public"."Instrument"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Instrument"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Instrument"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Instrument"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Instrument"."short_enabled_flag_id" IS 'Признак доступности для операций в шорт.';
	COMMENT ON COLUMN "public"."Instrument"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Instrument"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Instrument"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Instrument"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Instrument"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Instrument"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Instrument"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Instrument"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Instrument"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Instrument"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Instrument"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Instrument"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным';
	COMMENT ON COLUMN "public"."Instrument"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС';
	COMMENT ON COLUMN "public"."Instrument"."instrument_kind_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."Instrument"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Instrument"."first_1day_candle_date" IS 'Дата первой дневной свечи.';



CREATE TABLE "public"."InstrumentClosePriceResponse" (
	"figi_id" text NULL,
	"instrument_uid_id" text NULL,
	"price_id" Quotation NULL,
	"time" timestamptz NULL
);
	CREATE INDEX InstrumentClosePriceResponse_figi_id_idx ON public.InstrumentClosePriceResponse USING btree (figi_id);
	CREATE INDEX InstrumentClosePriceResponse_instrument_uid_id_idx ON public.InstrumentClosePriceResponse USING btree (instrument_uid_id);
	CREATE INDEX InstrumentClosePriceResponse_price_id_idx ON public.InstrumentClosePriceResponse USING btree (price_id);
	COMMENT ON TABLE "public"."InstrumentClosePriceResponse" IS 'Цена закрытия торговой сессии по инструменту.';
	COMMENT ON COLUMN "public"."InstrumentClosePriceResponse"."figi_id" IS 'Figi инструмента.';
	COMMENT ON COLUMN "public"."InstrumentClosePriceResponse"."instrument_uid_id" IS 'Uid инструмента.';
	COMMENT ON COLUMN "public"."InstrumentClosePriceResponse"."price_id" IS 'Цена закрытия торговой сессии.';
	COMMENT ON COLUMN "public"."InstrumentClosePriceResponse"."time" IS 'Дата совершения торгов.';


CREATE TABLE "public"."InstrumentLink" (
	"type_id" text NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX InstrumentLink_type_id_idx ON public.InstrumentLink USING btree (type_id);
	CREATE INDEX InstrumentLink_instrument_uid_id_idx ON public.InstrumentLink USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."InstrumentLink" IS 'Связь с другим инструментом.';
	COMMENT ON COLUMN "public"."InstrumentLink"."type_id" IS 'Тип связи.';
	COMMENT ON COLUMN "public"."InstrumentLink"."instrument_uid_id" IS 'uid идентификатор связанного инструмента.';


CREATE TABLE "public"."InstrumentRequest" (
	"id_type_id" InstrumentIdType NULL,
	"class_code_id" text NULL,
	"id_id" text NULL,
	CONSTRAINT InstrumentRequest_pk PRIMARY KEY (id)
);
	CREATE INDEX InstrumentRequest_id_type_id_idx ON public.InstrumentRequest USING btree (id_type_id);
	CREATE INDEX InstrumentRequest_class_code_id_idx ON public.InstrumentRequest USING btree (class_code_id);
	CREATE INDEX InstrumentRequest_id_id_idx ON public.InstrumentRequest USING btree (id_id);
	COMMENT ON TABLE "public"."InstrumentRequest" IS 'Запрос получения инструмента по идентификатору.';
	COMMENT ON COLUMN "public"."InstrumentRequest"."id_type_id" IS ' Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: [Идентификация инструментов](https://tinkoff.github.io/investAPI/faq_identification/)';
	COMMENT ON COLUMN "public"."InstrumentRequest"."class_code_id" IS ' Идентификатор class_code. Обязателен при id_type = ticker.';
	COMMENT ON COLUMN "public"."InstrumentRequest"."id_id" IS ' Идентификатор запрашиваемого инструмента.';



CREATE TABLE "public"."InstrumentShort" (
	"isin_id" text NULL,
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"instrument_type_id" text NULL,
	"name_id" text NULL,
	"uid_id" text NULL,
	"position_uid_id" text NULL,
	"instrument_kind_id" InstrumentType NULL,
	"api_trade_available_flag_id" bool NULL,
	"for_iis_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	CONSTRAINT InstrumentShort_pk PRIMARY KEY (uid)
);
	CREATE INDEX InstrumentShort_isin_id_idx ON public.InstrumentShort USING btree (isin_id);
	CREATE INDEX InstrumentShort_figi_id_idx ON public.InstrumentShort USING btree (figi_id);
	CREATE INDEX InstrumentShort_ticker_id_idx ON public.InstrumentShort USING btree (ticker_id);
	CREATE INDEX InstrumentShort_class_code_id_idx ON public.InstrumentShort USING btree (class_code_id);
	CREATE INDEX InstrumentShort_instrument_type_id_idx ON public.InstrumentShort USING btree (instrument_type_id);
	CREATE INDEX InstrumentShort_name_id_idx ON public.InstrumentShort USING btree (name_id);
	CREATE INDEX InstrumentShort_uid_id_idx ON public.InstrumentShort USING btree (uid_id);
	CREATE INDEX InstrumentShort_position_uid_id_idx ON public.InstrumentShort USING btree (position_uid_id);
	CREATE INDEX InstrumentShort_instrument_kind_id_idx ON public.InstrumentShort USING btree (instrument_kind_id);
	CREATE INDEX InstrumentShort_api_trade_available_flag_id_idx ON public.InstrumentShort USING btree (api_trade_available_flag_id);
	CREATE INDEX InstrumentShort_for_iis_flag_id_idx ON public.InstrumentShort USING btree (for_iis_flag_id);
	CREATE INDEX InstrumentShort_for_qual_investor_flag_id_idx ON public.InstrumentShort USING btree (for_qual_investor_flag_id);
	CREATE INDEX InstrumentShort_weekend_flag_id_idx ON public.InstrumentShort USING btree (weekend_flag_id);
	CREATE INDEX InstrumentShort_blocked_tca_flag_id_idx ON public.InstrumentShort USING btree (blocked_tca_flag_id);
	COMMENT ON TABLE "public"."InstrumentShort" IS 'Краткая информация об инструменте.';
	COMMENT ON COLUMN "public"."InstrumentShort"."isin_id" IS 'Isin инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."figi_id" IS 'Figi инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."ticker_id" IS 'Ticker инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."class_code_id" IS 'ClassCode инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."instrument_kind_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."InstrumentShort"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."InstrumentShort"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."InstrumentShort"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."InstrumentShort"."first_1day_candle_date" IS 'Дата первой дневной свечи.';
	COMMENT ON COLUMN "public"."InstrumentShort"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."InstrumentShort"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным';
	COMMENT ON COLUMN "public"."InstrumentShort"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС';



CREATE TABLE "public"."LastPrice" (
	"figi_id" text NULL,
	"price_id" Quotation NULL,
	"time" timestamptz NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX LastPrice_figi_id_idx ON public.LastPrice USING btree (figi_id);
	CREATE INDEX LastPrice_price_id_idx ON public.LastPrice USING btree (price_id);
	CREATE INDEX LastPrice_instrument_uid_id_idx ON public.LastPrice USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."LastPrice" IS 'Информация о цене последней сделки.';
	COMMENT ON COLUMN "public"."LastPrice"."figi_id" IS 'Figi инструмента.';
	COMMENT ON COLUMN "public"."LastPrice"."price_id" IS 'Цена последней сделки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."LastPrice"."time" IS 'Время получения последней цены в часовом поясе UTC по времени биржи.';
	COMMENT ON COLUMN "public"."LastPrice"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."LastPriceInstrument" (
	"figi_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX LastPriceInstrument_figi_id_idx ON public.LastPriceInstrument USING btree (figi_id);
	CREATE INDEX LastPriceInstrument_instrument_id_idx ON public.LastPriceInstrument USING btree (instrument_id);
	COMMENT ON TABLE "public"."LastPriceInstrument" IS 'Запрос подписки на последнюю цену.';
	COMMENT ON COLUMN "public"."LastPriceInstrument"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."LastPriceInstrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';


CREATE TABLE "public"."LastPriceSubscription" (
	"figi_id" text NULL,
	"subscription_status_id" SubscriptionStatus NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX LastPriceSubscription_figi_id_idx ON public.LastPriceSubscription USING btree (figi_id);
	CREATE INDEX LastPriceSubscription_subscription_status_id_idx ON public.LastPriceSubscription USING btree (subscription_status_id);
	CREATE INDEX LastPriceSubscription_instrument_uid_id_idx ON public.LastPriceSubscription USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."LastPriceSubscription" IS 'Статус подписки на цену последней сделки.';
	COMMENT ON COLUMN "public"."LastPriceSubscription"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."LastPriceSubscription"."subscription_status_id" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."LastPriceSubscription"."instrument_uid_id" IS 'Uid инструмента';




CREATE TABLE "public"."MarketDataServerSideStreamRequest" (
	"subscribe_candles_request_id" SubscribeCandlesRequest NULL,
	"subscribe_order_book_request_id" SubscribeOrderBookRequest NULL,
	"subscribe_trades_request_id" SubscribeTradesRequest NULL,
	"subscribe_info_request_id" SubscribeInfoRequest NULL,
	"subscribe_last_price_request_id" SubscribeLastPriceRequest NULL
);
	CREATE INDEX MarketDataServerSideStreamRequest_subscribe_candles_request_id_idx ON public.MarketDataServerSideStreamRequest USING btree (subscribe_candles_request_id);
	CREATE INDEX MarketDataServerSideStreamRequest_subscribe_order_book_request_id_idx ON public.MarketDataServerSideStreamRequest USING btree (subscribe_order_book_request_id);
	CREATE INDEX MarketDataServerSideStreamRequest_subscribe_trades_request_id_idx ON public.MarketDataServerSideStreamRequest USING btree (subscribe_trades_request_id);
	CREATE INDEX MarketDataServerSideStreamRequest_subscribe_info_request_id_idx ON public.MarketDataServerSideStreamRequest USING btree (subscribe_info_request_id);
	CREATE INDEX MarketDataServerSideStreamRequest_subscribe_last_price_request_id_idx ON public.MarketDataServerSideStreamRequest USING btree (subscribe_last_price_request_id);
	COMMENT ON TABLE "public"."MarketDataServerSideStreamRequest" IS '';
	COMMENT ON COLUMN "public"."MarketDataServerSideStreamRequest"."subscribe_candles_request_id" IS 'Запрос подписки на свечи.';
	COMMENT ON COLUMN "public"."MarketDataServerSideStreamRequest"."subscribe_order_book_request_id" IS 'Запрос подписки на стаканы.';
	COMMENT ON COLUMN "public"."MarketDataServerSideStreamRequest"."subscribe_trades_request_id" IS 'Запрос подписки на ленту обезличенных сделок.';
	COMMENT ON COLUMN "public"."MarketDataServerSideStreamRequest"."subscribe_info_request_id" IS 'Запрос подписки на торговые статусы инструментов.';
	COMMENT ON COLUMN "public"."MarketDataServerSideStreamRequest"."subscribe_last_price_request_id" IS 'Запрос подписки на цены последних сделок.';


CREATE TABLE "public"."MoneyValue" (
	"currency_id" text NULL,
	"units_id" bigint NULL,
	"nano_id" integer NULL
);
	CREATE INDEX MoneyValue_currency_id_idx ON public.MoneyValue USING btree (currency_id);
	CREATE INDEX MoneyValue_units_id_idx ON public.MoneyValue USING btree (units_id);
	CREATE INDEX MoneyValue_nano_id_idx ON public.MoneyValue USING btree (nano_id);
	COMMENT ON TABLE "public"."MoneyValue" IS 'Денежная сумма в определенной валюте';
	COMMENT ON COLUMN "public"."MoneyValue"."currency_id" IS ' строковый ISO-код валюты';
	COMMENT ON COLUMN "public"."MoneyValue"."units_id" IS ' целая часть суммы, может быть отрицательным числом';
	COMMENT ON COLUMN "public"."MoneyValue"."nano_id" IS ' дробная часть суммы, может быть отрицательным числом';


CREATE TABLE "public"."Operation" (
	"id_id" text NULL,
	"parent_operation_id" text NULL,
	"currency_id" text NULL,
	"payment_id" MoneyValue NULL,
	"price_id" MoneyValue NULL,
	"state_id" OperationState NULL,
	"quantity_id" bigint NULL,
	"quantity_rest_id" bigint NULL,
	"figi_id" text NULL,
	"instrument_type_id" text NULL,
	"date" timestamptz NULL,
	"type_id" text NULL,
	"operation_type_id" OperationType NULL,
	"trades_id" OperationTrade NULL,
	"asset_uid_id" text NULL,
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL,
	CONSTRAINT Operation_pk PRIMARY KEY (id)
);
	CREATE INDEX Operation_id_id_idx ON public.Operation USING btree (id_id);
	CREATE INDEX Operation_parent_operation_id_idx ON public.Operation USING btree (parent_operation_id);
	CREATE INDEX Operation_currency_id_idx ON public.Operation USING btree (currency_id);
	CREATE INDEX Operation_payment_id_idx ON public.Operation USING btree (payment_id);
	CREATE INDEX Operation_price_id_idx ON public.Operation USING btree (price_id);
	CREATE INDEX Operation_state_id_idx ON public.Operation USING btree (state_id);
	CREATE INDEX Operation_quantity_id_idx ON public.Operation USING btree (quantity_id);
	CREATE INDEX Operation_quantity_rest_id_idx ON public.Operation USING btree (quantity_rest_id);
	CREATE INDEX Operation_figi_id_idx ON public.Operation USING btree (figi_id);
	CREATE INDEX Operation_instrument_type_id_idx ON public.Operation USING btree (instrument_type_id);
	CREATE INDEX Operation_type_id_idx ON public.Operation USING btree (type_id);
	CREATE INDEX Operation_operation_type_id_idx ON public.Operation USING btree (operation_type_id);
	CREATE INDEX Operation_trades_id_idx ON public.Operation USING btree (trades_id);
	CREATE INDEX Operation_asset_uid_id_idx ON public.Operation USING btree (asset_uid_id);
	CREATE INDEX Operation_position_uid_id_idx ON public.Operation USING btree (position_uid_id);
	CREATE INDEX Operation_instrument_uid_id_idx ON public.Operation USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."Operation" IS 'Данные по операции.';
	COMMENT ON COLUMN "public"."Operation"."id_id" IS 'Идентификатор операции.';
	COMMENT ON COLUMN "public"."Operation"."parent_operation_id" IS 'Идентификатор родительской операции.';
	COMMENT ON COLUMN "public"."Operation"."currency_id" IS 'Валюта операции.';
	COMMENT ON COLUMN "public"."Operation"."payment_id" IS 'Сумма операции.';
	COMMENT ON COLUMN "public"."Operation"."price_id" IS 'Цена операции за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."Operation"."state_id" IS 'Статус операции.';
	COMMENT ON COLUMN "public"."Operation"."quantity_id" IS 'Количество единиц инструмента.';
	COMMENT ON COLUMN "public"."Operation"."quantity_rest_id" IS 'Неисполненный остаток по сделке.';
	COMMENT ON COLUMN "public"."Operation"."figi_id" IS 'Figi-идентификатор инструмента, связанного с операцией.';
	COMMENT ON COLUMN "public"."Operation"."instrument_type_id" IS 'Тип инструмента. Возможные значения: </br>**bond** — облигация; </br>**share** — акция; </br>**currency** — валюта; </br>**etf** — фонд; </br>**futures** — фьючерс.';
	COMMENT ON COLUMN "public"."Operation"."date" IS 'Дата и время операции в формате часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Operation"."type_id" IS 'Текстовое описание типа операции.';
	COMMENT ON COLUMN "public"."Operation"."operation_type_id" IS 'Тип операции.';
	COMMENT ON COLUMN "public"."Operation"."trades_id" IS 'Массив сделок.';
	COMMENT ON COLUMN "public"."Operation"."asset_uid_id" IS 'Идентификатор актива';
	COMMENT ON COLUMN "public"."Operation"."position_uid_id" IS 'position_uid-идентификатора инструмента.';
	COMMENT ON COLUMN "public"."Operation"."instrument_uid_id" IS 'Уникальный идентификатор инструмента.';


CREATE TABLE "public"."OperationItem" (
	"cursor_id" text NULL,
	"broker_account_id" text NULL,
	"id_id" text NULL,
	"parent_operation_id" text NULL,
	"name_id" text NULL,
	"date" timestamptz NULL,
	"type_id" OperationType NULL,
	"description_id" text NULL,
	"state_id" OperationState NULL,
	"instrument_uid_id" text NULL,
	"figi_id" text NULL,
	"instrument_type_id" text NULL,
	"instrument_kind_id" InstrumentType NULL,
	"position_uid_id" text NULL,
	"payment_id" MoneyValue NULL,
	"price_id" MoneyValue NULL,
	"commission_id" MoneyValue NULL,
	"yield_id" MoneyValue NULL,
	"yield_relative_id" Quotation NULL,
	"accrued_int_id" MoneyValue NULL,
	"quantity_id" bigint NULL,
	"quantity_rest_id" bigint NULL,
	"quantity_done_id" bigint NULL,
	"cancel_date_time" timestamptz NULL,
	"cancel_reason_id" text NULL,
	"trades_info_id" OperationItemTrades NULL,
	"asset_uid_id" text NULL,
	CONSTRAINT OperationItem_pk PRIMARY KEY (id)
);
	CREATE INDEX OperationItem_cursor_id_idx ON public.OperationItem USING btree (cursor_id);
	CREATE INDEX OperationItem_broker_account_id_idx ON public.OperationItem USING btree (broker_account_id);
	CREATE INDEX OperationItem_id_id_idx ON public.OperationItem USING btree (id_id);
	CREATE INDEX OperationItem_parent_operation_id_idx ON public.OperationItem USING btree (parent_operation_id);
	CREATE INDEX OperationItem_name_id_idx ON public.OperationItem USING btree (name_id);
	CREATE INDEX OperationItem_type_id_idx ON public.OperationItem USING btree (type_id);
	CREATE INDEX OperationItem_description_id_idx ON public.OperationItem USING btree (description_id);
	CREATE INDEX OperationItem_state_id_idx ON public.OperationItem USING btree (state_id);
	CREATE INDEX OperationItem_instrument_uid_id_idx ON public.OperationItem USING btree (instrument_uid_id);
	CREATE INDEX OperationItem_figi_id_idx ON public.OperationItem USING btree (figi_id);
	CREATE INDEX OperationItem_instrument_type_id_idx ON public.OperationItem USING btree (instrument_type_id);
	CREATE INDEX OperationItem_instrument_kind_id_idx ON public.OperationItem USING btree (instrument_kind_id);
	CREATE INDEX OperationItem_position_uid_id_idx ON public.OperationItem USING btree (position_uid_id);
	CREATE INDEX OperationItem_payment_id_idx ON public.OperationItem USING btree (payment_id);
	CREATE INDEX OperationItem_price_id_idx ON public.OperationItem USING btree (price_id);
	CREATE INDEX OperationItem_commission_id_idx ON public.OperationItem USING btree (commission_id);
	CREATE INDEX OperationItem_yield_id_idx ON public.OperationItem USING btree (yield_id);
	CREATE INDEX OperationItem_yield_relative_id_idx ON public.OperationItem USING btree (yield_relative_id);
	CREATE INDEX OperationItem_accrued_int_id_idx ON public.OperationItem USING btree (accrued_int_id);
	CREATE INDEX OperationItem_quantity_id_idx ON public.OperationItem USING btree (quantity_id);
	CREATE INDEX OperationItem_quantity_rest_id_idx ON public.OperationItem USING btree (quantity_rest_id);
	CREATE INDEX OperationItem_quantity_done_id_idx ON public.OperationItem USING btree (quantity_done_id);
	CREATE INDEX OperationItem_cancel_reason_id_idx ON public.OperationItem USING btree (cancel_reason_id);
	CREATE INDEX OperationItem_trades_info_id_idx ON public.OperationItem USING btree (trades_info_id);
	CREATE INDEX OperationItem_asset_uid_id_idx ON public.OperationItem USING btree (asset_uid_id);
	COMMENT ON TABLE "public"."OperationItem" IS 'Данные об операции.';
	COMMENT ON COLUMN "public"."OperationItem"."cursor_id" IS 'Курсор.';
	COMMENT ON COLUMN "public"."OperationItem"."broker_account_id" IS 'Номер счета клиента.';
	COMMENT ON COLUMN "public"."OperationItem"."id_id" IS 'Идентификатор операции, может меняться с течением времени.';
	COMMENT ON COLUMN "public"."OperationItem"."parent_operation_id" IS 'Идентификатор родительской операции, может измениться, если изменился id родительской операции.';
	COMMENT ON COLUMN "public"."OperationItem"."name_id" IS 'Название операции.';
	COMMENT ON COLUMN "public"."OperationItem"."date" IS 'Дата поручения.';
	COMMENT ON COLUMN "public"."OperationItem"."type_id" IS 'Тип операции.';
	COMMENT ON COLUMN "public"."OperationItem"."description_id" IS 'Описание операции.';
	COMMENT ON COLUMN "public"."OperationItem"."state_id" IS 'Статус поручения.';
	COMMENT ON COLUMN "public"."OperationItem"."instrument_uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OperationItem"."figi_id" IS 'Figi.';
	COMMENT ON COLUMN "public"."OperationItem"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."OperationItem"."instrument_kind_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."OperationItem"."position_uid_id" IS 'position_uid-идентификатора инструмента.';
	COMMENT ON COLUMN "public"."OperationItem"."payment_id" IS 'Сумма операции.';
	COMMENT ON COLUMN "public"."OperationItem"."price_id" IS 'Цена операции за 1 инструмент.';
	COMMENT ON COLUMN "public"."OperationItem"."commission_id" IS 'Комиссия.';
	COMMENT ON COLUMN "public"."OperationItem"."yield_id" IS 'Доходность.';
	COMMENT ON COLUMN "public"."OperationItem"."yield_relative_id" IS 'Относительная доходность.';
	COMMENT ON COLUMN "public"."OperationItem"."accrued_int_id" IS 'Накопленный купонный доход.';
	COMMENT ON COLUMN "public"."OperationItem"."quantity_id" IS 'Количество единиц инструмента.';
	COMMENT ON COLUMN "public"."OperationItem"."quantity_rest_id" IS 'Неисполненный остаток по сделке.';
	COMMENT ON COLUMN "public"."OperationItem"."quantity_done_id" IS 'Исполненный остаток.';
	COMMENT ON COLUMN "public"."OperationItem"."cancel_date_time" IS 'Дата и время снятия заявки.';
	COMMENT ON COLUMN "public"."OperationItem"."cancel_reason_id" IS 'Причина отмены операции.';
	COMMENT ON COLUMN "public"."OperationItem"."trades_info_id" IS 'Массив сделок.';
	COMMENT ON COLUMN "public"."OperationItem"."asset_uid_id" IS 'Идентификатор актива';


CREATE TABLE "public"."OperationItemTrade" (
	"num_id" text NULL,
	"date" timestamptz NULL,
	"quantity_id" bigint NULL,
	"price_id" MoneyValue NULL,
	"yield_id" MoneyValue NULL,
	"yield_relative_id" Quotation NULL
);
	CREATE INDEX OperationItemTrade_num_id_idx ON public.OperationItemTrade USING btree (num_id);
	CREATE INDEX OperationItemTrade_quantity_id_idx ON public.OperationItemTrade USING btree (quantity_id);
	CREATE INDEX OperationItemTrade_price_id_idx ON public.OperationItemTrade USING btree (price_id);
	CREATE INDEX OperationItemTrade_yield_id_idx ON public.OperationItemTrade USING btree (yield_id);
	CREATE INDEX OperationItemTrade_yield_relative_id_idx ON public.OperationItemTrade USING btree (yield_relative_id);
	COMMENT ON TABLE "public"."OperationItemTrade" IS 'Сделка по операции.';
	COMMENT ON COLUMN "public"."OperationItemTrade"."num_id" IS 'Номер сделки';
	COMMENT ON COLUMN "public"."OperationItemTrade"."date" IS 'Дата сделки';
	COMMENT ON COLUMN "public"."OperationItemTrade"."quantity_id" IS 'Количество в единицах.';
	COMMENT ON COLUMN "public"."OperationItemTrade"."price_id" IS 'Цена.';
	COMMENT ON COLUMN "public"."OperationItemTrade"."yield_id" IS 'Доходность.';
	COMMENT ON COLUMN "public"."OperationItemTrade"."yield_relative_id" IS 'Относительная доходность.';



CREATE TABLE "public"."OperationTrade" (
	"trade_id" text NULL,
	"date_time" timestamptz NULL,
	"quantity_id" bigint NULL,
	"price_id" MoneyValue NULL
);
	CREATE INDEX OperationTrade_trade_id_idx ON public.OperationTrade USING btree (trade_id);
	CREATE INDEX OperationTrade_quantity_id_idx ON public.OperationTrade USING btree (quantity_id);
	CREATE INDEX OperationTrade_price_id_idx ON public.OperationTrade USING btree (price_id);
	COMMENT ON TABLE "public"."OperationTrade" IS 'Сделка по операции.';
	COMMENT ON COLUMN "public"."OperationTrade"."trade_id" IS 'Идентификатор сделки.';
	COMMENT ON COLUMN "public"."OperationTrade"."date_time" IS 'Дата и время сделки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."OperationTrade"."quantity_id" IS 'Количество инструментов.';
	COMMENT ON COLUMN "public"."OperationTrade"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';


CREATE TABLE "public"."OperationsRequest" (
	"account_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL,
	"state_id" OperationState NULL,
	"figi_id" text NULL
);
	CREATE INDEX OperationsRequest_account_id_idx ON public.OperationsRequest USING btree (account_id);
	CREATE INDEX OperationsRequest_state_id_idx ON public.OperationsRequest USING btree (state_id);
	CREATE INDEX OperationsRequest_figi_id_idx ON public.OperationsRequest USING btree (figi_id);
	COMMENT ON TABLE "public"."OperationsRequest" IS 'Запрос получения списка операций по счёту.';
	COMMENT ON COLUMN "public"."OperationsRequest"."account_id" IS 'Идентификатор счёта клиента.';
	COMMENT ON COLUMN "public"."OperationsRequest"."from" IS 'Начало периода (по UTC).';
	COMMENT ON COLUMN "public"."OperationsRequest"."to" IS 'Окончание периода (по UTC).';
	COMMENT ON COLUMN "public"."OperationsRequest"."state_id" IS 'Статус запрашиваемых операций.';
	COMMENT ON COLUMN "public"."OperationsRequest"."figi_id" IS 'Figi-идентификатор инструмента для фильтрации.';



CREATE TABLE "public"."Option" (
	"uid_id" text NULL,
	"position_uid_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"basic_asset_position_uid_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"real_exchange_id" RealExchange NULL,
	"direction_id" OptionDirection NULL,
	"payment_type_id" OptionPaymentType NULL,
	"style_id" OptionStyle NULL,
	"settlement_type_id" OptionSettlementType NULL,
	"name_id" text NULL,
	"currency_id" text NULL,
	"settlement_currency_id" text NULL,
	"asset_type_id" text NULL,
	"basic_asset_id" text NULL,
	"exchange_id" text NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"sector_id" text NULL,
	"lot_id" integer NULL,
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
	"short_enabled_flag_id" bool NULL,
	"for_iis_flag_id" bool NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"api_trade_available_flag_id" bool NULL,
	CONSTRAINT Option_pk PRIMARY KEY (uid)
);
	CREATE INDEX Option_uid_id_idx ON public.Option USING btree (uid_id);
	CREATE INDEX Option_position_uid_id_idx ON public.Option USING btree (position_uid_id);
	CREATE INDEX Option_ticker_id_idx ON public.Option USING btree (ticker_id);
	CREATE INDEX Option_class_code_id_idx ON public.Option USING btree (class_code_id);
	CREATE INDEX Option_basic_asset_position_uid_id_idx ON public.Option USING btree (basic_asset_position_uid_id);
	CREATE INDEX Option_trading_status_id_idx ON public.Option USING btree (trading_status_id);
	CREATE INDEX Option_real_exchange_id_idx ON public.Option USING btree (real_exchange_id);
	CREATE INDEX Option_direction_id_idx ON public.Option USING btree (direction_id);
	CREATE INDEX Option_payment_type_id_idx ON public.Option USING btree (payment_type_id);
	CREATE INDEX Option_style_id_idx ON public.Option USING btree (style_id);
	CREATE INDEX Option_settlement_type_id_idx ON public.Option USING btree (settlement_type_id);
	CREATE INDEX Option_name_id_idx ON public.Option USING btree (name_id);
	CREATE INDEX Option_currency_id_idx ON public.Option USING btree (currency_id);
	CREATE INDEX Option_settlement_currency_id_idx ON public.Option USING btree (settlement_currency_id);
	CREATE INDEX Option_asset_type_id_idx ON public.Option USING btree (asset_type_id);
	CREATE INDEX Option_basic_asset_id_idx ON public.Option USING btree (basic_asset_id);
	CREATE INDEX Option_exchange_id_idx ON public.Option USING btree (exchange_id);
	CREATE INDEX Option_country_of_risk_id_idx ON public.Option USING btree (country_of_risk_id);
	CREATE INDEX Option_country_of_risk_name_id_idx ON public.Option USING btree (country_of_risk_name_id);
	CREATE INDEX Option_sector_id_idx ON public.Option USING btree (sector_id);
	CREATE INDEX Option_lot_id_idx ON public.Option USING btree (lot_id);
	CREATE INDEX Option_basic_asset_size_id_idx ON public.Option USING btree (basic_asset_size_id);
	CREATE INDEX Option_klong_id_idx ON public.Option USING btree (klong_id);
	CREATE INDEX Option_kshort_id_idx ON public.Option USING btree (kshort_id);
	CREATE INDEX Option_dlong_id_idx ON public.Option USING btree (dlong_id);
	CREATE INDEX Option_dshort_id_idx ON public.Option USING btree (dshort_id);
	CREATE INDEX Option_dlong_min_id_idx ON public.Option USING btree (dlong_min_id);
	CREATE INDEX Option_dshort_min_id_idx ON public.Option USING btree (dshort_min_id);
	CREATE INDEX Option_min_price_increment_id_idx ON public.Option USING btree (min_price_increment_id);
	CREATE INDEX Option_strike_price_id_idx ON public.Option USING btree (strike_price_id);
	CREATE INDEX Option_short_enabled_flag_id_idx ON public.Option USING btree (short_enabled_flag_id);
	CREATE INDEX Option_for_iis_flag_id_idx ON public.Option USING btree (for_iis_flag_id);
	CREATE INDEX Option_otc_flag_id_idx ON public.Option USING btree (otc_flag_id);
	CREATE INDEX Option_buy_available_flag_id_idx ON public.Option USING btree (buy_available_flag_id);
	CREATE INDEX Option_sell_available_flag_id_idx ON public.Option USING btree (sell_available_flag_id);
	CREATE INDEX Option_for_qual_investor_flag_id_idx ON public.Option USING btree (for_qual_investor_flag_id);
	CREATE INDEX Option_weekend_flag_id_idx ON public.Option USING btree (weekend_flag_id);
	CREATE INDEX Option_blocked_tca_flag_id_idx ON public.Option USING btree (blocked_tca_flag_id);
	CREATE INDEX Option_api_trade_available_flag_id_idx ON public.Option USING btree (api_trade_available_flag_id);
	COMMENT ON TABLE "public"."Option" IS 'Опцион.';
	COMMENT ON COLUMN "public"."Option"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Option"."position_uid_id" IS 'Уникальный идентификатор позиции.';
	COMMENT ON COLUMN "public"."Option"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Option"."class_code_id" IS 'Класс-код.';
	COMMENT ON COLUMN "public"."Option"."basic_asset_position_uid_id" IS 'Уникальный идентификатор позиции основного инструмента.';
	COMMENT ON COLUMN "public"."Option"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Option"."real_exchange_id" IS 'Реальная площадка исполнения расчётов. Допустимые значения: [REAL_EXCHANGE_MOEX, REAL_EXCHANGE_RTS]';
	COMMENT ON COLUMN "public"."Option"."direction_id" IS 'Направление опциона.';
	COMMENT ON COLUMN "public"."Option"."payment_type_id" IS 'Тип расчетов по опциону.';
	COMMENT ON COLUMN "public"."Option"."style_id" IS 'Стиль опциона.';
	COMMENT ON COLUMN "public"."Option"."settlement_type_id" IS 'Способ исполнения опциона.';
	COMMENT ON COLUMN "public"."Option"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Option"."currency_id" IS 'Валюта.';
	COMMENT ON COLUMN "public"."Option"."settlement_currency_id" IS 'Валюта, в которой оценивается контракт.';
	COMMENT ON COLUMN "public"."Option"."asset_type_id" IS 'Тип актива.';
	COMMENT ON COLUMN "public"."Option"."basic_asset_id" IS 'Основной актив.';
	COMMENT ON COLUMN "public"."Option"."exchange_id" IS 'Биржа.';
	COMMENT ON COLUMN "public"."Option"."country_of_risk_id" IS 'Код страны рисков.';
	COMMENT ON COLUMN "public"."Option"."country_of_risk_name_id" IS 'Наименование страны рисков.';
	COMMENT ON COLUMN "public"."Option"."sector_id" IS 'Сектор экономики.';
	COMMENT ON COLUMN "public"."Option"."lot_id" IS 'Количество бумаг в лоте.';
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
	COMMENT ON COLUMN "public"."Option"."short_enabled_flag_id" IS 'Признак доступности для операций шорт.';
	COMMENT ON COLUMN "public"."Option"."for_iis_flag_id" IS 'Возможность покупки/продажи на ИИС.';
	COMMENT ON COLUMN "public"."Option"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Option"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Option"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Option"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Option"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным.';
	COMMENT ON COLUMN "public"."Option"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС.';
	COMMENT ON COLUMN "public"."Option"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';




CREATE TABLE "public"."Order" (
	"price_id" Quotation NULL,
	"quantity_id" bigint NULL
);
	CREATE INDEX Order_price_id_idx ON public.Order USING btree (price_id);
	CREATE INDEX Order_quantity_id_idx ON public.Order USING btree (quantity_id);
	COMMENT ON TABLE "public"."Order" IS 'Массив предложений/спроса.';
	COMMENT ON COLUMN "public"."Order"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Order"."quantity_id" IS 'Количество в лотах.';


CREATE TABLE "public"."OrderBook" (
	"figi_id" text NULL,
	"depth_id" integer NULL,
	"is_consistent_id" bool NULL,
	"bids_id" Order NULL,
	"asks_id" Order NULL,
	"time" timestamptz NULL,
	"limit_up_id" Quotation NULL,
	"limit_down_id" Quotation NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX OrderBook_figi_id_idx ON public.OrderBook USING btree (figi_id);
	CREATE INDEX OrderBook_depth_id_idx ON public.OrderBook USING btree (depth_id);
	CREATE INDEX OrderBook_is_consistent_id_idx ON public.OrderBook USING btree (is_consistent_id);
	CREATE INDEX OrderBook_bids_id_idx ON public.OrderBook USING btree (bids_id);
	CREATE INDEX OrderBook_asks_id_idx ON public.OrderBook USING btree (asks_id);
	CREATE INDEX OrderBook_limit_up_id_idx ON public.OrderBook USING btree (limit_up_id);
	CREATE INDEX OrderBook_limit_down_id_idx ON public.OrderBook USING btree (limit_down_id);
	CREATE INDEX OrderBook_instrument_uid_id_idx ON public.OrderBook USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."OrderBook" IS 'Пакет стаканов в рамках стрима.';
	COMMENT ON COLUMN "public"."OrderBook"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OrderBook"."depth_id" IS 'Глубина стакана.';
	COMMENT ON COLUMN "public"."OrderBook"."is_consistent_id" IS 'Флаг консистентности стакана. **false** значит не все заявки попали в стакан по причинам сетевых задержек или нарушения порядка доставки.';
	COMMENT ON COLUMN "public"."OrderBook"."bids_id" IS 'Массив предложений.';
	COMMENT ON COLUMN "public"."OrderBook"."asks_id" IS 'Массив спроса.';
	COMMENT ON COLUMN "public"."OrderBook"."time" IS 'Время формирования стакана в часовом поясе UTC по времени биржи.';
	COMMENT ON COLUMN "public"."OrderBook"."limit_up_id" IS 'Верхний лимит цены за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."OrderBook"."limit_down_id" IS 'Нижний лимит цены за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."OrderBook"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."OrderBookInstrument" (
	"figi_id" text NULL,
	"depth_id" integer NULL,
	"instrument_id" text NULL
);
	CREATE INDEX OrderBookInstrument_figi_id_idx ON public.OrderBookInstrument USING btree (figi_id);
	CREATE INDEX OrderBookInstrument_depth_id_idx ON public.OrderBookInstrument USING btree (depth_id);
	CREATE INDEX OrderBookInstrument_instrument_id_idx ON public.OrderBookInstrument USING btree (instrument_id);
	COMMENT ON TABLE "public"."OrderBookInstrument" IS 'Запрос подписки на стаканы.';
	COMMENT ON COLUMN "public"."OrderBookInstrument"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."OrderBookInstrument"."depth_id" IS 'Глубина стакана.';
	COMMENT ON COLUMN "public"."OrderBookInstrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';


CREATE TABLE "public"."OrderBookSubscription" (
	"figi_id" text NULL,
	"depth_id" integer NULL,
	"subscription_status_id" SubscriptionStatus NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX OrderBookSubscription_figi_id_idx ON public.OrderBookSubscription USING btree (figi_id);
	CREATE INDEX OrderBookSubscription_depth_id_idx ON public.OrderBookSubscription USING btree (depth_id);
	CREATE INDEX OrderBookSubscription_subscription_status_id_idx ON public.OrderBookSubscription USING btree (subscription_status_id);
	CREATE INDEX OrderBookSubscription_instrument_uid_id_idx ON public.OrderBookSubscription USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."OrderBookSubscription" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."OrderBookSubscription"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OrderBookSubscription"."depth_id" IS 'Глубина стакана.';
	COMMENT ON COLUMN "public"."OrderBookSubscription"."subscription_status_id" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."OrderBookSubscription"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."OrderStage" (
	"price_id" MoneyValue NULL,
	"quantity_id" bigint NULL,
	"trade_id" text NULL
);
	CREATE INDEX OrderStage_price_id_idx ON public.OrderStage USING btree (price_id);
	CREATE INDEX OrderStage_quantity_id_idx ON public.OrderStage USING btree (quantity_id);
	CREATE INDEX OrderStage_trade_id_idx ON public.OrderStage USING btree (trade_id);
	COMMENT ON TABLE "public"."OrderStage" IS 'Сделки в рамках торгового поручения.';
	COMMENT ON COLUMN "public"."OrderStage"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."OrderStage"."quantity_id" IS 'Количество лотов.';
	COMMENT ON COLUMN "public"."OrderStage"."trade_id" IS 'Идентификатор сделки.';


CREATE TABLE "public"."OrderState" (
	"order_id" text NULL,
	"execution_report_status_id" OrderExecutionReportStatus NULL,
	"lots_requested_id" bigint NULL,
	"lots_executed_id" bigint NULL,
	"initial_order_price_id" MoneyValue NULL,
	"executed_order_price_id" MoneyValue NULL,
	"total_order_amount_id" MoneyValue NULL,
	"average_position_price_id" MoneyValue NULL,
	"initial_commission_id" MoneyValue NULL,
	"executed_commission_id" MoneyValue NULL,
	"figi_id" text NULL,
	"direction_id" OrderDirection NULL,
	"initial_security_price_id" MoneyValue NULL,
	"stages_id" OrderStage NULL,
	"service_commission_id" MoneyValue NULL,
	"currency_id" text NULL,
	"order_type_id" OrderType NULL,
	"order_date" timestamptz NULL,
	"instrument_uid_id" text NULL,
	"order_request_id" text NULL
);
	CREATE INDEX OrderState_order_id_idx ON public.OrderState USING btree (order_id);
	CREATE INDEX OrderState_execution_report_status_id_idx ON public.OrderState USING btree (execution_report_status_id);
	CREATE INDEX OrderState_lots_requested_id_idx ON public.OrderState USING btree (lots_requested_id);
	CREATE INDEX OrderState_lots_executed_id_idx ON public.OrderState USING btree (lots_executed_id);
	CREATE INDEX OrderState_initial_order_price_id_idx ON public.OrderState USING btree (initial_order_price_id);
	CREATE INDEX OrderState_executed_order_price_id_idx ON public.OrderState USING btree (executed_order_price_id);
	CREATE INDEX OrderState_total_order_amount_id_idx ON public.OrderState USING btree (total_order_amount_id);
	CREATE INDEX OrderState_average_position_price_id_idx ON public.OrderState USING btree (average_position_price_id);
	CREATE INDEX OrderState_initial_commission_id_idx ON public.OrderState USING btree (initial_commission_id);
	CREATE INDEX OrderState_executed_commission_id_idx ON public.OrderState USING btree (executed_commission_id);
	CREATE INDEX OrderState_figi_id_idx ON public.OrderState USING btree (figi_id);
	CREATE INDEX OrderState_direction_id_idx ON public.OrderState USING btree (direction_id);
	CREATE INDEX OrderState_initial_security_price_id_idx ON public.OrderState USING btree (initial_security_price_id);
	CREATE INDEX OrderState_stages_id_idx ON public.OrderState USING btree (stages_id);
	CREATE INDEX OrderState_service_commission_id_idx ON public.OrderState USING btree (service_commission_id);
	CREATE INDEX OrderState_currency_id_idx ON public.OrderState USING btree (currency_id);
	CREATE INDEX OrderState_order_type_id_idx ON public.OrderState USING btree (order_type_id);
	CREATE INDEX OrderState_instrument_uid_id_idx ON public.OrderState USING btree (instrument_uid_id);
	CREATE INDEX OrderState_order_request_id_idx ON public.OrderState USING btree (order_request_id);
	COMMENT ON TABLE "public"."OrderState" IS 'Информация о торговом поручении.';
	COMMENT ON COLUMN "public"."OrderState"."order_id" IS 'Биржевой идентификатор заявки.';
	COMMENT ON COLUMN "public"."OrderState"."execution_report_status_id" IS 'Текущий статус заявки.';
	COMMENT ON COLUMN "public"."OrderState"."lots_requested_id" IS 'Запрошено лотов.';
	COMMENT ON COLUMN "public"."OrderState"."lots_executed_id" IS 'Исполнено лотов.';
	COMMENT ON COLUMN "public"."OrderState"."initial_order_price_id" IS 'Начальная цена заявки. Произведение количества запрошенных лотов на цену.';
	COMMENT ON COLUMN "public"."OrderState"."executed_order_price_id" IS 'Исполненная цена заявки. Произведение средней цены покупки на количество лотов.';
	COMMENT ON COLUMN "public"."OrderState"."total_order_amount_id" IS 'Итоговая стоимость заявки, включающая все комиссии.';
	COMMENT ON COLUMN "public"."OrderState"."average_position_price_id" IS 'Средняя цена позиции по сделке.';
	COMMENT ON COLUMN "public"."OrderState"."initial_commission_id" IS 'Начальная комиссия. Комиссия, рассчитанная на момент подачи заявки.';
	COMMENT ON COLUMN "public"."OrderState"."executed_commission_id" IS 'Фактическая комиссия по итогам исполнения заявки.';
	COMMENT ON COLUMN "public"."OrderState"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OrderState"."direction_id" IS 'Направление заявки.';
	COMMENT ON COLUMN "public"."OrderState"."initial_security_price_id" IS 'Начальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."OrderState"."stages_id" IS 'Стадии выполнения заявки.';
	COMMENT ON COLUMN "public"."OrderState"."service_commission_id" IS 'Сервисная комиссия.';
	COMMENT ON COLUMN "public"."OrderState"."currency_id" IS 'Валюта заявки.';
	COMMENT ON COLUMN "public"."OrderState"."order_type_id" IS 'Тип заявки.';
	COMMENT ON COLUMN "public"."OrderState"."order_date" IS 'Дата и время выставления заявки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."OrderState"."instrument_uid_id" IS 'UID идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OrderState"."order_request_id" IS 'Идентификатор ключа идемпотентности, переданный клиентом.';


CREATE TABLE "public"."OrderTrade" (
	"date_time" timestamptz NULL,
	"price_id" Quotation NULL,
	"quantity_id" bigint NULL,
	"trade_id" text NULL
);
	CREATE INDEX OrderTrade_price_id_idx ON public.OrderTrade USING btree (price_id);
	CREATE INDEX OrderTrade_quantity_id_idx ON public.OrderTrade USING btree (quantity_id);
	CREATE INDEX OrderTrade_trade_id_idx ON public.OrderTrade USING btree (trade_id);
	COMMENT ON TABLE "public"."OrderTrade" IS 'Информация о сделке.';
	COMMENT ON COLUMN "public"."OrderTrade"."date_time" IS 'Дата и время совершения сделки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."OrderTrade"."price_id" IS 'Цена за 1 инструмент, по которой совершена сделка.';
	COMMENT ON COLUMN "public"."OrderTrade"."quantity_id" IS 'Количество штук в сделке.';
	COMMENT ON COLUMN "public"."OrderTrade"."trade_id" IS 'Идентификатор сделки.';


CREATE TABLE "public"."OrderTrades" (
	"order_id" text NULL,
	"created_at" timestamptz NULL,
	"direction_id" OrderDirection NULL,
	"figi_id" text NULL,
	"trades_id" OrderTrade NULL,
	"account_id" text NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX OrderTrades_order_id_idx ON public.OrderTrades USING btree (order_id);
	CREATE INDEX OrderTrades_direction_id_idx ON public.OrderTrades USING btree (direction_id);
	CREATE INDEX OrderTrades_figi_id_idx ON public.OrderTrades USING btree (figi_id);
	CREATE INDEX OrderTrades_trades_id_idx ON public.OrderTrades USING btree (trades_id);
	CREATE INDEX OrderTrades_account_id_idx ON public.OrderTrades USING btree (account_id);
	CREATE INDEX OrderTrades_instrument_uid_id_idx ON public.OrderTrades USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."OrderTrades" IS 'Информация об исполнении торгового поручения.';
	COMMENT ON COLUMN "public"."OrderTrades"."order_id" IS 'Идентификатор торгового поручения.';
	COMMENT ON COLUMN "public"."OrderTrades"."created_at" IS 'Дата и время создания сообщения в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."OrderTrades"."direction_id" IS 'Направление сделки.';
	COMMENT ON COLUMN "public"."OrderTrades"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."OrderTrades"."trades_id" IS 'Массив сделок.';
	COMMENT ON COLUMN "public"."OrderTrades"."account_id" IS 'Идентификатор счёта.';
	COMMENT ON COLUMN "public"."OrderTrades"."instrument_uid_id" IS 'UID идентификатор инструмента.';



CREATE TABLE "public"."PortfolioPosition" (
	"figi_id" text NULL,
	"instrument_type_id" text NULL,
	"quantity_id" Quotation NULL,
	"average_position_price_id" MoneyValue NULL,
	"expected_yield_id" Quotation NULL,
	"current_nkd_id" MoneyValue NULL,
	"average_position_price_pt_id" Quotation NULL,
	"current_price_id" MoneyValue NULL,
	"average_position_price_fifo_id" MoneyValue NULL,
	"quantity_lots_id" Quotation NULL,
	"blocked_id" bool NULL,
	"blocked_lots_id" Quotation NULL,
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL,
	"var_margin_id" MoneyValue NULL,
	"expected_yield_fifo_id" Quotation NULL
);
	CREATE INDEX PortfolioPosition_figi_id_idx ON public.PortfolioPosition USING btree (figi_id);
	CREATE INDEX PortfolioPosition_instrument_type_id_idx ON public.PortfolioPosition USING btree (instrument_type_id);
	CREATE INDEX PortfolioPosition_quantity_id_idx ON public.PortfolioPosition USING btree (quantity_id);
	CREATE INDEX PortfolioPosition_average_position_price_id_idx ON public.PortfolioPosition USING btree (average_position_price_id);
	CREATE INDEX PortfolioPosition_expected_yield_id_idx ON public.PortfolioPosition USING btree (expected_yield_id);
	CREATE INDEX PortfolioPosition_current_nkd_id_idx ON public.PortfolioPosition USING btree (current_nkd_id);
	CREATE INDEX PortfolioPosition_average_position_price_pt_id_idx ON public.PortfolioPosition USING btree (average_position_price_pt_id);
	CREATE INDEX PortfolioPosition_current_price_id_idx ON public.PortfolioPosition USING btree (current_price_id);
	CREATE INDEX PortfolioPosition_average_position_price_fifo_id_idx ON public.PortfolioPosition USING btree (average_position_price_fifo_id);
	CREATE INDEX PortfolioPosition_quantity_lots_id_idx ON public.PortfolioPosition USING btree (quantity_lots_id);
	CREATE INDEX PortfolioPosition_blocked_id_idx ON public.PortfolioPosition USING btree (blocked_id);
	CREATE INDEX PortfolioPosition_blocked_lots_id_idx ON public.PortfolioPosition USING btree (blocked_lots_id);
	CREATE INDEX PortfolioPosition_position_uid_id_idx ON public.PortfolioPosition USING btree (position_uid_id);
	CREATE INDEX PortfolioPosition_instrument_uid_id_idx ON public.PortfolioPosition USING btree (instrument_uid_id);
	CREATE INDEX PortfolioPosition_var_margin_id_idx ON public.PortfolioPosition USING btree (var_margin_id);
	CREATE INDEX PortfolioPosition_expected_yield_fifo_id_idx ON public.PortfolioPosition USING btree (expected_yield_fifo_id);
	COMMENT ON TABLE "public"."PortfolioPosition" IS 'Позиции портфеля.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."figi_id" IS 'Figi-идентификатора инструмента.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."quantity_id" IS 'Количество инструмента в портфеле в штуках.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."average_position_price_id" IS 'Средневзвешенная цена позиции. **Возможна задержка до секунды для пересчёта**.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."expected_yield_id" IS 'Текущая рассчитанная доходность позиции.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."current_nkd_id" IS ' Текущий НКД.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."average_position_price_pt_id" IS ' Deprecated Средняя цена позиции в пунктах (для фьючерсов). **Возможна задержка до секунды для пересчёта**.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."current_price_id" IS 'Текущая цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."average_position_price_fifo_id" IS 'Средняя цена позиции по методу FIFO. **Возможна задержка до секунды для пересчёта**.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."quantity_lots_id" IS 'Deprecated Количество лотов в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."blocked_id" IS 'Заблокировано на бирже.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."blocked_lots_id" IS 'Количество бумаг, заблокированных выставленными заявками.';
	COMMENT ON COLUMN "public"."PortfolioPosition"."position_uid_id" IS 'position_uid-идентификатора инструмента';
	COMMENT ON COLUMN "public"."PortfolioPosition"."instrument_uid_id" IS 'instrument_uid-идентификатора инструмента';
	COMMENT ON COLUMN "public"."PortfolioPosition"."var_margin_id" IS 'Вариационная маржа';
	COMMENT ON COLUMN "public"."PortfolioPosition"."expected_yield_fifo_id" IS 'Текущая рассчитанная доходность позиции.';


CREATE TABLE "public"."PortfolioRequest" (
	"account_id" text NULL,
	"currency_id" CurrencyRequest NULL
);
	CREATE INDEX PortfolioRequest_account_id_idx ON public.PortfolioRequest USING btree (account_id);
	CREATE INDEX PortfolioRequest_currency_id_idx ON public.PortfolioRequest USING btree (currency_id);
	COMMENT ON TABLE "public"."PortfolioRequest" IS 'Запрос получения текущего портфеля по счёту.';
	COMMENT ON COLUMN "public"."PortfolioRequest"."account_id" IS 'Идентификатор счёта пользователя.';
	COMMENT ON COLUMN "public"."PortfolioRequest"."currency_id" IS 'Валюта, в которой требуется рассчитать портфель';


CREATE TABLE "public"."PortfolioResponse" (
	"total_amount_shares_id" MoneyValue NULL,
	"total_amount_bonds_id" MoneyValue NULL,
	"total_amount_etf_id" MoneyValue NULL,
	"total_amount_currencies_id" MoneyValue NULL,
	"total_amount_futures_id" MoneyValue NULL,
	"expected_yield_id" Quotation NULL,
	"positions_id" PortfolioPosition NULL,
	"account_id" text NULL,
	"total_amount_options_id" MoneyValue NULL,
	"total_amount_sp_id" MoneyValue NULL,
	"total_amount_portfolio_id" MoneyValue NULL,
	"virtual_positions_id" VirtualPortfolioPosition NULL
);
	CREATE INDEX PortfolioResponse_total_amount_shares_id_idx ON public.PortfolioResponse USING btree (total_amount_shares_id);
	CREATE INDEX PortfolioResponse_total_amount_bonds_id_idx ON public.PortfolioResponse USING btree (total_amount_bonds_id);
	CREATE INDEX PortfolioResponse_total_amount_etf_id_idx ON public.PortfolioResponse USING btree (total_amount_etf_id);
	CREATE INDEX PortfolioResponse_total_amount_currencies_id_idx ON public.PortfolioResponse USING btree (total_amount_currencies_id);
	CREATE INDEX PortfolioResponse_total_amount_futures_id_idx ON public.PortfolioResponse USING btree (total_amount_futures_id);
	CREATE INDEX PortfolioResponse_expected_yield_id_idx ON public.PortfolioResponse USING btree (expected_yield_id);
	CREATE INDEX PortfolioResponse_positions_id_idx ON public.PortfolioResponse USING btree (positions_id);
	CREATE INDEX PortfolioResponse_account_id_idx ON public.PortfolioResponse USING btree (account_id);
	CREATE INDEX PortfolioResponse_total_amount_options_id_idx ON public.PortfolioResponse USING btree (total_amount_options_id);
	CREATE INDEX PortfolioResponse_total_amount_sp_id_idx ON public.PortfolioResponse USING btree (total_amount_sp_id);
	CREATE INDEX PortfolioResponse_total_amount_portfolio_id_idx ON public.PortfolioResponse USING btree (total_amount_portfolio_id);
	CREATE INDEX PortfolioResponse_virtual_positions_id_idx ON public.PortfolioResponse USING btree (virtual_positions_id);
	COMMENT ON TABLE "public"."PortfolioResponse" IS 'Текущий портфель по счёту.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_shares_id" IS 'Общая стоимость акций в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_bonds_id" IS 'Общая стоимость облигаций в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_etf_id" IS 'Общая стоимость фондов в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_currencies_id" IS 'Общая стоимость валют в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_futures_id" IS 'Общая стоимость фьючерсов в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."expected_yield_id" IS 'Текущая относительная доходность портфеля, в %.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."positions_id" IS 'Список позиций портфеля.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."account_id" IS 'Идентификатор счёта пользователя.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_options_id" IS 'Общая стоимость опционов в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_sp_id" IS 'Общая стоимость структурных нот в портфеле.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."total_amount_portfolio_id" IS 'Общая стоимость портфеля.';
	COMMENT ON COLUMN "public"."PortfolioResponse"."virtual_positions_id" IS 'Массив виртуальных позиций портфеля.';





CREATE TABLE "public"."PositionData" (
	"account_id" text NULL,
	"money_id" PositionsMoney NULL,
	"securities_id" PositionsSecurities NULL,
	"futures_id" PositionsFutures NULL,
	"options_id" PositionsOptions NULL,
	"date" timestamptz NULL
);
	CREATE INDEX PositionData_account_id_idx ON public.PositionData USING btree (account_id);
	CREATE INDEX PositionData_money_id_idx ON public.PositionData USING btree (money_id);
	CREATE INDEX PositionData_securities_id_idx ON public.PositionData USING btree (securities_id);
	CREATE INDEX PositionData_futures_id_idx ON public.PositionData USING btree (futures_id);
	CREATE INDEX PositionData_options_id_idx ON public.PositionData USING btree (options_id);
	COMMENT ON TABLE "public"."PositionData" IS 'Данные о позиции портфеля.';
	COMMENT ON COLUMN "public"."PositionData"."account_id" IS 'Идентификатор счёта.';
	COMMENT ON COLUMN "public"."PositionData"."money_id" IS 'Массив валютных позиций портфеля.';
	COMMENT ON COLUMN "public"."PositionData"."securities_id" IS 'Список ценно-бумажных позиций портфеля.';
	COMMENT ON COLUMN "public"."PositionData"."futures_id" IS 'Список фьючерсов портфеля.';
	COMMENT ON COLUMN "public"."PositionData"."options_id" IS 'Список опционов портфеля.';
	COMMENT ON COLUMN "public"."PositionData"."date" IS 'Дата и время операции в формате UTC.';


CREATE TABLE "public"."PositionsFutures" (
	"figi_id" text NULL,
	"blocked_id" bigint NULL,
	"balance_id" bigint NULL,
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX PositionsFutures_figi_id_idx ON public.PositionsFutures USING btree (figi_id);
	CREATE INDEX PositionsFutures_blocked_id_idx ON public.PositionsFutures USING btree (blocked_id);
	CREATE INDEX PositionsFutures_balance_id_idx ON public.PositionsFutures USING btree (balance_id);
	CREATE INDEX PositionsFutures_position_uid_id_idx ON public.PositionsFutures USING btree (position_uid_id);
	CREATE INDEX PositionsFutures_instrument_uid_id_idx ON public.PositionsFutures USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."PositionsFutures" IS 'Баланс фьючерса.';
	COMMENT ON COLUMN "public"."PositionsFutures"."figi_id" IS 'Figi-идентификатор фьючерса.';
	COMMENT ON COLUMN "public"."PositionsFutures"."blocked_id" IS 'Количество бумаг заблокированных выставленными заявками.';
	COMMENT ON COLUMN "public"."PositionsFutures"."balance_id" IS 'Текущий незаблокированный баланс.';
	COMMENT ON COLUMN "public"."PositionsFutures"."position_uid_id" IS 'Уникальный идентификатор позиции.';
	COMMENT ON COLUMN "public"."PositionsFutures"."instrument_uid_id" IS 'Уникальный идентификатор  инструмента.';


CREATE TABLE "public"."PositionsMoney" (
	"available_value_id" MoneyValue NULL,
	"blocked_value_id" MoneyValue NULL
);
	CREATE INDEX PositionsMoney_available_value_id_idx ON public.PositionsMoney USING btree (available_value_id);
	CREATE INDEX PositionsMoney_blocked_value_id_idx ON public.PositionsMoney USING btree (blocked_value_id);
	COMMENT ON TABLE "public"."PositionsMoney" IS 'Валютная позиция портфеля.';
	COMMENT ON COLUMN "public"."PositionsMoney"."available_value_id" IS 'Доступное количество валютный позиций.';
	COMMENT ON COLUMN "public"."PositionsMoney"."blocked_value_id" IS 'Заблокированное количество валютный позиций.';


CREATE TABLE "public"."PositionsOptions" (
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL,
	"blocked_id" bigint NULL,
	"balance_id" bigint NULL
);
	CREATE INDEX PositionsOptions_position_uid_id_idx ON public.PositionsOptions USING btree (position_uid_id);
	CREATE INDEX PositionsOptions_instrument_uid_id_idx ON public.PositionsOptions USING btree (instrument_uid_id);
	CREATE INDEX PositionsOptions_blocked_id_idx ON public.PositionsOptions USING btree (blocked_id);
	CREATE INDEX PositionsOptions_balance_id_idx ON public.PositionsOptions USING btree (balance_id);
	COMMENT ON TABLE "public"."PositionsOptions" IS 'Баланс опциона.';
	COMMENT ON COLUMN "public"."PositionsOptions"."position_uid_id" IS 'Уникальный идентификатор позиции опциона.';
	COMMENT ON COLUMN "public"."PositionsOptions"."instrument_uid_id" IS 'Уникальный идентификатор  инструмента.';
	COMMENT ON COLUMN "public"."PositionsOptions"."blocked_id" IS 'Количество бумаг заблокированных выставленными заявками.';
	COMMENT ON COLUMN "public"."PositionsOptions"."balance_id" IS 'Текущий незаблокированный баланс.';



CREATE TABLE "public"."PositionsResponse" (
	"money_id" MoneyValue NULL,
	"blocked_id" MoneyValue NULL,
	"securities_id" PositionsSecurities NULL,
	"limits_loading_in_progress_id" bool NULL,
	"futures_id" PositionsFutures NULL,
	"options_id" PositionsOptions NULL
);
	CREATE INDEX PositionsResponse_money_id_idx ON public.PositionsResponse USING btree (money_id);
	CREATE INDEX PositionsResponse_blocked_id_idx ON public.PositionsResponse USING btree (blocked_id);
	CREATE INDEX PositionsResponse_securities_id_idx ON public.PositionsResponse USING btree (securities_id);
	CREATE INDEX PositionsResponse_limits_loading_in_progress_id_idx ON public.PositionsResponse USING btree (limits_loading_in_progress_id);
	CREATE INDEX PositionsResponse_futures_id_idx ON public.PositionsResponse USING btree (futures_id);
	CREATE INDEX PositionsResponse_options_id_idx ON public.PositionsResponse USING btree (options_id);
	COMMENT ON TABLE "public"."PositionsResponse" IS 'Список позиций по счёту.';
	COMMENT ON COLUMN "public"."PositionsResponse"."money_id" IS 'Массив валютных позиций портфеля.';
	COMMENT ON COLUMN "public"."PositionsResponse"."blocked_id" IS 'Массив заблокированных валютных позиций портфеля.';
	COMMENT ON COLUMN "public"."PositionsResponse"."securities_id" IS 'Список ценно-бумажных позиций портфеля.';
	COMMENT ON COLUMN "public"."PositionsResponse"."limits_loading_in_progress_id" IS 'Признак идущей в данный момент выгрузки лимитов.';
	COMMENT ON COLUMN "public"."PositionsResponse"."futures_id" IS 'Список фьючерсов портфеля.';
	COMMENT ON COLUMN "public"."PositionsResponse"."options_id" IS 'Список опционов портфеля.';


CREATE TABLE "public"."PositionsSecurities" (
	"figi_id" text NULL,
	"blocked_id" bigint NULL,
	"balance_id" bigint NULL,
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL,
	"exchange_blocked_id" bool NULL,
	"instrument_type_id" text NULL
);
	CREATE INDEX PositionsSecurities_figi_id_idx ON public.PositionsSecurities USING btree (figi_id);
	CREATE INDEX PositionsSecurities_blocked_id_idx ON public.PositionsSecurities USING btree (blocked_id);
	CREATE INDEX PositionsSecurities_balance_id_idx ON public.PositionsSecurities USING btree (balance_id);
	CREATE INDEX PositionsSecurities_position_uid_id_idx ON public.PositionsSecurities USING btree (position_uid_id);
	CREATE INDEX PositionsSecurities_instrument_uid_id_idx ON public.PositionsSecurities USING btree (instrument_uid_id);
	CREATE INDEX PositionsSecurities_exchange_blocked_id_idx ON public.PositionsSecurities USING btree (exchange_blocked_id);
	CREATE INDEX PositionsSecurities_instrument_type_id_idx ON public.PositionsSecurities USING btree (instrument_type_id);
	COMMENT ON TABLE "public"."PositionsSecurities" IS 'Баланс позиции ценной бумаги.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."figi_id" IS 'Figi-идентификатор бумаги.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."blocked_id" IS 'Количество бумаг заблокированных выставленными заявками.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."balance_id" IS 'Текущий незаблокированный баланс.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."position_uid_id" IS 'Уникальный идентификатор позиции.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."instrument_uid_id" IS 'Уникальный идентификатор  инструмента.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."exchange_blocked_id" IS 'Заблокировано на бирже.';
	COMMENT ON COLUMN "public"."PositionsSecurities"."instrument_type_id" IS 'Тип инструмента.';





CREATE TABLE "public"."PositionsSubscriptionStatus" (
	"account_id" text NULL,
	"subscription_status_id" PositionsAccountSubscriptionStatus NULL
);
	CREATE INDEX PositionsSubscriptionStatus_account_id_idx ON public.PositionsSubscriptionStatus USING btree (account_id);
	CREATE INDEX PositionsSubscriptionStatus_subscription_status_id_idx ON public.PositionsSubscriptionStatus USING btree (subscription_status_id);
	COMMENT ON TABLE "public"."PositionsSubscriptionStatus" IS 'Счет клиента.';
	COMMENT ON COLUMN "public"."PositionsSubscriptionStatus"."account_id" IS 'Идентификатор счёта';
	COMMENT ON COLUMN "public"."PositionsSubscriptionStatus"."subscription_status_id" IS 'Результат подписки.';


CREATE TABLE "public"."PostOrderRequest" (
	"figi_id" text NULL,
	"quantity_id" bigint NULL,
	"price_id" Quotation NULL,
	"direction_id" OrderDirection NULL,
	"account_id" text NULL,
	"order_type_id" OrderType NULL,
	"order_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX PostOrderRequest_figi_id_idx ON public.PostOrderRequest USING btree (figi_id);
	CREATE INDEX PostOrderRequest_quantity_id_idx ON public.PostOrderRequest USING btree (quantity_id);
	CREATE INDEX PostOrderRequest_price_id_idx ON public.PostOrderRequest USING btree (price_id);
	CREATE INDEX PostOrderRequest_direction_id_idx ON public.PostOrderRequest USING btree (direction_id);
	CREATE INDEX PostOrderRequest_account_id_idx ON public.PostOrderRequest USING btree (account_id);
	CREATE INDEX PostOrderRequest_order_type_id_idx ON public.PostOrderRequest USING btree (order_type_id);
	CREATE INDEX PostOrderRequest_order_id_idx ON public.PostOrderRequest USING btree (order_id);
	CREATE INDEX PostOrderRequest_instrument_id_idx ON public.PostOrderRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."PostOrderRequest" IS 'Запрос выставления торгового поручения.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."quantity_id" IS 'Количество лотов.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Игнорируется для рыночных поручений.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."direction_id" IS 'Направление операции.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."account_id" IS 'Номер счёта.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."order_type_id" IS 'Тип заявки.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."order_id" IS 'Идентификатор запроса выставления поручения для целей идемпотентности. Максимальная длина 36 символов.';
	COMMENT ON COLUMN "public"."PostOrderRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значения Figi или Instrument_uid.';


CREATE TABLE "public"."PostOrderResponse" (
	"order_id" text NULL,
	"execution_report_status_id" OrderExecutionReportStatus NULL,
	"lots_requested_id" bigint NULL,
	"lots_executed_id" bigint NULL,
	"initial_order_price_id" MoneyValue NULL,
	"executed_order_price_id" MoneyValue NULL,
	"total_order_amount_id" MoneyValue NULL,
	"initial_commission_id" MoneyValue NULL,
	"executed_commission_id" MoneyValue NULL,
	"aci_value_id" MoneyValue NULL,
	"figi_id" text NULL,
	"direction_id" OrderDirection NULL,
	"initial_security_price_id" MoneyValue NULL,
	"order_type_id" OrderType NULL,
	"message_id" text NULL,
	"initial_order_price_pt_id" Quotation NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX PostOrderResponse_order_id_idx ON public.PostOrderResponse USING btree (order_id);
	CREATE INDEX PostOrderResponse_execution_report_status_id_idx ON public.PostOrderResponse USING btree (execution_report_status_id);
	CREATE INDEX PostOrderResponse_lots_requested_id_idx ON public.PostOrderResponse USING btree (lots_requested_id);
	CREATE INDEX PostOrderResponse_lots_executed_id_idx ON public.PostOrderResponse USING btree (lots_executed_id);
	CREATE INDEX PostOrderResponse_initial_order_price_id_idx ON public.PostOrderResponse USING btree (initial_order_price_id);
	CREATE INDEX PostOrderResponse_executed_order_price_id_idx ON public.PostOrderResponse USING btree (executed_order_price_id);
	CREATE INDEX PostOrderResponse_total_order_amount_id_idx ON public.PostOrderResponse USING btree (total_order_amount_id);
	CREATE INDEX PostOrderResponse_initial_commission_id_idx ON public.PostOrderResponse USING btree (initial_commission_id);
	CREATE INDEX PostOrderResponse_executed_commission_id_idx ON public.PostOrderResponse USING btree (executed_commission_id);
	CREATE INDEX PostOrderResponse_aci_value_id_idx ON public.PostOrderResponse USING btree (aci_value_id);
	CREATE INDEX PostOrderResponse_figi_id_idx ON public.PostOrderResponse USING btree (figi_id);
	CREATE INDEX PostOrderResponse_direction_id_idx ON public.PostOrderResponse USING btree (direction_id);
	CREATE INDEX PostOrderResponse_initial_security_price_id_idx ON public.PostOrderResponse USING btree (initial_security_price_id);
	CREATE INDEX PostOrderResponse_order_type_id_idx ON public.PostOrderResponse USING btree (order_type_id);
	CREATE INDEX PostOrderResponse_message_id_idx ON public.PostOrderResponse USING btree (message_id);
	CREATE INDEX PostOrderResponse_initial_order_price_pt_id_idx ON public.PostOrderResponse USING btree (initial_order_price_pt_id);
	CREATE INDEX PostOrderResponse_instrument_uid_id_idx ON public.PostOrderResponse USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."PostOrderResponse" IS 'Информация о выставлении поручения.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."order_id" IS 'Биржевой идентификатор заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."execution_report_status_id" IS 'Текущий статус заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."lots_requested_id" IS 'Запрошено лотов.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."lots_executed_id" IS 'Исполнено лотов.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."initial_order_price_id" IS 'Начальная цена заявки. Произведение количества запрошенных лотов на цену.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."executed_order_price_id" IS 'Исполненная средняя цена 1 одного инструмента в заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."total_order_amount_id" IS 'Итоговая стоимость заявки, включающая все комиссии.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."initial_commission_id" IS 'Начальная комиссия. Комиссия рассчитанная при выставлении заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."executed_commission_id" IS 'Фактическая комиссия по итогам исполнения заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."aci_value_id" IS 'Значение НКД (накопленного купонного дохода) на дату. Подробнее: [НКД при выставлении торговых поручений](https://tinkoff.github.io/investAPI/head-orders#coupon)';
	COMMENT ON COLUMN "public"."PostOrderResponse"."figi_id" IS ' Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."direction_id" IS 'Направление сделки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."initial_security_price_id" IS 'Начальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."order_type_id" IS 'Тип заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."message_id" IS 'Дополнительные данные об исполнении заявки.';
	COMMENT ON COLUMN "public"."PostOrderResponse"."initial_order_price_pt_id" IS 'Начальная цена заявки в пунктах (для фьючерсов).';
	COMMENT ON COLUMN "public"."PostOrderResponse"."instrument_uid_id" IS 'UID идентификатор инструмента.';


CREATE TABLE "public"."PostStopOrderRequest" (
	"figi_id" text NULL,
	"quantity_id" bigint NULL,
	"price_id" Quotation NULL,
	"stop_price_id" Quotation NULL,
	"direction_id" StopOrderDirection NULL,
	"account_id" text NULL,
	"expiration_type_id" StopOrderExpirationType NULL,
	"stop_order_type_id" StopOrderType NULL,
	"expire_date" timestamptz NULL,
	"instrument_id" text NULL
);
	CREATE INDEX PostStopOrderRequest_figi_id_idx ON public.PostStopOrderRequest USING btree (figi_id);
	CREATE INDEX PostStopOrderRequest_quantity_id_idx ON public.PostStopOrderRequest USING btree (quantity_id);
	CREATE INDEX PostStopOrderRequest_price_id_idx ON public.PostStopOrderRequest USING btree (price_id);
	CREATE INDEX PostStopOrderRequest_stop_price_id_idx ON public.PostStopOrderRequest USING btree (stop_price_id);
	CREATE INDEX PostStopOrderRequest_direction_id_idx ON public.PostStopOrderRequest USING btree (direction_id);
	CREATE INDEX PostStopOrderRequest_account_id_idx ON public.PostStopOrderRequest USING btree (account_id);
	CREATE INDEX PostStopOrderRequest_expiration_type_id_idx ON public.PostStopOrderRequest USING btree (expiration_type_id);
	CREATE INDEX PostStopOrderRequest_stop_order_type_id_idx ON public.PostStopOrderRequest USING btree (stop_order_type_id);
	CREATE INDEX PostStopOrderRequest_instrument_id_idx ON public.PostStopOrderRequest USING btree (instrument_id);
	COMMENT ON TABLE "public"."PostStopOrderRequest" IS 'Запрос выставления стоп-заявки.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."quantity_id" IS 'Количество лотов.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."stop_price_id" IS 'Стоп-цена заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."direction_id" IS 'Направление операции.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."account_id" IS 'Номер счёта.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."expiration_type_id" IS 'Тип экспирации заявки.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."stop_order_type_id" IS 'Тип заявки.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."expire_date" IS 'Дата и время окончания действия стоп-заявки в часовом поясе UTC. **Для ExpirationType = GoodTillDate заполнение обязательно**.';
	COMMENT ON COLUMN "public"."PostStopOrderRequest"."instrument_id" IS 'Идентификатор инструмента, принимает значения Figi или instrument_uid.';



CREATE TABLE "public"."Quotation" (
	"units_id" bigint NULL,
	"nano_id" integer NULL
);
	CREATE INDEX Quotation_units_id_idx ON public.Quotation USING btree (units_id);
	CREATE INDEX Quotation_nano_id_idx ON public.Quotation USING btree (nano_id);
	COMMENT ON TABLE "public"."Quotation" IS 'Котировка - денежная сумма без указания валюты';
	COMMENT ON COLUMN "public"."Quotation"."units_id" IS ' целая часть суммы, может быть отрицательным числом';
	COMMENT ON COLUMN "public"."Quotation"."nano_id" IS ' дробная часть суммы, может быть отрицательным числом';


CREATE TABLE "public"."ReplaceOrderRequest" (
	"account_id" text NULL,
	"order_id" text NULL,
	"idempotency_key_id" text NULL,
	"quantity_id" bigint NULL,
	"price_id" Quotation NULL,
	"price_type_id" PriceType NULL
);
	CREATE INDEX ReplaceOrderRequest_account_id_idx ON public.ReplaceOrderRequest USING btree (account_id);
	CREATE INDEX ReplaceOrderRequest_order_id_idx ON public.ReplaceOrderRequest USING btree (order_id);
	CREATE INDEX ReplaceOrderRequest_idempotency_key_id_idx ON public.ReplaceOrderRequest USING btree (idempotency_key_id);
	CREATE INDEX ReplaceOrderRequest_quantity_id_idx ON public.ReplaceOrderRequest USING btree (quantity_id);
	CREATE INDEX ReplaceOrderRequest_price_id_idx ON public.ReplaceOrderRequest USING btree (price_id);
	CREATE INDEX ReplaceOrderRequest_price_type_id_idx ON public.ReplaceOrderRequest USING btree (price_type_id);
	COMMENT ON TABLE "public"."ReplaceOrderRequest" IS 'Запрос изменения выставленной заявки.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."account_id" IS 'Номер счета.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."order_id" IS 'Идентификатор заявки на бирже.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."idempotency_key_id" IS 'Новый идентификатор запроса выставления поручения для целей идемпотентности. Максимальная длина 36 символов. Перезатирает старый ключ.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."quantity_id" IS 'Количество лотов.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."price_id" IS 'Цена за 1 инструмент.';
	COMMENT ON COLUMN "public"."ReplaceOrderRequest"."price_type_id" IS 'Тип цены.';


CREATE TABLE "public"."Share" (
	"figi_id" text NULL,
	"ticker_id" text NULL,
	"class_code_id" text NULL,
	"isin_id" text NULL,
	"lot_id" integer NULL,
	"currency_id" text NULL,
	"klong_id" Quotation NULL,
	"kshort_id" Quotation NULL,
	"dlong_id" Quotation NULL,
	"dshort_id" Quotation NULL,
	"dlong_min_id" Quotation NULL,
	"dshort_min_id" Quotation NULL,
	"short_enabled_flag_id" bool NULL,
	"name_id" text NULL,
	"exchange_id" text NULL,
	"ipo_date" timestamptz NULL,
	"issue_size_id" bigint NULL,
	"country_of_risk_id" text NULL,
	"country_of_risk_name_id" text NULL,
	"sector_id" text NULL,
	"issue_size_plan_id" bigint NULL,
	"nominal_id" MoneyValue NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"otc_flag_id" bool NULL,
	"buy_available_flag_id" bool NULL,
	"sell_available_flag_id" bool NULL,
	"div_yield_flag_id" bool NULL,
	"share_type_id" ShareType NULL,
	"min_price_increment_id" Quotation NULL,
	"api_trade_available_flag_id" bool NULL,
	"uid_id" text NULL,
	"real_exchange_id" RealExchange NULL,
	"position_uid_id" text NULL,
	"for_iis_flag_id" bool NULL,
	"for_qual_investor_flag_id" bool NULL,
	"weekend_flag_id" bool NULL,
	"blocked_tca_flag_id" bool NULL,
	"liquidity_flag_id" bool NULL,
	"first_1min_candle_date" timestamptz NULL,
	"first_1day_candle_date" timestamptz NULL,
	CONSTRAINT Share_pk PRIMARY KEY (uid)
);
	CREATE INDEX Share_figi_id_idx ON public.Share USING btree (figi_id);
	CREATE INDEX Share_ticker_id_idx ON public.Share USING btree (ticker_id);
	CREATE INDEX Share_class_code_id_idx ON public.Share USING btree (class_code_id);
	CREATE INDEX Share_isin_id_idx ON public.Share USING btree (isin_id);
	CREATE INDEX Share_lot_id_idx ON public.Share USING btree (lot_id);
	CREATE INDEX Share_currency_id_idx ON public.Share USING btree (currency_id);
	CREATE INDEX Share_klong_id_idx ON public.Share USING btree (klong_id);
	CREATE INDEX Share_kshort_id_idx ON public.Share USING btree (kshort_id);
	CREATE INDEX Share_dlong_id_idx ON public.Share USING btree (dlong_id);
	CREATE INDEX Share_dshort_id_idx ON public.Share USING btree (dshort_id);
	CREATE INDEX Share_dlong_min_id_idx ON public.Share USING btree (dlong_min_id);
	CREATE INDEX Share_dshort_min_id_idx ON public.Share USING btree (dshort_min_id);
	CREATE INDEX Share_short_enabled_flag_id_idx ON public.Share USING btree (short_enabled_flag_id);
	CREATE INDEX Share_name_id_idx ON public.Share USING btree (name_id);
	CREATE INDEX Share_exchange_id_idx ON public.Share USING btree (exchange_id);
	CREATE INDEX Share_issue_size_id_idx ON public.Share USING btree (issue_size_id);
	CREATE INDEX Share_country_of_risk_id_idx ON public.Share USING btree (country_of_risk_id);
	CREATE INDEX Share_country_of_risk_name_id_idx ON public.Share USING btree (country_of_risk_name_id);
	CREATE INDEX Share_sector_id_idx ON public.Share USING btree (sector_id);
	CREATE INDEX Share_issue_size_plan_id_idx ON public.Share USING btree (issue_size_plan_id);
	CREATE INDEX Share_nominal_id_idx ON public.Share USING btree (nominal_id);
	CREATE INDEX Share_trading_status_id_idx ON public.Share USING btree (trading_status_id);
	CREATE INDEX Share_otc_flag_id_idx ON public.Share USING btree (otc_flag_id);
	CREATE INDEX Share_buy_available_flag_id_idx ON public.Share USING btree (buy_available_flag_id);
	CREATE INDEX Share_sell_available_flag_id_idx ON public.Share USING btree (sell_available_flag_id);
	CREATE INDEX Share_div_yield_flag_id_idx ON public.Share USING btree (div_yield_flag_id);
	CREATE INDEX Share_share_type_id_idx ON public.Share USING btree (share_type_id);
	CREATE INDEX Share_min_price_increment_id_idx ON public.Share USING btree (min_price_increment_id);
	CREATE INDEX Share_api_trade_available_flag_id_idx ON public.Share USING btree (api_trade_available_flag_id);
	CREATE INDEX Share_uid_id_idx ON public.Share USING btree (uid_id);
	CREATE INDEX Share_real_exchange_id_idx ON public.Share USING btree (real_exchange_id);
	CREATE INDEX Share_position_uid_id_idx ON public.Share USING btree (position_uid_id);
	CREATE INDEX Share_for_iis_flag_id_idx ON public.Share USING btree (for_iis_flag_id);
	CREATE INDEX Share_for_qual_investor_flag_id_idx ON public.Share USING btree (for_qual_investor_flag_id);
	CREATE INDEX Share_weekend_flag_id_idx ON public.Share USING btree (weekend_flag_id);
	CREATE INDEX Share_blocked_tca_flag_id_idx ON public.Share USING btree (blocked_tca_flag_id);
	CREATE INDEX Share_liquidity_flag_id_idx ON public.Share USING btree (liquidity_flag_id);
	COMMENT ON TABLE "public"."Share" IS 'Объект передачи информации об акции.';
	COMMENT ON COLUMN "public"."Share"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Share"."ticker_id" IS 'Тикер инструмента.';
	COMMENT ON COLUMN "public"."Share"."class_code_id" IS 'Класс-код (секция торгов).';
	COMMENT ON COLUMN "public"."Share"."isin_id" IS 'Isin-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Share"."lot_id" IS 'Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру *lot*. Подробнее: [лот](https://tinkoff.github.io/investAPI/glossary#lot)';
	COMMENT ON COLUMN "public"."Share"."currency_id" IS 'Валюта расчётов.';
	COMMENT ON COLUMN "public"."Share"."klong_id" IS 'Коэффициент ставки риска длинной позиции по инструменту.';
	COMMENT ON COLUMN "public"."Share"."kshort_id" IS 'Коэффициент ставки риска короткой позиции по инструменту.';
	COMMENT ON COLUMN "public"."Share"."dlong_id" IS 'Ставка риска минимальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Share"."dshort_id" IS 'Ставка риска минимальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Share"."dlong_min_id" IS 'Ставка риска начальной маржи в лонг. Подробнее: [ставка риска в лонг](https://help.tinkoff.ru/margin-trade/long/risk-rate/)';
	COMMENT ON COLUMN "public"."Share"."dshort_min_id" IS 'Ставка риска начальной маржи в шорт. Подробнее: [ставка риска в шорт](https://help.tinkoff.ru/margin-trade/short/risk-rate/)';
	COMMENT ON COLUMN "public"."Share"."short_enabled_flag_id" IS 'Признак доступности для операций в шорт.';
	COMMENT ON COLUMN "public"."Share"."name_id" IS 'Название инструмента.';
	COMMENT ON COLUMN "public"."Share"."exchange_id" IS 'Торговая площадка.';
	COMMENT ON COLUMN "public"."Share"."ipo_date" IS 'Дата IPO акции в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."Share"."issue_size_id" IS 'Размер выпуска.';
	COMMENT ON COLUMN "public"."Share"."country_of_risk_id" IS 'Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Share"."country_of_risk_name_id" IS 'Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.';
	COMMENT ON COLUMN "public"."Share"."sector_id" IS 'Сектор экономики.';
	COMMENT ON COLUMN "public"."Share"."issue_size_plan_id" IS 'Плановый размер выпуска.';
	COMMENT ON COLUMN "public"."Share"."nominal_id" IS 'Номинал.';
	COMMENT ON COLUMN "public"."Share"."trading_status_id" IS 'Текущий режим торгов инструмента.';
	COMMENT ON COLUMN "public"."Share"."otc_flag_id" IS 'Признак внебиржевой ценной бумаги.';
	COMMENT ON COLUMN "public"."Share"."buy_available_flag_id" IS 'Признак доступности для покупки.';
	COMMENT ON COLUMN "public"."Share"."sell_available_flag_id" IS 'Признак доступности для продажи.';
	COMMENT ON COLUMN "public"."Share"."div_yield_flag_id" IS 'Признак наличия дивидендной доходности.';
	COMMENT ON COLUMN "public"."Share"."share_type_id" IS 'Тип акции. Возможные значения: [ShareType](https://tinkoff.github.io/investAPI/instruments#sharetype)';
	COMMENT ON COLUMN "public"."Share"."min_price_increment_id" IS 'Шаг цены.';
	COMMENT ON COLUMN "public"."Share"."api_trade_available_flag_id" IS 'Параметр указывает на возможность торговать инструментом через API.';
	COMMENT ON COLUMN "public"."Share"."uid_id" IS 'Уникальный идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Share"."real_exchange_id" IS 'Реальная площадка исполнения расчётов.';
	COMMENT ON COLUMN "public"."Share"."position_uid_id" IS 'Уникальный идентификатор позиции инструмента.';
	COMMENT ON COLUMN "public"."Share"."for_iis_flag_id" IS 'Признак доступности для ИИС.';
	COMMENT ON COLUMN "public"."Share"."for_qual_investor_flag_id" IS 'Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.';
	COMMENT ON COLUMN "public"."Share"."weekend_flag_id" IS 'Флаг отображающий доступность торговли инструментом по выходным';
	COMMENT ON COLUMN "public"."Share"."blocked_tca_flag_id" IS 'Флаг заблокированного ТКС';
	COMMENT ON COLUMN "public"."Share"."liquidity_flag_id" IS 'Флаг достаточной ликвидности';
	COMMENT ON COLUMN "public"."Share"."first_1min_candle_date" IS 'Дата первой минутной свечи.';
	COMMENT ON COLUMN "public"."Share"."first_1day_candle_date" IS 'Дата первой дневной свечи.';




CREATE TABLE "public"."StopOrder" (
	"stop_order_id" text NULL,
	"lots_requested_id" bigint NULL,
	"figi_id" text NULL,
	"direction_id" StopOrderDirection NULL,
	"currency_id" text NULL,
	"order_type_id" StopOrderType NULL,
	"create_date" timestamptz NULL,
	"activation_date_time" timestamptz NULL,
	"expiration_time" timestamptz NULL,
	"price_id" MoneyValue NULL,
	"stop_price_id" MoneyValue NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX StopOrder_stop_order_id_idx ON public.StopOrder USING btree (stop_order_id);
	CREATE INDEX StopOrder_lots_requested_id_idx ON public.StopOrder USING btree (lots_requested_id);
	CREATE INDEX StopOrder_figi_id_idx ON public.StopOrder USING btree (figi_id);
	CREATE INDEX StopOrder_direction_id_idx ON public.StopOrder USING btree (direction_id);
	CREATE INDEX StopOrder_currency_id_idx ON public.StopOrder USING btree (currency_id);
	CREATE INDEX StopOrder_order_type_id_idx ON public.StopOrder USING btree (order_type_id);
	CREATE INDEX StopOrder_price_id_idx ON public.StopOrder USING btree (price_id);
	CREATE INDEX StopOrder_stop_price_id_idx ON public.StopOrder USING btree (stop_price_id);
	CREATE INDEX StopOrder_instrument_uid_id_idx ON public.StopOrder USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."StopOrder" IS 'Информация о стоп-заявке.';
	COMMENT ON COLUMN "public"."StopOrder"."stop_order_id" IS 'Идентификатор-идентификатор стоп-заявки.';
	COMMENT ON COLUMN "public"."StopOrder"."lots_requested_id" IS 'Запрошено лотов.';
	COMMENT ON COLUMN "public"."StopOrder"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."StopOrder"."direction_id" IS 'Направление операции.';
	COMMENT ON COLUMN "public"."StopOrder"."currency_id" IS 'Валюта стоп-заявки.';
	COMMENT ON COLUMN "public"."StopOrder"."order_type_id" IS 'Тип стоп-заявки.';
	COMMENT ON COLUMN "public"."StopOrder"."create_date" IS 'Дата и время выставления заявки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."StopOrder"."activation_date_time" IS 'Дата и время конвертации стоп-заявки в биржевую в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."StopOrder"."expiration_time" IS 'Дата и время снятия заявки в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."StopOrder"."price_id" IS 'Цена заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."StopOrder"."stop_price_id" IS 'Цена активации стоп-заявки за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."StopOrder"."instrument_uid_id" IS 'instrument_uid идентификатор инструмента.';


CREATE TABLE "public"."StreamLimit" (
	"limit_id" integer NULL,
	"streams_id" text NULL,
	"open_id" integer NULL
);
	CREATE INDEX StreamLimit_limit_id_idx ON public.StreamLimit USING btree (limit_id);
	CREATE INDEX StreamLimit_streams_id_idx ON public.StreamLimit USING btree (streams_id);
	CREATE INDEX StreamLimit_open_id_idx ON public.StreamLimit USING btree (open_id);
	COMMENT ON TABLE "public"."StreamLimit" IS 'Лимит stream-соединений.';
	COMMENT ON COLUMN "public"."StreamLimit"."limit_id" IS 'Максимальное количество stream-соединений.';
	COMMENT ON COLUMN "public"."StreamLimit"."streams_id" IS 'Названия stream-методов.';
	COMMENT ON COLUMN "public"."StreamLimit"."open_id" IS 'Текущее количество открытых stream-соединений.';


CREATE TABLE "public"."SubscribeCandlesRequest" (
	"subscription_action_id" SubscriptionAction NULL,
	"instruments_id" CandleInstrument NULL,
	"waiting_close_id" bool NULL
);
	CREATE INDEX SubscribeCandlesRequest_subscription_action_id_idx ON public.SubscribeCandlesRequest USING btree (subscription_action_id);
	CREATE INDEX SubscribeCandlesRequest_instruments_id_idx ON public.SubscribeCandlesRequest USING btree (instruments_id);
	CREATE INDEX SubscribeCandlesRequest_waiting_close_id_idx ON public.SubscribeCandlesRequest USING btree (waiting_close_id);
	COMMENT ON TABLE "public"."SubscribeCandlesRequest" IS ' subscribeCandles | Изменения статуса подписки на свечи.';
	COMMENT ON COLUMN "public"."SubscribeCandlesRequest"."subscription_action_id" IS 'Изменение статуса подписки.';
	COMMENT ON COLUMN "public"."SubscribeCandlesRequest"."instruments_id" IS 'Массив инструментов для подписки на свечи.';
	COMMENT ON COLUMN "public"."SubscribeCandlesRequest"."waiting_close_id" IS 'Флаг ожидания закрытия временного интервала для отправки свечи, применяется только для минутных свечей.';


CREATE TABLE "public"."SubscribeCandlesResponse" (
	"tracking_id" text NULL,
	"candles_subscriptions_id" CandleSubscription NULL
);
	CREATE INDEX SubscribeCandlesResponse_tracking_id_idx ON public.SubscribeCandlesResponse USING btree (tracking_id);
	CREATE INDEX SubscribeCandlesResponse_candles_subscriptions_id_idx ON public.SubscribeCandlesResponse USING btree (candles_subscriptions_id);
	COMMENT ON TABLE "public"."SubscribeCandlesResponse" IS 'Результат изменения статус подписки на свечи.';
	COMMENT ON COLUMN "public"."SubscribeCandlesResponse"."tracking_id" IS 'Уникальный идентификатор запроса, подробнее: [tracking_id](https://tinkoff.github.io/investAPI/grpc#tracking-id).';
	COMMENT ON COLUMN "public"."SubscribeCandlesResponse"."candles_subscriptions_id" IS 'Массив статусов подписки на свечи.';


CREATE TABLE "public"."SubscribeInfoRequest" (
	"subscription_action_id" SubscriptionAction NULL,
	"instruments_id" InfoInstrument NULL
);
	CREATE INDEX SubscribeInfoRequest_subscription_action_id_idx ON public.SubscribeInfoRequest USING btree (subscription_action_id);
	CREATE INDEX SubscribeInfoRequest_instruments_id_idx ON public.SubscribeInfoRequest USING btree (instruments_id);
	COMMENT ON TABLE "public"."SubscribeInfoRequest" IS 'Изменение статуса подписки на торговый статус инструмента.';
	COMMENT ON COLUMN "public"."SubscribeInfoRequest"."subscription_action_id" IS 'Изменение статуса подписки.';
	COMMENT ON COLUMN "public"."SubscribeInfoRequest"."instruments_id" IS 'Массив инструментов для подписки на торговый статус.';


CREATE TABLE "public"."SubscribeInfoResponse" (
	"tracking_id" text NULL,
	"info_subscriptions_id" InfoSubscription NULL
);
	CREATE INDEX SubscribeInfoResponse_tracking_id_idx ON public.SubscribeInfoResponse USING btree (tracking_id);
	CREATE INDEX SubscribeInfoResponse_info_subscriptions_id_idx ON public.SubscribeInfoResponse USING btree (info_subscriptions_id);
	COMMENT ON TABLE "public"."SubscribeInfoResponse" IS 'Результат изменения статуса подписки на торговый статус.';
	COMMENT ON COLUMN "public"."SubscribeInfoResponse"."tracking_id" IS 'Уникальный идентификатор запроса, подробнее: [tracking_id](https://tinkoff.github.io/investAPI/grpc#tracking-id).';
	COMMENT ON COLUMN "public"."SubscribeInfoResponse"."info_subscriptions_id" IS 'Массив статусов подписки на торговый статус.';


CREATE TABLE "public"."SubscribeLastPriceRequest" (
	"subscription_action_id" SubscriptionAction NULL,
	"instruments_id" LastPriceInstrument NULL
);
	CREATE INDEX SubscribeLastPriceRequest_subscription_action_id_idx ON public.SubscribeLastPriceRequest USING btree (subscription_action_id);
	CREATE INDEX SubscribeLastPriceRequest_instruments_id_idx ON public.SubscribeLastPriceRequest USING btree (instruments_id);
	COMMENT ON TABLE "public"."SubscribeLastPriceRequest" IS 'Изменение статуса подписки на цену последней сделки по инструменту.';
	COMMENT ON COLUMN "public"."SubscribeLastPriceRequest"."subscription_action_id" IS 'Изменение статуса подписки.';
	COMMENT ON COLUMN "public"."SubscribeLastPriceRequest"."instruments_id" IS 'Массив инструментов для подписки на цену последней сделки.';


CREATE TABLE "public"."SubscribeLastPriceResponse" (
	"tracking_id" text NULL,
	"last_price_subscriptions_id" LastPriceSubscription NULL
);
	CREATE INDEX SubscribeLastPriceResponse_tracking_id_idx ON public.SubscribeLastPriceResponse USING btree (tracking_id);
	CREATE INDEX SubscribeLastPriceResponse_last_price_subscriptions_id_idx ON public.SubscribeLastPriceResponse USING btree (last_price_subscriptions_id);
	COMMENT ON TABLE "public"."SubscribeLastPriceResponse" IS 'Результат изменения статуса подписки на цену последней сделки.';
	COMMENT ON COLUMN "public"."SubscribeLastPriceResponse"."tracking_id" IS 'Уникальный идентификатор запроса, подробнее: [tracking_id](https://tinkoff.github.io/investAPI/grpc#tracking-id).';
	COMMENT ON COLUMN "public"."SubscribeLastPriceResponse"."last_price_subscriptions_id" IS 'Массив статусов подписки на цену последней сделки.';


CREATE TABLE "public"."SubscribeOrderBookRequest" (
	"subscription_action_id" SubscriptionAction NULL,
	"instruments_id" OrderBookInstrument NULL
);
	CREATE INDEX SubscribeOrderBookRequest_subscription_action_id_idx ON public.SubscribeOrderBookRequest USING btree (subscription_action_id);
	CREATE INDEX SubscribeOrderBookRequest_instruments_id_idx ON public.SubscribeOrderBookRequest USING btree (instruments_id);
	COMMENT ON TABLE "public"."SubscribeOrderBookRequest" IS 'Запрос на изменение статуса подписки на стаканы.';
	COMMENT ON COLUMN "public"."SubscribeOrderBookRequest"."subscription_action_id" IS 'Изменение статуса подписки.';
	COMMENT ON COLUMN "public"."SubscribeOrderBookRequest"."instruments_id" IS 'Массив инструментов для подписки на стаканы.';


CREATE TABLE "public"."SubscribeOrderBookResponse" (
	"tracking_id" text NULL,
	"order_book_subscriptions_id" OrderBookSubscription NULL
);
	CREATE INDEX SubscribeOrderBookResponse_tracking_id_idx ON public.SubscribeOrderBookResponse USING btree (tracking_id);
	CREATE INDEX SubscribeOrderBookResponse_order_book_subscriptions_id_idx ON public.SubscribeOrderBookResponse USING btree (order_book_subscriptions_id);
	COMMENT ON TABLE "public"."SubscribeOrderBookResponse" IS 'Результат изменения статуса подписки на стаканы.';
	COMMENT ON COLUMN "public"."SubscribeOrderBookResponse"."tracking_id" IS 'Уникальный идентификатор запроса, подробнее: [tracking_id](https://tinkoff.github.io/investAPI/grpc#tracking-id).';
	COMMENT ON COLUMN "public"."SubscribeOrderBookResponse"."order_book_subscriptions_id" IS 'Массив статусов подписки на стаканы.';


CREATE TABLE "public"."SubscribeTradesRequest" (
	"subscription_action_id" SubscriptionAction NULL,
	"instruments_id" TradeInstrument NULL
);
	CREATE INDEX SubscribeTradesRequest_subscription_action_id_idx ON public.SubscribeTradesRequest USING btree (subscription_action_id);
	CREATE INDEX SubscribeTradesRequest_instruments_id_idx ON public.SubscribeTradesRequest USING btree (instruments_id);
	COMMENT ON TABLE "public"."SubscribeTradesRequest" IS 'Изменение статуса подписки на поток обезличенных сделок.';
	COMMENT ON COLUMN "public"."SubscribeTradesRequest"."subscription_action_id" IS 'Изменение статуса подписки.';
	COMMENT ON COLUMN "public"."SubscribeTradesRequest"."instruments_id" IS 'Массив инструментов для подписки на поток обезличенных сделок.';


CREATE TABLE "public"."SubscribeTradesResponse" (
	"tracking_id" text NULL,
	"trade_subscriptions_id" TradeSubscription NULL
);
	CREATE INDEX SubscribeTradesResponse_tracking_id_idx ON public.SubscribeTradesResponse USING btree (tracking_id);
	CREATE INDEX SubscribeTradesResponse_trade_subscriptions_id_idx ON public.SubscribeTradesResponse USING btree (trade_subscriptions_id);
	COMMENT ON TABLE "public"."SubscribeTradesResponse" IS 'Результат изменения статуса подписки на поток обезличенных сделок.';
	COMMENT ON COLUMN "public"."SubscribeTradesResponse"."tracking_id" IS 'Уникальный идентификатор запроса, подробнее: [tracking_id](https://tinkoff.github.io/investAPI/grpc#tracking-id).';
	COMMENT ON COLUMN "public"."SubscribeTradesResponse"."trade_subscriptions_id" IS 'Массив статусов подписки на поток сделок.';


CREATE TABLE "public"."Trade" (
	"figi_id" text NULL,
	"direction_id" TradeDirection NULL,
	"price_id" Quotation NULL,
	"quantity_id" bigint NULL,
	"time" timestamptz NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX Trade_figi_id_idx ON public.Trade USING btree (figi_id);
	CREATE INDEX Trade_direction_id_idx ON public.Trade USING btree (direction_id);
	CREATE INDEX Trade_price_id_idx ON public.Trade USING btree (price_id);
	CREATE INDEX Trade_quantity_id_idx ON public.Trade USING btree (quantity_id);
	CREATE INDEX Trade_instrument_uid_id_idx ON public.Trade USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."Trade" IS 'Информация о сделке.';
	COMMENT ON COLUMN "public"."Trade"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."Trade"."direction_id" IS 'Направление сделки.';
	COMMENT ON COLUMN "public"."Trade"."price_id" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/)';
	COMMENT ON COLUMN "public"."Trade"."quantity_id" IS 'Количество лотов.';
	COMMENT ON COLUMN "public"."Trade"."time" IS 'Время сделки в часовом поясе UTC по времени биржи.';
	COMMENT ON COLUMN "public"."Trade"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."TradeInstrument" (
	"figi_id" text NULL,
	"instrument_id" text NULL
);
	CREATE INDEX TradeInstrument_figi_id_idx ON public.TradeInstrument USING btree (figi_id);
	CREATE INDEX TradeInstrument_instrument_id_idx ON public.TradeInstrument USING btree (instrument_id);
	COMMENT ON TABLE "public"."TradeInstrument" IS 'Запрос подписки на поток обезличенных сделок.';
	COMMENT ON COLUMN "public"."TradeInstrument"."figi_id" IS 'Deprecated Figi-идентификатор инструмента. Необходимо использовать instrument_id.';
	COMMENT ON COLUMN "public"."TradeInstrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';


CREATE TABLE "public"."TradeSubscription" (
	"figi_id" text NULL,
	"subscription_status_id" SubscriptionStatus NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX TradeSubscription_figi_id_idx ON public.TradeSubscription USING btree (figi_id);
	CREATE INDEX TradeSubscription_subscription_status_id_idx ON public.TradeSubscription USING btree (subscription_status_id);
	CREATE INDEX TradeSubscription_instrument_uid_id_idx ON public.TradeSubscription USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."TradeSubscription" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."TradeSubscription"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."TradeSubscription"."subscription_status_id" IS 'Статус подписки.';
	COMMENT ON COLUMN "public"."TradeSubscription"."instrument_uid_id" IS 'Uid инструмента';




CREATE TABLE "public"."TradingDay" (
	"date" timestamptz NULL,
	"is_trading_day_id" bool NULL,
	"start_time" timestamptz NULL,
	"end_time" timestamptz NULL,
	"opening_auction_start_time" timestamptz NULL,
	"closing_auction_end_time" timestamptz NULL,
	"evening_opening_auction_start_time" timestamptz NULL,
	"evening_start_time" timestamptz NULL,
	"evening_end_time" timestamptz NULL,
	"clearing_start_time" timestamptz NULL,
	"clearing_end_time" timestamptz NULL,
	"premarket_start_time" timestamptz NULL,
	"premarket_end_time" timestamptz NULL,
	"closing_auction_start_time" timestamptz NULL,
	"opening_auction_end_time" timestamptz NULL
);
	CREATE INDEX TradingDay_is_trading_day_id_idx ON public.TradingDay USING btree (is_trading_day_id);
	COMMENT ON TABLE "public"."TradingDay" IS 'Информация о времени торгов.';
	COMMENT ON COLUMN "public"."TradingDay"."date" IS ' Дата.';
	COMMENT ON COLUMN "public"."TradingDay"."is_trading_day_id" IS ' Признак торгового дня на бирже.';
	COMMENT ON COLUMN "public"."TradingDay"."start_time" IS ' Время начала торгов по часовому поясу UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."end_time" IS ' Время окончания торгов по часовому поясу UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."opening_auction_start_time" IS ' Время начала аукциона открытия в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."closing_auction_end_time" IS ' Время окончания аукциона закрытия в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."evening_opening_auction_start_time" IS ' Время начала аукциона открытия вечерней сессии в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."evening_start_time" IS ' Время начала вечерней сессии в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."evening_end_time" IS ' Время окончания вечерней сессии в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."clearing_start_time" IS ' Время начала основного клиринга в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."clearing_end_time" IS ' Время окончания основного клиринга в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."premarket_start_time" IS ' Время начала премаркета в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."premarket_end_time" IS ' Время окончания премаркета в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."closing_auction_start_time" IS ' Время начала аукциона закрытия в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingDay"."opening_auction_end_time" IS ' Время окончания аукциона открытия в часовом поясе UTC.';


CREATE TABLE "public"."TradingSchedule" (
	"exchange_id" text NULL,
	"days_id" TradingDay NULL
);
	CREATE INDEX TradingSchedule_exchange_id_idx ON public.TradingSchedule USING btree (exchange_id);
	CREATE INDEX TradingSchedule_days_id_idx ON public.TradingSchedule USING btree (days_id);
	COMMENT ON TABLE "public"."TradingSchedule" IS 'Данные по торговой площадке.';
	COMMENT ON COLUMN "public"."TradingSchedule"."exchange_id" IS ' Наименование торговой площадки.';
	COMMENT ON COLUMN "public"."TradingSchedule"."days_id" IS ' Массив с торговыми и неторговыми днями.';


CREATE TABLE "public"."TradingSchedulesRequest" (
	"exchange_id" text NULL,
	"from" timestamptz NULL,
	"to" timestamptz NULL
);
	CREATE INDEX TradingSchedulesRequest_exchange_id_idx ON public.TradingSchedulesRequest USING btree (exchange_id);
	COMMENT ON TABLE "public"."TradingSchedulesRequest" IS 'Запрос расписания торгов.';
	COMMENT ON COLUMN "public"."TradingSchedulesRequest"."exchange_id" IS 'Наименование биржи или расчетного календаря. </br>Если не передаётся, возвращается информация по всем доступным торговым площадкам.';
	COMMENT ON COLUMN "public"."TradingSchedulesRequest"."from" IS 'Начало периода по часовому поясу UTC.';
	COMMENT ON COLUMN "public"."TradingSchedulesRequest"."to" IS 'Окончание периода по часовому поясу UTC.';



CREATE TABLE "public"."TradingStatus" (
	"figi_id" text NULL,
	"trading_status_id" SecurityTradingStatus NULL,
	"time" timestamptz NULL,
	"limit_order_available_flag_id" bool NULL,
	"market_order_available_flag_id" bool NULL,
	"instrument_uid_id" text NULL
);
	CREATE INDEX TradingStatus_figi_id_idx ON public.TradingStatus USING btree (figi_id);
	CREATE INDEX TradingStatus_trading_status_id_idx ON public.TradingStatus USING btree (trading_status_id);
	CREATE INDEX TradingStatus_limit_order_available_flag_id_idx ON public.TradingStatus USING btree (limit_order_available_flag_id);
	CREATE INDEX TradingStatus_market_order_available_flag_id_idx ON public.TradingStatus USING btree (market_order_available_flag_id);
	CREATE INDEX TradingStatus_instrument_uid_id_idx ON public.TradingStatus USING btree (instrument_uid_id);
	COMMENT ON TABLE "public"."TradingStatus" IS 'Пакет изменения торгового статуса.';
	COMMENT ON COLUMN "public"."TradingStatus"."figi_id" IS 'Figi-идентификатор инструмента.';
	COMMENT ON COLUMN "public"."TradingStatus"."trading_status_id" IS 'Статус торговли инструментом.';
	COMMENT ON COLUMN "public"."TradingStatus"."time" IS 'Время изменения торгового статуса в часовом поясе UTC.';
	COMMENT ON COLUMN "public"."TradingStatus"."limit_order_available_flag_id" IS 'Признак доступности выставления лимитной заявки по инструменту.';
	COMMENT ON COLUMN "public"."TradingStatus"."market_order_available_flag_id" IS 'Признак доступности выставления рыночной заявки по инструменту.';
	COMMENT ON COLUMN "public"."TradingStatus"."instrument_uid_id" IS 'Uid инструмента';


CREATE TABLE "public"."UnaryLimit" (
	"limit_per_minute_id" integer NULL,
	"methods_id" text NULL
);
	CREATE INDEX UnaryLimit_limit_per_minute_id_idx ON public.UnaryLimit USING btree (limit_per_minute_id);
	CREATE INDEX UnaryLimit_methods_id_idx ON public.UnaryLimit USING btree (methods_id);
	COMMENT ON TABLE "public"."UnaryLimit" IS 'Лимит unary-методов.';
	COMMENT ON COLUMN "public"."UnaryLimit"."limit_per_minute_id" IS 'Количество unary-запросов в минуту.';
	COMMENT ON COLUMN "public"."UnaryLimit"."methods_id" IS 'Названия методов.';


CREATE TABLE "public"."VirtualPortfolioPosition" (
	"position_uid_id" text NULL,
	"instrument_uid_id" text NULL,
	"figi_id" text NULL,
	"instrument_type_id" text NULL,
	"quantity_id" Quotation NULL,
	"average_position_price_id" MoneyValue NULL,
	"expected_yield_id" Quotation NULL,
	"expected_yield_fifo_id" Quotation NULL,
	"expire_date" timestamptz NULL,
	"current_price_id" MoneyValue NULL,
	"average_position_price_fifo_id" MoneyValue NULL
);
	CREATE INDEX VirtualPortfolioPosition_position_uid_id_idx ON public.VirtualPortfolioPosition USING btree (position_uid_id);
	CREATE INDEX VirtualPortfolioPosition_instrument_uid_id_idx ON public.VirtualPortfolioPosition USING btree (instrument_uid_id);
	CREATE INDEX VirtualPortfolioPosition_figi_id_idx ON public.VirtualPortfolioPosition USING btree (figi_id);
	CREATE INDEX VirtualPortfolioPosition_instrument_type_id_idx ON public.VirtualPortfolioPosition USING btree (instrument_type_id);
	CREATE INDEX VirtualPortfolioPosition_quantity_id_idx ON public.VirtualPortfolioPosition USING btree (quantity_id);
	CREATE INDEX VirtualPortfolioPosition_average_position_price_id_idx ON public.VirtualPortfolioPosition USING btree (average_position_price_id);
	CREATE INDEX VirtualPortfolioPosition_expected_yield_id_idx ON public.VirtualPortfolioPosition USING btree (expected_yield_id);
	CREATE INDEX VirtualPortfolioPosition_expected_yield_fifo_id_idx ON public.VirtualPortfolioPosition USING btree (expected_yield_fifo_id);
	CREATE INDEX VirtualPortfolioPosition_current_price_id_idx ON public.VirtualPortfolioPosition USING btree (current_price_id);
	CREATE INDEX VirtualPortfolioPosition_average_position_price_fifo_id_idx ON public.VirtualPortfolioPosition USING btree (average_position_price_fifo_id);
	COMMENT ON TABLE "public"."VirtualPortfolioPosition" IS '';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."position_uid_id" IS 'position_uid-идентификатора инструмента';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."instrument_uid_id" IS 'instrument_uid-идентификатора инструмента';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."figi_id" IS 'Figi-идентификатора инструмента.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."instrument_type_id" IS 'Тип инструмента.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."quantity_id" IS 'Количество инструмента в портфеле в штуках.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."average_position_price_id" IS 'Средневзвешенная цена позиции. **Возможна задержка до секунды для пересчёта**.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."expected_yield_id" IS 'Текущая рассчитанная доходность позиции.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."expected_yield_fifo_id" IS 'Текущая рассчитанная доходность позиции.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."expire_date" IS 'Дата до которой нужно продать виртуальные бумаги, после этой даты виртуальная позиция "сгорит"';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."current_price_id" IS 'Текущая цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента.';
	COMMENT ON COLUMN "public"."VirtualPortfolioPosition"."average_position_price_fifo_id" IS 'Средняя цена позиции по методу FIFO. **Возможна задержка до секунды для пересчёта**.';



CREATE TABLE "public"."WithdrawLimitsResponse" (
	"money_id" MoneyValue NULL,
	"blocked_id" MoneyValue NULL,
	"blocked_guarantee_id" MoneyValue NULL
);
	CREATE INDEX WithdrawLimitsResponse_money_id_idx ON public.WithdrawLimitsResponse USING btree (money_id);
	CREATE INDEX WithdrawLimitsResponse_blocked_id_idx ON public.WithdrawLimitsResponse USING btree (blocked_id);
	CREATE INDEX WithdrawLimitsResponse_blocked_guarantee_id_idx ON public.WithdrawLimitsResponse USING btree (blocked_guarantee_id);
	COMMENT ON TABLE "public"."WithdrawLimitsResponse" IS 'Доступный для вывода остаток.';
	COMMENT ON COLUMN "public"."WithdrawLimitsResponse"."money_id" IS 'Массив валютных позиций портфеля.';
	COMMENT ON COLUMN "public"."WithdrawLimitsResponse"."blocked_id" IS 'Массив заблокированных валютных позиций портфеля.';
	COMMENT ON COLUMN "public"."WithdrawLimitsResponse"."blocked_guarantee_id" IS 'Заблокировано под гарантийное обеспечение фьючерсов.';


