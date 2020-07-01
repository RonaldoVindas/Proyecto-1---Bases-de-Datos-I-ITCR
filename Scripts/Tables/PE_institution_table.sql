/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE institution 
	(
		id_institution NUMBER(6),
		institution_name VARCHAR2(50) CONSTRAINT institution_description_nn NOT NULL
	);


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE institution
IS 'Repository to store information regarding the person work place.';

	COMMENT ON COLUMN institution.id_institution
	IS 'Institution identification.';

	COMMENT ON COLUMN institution.name
	IS 'Institution description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE institution
ADD CONSTRAINT pk_institution PRIMARY KEY (id_institution)
USING INDEX
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE institution
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_institution
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTInstitution
BEFORE INSERT
ON pe.institution
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_institution:=s_institution.nextval;
END beforeINSERTInstitution;
/
CREATE OR REPLACE TRIGGER pe.beforeUpdateInstitution
BEFORE UPDATE
ON pe.institution
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdateInstitution;

