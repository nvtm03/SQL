SELECT
    address,
    round(MAX(age) - (MIN(age) / MAX(age) :: DECIMAL), 2) AS formula,
    ROUND(AVG(age), 2) AS average,
    CASE
        WHEN round(MAX(age) - (MIN(age) / MAX(age) :: DECIMAL), 2) > ROUND(AVG(age), 2) THEN TRUE
        ELSE FALSE
    END comparison
FROM
    person
GROUP BY
    address
ORDER BY
    address;
