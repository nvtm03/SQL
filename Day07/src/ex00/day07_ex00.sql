SELECT
    person_id,
    count(id) AS count_of_visits
FROM
    person_visits
GROUP BY
    person_id
ORDER BY
    count_of_visits DESC,
    person_id;
