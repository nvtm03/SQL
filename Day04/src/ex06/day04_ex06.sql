CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
    SELECT
        piz.name AS pizzeria_name
    FROM
    ((
        SELECT
            pizzeria_id
        FROM
            person_visits
        WHERE
            person_id = (SELECT id FROM person WHERE name = 'Dmitriy')
            AND visit_date = '2022-01-08'
    )
    INTERSECT
    (
        SELECT pizzeria_id FROM menu WHERE price < 800
    )) main_table
    JOIN pizzeria piz ON (main_table.pizzeria_id = piz.id)
) WITH DATA;

SELECT * FROM mv_dmitriy_visits_and_eats;
