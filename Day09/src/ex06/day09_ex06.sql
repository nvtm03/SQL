CREATE OR REPLACE FUNCTION
    fnc_person_visits_and_eats_on_date(pperson VARCHAR DEFAULT 'Dmitriy', pprice NUMERIC DEFAULT 500, pdate DATE DEFAULT '2022-01-08')
RETURNS table(pizzeria_name VARCHAR)
AS $$
    BEGIN
        RETURN QUERY
            SELECT
                DISTINCT piz.name
            FROM
                (SELECT pizzeria_id FROM person_visits
                WHERE visit_date = pdate
                    AND person_id IN (SELECT id FROM person WHERE name = pperson)) per_date
                JOIN
                (SELECT pizzeria_id FROM menu WHERE price < pprice) less
                    ON (per_date.pizzeria_id = less.pizzeria_id)
                JOIN pizzeria piz ON (less.pizzeria_id = piz.id)
            ORDER BY
                piz.name;
    END;
$$
LANGUAGE plpgsql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
