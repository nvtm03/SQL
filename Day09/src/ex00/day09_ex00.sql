CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
    type_event CHAR(1) DEFAULT 'I' NOT NULL,
    CONSTRAINT ch_type_event CHECK ( type_event IN ('I', 'D', 'U') ),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age integer,
    gender VARCHAR,
    address VARCHAR
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $person_audit$
    BEGIN
        IF (TG_OP = 'INSERT') THEN
            INSERT INTO person_audit
            SELECT now(), 'I', new.id, new.name, new.age, new.gender, new.address;
            RETURN new;
        END IF;
        RETURN NULL;
    END;
$person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
    FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- SELECT * FROM person_audit;
-- SELECT * FROM person;