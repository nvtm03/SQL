INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    generate_series((SELECT MAX(id) + 1 FROM person_order),
                    (SELECT MAX(id) FROM person_order) + (SELECT COUNT(id) FROM person)) id,
    generate_series((SELECT MIN(id) FROM person), (SELECT MAX(id) FROM person)) person_id,
    id,
    '2022-02-25'
FROM
    menu
WHERE
    pizza_name = 'greek pizza';

SELECT * FROM person_order;