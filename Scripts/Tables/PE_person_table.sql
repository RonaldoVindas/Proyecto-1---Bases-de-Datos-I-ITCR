/*==================================================CREACIÃ“N DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/

CREATE TABLE person(
	id_person NUMBER(9),
	first_name VARCHAR2(20) CONSTRAINT person_first_name_not_null NOT NULL,
	last_name VARCHAR2(30) CONSTRAINT person_last_name_not_null NOT NULL,
	birth_day DATE,
	email VARCHAR2(50) CONSTRAINT person_email_unique UNIQUE,
	user_name VARCHAR2(30) CONSTRAINT person_user_name_unique UNIQUE,
	password VARCHAR2(20),
	id_gender NUMBER(6),
	id_institution NUMBER(6),
	id_user_password_binnacle NUMBER(8)CONSTRAINT person_user_name_unique UNIQUE,
	id_type_person NUMBER(6)
);

ALTER TABLE person
ADD person_age NUMBER(4,4);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE person
Is 'Repository to store person´s information.';

	COMMENT ON COLUMN person.id_person
	IS 'Person´s identification.';

	COMMENT ON COLUMN person.first_name
	IS 'Person´s first name.';

	COMMENT ON COLUMN person.last_name
	IS 'Person´s last name.';

	COMMENT ON COLUMN person.birth_day
	IS 'Person´s birth day.';
    
	COMMENT ON COLUMN person.user_name
	IS 'Person´s user name.';

	COMMENT ON COLUMN person.password
	IS 'Person´s password.';

	COMMENT ON COLUMN person.id_gender
	IS 'Person´s genre identification';

	COMMENT ON COLUMN person.id_institution
	IS 'Person´s institution identification.';

	COMMENT ON COLUMN person.id_user_password_binnacle
	IS 'Person´s password identification in the binnacle.';

	COMMENT ON COLUMN person.id_type_person
	IS 'Person´s type identification.';


/*==================================================CREACIÃ“N DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE person
ADD CONSTRAINT pk_person PRIMARY KEY (id_person)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
/*==================================================CREACIÃ“N DE LLAVES FORÃ?NEAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE person
ADD CONSTRAINT fk_person_id_gender FOREIGN KEY
(id_gender) REFERENCES gender(id_gender);

ALTER TABLE person
MODIFY id_person NUMBER(20);

ALTER TABLE person
ADD CONSTRAINT fk_person_id_institution FOREIGN KEY
(id_institution) REFERENCES institution(id_institution);

ALTER TABLE person
ADD CONSTRAINT fk_person_id_password_binnacle FOREIGN KEY
(id_user_password_binnacle) REFERENCES user_password_binnacle(id_user_password_binnacle);

ALTER TABLE person
ADD CONSTRAINT fk_person_id_type_person FOREIGN KEY
(id_type_person) REFERENCES type_person(id_type_person);

ALTER TABLE person
MODIFY birth_day CONSTRAINT birth_day_not_null NOT NULL;
/*==================================================CAMPOS DE AUDITORÃ?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÃ?A AÃšN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE person
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÃ“N DE SECUENCIAS PARA IDÂ´s DE TODAS LAS TABLAS======================================================*/


/*En esquema PE ===============================================================*/

/*
CREATE SEQUENCE s_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;
*/

/*==================================================CREACIÃ“N DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeInsertperson
BEFORE INSERT
ON pe.person
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEperson; 

/

CREATE OR REPLACE TRIGGER pe.beforeUPDATEperson
BEFORE UPDATE
ON pe.person
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson; 
