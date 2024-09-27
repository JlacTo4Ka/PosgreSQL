WITH currency_rating AS
(
    SELECT
        currency.id AS id,
        currency.name AS name,
        rate_to_usd
    FROM currency
    JOIN (
        SELECT
            id,
            name,
            MAX(updated) AS last_updated
        FROM currency
        GROUP BY id, name
    ) q ON q.id = currency.id
    WHERE q.last_updated = currency.updated
), all_without_total AS 
(
    SELECT
        COALESCE(u.name, 'not defined') AS name,
        COALESCE(u.lastname, 'not defined') AS lastname,
        b.type AS type,
        SUM(b.money) AS volume,
        COALESCE(c.name, 'not defined') AS currency_name,
        COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd
        -- b.money * COALESCE(c.rate_to_usd, 1) AS total_volume_in_usd
    FROM "user" u
    FULL JOIN balance b ON u.id = b.user_id
    FULL JOIN currency_rating c ON c.id = b.currency_id
    GROUP BY u.name, u.lastname, b.type, c.name, c.rate_to_usd
    ORDER BY 
        name DESC, 
        lastname, type ASC
)

SELECT 
    *,
    volume * last_rate_to_usd AS total_volume_in_usd
FROM all_without_total
