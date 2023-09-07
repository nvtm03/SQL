SELECT
    piz.name AS pizzeria_name
FROM
((
    (SELECT p_v.pizzeria_id
    FROM
        (SELECT * FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE gender = 'female')) p_v
    )
    EXCEPT ALL
    (SELECT p_v.pizzeria_id
    FROM
        (SELECT * FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE gender = 'male')) p_v
    )
)
UNION ALL
(
    (SELECT p_v.pizzeria_id
    FROM
        (SELECT * FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE gender = 'male')) p_v
    )
    EXCEPT ALL
    (SELECT p_v.pizzeria_id
    FROM
        (SELECT * FROM person_visits WHERE person_id IN (SELECT id FROM person WHERE gender = 'female')) p_v
    )
)) main_table
JOIN pizzeria piz ON (main_table.pizzeria_id = piz.id)
ORDER BY
    pizzeria_name;