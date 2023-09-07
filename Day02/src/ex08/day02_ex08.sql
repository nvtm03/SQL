SELECT
    per.name
FROM
    (SELECT id, name FROM person WHERE address IN ('Moscow', 'Samara') AND gender = 'male') per
    JOIN person_order p_o ON (per.id = p_o.person_id)
    JOIN (SELECT id FROM menu WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')) m ON (p_o.menu_id = m.id)
ORDER BY
    per.name DESC