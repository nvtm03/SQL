SELECT
    piz.name AS pizzeria_name
FROM
    (SELECT pizzeria_id, person_id, visit_date FROM person_visits
        WHERE
            visit_date = '2022-01-08' AND
            person_id = (SELECT id FROM person WHERE name = 'Dmitriy') AND
            pizzeria_id IN (SELECT pizzeria_id FROM menu WHERE price < 800)
    ) p_v
    JOIN pizzeria piz ON (p_v.pizzeria_id = piz.id);