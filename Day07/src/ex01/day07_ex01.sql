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
) t JOIN person p ON (t.person_id = p.id)
ORDER BY
    count_of_visits DESC,
    p.name
LIMIT 4;
