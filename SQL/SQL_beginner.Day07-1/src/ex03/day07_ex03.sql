WITH RESULT AS (
    (SELECT
        p.name,
        COUNT(p.id)
    FROM
        person_visits pv
    JOIN
        pizzeria p ON pv.pizzeria_id = p.id
    GROUP BY
        p.name
    ORDER BY
        COUNT DESC)
    UNION ALL
    (SELECT
        p.name,
        COUNT(p.id)
    FROM
        person_order po
    JOIN
        menu ON po.menu_id = menu.id
    JOIN
        pizzeria p ON menu.pizzeria_id = p.id
    GROUP BY
        p.name
    ORDER BY
        COUNT DESC)
)
SELECT
    name,
    SUM(COUNT) AS total_count
FROM
    RESULT
GROUP BY
    name
ORDER BY
    total_count DESC, name ASC;