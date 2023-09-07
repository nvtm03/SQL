INSERT INTO person_discounts
SELECT
    ROW_NUMBER() OVER () AS id,
    p_o.person_id,
    m.pizzeria_id,
    CASE
        WHEN COUNT(*) = 1 THEN 10.5
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30
    END AS discount
FROM
    person_order p_o JOIN menu m ON (p_o.menu_id = m.id)
GROUP BY
    p_o.person_id,
    m.pizzeria_id
ORDER BY
    p_o.person_id,
    m.pizzeria_id;