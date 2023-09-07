SELECT
    order_date,
    person_information
FROM
    person_order
JOIN
    (SELECT id, CONCAT(name, ' (age:', age, ')') AS person_information FROM person) t
ON (person_order.person_id = t.id)
ORDER BY
    order_date,
    person_information;