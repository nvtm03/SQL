SELECT
    p.name,
    t.count_of_visits
FROM
(
    SELECT
        person_id,
        count(id) AS count_of_visits
    FROM
        person_visits
    GROUP BY
        person_id
    HAVING
        count(id) > 3
) t JOIN person p ON (t.person_id = p.id);
