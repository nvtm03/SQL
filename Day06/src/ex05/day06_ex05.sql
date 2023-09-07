COMMENT ON TABLE person_discounts IS 'Это таблица, где указаны персональные скидки для клиентов в конкретных пиццериях';

COMMENT ON COLUMN person_discounts.id IS 'В этой колонке хранится id (Primary key)';

COMMENT ON COLUMN person_discounts.person_id IS 'В этой колонке хранится id пользователя';

COMMENT ON COLUMN person_discounts.pizzeria_id IS 'В этой колонке хранится id пиццерии';

COMMENT ON COLUMN person_discounts.discount IS 'В этой колонке хранится персональная скидка пользователя';
