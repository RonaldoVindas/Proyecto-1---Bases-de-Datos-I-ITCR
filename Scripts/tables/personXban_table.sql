CREATE TABLE personXban(
	id_person NUMBER(8),
	id_ban NUMBER(6),
);

COMMENT ON personXban
IS 'Repository to store the relationships between persons and bans.';

	COMMENT ON  personXban.id_person
	IS 'Person identification.';

	COMMENT ON personXban.id_ban
	IS 'Ban identification.';

ALTER TABLE personXban
ADD CONSTRAINT pk_personXban PRIMARY KEY (id_person, id_ban)
USING INDEX gen_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


ALTER TABLE personXban
ADD CONSTRAINT fk_personXban_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personXban
ADD CONSTRAINT fk_personXban_id_ban FOREIGN KEY
(id_ban) REFERENCES ban(id_ban);


ALTER TABLE personXban
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*
CREATE SEQUENCE s_personXban_id_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE s_personXban_id_ban
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;
*/

CREATE OR REPLACE TRIGGER gen.beforeInsertpersonXban
BEFORE UPDATE
ON gen.personXban
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEpersonXban; 


CREATE OR REPLACE TRIGGER gen.beforeUPDATEpersonXban
BEFORE UPDATE
ON gen.personXban
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonXban; 