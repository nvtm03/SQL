-- Session #1
BEGIN ISOLATION LEVEL SERIALIZABLE;
-- Session #2
BEGIN ISOLATION LEVEL SERIALIZABLE;

-- Session #1
select * from pizzeria WHERE name = 'Pizza Hut';

-- Session #2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
select * from pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session #1
select * from pizzeria WHERE name = 'Pizza Hut';
-- Session #2
select * from pizzeria WHERE name = 'Pizza Hut';
