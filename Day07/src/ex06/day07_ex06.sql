SELECT
    pizzeria.name, count_of_orders, average_price, max_price, min_price
FROM
(SELECT
    m.pizzeria_id,
    COUNT(p_o.id) AS count_of_orders,
    round(AVG(m.price), 2) AS average_price,
    MAX(m.price) AS max_price,
    MIN(m.price) AS min_price
FROM
    person_order p_o JOIN menu m ON (p_o.menu_id = m.id)
GROUP BY
    m.pizzeria_id) main_table JOIN pizzeria ON (main_table.pizzeria_id = pizzeria.id)
ORDER BY
    pizzeria.name;
