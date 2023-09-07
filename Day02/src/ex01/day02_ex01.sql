SELECT
    t.visit_date AS missing_date
FROM
    (SELECT dates :: DATE AS visit_date FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates) t
        LEFT JOIN
    (SELECT DISTINCT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) pv
        ON (t.visit_date = pv.visit_date)
WHERE
    pv.visit_date IS NULL
ORDER BY
    missing_date