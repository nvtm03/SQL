SELECT
    piz.name AS pizzeria_name
FROM
    (
    SELECT pizzeria_id FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE name = 'Andrey')
    EXCEPT
    SELECT
        m.pizzeria_id
    FROM
        (SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE name = 'Andrey')) p_o
        JOIN menu m ON (p_o.menu_id = m.id)
) main_table
JOIN pizzeria piz ON (main_table.pizzeria_id = piz.id)
ORDER BY
    pizzeria_name;