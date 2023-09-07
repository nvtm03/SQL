SELECT
    main_table.name AS pizzeria_name
FROM
((
    SELECT
        piz.name
    FROM
        (
            SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE gender = 'female')) p_o
            JOIN menu m ON (p_o.menu_id = m.id)
            JOIN pizzeria piz ON (m.pizzeria_id = piz.id
        )
    EXCEPT
    SELECT
        piz.name
    FROM
        (
            SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE gender = 'male')) p_o
            JOIN menu m ON (p_o.menu_id = m.id)
            JOIN pizzeria piz ON (m.pizzeria_id = piz.id
        )
)
UNION
(
    SELECT
        piz.name
    FROM
        (
            SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE gender = 'male')) p_o
            JOIN menu m ON (p_o.menu_id = m.id)
            JOIN pizzeria piz ON (m.pizzeria_id = piz.id
        )
    EXCEPT
    SELECT
        piz.name
    FROM
        (
            SELECT menu_id FROM person_order WHERE person_id IN (SELECT id FROM person WHERE gender = 'female')) p_o
            JOIN menu m ON (p_o.menu_id = m.id)
            JOIN pizzeria piz ON (m.pizzeria_id = piz.id
        )
)) main_table
ORDER BY
    pizzeria_name