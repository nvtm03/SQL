CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
    RETURNS table(fib INTEGER) AS $$
    BEGIN
        RETURN QUERY
            WITH RECURSIVE fib AS (
                SELECT 0 AS num1, 0 AS num2
                UNION
                SELECT
                    num2,
                    CASE WHEN num2 = 0 THEN 1 ELSE num1 + num2 END
                FROM fib WHERE num1 + num2 < pstop
            ) SELECT num2 FROM fib;
    END;
$$ LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
