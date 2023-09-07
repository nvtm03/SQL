SELECT
    piz.name,
    main_table.count,
    main_table.action_type
FROM
((
    SELECT
        pizzeria_id,
        count(id) AS count,
        'visit' AS action_type
    FROM
        person_visits
    GROUP BY
        pizzeria_id
    ORDER BY
        count DESC
    LIMIT 3)
UNION
    (SELECT
        m.pizzeria_id,
        count(p_o.id) AS count,
        'order' AS action_type
    FROM
        person_order p_o JOIN menu m ON (p_o.menu_id = m.id)
    GROUP BY
        m.pizzeria_id
    ORDER BY
        count DESC
    LIMIT 3)
) main_table JOIN pizzeria piz ON (main_table.pizzeria_id = piz.id)
ORDER BY
    action_type,
    count DESC;