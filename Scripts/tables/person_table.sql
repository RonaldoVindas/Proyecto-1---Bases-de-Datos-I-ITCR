CREATE TABLE person(
	id_person NUMBER(8),
	first_name VARCHAR2(20) CONSTRAINT person_first_name_not_null NOT NULL,
	last_name VARCHAR2(30) CONSTRAINT person_last_name_not_null NOT NULL,
	birth_day DATE,
	user_name VARCHAR2(30) CONSTRAINT person_user_name_unique UNIQUE, /*Qué pasa con las personas que no están registradas en la base?*/
	password VARCHAR2(20) CONSTRAINT person_password_not_null NOT NULL,
	id_genre NUMBER(6),
	id_institution NUMBER(6),
	id_user_password_binnacle NUMBER(8),
	id_type_person NUMBER(6),
);

COMMENT ON person
Is 'Repository to store person´s information.';

	COMMENT ON person.id_person
	IS 'Person´s identification.';

	COMMENT ON person.first_name
	IS 'Person´s first name.';

	COMMENT ON person.last_name
	IS 'Person´s last name.';

	COMMENT ON person.birth_day
	IS 'Person´s birth day.';

	COMMENT ON person.user_name
	IS 'Person´s user name.';

	COMMENT ON person.password
	IS 'Person´s password.';

	COMMENT ON person.id_genre
	IS 'Person´s genre identification';

	COMMENT ON person.id_institution
	IS 'Person´s institution identification.';

	COMMENT ON person.id_user_password_binnacle
	IS 'Person´s password identification in the binnacle.';

	COMMENT ON person.id_type_person
	IS 'Person´s type identification.';


ALTER TABLE person
ADD CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX gen_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

ALTER TABLE person
ADD CONSTRAINT fk_person_id_user_password_binnacle FOREIGN KEY
(id_user_password_binnacle) REFERENCES user_password_binnacle(id_user_password_binnacle);

ALTER TABLE person
ADD CONSTRAINT fk_person_id_type_person FOREIGN KEY
(id_type_person) REFERENCES type_person(id_type_person);

ALTER TABLE person
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

CREATE SEQUENCE s_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE OR REPLACE TRIGGER gen.beforeInsertperson
BEFORE UPDATE
ON gen.person
FOR EACH ROW
BEGIN
	:new.id_person:=s_person.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEperson; 


CREATE OR REPLACE TRIGGER gen.beforeUPDATEperson
BEFORE UPDATE
ON gen.person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson; 
