SELECT
    p.name,
    m.pizza_name,
    m.price,
    round((100 - p_d.discount) / 100 * m.price) AS discount_price,
    piz.name AS pizzeria_name
FROM
    person_order p_o
    JOIN menu m ON (p_o.menu_id = m.id)
    JOIN person_discounts p_d ON (p_o.person_id = p_d.person_id AND m.pizzeria_id = p_d.pizzeria_id)
    JOIN pizzeria piz ON (m.pizzeria_id = piz.id)
    JOIN person p ON (p.id = p_o.person_id)
ORDER BY
    p.name,
    m.pizza_name;
