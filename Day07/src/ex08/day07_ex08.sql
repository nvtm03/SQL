SELECT
    t.address,
    piz.name,
    t.count_of_orders
FROM
(SELECT
    p.address,
    m.pizzeria_id,
    COUNT(p_o.id) AS count_of_orders
FROM
    person_order p_o
    JOIN menu m ON (p_o.menu_id = m.id)
    JOIN person p  ON (p_o.person_id = p.id)
GROUP BY
    p.address,
    m.pizzeria_id
) t JOIN pizzeria piz ON (T.pizzeria_id = piz.id)
ORDER BY
    t.address,
    piz.name;
