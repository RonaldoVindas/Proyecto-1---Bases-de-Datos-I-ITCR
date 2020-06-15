CREATE TABLE person_has_file(
	id_person NUMBER(8),
	id_case_file NUMBER(6)
);

COMMENT ON person_has_file
IS 'Repository to store information about the relationship between the guilty Person and Case File.';

	COMMENT ON person_has_file.id_person
	IS 'Person identification.';

	COMMENT ON person_has_file.id_case_file
	IS 'Case File identification.';


ALTER TABLE person_has_file
ADD CONSTRAINT pk_person_has_file PRIMARY KEY (id_person, id_case_file)
USING INDEX gen_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

ALTER TABLE person_has_file
ADD CONSTRAINT fk_person_has_file_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE person_has_file
ADD CONSTRAINT fk_person_has_file_id_case_file FOREIGN KEY
(id_case_file) REFERENCES case_file(id_case_file);

ALTER TABLE person_has_file
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*
CREATE SEQUENCE s_person_has_file_id_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE s_person_has_file_id_case_file
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;
*/

CREATE OR REPLACE TRIGGER gen.beforeINSERTperson_has_file
BEFORE INSERT
ON gen.person_has_file
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
END beforeINSERTperson_has_file;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEperson_has_file
BEFORE UPDATE
ON gen.person_has_file
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEperson_has_file;