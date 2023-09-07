WITH gen_dates AS (
    SELECT
        dates :: DATE AS visit_date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates
)

SELECT
    gen_dates.visit_date AS missing_date
FROM
    gen_dates
        LEFT JOIN
    (SELECT DISTINCT visit_date FROM person_visits WHERE person_id = 1 OR person_id = 2) pv
        ON (gen_dates.visit_date = pv.visit_date)
WHERE
    pv.visit_date IS NULL
ORDER BY
    missing_date