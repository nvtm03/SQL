SELECT
    piz.name,
    sum(main_table.count) AS total_count
FROM
(
    (SELECT pizzeria_id, count(id) AS count FROM person_visits GROUP BY pizzeria_id)
    UNION ALL
    (SELECT m.pizzeria_id, count(p_o.id) AS count
    FROM person_order p_o JOIN menu m ON (p_o.menu_id = m.id) GROUP BY m.pizzeria_id)
) main_table JOIN pizzeria piz ON (main_table.pizzeria_id = piz.id)
GROUP BY
    piz.name
ORDER BY
    total_count DESC,
    piz.name;