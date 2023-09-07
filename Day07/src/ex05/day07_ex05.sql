SELECT
    DISTINCT p.name
FROM
    person_order p_o JOIN person p ON (p_o.person_id = p.id)
ORDER BY
    p.name;
