CREATE TABLE person_register_file(
	id_person NUMBER (8),
	id_case_file NUMBER(6),
	sentence_years NUMBER(6),
	sentence_start DATE(),
	sentence_end DATE(),
	sentence_expiration DATE(),
	sentence_date DATE()
	sentence_number NUMBER(6),
	resolution VARCHAR2(50) CONSTRAINT personXfile_resolution_not_null NOT NULL,
	house_for_jail BIT,
);

COMMENT ON person_register_file
IS 'Repository to store information about the relationship between Person and Case File creators.'

	COMMENT ON person_register_file.id_person
	IS 'Person´s identification.';

	COMMENT ON person_register_file.id_case_file
	IS 'Case File identification.';

	COMMENT ON person_register_file.sentence_years
	IS 'Case File Years of sentence to the Person.';

	COMMENT ON person_register_file.sentence_start
	IS 'Case File start of the sentence to the Person.';

	COMMENT ON person_register_file.sentence_end
	IS 'Case File end of the sentence to the Person.';

	COMMENT ON person_register_file.sentence_expiration
	IS 'Case File expiration of the sentence to the Person.';

	COMMENT ON person_register_file.sentence_number
	IS 'Case File number of sentence.';

	COMMENT ON person_register_file.resolution
	IS 'Case File final resolution about the judgement.';

	COMMENT On person_register_file.house_for_jail
	IS 'Case File allows or not house for jail option to the person.';

ALTER TABLE person_register_file
ADD CONSTRAINT pk_person_register_file PRIMARY KEY (id_person, id_case_file)
USING INDEX gen_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

ALTER TABLE person_register_file
ADD CONSTRAINT fk_person_register_file_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE person_register_file
ADD CONSTRAINT fk_person_register_file_id_case_file FOREIGN KEY
(id_case_file) REFERENCES case_file(id_case_file);

/*
CREATE SEQUENCE s_person_register_file_id_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE s_person_register_file_id_case_file
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;
*/

ALTER TABLE person_register_file
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

CREATE OR REPLACE TRIGGER gen.beforeINSERTperson_register_file
BEFORE INSERT
ON gen.person_register_file
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
END beforeINSERTperson_register_file;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEperson_register_file
BEFORE UPDATE
ON gen.person_register_file
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEperson_register_file;
