-- Session #1
BEGIN ISOLATION LEVEL READ COMMITTED;
-- Session #2
BEGIN ISOLATION LEVEL READ COMMITTED;

-- Session #1
select SUM(rating) from pizzeria;

-- Session #2
UPDATE pizzeria SET rating = 1.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
select SUM(rating) from pizzeria;
COMMIT;

-- Session #1
select SUM(rating) from pizzeria;
-- Session #2
select SUM(rating) from pizzeria;
