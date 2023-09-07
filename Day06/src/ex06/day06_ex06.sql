CREATE SEQUENCE seq_person_discounts AS BIGINT START 1;

SELECT setval('seq_person_discounts', (SELECT count(*) + 1 FROM person_discounts), FALSE);

ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');
