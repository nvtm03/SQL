CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'DELETE') THEN
            INSERT INTO person_audit
            SELECT now(), 'D', old.id, old.name, old.age, old.gender, old.address;
            RETURN old;
        END IF;
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;


CREATE TRIGGER trg_person_delete_audit
AFTER DELETE ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;

SELECT * FROM person_audit;
SELECT * FROM person;

