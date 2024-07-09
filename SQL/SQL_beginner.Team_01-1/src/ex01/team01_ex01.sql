insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH nearest_currency_rate AS (
    SELECT
        b.user_id,
        b.currency_id,
        b.updated AS balance_updated,
        b.money,
        c.name AS currency_name,
        COALESCE(
            (SELECT rate_to_usd FROM currency
             WHERE currency.id = b.currency_id AND currency.updated <= b.updated
             ORDER BY currency.updated DESC LIMIT 1),
            (SELECT rate_to_usd FROM currency
             WHERE currency.id = b.currency_id AND currency.updated > b.updated
             ORDER BY currency.updated ASC LIMIT 1)
        ) AS rate_to_usd
    FROM balance b
    JOIN currency c ON b.currency_id = c.id
),
calculated_balance AS (
    SELECT
        u.name,
        u.lastname,
        ncr.currency_name,
        ncr.money * ncr.rate_to_usd AS currency_in_usd
    FROM nearest_currency_rate ncr
    LEFT JOIN "user" u ON ncr.user_id = u.id
)
SELECT DISTINCT
    COALESCE(name, 'not defined') AS name,
    COALESCE(lastname, 'not defined') AS lastname,
    currency_name,
    currency_in_usd
FROM calculated_balance
ORDER BY name DESC, lastname ASC, currency_name ASC;