-- Session #1
BEGIN;
-- Session #2
BEGIN;

-- Session #1
UPDATE pizzeria SET rating = 4.0 WHERE name = 'Pizza Hut';
-- Session #2
UPDATE pizzeria SET rating = 5.0 WHERE name = 'Dominos';

-- Session #1
UPDATE pizzeria SET rating = 4.5 WHERE name = 'Dominos';
-- Session #2
UPDATE pizzeria SET rating = 3.5 WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;
-- Session #2
COMMIT;

-- Session #1
SELECT * FROM pizzeria;
-- Session #2
SELECT * FROM pizzeria;
