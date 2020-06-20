/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE type_person (   												/*Tipo de Persona: Usuario, Admin, Impputado, etc*/
		id_type_person NUMBER(6),
		description VARCHAR(50) CONSTRAINT type_person_description_nn NOT NULL
	);


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE type_person
IS 'Repository to store the type of a person. It referes to which role the person has in the Database.';

	COMMENT ON COLUMN type_person.id_type_person
	IS 'Type of Person identification.';

	COMMENT ON COLUMN type_person.description
	IS 'Type of Person descrption.';


/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE type_person
ADD CONSTRAINT pk_type_person PRIMARY KEY (id_type_person)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE type_person
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_type_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTtype_person
BEFORE INSERT
ON pe.type_person
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_type_person:=s_type_person.nextval;
END beforeINSERTtype_person;
/
CREATE OR REPLACE TRIGGER pe.beforeUpdatetype_person
BEFORE UPDATE
ON pe.type_person
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdatetype_person;

