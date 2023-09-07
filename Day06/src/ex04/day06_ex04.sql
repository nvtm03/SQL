ALTER TABLE person_discounts
        ADD CONSTRAINT ch_nn_person_id check ( person_id IS NOT NULL ),
        ADD CONSTRAINT ch_nn_pizzeria_id check ( pizzeria_id IS NOT NULL ),
        ADD CONSTRAINT ch_nn_discount check ( discount IS NOT NULL ),
        ALTER COLUMN discount SET DEFAULT 0,
        ADD CONSTRAINT ch_range_discount CHECK ( discount BETWEEN 0 AND 100);
