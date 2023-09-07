CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'UPDATE') THEN
            INSERT INTO person_audit
            SELECT now(), 'U', old.id, old.name, old.age, old.gender, old.address;
            RETURN old;
        END IF;
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_update_audit
AFTER UPDATE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;

SELECT * FROM person_audit;
SELECT * FROM person;

