WITH not_ordered AS (
    (SELECT id AS menu_id FROM menu)
    EXCEPT ALL
    (SELECT menu_id FROM person_order)
)

SELECT
    m.pizza_name,
    m.price,
    piz.name AS pizzeria_name
FROM
    not_ordered n_o JOIN menu m ON (n_o.menu_id = m.id)
    JOIN pizzeria piz ON (m.pizzeria_id = piz.id)
ORDER BY
    m.pizza_name,
    m.price