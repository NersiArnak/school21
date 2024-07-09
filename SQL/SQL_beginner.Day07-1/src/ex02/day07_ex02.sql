(SELECT
    p.name,
    COUNT(po.id) AS count,
    'order' AS action_type
FROM
    person_order po
JOIN
    public.menu ON po.menu_id = menu.id
JOIN
    public.pizzeria p ON menu.pizzeria_id = p.id
GROUP BY
    p.name
ORDER BY
    count DESC
LIMIT 3)
UNION
(SELECT
    p.name,
    COUNT(pv.id) AS count,
    'visit' AS action_type
FROM
    person_visits pv
JOIN
    public.pizzeria p ON pv.pizzeria_id = p.id
GROUP BY
    p.name
ORDER BY
    count DESC
LIMIT 3)
ORDER BY
    action_type, count DESC;
