
CREATE TABLE IF NOT EXISTS "tin"."accrued_interest" (
	"date" timestamptz NULL,
	"value_units" bigint NOT NULL,
	"value_nano" integer NOT NULL,
	"value_percent_units" bigint NOT NULL,
	"value_percent_nano" integer NOT NULL,
	"nominal_units" bigint NOT NULL,
	"nominal_nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."accrued_interest" IS 'Операция начисления купонов.';
COMMENT ON COLUMN "tin"."accrued_interest"."date" IS 'Дата и время выплаты в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."accrued_interest"."value_units" IS 'Величина выплаты. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."accrued_interest"."value_nano" IS 'Величина выплаты. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."accrued_interest"."value_percent_units" IS 'Величина выплаты в процентах от номинала. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."accrued_interest"."value_percent_nano" IS 'Величина выплаты в процентах от номинала. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."accrued_interest"."nominal_units" IS 'Номинал облигации. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."accrued_interest"."nominal_nano" IS 'Номинал облигации. / дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."asset_bond" (
	"current_nominal_units" bigint NOT NULL,
	"current_nominal_nano" integer NOT NULL,
	"borrow_name" text NOT NULL,
	"issue_size_units" bigint NOT NULL,
	"issue_size_nano" integer NOT NULL,
	"nominal_units" bigint NOT NULL,
	"nominal_nano" integer NOT NULL,
	"nominal_currency" text NOT NULL,
	"issue_kind" text NOT NULL,
	"interest_kind" text NOT NULL,
	"coupon_quantity_per_year" integer NOT NULL,
	"indexed_nominal_flag" bool NOT NULL,
	"subordinated_flag" bool NOT NULL,
	"collateral_flag" bool NOT NULL,
	"tax_free_flag" bool NOT NULL,
	"amortization_flag" bool NOT NULL,
	"floating_coupon_flag" bool NOT NULL,
	"perpetual_flag" bool NOT NULL,
	"maturity_date" timestamptz NULL,
	"return_condition" text NOT NULL,
	"state_reg_date" timestamptz NULL,
	"placement_date" timestamptz NULL,
	"placement_price_units" bigint NOT NULL,
	"placement_price_nano" integer NOT NULL,
	"issue_size_plan_units" bigint NOT NULL,
	"issue_size_plan_nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."asset_bond" IS 'Облигация.';
COMMENT ON COLUMN "tin"."asset_bond"."current_nominal_units" IS 'Текущий номинал. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."current_nominal_nano" IS 'Текущий номинал. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."borrow_name" IS 'Наименование заемщика.';
COMMENT ON COLUMN "tin"."asset_bond"."issue_size_units" IS 'Объем эмиссии облигации (стоимость). / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."issue_size_nano" IS 'Объем эмиссии облигации (стоимость). / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."nominal_units" IS 'Номинал облигации. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."nominal_nano" IS 'Номинал облигации. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."nominal_currency" IS 'Валюта номинала.';
COMMENT ON COLUMN "tin"."asset_bond"."issue_kind" IS 'Форма выпуска облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."interest_kind" IS 'Форма дохода облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."coupon_quantity_per_year" IS 'Количество выплат в год.';
COMMENT ON COLUMN "tin"."asset_bond"."indexed_nominal_flag" IS 'Признак облигации с индексируемым номиналом.';
COMMENT ON COLUMN "tin"."asset_bond"."subordinated_flag" IS 'Признак субординированной облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."collateral_flag" IS 'Признак обеспеченной облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."tax_free_flag" IS 'Признак показывает, что купоны облигации не облагаются налогом (для mass market).';
COMMENT ON COLUMN "tin"."asset_bond"."amortization_flag" IS 'Признак облигации с амортизацией долга.';
COMMENT ON COLUMN "tin"."asset_bond"."floating_coupon_flag" IS 'Признак облигации с плавающим купоном.';
COMMENT ON COLUMN "tin"."asset_bond"."perpetual_flag" IS 'Признак бессрочной облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."maturity_date" IS 'Дата погашения облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."return_condition" IS 'Описание и условия получения дополнительного дохода.';
COMMENT ON COLUMN "tin"."asset_bond"."state_reg_date" IS 'Дата выпуска облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."placement_date" IS 'Дата размещения облигации.';
COMMENT ON COLUMN "tin"."asset_bond"."placement_price_units" IS 'Цена размещения облигации. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."placement_price_nano" IS 'Цена размещения облигации. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."issue_size_plan_units" IS 'Объявленное количество шт. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_bond"."issue_size_plan_nano" IS 'Объявленное количество шт. / дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."asset_clearing_certificate" (
	"nominal_units" bigint NOT NULL,
	"nominal_nano" integer NOT NULL,
	"nominal_currency" text NOT NULL
);
COMMENT ON TABLE "tin"."asset_clearing_certificate" IS 'Клиринговый сертификат участия.';
COMMENT ON COLUMN "tin"."asset_clearing_certificate"."nominal_units" IS 'Номинал. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_clearing_certificate"."nominal_nano" IS 'Номинал. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_clearing_certificate"."nominal_currency" IS 'Валюта номинала.';

CREATE TABLE IF NOT EXISTS "tin"."dividend" (
	"dividend_net_currency" text NOT NULL,
	"dividend_net_units" bigint NOT NULL,
	"dividend_net_nano" integer NOT NULL,
	"payment_date" timestamptz NULL,
	"declared_date" timestamptz NULL,
	"last_buy_date" timestamptz NULL,
	"dividend_type" text NOT NULL,
	"record_date" timestamptz NULL,
	"regularity" text NOT NULL,
	"close_price_currency" text NOT NULL,
	"close_price_units" bigint NOT NULL,
	"close_price_nano" integer NOT NULL,
	"yield_value_units" bigint NOT NULL,
	"yield_value_nano" integer NOT NULL,
	"created_at" timestamptz NULL
);
COMMENT ON TABLE "tin"."dividend" IS 'Информация о выплате.';
COMMENT ON COLUMN "tin"."dividend"."dividend_net_currency" IS 'Величина дивиденда на 1 ценную бумагу (включая валюту). / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."dividend"."dividend_net_units" IS 'Величина дивиденда на 1 ценную бумагу (включая валюту). / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."dividend_net_nano" IS 'Величина дивиденда на 1 ценную бумагу (включая валюту). / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."payment_date" IS 'Дата фактических выплат в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."dividend"."declared_date" IS 'Дата объявления дивидендов в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."dividend"."last_buy_date" IS 'Последний день (включительно) покупки для получения выплаты в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."dividend"."dividend_type" IS 'Тип выплаты. Возможные значения: Regular Cash – регулярные выплаты, Cancelled – выплата отменена, Daily Accrual – ежедневное начисление, Return of Capital – возврат капитала, прочие типы выплат.';
COMMENT ON COLUMN "tin"."dividend"."record_date" IS 'Дата фиксации реестра в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."dividend"."regularity" IS 'Регулярность выплаты. Возможные значения: Annual – ежегодная, Semi-Anl – каждые полгода, прочие типы выплат.';
COMMENT ON COLUMN "tin"."dividend"."close_price_currency" IS 'Цена закрытия инструмента на момент ex_dividend_date. / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."dividend"."close_price_units" IS 'Цена закрытия инструмента на момент ex_dividend_date. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."close_price_nano" IS 'Цена закрытия инструмента на момент ex_dividend_date. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."yield_value_units" IS 'Величина доходности. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."yield_value_nano" IS 'Величина доходности. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividend"."created_at" IS 'Дата и время создания записи в часовом поясе UTC.';

CREATE TABLE IF NOT EXISTS "tin"."dividends_foreign_issuer_report" (
	"record_date" timestamptz NULL,
	"payment_date" timestamptz NULL,
	"security_name" text NOT NULL,
	"isin" text NOT NULL,
	"issuer_country" text NOT NULL,
	"quantity" bigint NOT NULL,
	"dividend_units" bigint NOT NULL,
	"dividend_nano" integer NOT NULL,
	"external_commission_units" bigint NOT NULL,
	"external_commission_nano" integer NOT NULL,
	"dividend_gross_units" bigint NOT NULL,
	"dividend_gross_nano" integer NOT NULL,
	"tax_units" bigint NOT NULL,
	"tax_nano" integer NOT NULL,
	"dividend_amount_units" bigint NOT NULL,
	"dividend_amount_nano" integer NOT NULL,
	"currency" text NOT NULL
);
COMMENT ON TABLE "tin"."dividends_foreign_issuer_report" IS ' Отчёт "Справка о доходах за пределами РФ".';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."record_date" IS 'Дата фиксации реестра.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."payment_date" IS 'Дата выплаты.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."security_name" IS 'Наименование ценной бумаги.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."isin" IS 'ISIN-идентификатор ценной бумаги.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."issuer_country" IS 'Страна эмитента. Для депозитарных расписок указывается страна эмитента базового актива.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."quantity" IS 'Количество ценных бумаг.';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_units" IS 'Выплаты на одну бумагу / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_nano" IS 'Выплаты на одну бумагу / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."external_commission_units" IS 'Комиссия внешних платёжных агентов. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."external_commission_nano" IS 'Комиссия внешних платёжных агентов. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_gross_units" IS 'Сумма до удержания налога. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_gross_nano" IS 'Сумма до удержания налога. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."tax_units" IS 'Сумма налога, удержанного агентом. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."tax_nano" IS 'Сумма налога, удержанного агентом. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_amount_units" IS 'Итоговая сумма выплаты. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."dividend_amount_nano" IS 'Итоговая сумма выплаты. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."dividends_foreign_issuer_report"."currency" IS 'Валюта.';

CREATE TABLE IF NOT EXISTS "tin"."historic_candle" (
	"open_units" bigint NOT NULL,
	"open_nano" integer NOT NULL,
	"high_units" bigint NOT NULL,
	"high_nano" integer NOT NULL,
	"low_units" bigint NOT NULL,
	"low_nano" integer NOT NULL,
	"close_units" bigint NOT NULL,
	"close_nano" integer NOT NULL,
	"volume" bigint NOT NULL,
	"time" timestamptz NULL,
	"is_complete" bool NOT NULL
);
COMMENT ON TABLE "tin"."historic_candle" IS 'Информация о свече.';
COMMENT ON COLUMN "tin"."historic_candle"."open_units" IS 'Цена открытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."open_nano" IS 'Цена открытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."high_units" IS 'Максимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."high_nano" IS 'Максимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."low_units" IS 'Минимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."low_nano" IS 'Минимальная цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."close_units" IS 'Цена закрытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."close_nano" IS 'Цена закрытия за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."historic_candle"."volume" IS 'Объём торгов в лотах.';
COMMENT ON COLUMN "tin"."historic_candle"."time" IS 'Время свечи в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."historic_candle"."is_complete" IS 'Признак завершённости свечи. **false** значит, свеча за текущие интервал ещё сформирована не полностью.';

CREATE TABLE IF NOT EXISTS "tin"."info_instrument" (
	"instrument_id" text NOT NULL
);
COMMENT ON TABLE "tin"."info_instrument" IS 'Запрос подписки на торговый статус.';
COMMENT ON COLUMN "tin"."info_instrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';

CREATE TABLE IF NOT EXISTS "tin"."instrument_link" (
	"type" text NOT NULL,
	"instrument_uid" text NOT NULL
);
COMMENT ON TABLE "tin"."instrument_link" IS 'Связь с другим инструментом.';
COMMENT ON COLUMN "tin"."instrument_link"."type" IS 'Тип связи.';
COMMENT ON COLUMN "tin"."instrument_link"."instrument_uid" IS 'uid идентификатор связанного инструмента.';

CREATE TABLE IF NOT EXISTS "tin"."last_price_instrument" (
	"instrument_id" text NOT NULL
);
COMMENT ON TABLE "tin"."last_price_instrument" IS 'Запрос подписки на последнюю цену.';
COMMENT ON COLUMN "tin"."last_price_instrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';

CREATE TABLE IF NOT EXISTS "tin"."money_value" (
	"currency" text NOT NULL,
	"units" bigint NOT NULL,
	"nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."money_value" IS 'Денежная сумма в определенной валюте';
COMMENT ON COLUMN "tin"."money_value"."currency" IS 'строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."money_value"."units" IS 'целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."money_value"."nano" IS 'дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."operation_item_trade" (
	"num" text NOT NULL,
	"date" timestamptz NULL,
	"quantity" bigint NOT NULL,
	"price_currency" text NOT NULL,
	"price_units" bigint NOT NULL,
	"price_nano" integer NOT NULL,
	"yield_currency" text NOT NULL,
	"yield_units" bigint NOT NULL,
	"yield_nano" integer NOT NULL,
	"yield_relative_units" bigint NOT NULL,
	"yield_relative_nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."operation_item_trade" IS 'Сделка по операции.';
COMMENT ON COLUMN "tin"."operation_item_trade"."num" IS 'Номер сделки';
COMMENT ON COLUMN "tin"."operation_item_trade"."date" IS 'Дата сделки';
COMMENT ON COLUMN "tin"."operation_item_trade"."quantity" IS 'Количество в единицах.';
COMMENT ON COLUMN "tin"."operation_item_trade"."price_currency" IS 'Цена. / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."operation_item_trade"."price_units" IS 'Цена. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."operation_item_trade"."price_nano" IS 'Цена. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."operation_item_trade"."yield_currency" IS 'Доходность. / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."operation_item_trade"."yield_units" IS 'Доходность. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."operation_item_trade"."yield_nano" IS 'Доходность. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."operation_item_trade"."yield_relative_units" IS 'Относительная доходность. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."operation_item_trade"."yield_relative_nano" IS 'Относительная доходность. / дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."order" (
	"price_units" bigint NOT NULL,
	"price_nano" integer NOT NULL,
	"quantity" bigint NOT NULL
);
COMMENT ON TABLE "tin"."order" IS 'Массив предложений/спроса.';
COMMENT ON COLUMN "tin"."order"."price_units" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."order"."price_nano" IS 'Цена за 1 инструмент. Для получения стоимости лота требуется умножить на лотность инструмента. Для перевод цен в валюту рекомендуем использовать [информацию со страницы](https://tinkoff.github.io/investAPI/faq_marketdata/) / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."order"."quantity" IS 'Количество в лотах.';

CREATE TABLE IF NOT EXISTS "tin"."order_book_instrument" (
	"depth" integer NOT NULL,
	"instrument_id" text NOT NULL
);
COMMENT ON TABLE "tin"."order_book_instrument" IS 'Запрос подписки на стаканы.';
COMMENT ON COLUMN "tin"."order_book_instrument"."depth" IS 'Глубина стакана.';
COMMENT ON COLUMN "tin"."order_book_instrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';

CREATE TABLE IF NOT EXISTS "tin"."position_data" (
	"account_id" text NOT NULL,
	"date" timestamptz NULL
);
COMMENT ON TABLE "tin"."position_data" IS 'Данные о позиции портфеля.';
COMMENT ON COLUMN "tin"."position_data"."account_id" IS 'Идентификатор счёта.';
COMMENT ON COLUMN "tin"."position_data"."date" IS 'Дата и время операции в формате UTC.';

CREATE TABLE IF NOT EXISTS "tin"."positions_money" (
	"available_value_currency" text NOT NULL,
	"available_value_units" bigint NOT NULL,
	"available_value_nano" integer NOT NULL,
	"blocked_value_currency" text NOT NULL,
	"blocked_value_units" bigint NOT NULL,
	"blocked_value_nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."positions_money" IS 'Валютная позиция портфеля.';
COMMENT ON COLUMN "tin"."positions_money"."available_value_currency" IS 'Доступное количество валютный позиций. / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."positions_money"."available_value_units" IS 'Доступное количество валютный позиций. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."positions_money"."available_value_nano" IS 'Доступное количество валютный позиций. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."positions_money"."blocked_value_currency" IS 'Заблокированное количество валютный позиций. / строковый ISO-код валюты';
COMMENT ON COLUMN "tin"."positions_money"."blocked_value_units" IS 'Заблокированное количество валютный позиций. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."positions_money"."blocked_value_nano" IS 'Заблокированное количество валютный позиций. / дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."positions_options" (
	"position_uid" text NOT NULL,
	"instrument_uid" text NOT NULL,
	"blocked" bigint NOT NULL,
	"balance" bigint NOT NULL
);
COMMENT ON TABLE "tin"."positions_options" IS 'Баланс опциона.';
COMMENT ON COLUMN "tin"."positions_options"."position_uid" IS 'Уникальный идентификатор позиции опциона.';
COMMENT ON COLUMN "tin"."positions_options"."instrument_uid" IS 'Уникальный идентификатор  инструмента.';
COMMENT ON COLUMN "tin"."positions_options"."blocked" IS 'Количество бумаг заблокированных выставленными заявками.';
COMMENT ON COLUMN "tin"."positions_options"."balance" IS 'Текущий незаблокированный баланс.';

CREATE TABLE IF NOT EXISTS "tin"."quotation" (
	"units" bigint NOT NULL,
	"nano" integer NOT NULL
);
COMMENT ON TABLE "tin"."quotation" IS 'Котировка - денежная сумма без указания валюты';
COMMENT ON COLUMN "tin"."quotation"."units" IS 'целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."quotation"."nano" IS 'дробная часть суммы, может быть отрицательным числом';

CREATE TABLE IF NOT EXISTS "tin"."stream_limit" (
	"limit" integer NOT NULL,
	"open" integer NOT NULL
);
COMMENT ON TABLE "tin"."stream_limit" IS 'Лимит stream-соединений.';
COMMENT ON COLUMN "tin"."stream_limit"."limit" IS 'Максимальное количество stream-соединений.';
COMMENT ON COLUMN "tin"."stream_limit"."open" IS 'Текущее количество открытых stream-соединений.';

CREATE TABLE IF NOT EXISTS "tin"."trade_instrument" (
	"instrument_id" text NOT NULL
);
COMMENT ON TABLE "tin"."trade_instrument" IS 'Запрос подписки на поток обезличенных сделок.';
COMMENT ON COLUMN "tin"."trade_instrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';

CREATE TABLE IF NOT EXISTS "tin"."trading_day" (
	"date" timestamptz NULL,
	"is_trading_day" bool NOT NULL,
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
COMMENT ON TABLE "tin"."trading_day" IS 'Информация о времени торгов.';
COMMENT ON COLUMN "tin"."trading_day"."date" IS 'Дата.';
COMMENT ON COLUMN "tin"."trading_day"."is_trading_day" IS 'Признак торгового дня на бирже.';
COMMENT ON COLUMN "tin"."trading_day"."start_time" IS 'Время начала торгов по часовому поясу UTC.';
COMMENT ON COLUMN "tin"."trading_day"."end_time" IS 'Время окончания торгов по часовому поясу UTC.';
COMMENT ON COLUMN "tin"."trading_day"."opening_auction_start_time" IS 'Время начала аукциона открытия в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."closing_auction_end_time" IS 'Время окончания аукциона закрытия в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."evening_opening_auction_start_time" IS 'Время начала аукциона открытия вечерней сессии в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."evening_start_time" IS 'Время начала вечерней сессии в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."evening_end_time" IS 'Время окончания вечерней сессии в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."clearing_start_time" IS 'Время начала основного клиринга в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."clearing_end_time" IS 'Время окончания основного клиринга в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."premarket_start_time" IS 'Время начала премаркета в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."premarket_end_time" IS 'Время окончания премаркета в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."closing_auction_start_time" IS 'Время начала аукциона закрытия в часовом поясе UTC.';
COMMENT ON COLUMN "tin"."trading_day"."opening_auction_end_time" IS 'Время окончания аукциона открытия в часовом поясе UTC.';

CREATE TABLE IF NOT EXISTS "tin"."trading_schedule" (
	"exchange" text NOT NULL
);
COMMENT ON TABLE "tin"."trading_schedule" IS 'Данные по торговой площадке.';
COMMENT ON COLUMN "tin"."trading_schedule"."exchange" IS 'Наименование торговой площадки.';

CREATE TABLE IF NOT EXISTS "tin"."unary_limit" (
	"limit_per_minute" integer NOT NULL
);
COMMENT ON TABLE "tin"."unary_limit" IS 'Лимит unary-методов.';
COMMENT ON COLUMN "tin"."unary_limit"."limit_per_minute" IS 'Количество unary-запросов в минуту.';

CREATE TABLE IF NOT EXISTS "tin"."account_subscription_status" (
	"account_id" text NOT NULL,
	"subscription_status_id" bigint NULL,
	CONSTRAINT "account_subscription_status_subscription_status_id_fk" FOREIGN KEY ("subscription_status_id") REFERENCES "tin"."portfolio_subscription_status" ("id")
);
CREATE INDEX IF NOT EXISTS "account_subscription_status_subscription_status_id_idx" ON "tin"."account_subscription_status" USING btree ("subscription_status_id");
COMMENT ON TABLE "tin"."account_subscription_status" IS 'Счет клиента.';
COMMENT ON COLUMN "tin"."account_subscription_status"."account_id" IS 'Идентификатор счёта';
COMMENT ON COLUMN "tin"."account_subscription_status"."subscription_status_id" IS 'Результат подписки.';

CREATE TABLE IF NOT EXISTS "tin"."asset_security" (
	"isin" text NOT NULL,
	"type" text NOT NULL,
	"instrument_kind_id" bigint NULL,
	CONSTRAINT "asset_security_instrument_kind_id_fk" FOREIGN KEY ("instrument_kind_id") REFERENCES "tin"."instrument_type" ("id")
);
CREATE INDEX IF NOT EXISTS "asset_security_instrument_kind_id_idx" ON "tin"."asset_security" USING btree ("instrument_kind_id");
COMMENT ON TABLE "tin"."asset_security" IS 'Ценная бумага.';
COMMENT ON COLUMN "tin"."asset_security"."isin" IS 'ISIN-идентификатор ценной бумаги.';
COMMENT ON COLUMN "tin"."asset_security"."type" IS 'Тип ценной бумаги.';
COMMENT ON COLUMN "tin"."asset_security"."instrument_kind_id" IS 'Тип инструмента.';

CREATE TABLE IF NOT EXISTS "tin"."candle_instrument" (
	"interval_id" bigint NULL,
	"instrument_id" text NOT NULL,
	CONSTRAINT "candle_instrument_interval_id_fk" FOREIGN KEY ("interval_id") REFERENCES "tin"."subscription_interval" ("id")
);
CREATE INDEX IF NOT EXISTS "candle_instrument_interval_id_idx" ON "tin"."candle_instrument" USING btree ("interval_id");
COMMENT ON TABLE "tin"."candle_instrument" IS 'Запрос изменения статус подписки на свечи.';
COMMENT ON COLUMN "tin"."candle_instrument"."interval_id" IS 'Интервал свечей.';
COMMENT ON COLUMN "tin"."candle_instrument"."instrument_id" IS 'Идентификатор инструмента, принимает значение figi или instrument_uid';

CREATE TABLE IF NOT EXISTS "tin"."positions_subscription_status" (
	"account_id" text NOT NULL,
	"subscription_status_id" bigint NULL,
	CONSTRAINT "positions_subscription_status_subscription_status_id_fk" FOREIGN KEY ("subscription_status_id") REFERENCES "tin"."positions_account_subscription_status" ("id")
);
CREATE INDEX IF NOT EXISTS "positions_subscription_status_subscription_status_id_idx" ON "tin"."positions_subscription_status" USING btree ("subscription_status_id");
COMMENT ON TABLE "tin"."positions_subscription_status" IS 'Счет клиента.';
COMMENT ON COLUMN "tin"."positions_subscription_status"."account_id" IS 'Идентификатор счёта';
COMMENT ON COLUMN "tin"."positions_subscription_status"."subscription_status_id" IS 'Результат подписки.';

CREATE TABLE IF NOT EXISTS "tin"."asset_structured_product" (
	"borrow_name" text NOT NULL,
	"nominal_units" bigint NOT NULL,
	"nominal_nano" integer NOT NULL,
	"nominal_currency" text NOT NULL,
	"type_id" bigint NULL,
	"logic_portfolio" text NOT NULL,
	"asset_type_id" bigint NULL,
	"basic_asset" text NOT NULL,
	"safety_barrier_units" bigint NOT NULL,
	"safety_barrier_nano" integer NOT NULL,
	"maturity_date" timestamptz NULL,
	"issue_size_plan_units" bigint NOT NULL,
	"issue_size_plan_nano" integer NOT NULL,
	"issue_size_units" bigint NOT NULL,
	"issue_size_nano" integer NOT NULL,
	"placement_date" timestamptz NULL,
	"issue_kind" text NOT NULL,
	CONSTRAINT "asset_structured_product_type_id_fk" FOREIGN KEY ("type_id") REFERENCES "tin"."structured_product_type" ("id"),
	CONSTRAINT "asset_structured_product_asset_type_id_fk" FOREIGN KEY ("asset_type_id") REFERENCES "tin"."asset_type" ("id")
);
CREATE INDEX IF NOT EXISTS "asset_structured_product_type_id_idx" ON "tin"."asset_structured_product" USING btree ("type_id");
CREATE INDEX IF NOT EXISTS "asset_structured_product_asset_type_id_idx" ON "tin"."asset_structured_product" USING btree ("asset_type_id");
COMMENT ON TABLE "tin"."asset_structured_product" IS 'Структурная нота.';
COMMENT ON COLUMN "tin"."asset_structured_product"."borrow_name" IS 'Наименование заемщика.';
COMMENT ON COLUMN "tin"."asset_structured_product"."nominal_units" IS 'Номинал. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."nominal_nano" IS 'Номинал. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."nominal_currency" IS 'Валюта номинала.';
COMMENT ON COLUMN "tin"."asset_structured_product"."type_id" IS 'Тип структурной ноты.';
COMMENT ON COLUMN "tin"."asset_structured_product"."logic_portfolio" IS 'Стратегия портфеля.';
COMMENT ON COLUMN "tin"."asset_structured_product"."asset_type_id" IS 'Тип базового актива.';
COMMENT ON COLUMN "tin"."asset_structured_product"."basic_asset" IS 'Вид базового актива в зависимости от типа базового актива.';
COMMENT ON COLUMN "tin"."asset_structured_product"."safety_barrier_units" IS 'Барьер сохранности (в процентах). / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."safety_barrier_nano" IS 'Барьер сохранности (в процентах). / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."maturity_date" IS 'Дата погашения.';
COMMENT ON COLUMN "tin"."asset_structured_product"."issue_size_plan_units" IS 'Объявленное количество шт. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."issue_size_plan_nano" IS 'Объявленное количество шт. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."issue_size_units" IS 'Объем размещения. / целая часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."issue_size_nano" IS 'Объем размещения. / дробная часть суммы, может быть отрицательным числом';
COMMENT ON COLUMN "tin"."asset_structured_product"."placement_date" IS 'Дата размещения ноты.';
COMMENT ON COLUMN "tin"."asset_structured_product"."issue_kind" IS 'Форма выпуска.';

