SELECT
    m.pizza_name,
    m.price,
    piz.name AS pizzeria_name,
    p_v.visit_date
FROM
    (SELECT * FROM menu WHERE price BETWEEN 800 AND 1000) m
    JOIN pizzeria piz ON (m.pizzeria_id = piz.id)
    JOIN (SELECT * FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE name = 'Kate')) p_v
    ON (piz.id = p_v.pizzeria_id)
ORDER BY
    m.pizza_name,
    m.price,
    piz.name;