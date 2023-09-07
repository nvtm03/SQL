SELECT
    m.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name,
    m.price AS price
FROM
    pizzeria
        JOIN
    (SELECT pizzeria_id, pizza_name, price FROM menu WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')) m
        ON pizzeria.id = m.pizzeria_id
ORDER BY
    pizza_name,
    pizzeria_name