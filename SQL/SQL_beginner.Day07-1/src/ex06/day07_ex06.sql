SELECT
    p.name,
    COUNT(po.menu_id) AS count_of_orders,
    ROUND(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM
    public.person_order po
JOIN
    menu m ON po.menu_id = m.id
JOIN
    pizzeria p ON m.pizzeria_id = p.id
GROUP BY
    p.name
ORDER BY
    p.name;
