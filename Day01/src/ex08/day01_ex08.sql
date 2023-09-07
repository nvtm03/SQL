SELECT
    order_date,
    person_information
FROM
    person_order
NATURAL JOIN
    (SELECT id AS person_id, CONCAT(name, ' (age:', age, ')') AS person_information FROM person) t
ORDER BY
    order_date,
    person_information;