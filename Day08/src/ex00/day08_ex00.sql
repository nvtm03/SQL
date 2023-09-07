-- Session #1
select * from pizzeria;
-- Session #2
select * from pizzeria;

-- Session #1
BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';

select * from pizzeria;
-- Session #2
select * from pizzeria;

-- Session #1
COMMIT;
-- Session #2
select * from pizzeria;