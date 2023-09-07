CREATE VIEW v_price_with_discount AS (
    SELECT
        p.name,
        m.pizza_name,
        m.price,
        ROUND(m.price * 0.9) AS discount_price
    FROM
        person_order p_o
        JOIN person p ON (p_o.person_id = p.id)
        JOIN menu m ON (p_o.menu_id = M.id)
    ORDER BY
        p.name,
        m.pizza_name
);

SELECT * FROM v_price_with_discount;