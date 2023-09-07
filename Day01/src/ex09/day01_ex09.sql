SELECT
    name
FROM
    pizzeria
WHERE
    id NOT IN (SELECT DISTINCT pizzeria_id FROM person_visits);

SELECT
    name
FROM
    pizzeria
WHERE
    NOT EXISTS (SELECT *  FROM person_visits WHERE pizzeria.id = pizzeria_id);