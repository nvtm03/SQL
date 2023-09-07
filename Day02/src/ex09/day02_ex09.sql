WITH orders AS (
    SELECT
        person_order.id,
        pizza_name,
        person_id
    FROM
        person_order
        JOIN
        (SELECT * FROM menu WHERE pizza_name IN ('pepperoni pizza', 'cheese pizza')) m ON (person_order.menu_id = m.id)
)

SELECT
    DISTINCT per.name
FROM
    orders o1
    JOIN orders o2 ON (o1.person_id = o2.person_id AND o1.id < o2.id)
    JOIN (SELECT id, name FROM person WHERE gender = 'female') per ON (o1.person_id = per.id)
WHERE
    (o1.pizza_name = 'pepperoni pizza' AND o2.pizza_name = 'cheese pizza') OR
    (o1.pizza_name = 'cheese pizza' AND o2.pizza_name = 'pepperoni pizza')
ORDER BY
    per.name