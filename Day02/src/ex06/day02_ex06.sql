SELECT
    m.pizza_name AS pizza_name,
    piz.name AS pizzeria_name
FROM
    (SELECT * FROM person_order WHERE person_id IN (SELECT id FROM person WHERE name IN ('Denis', 'Anna'))) p_o
        JOIN menu m ON (p_o.menu_id = M.id)
        JOIN pizzeria piz ON (M.pizzeria_id = piz.id)
ORDER BY
    pizza_name,
    pizzeria_name
