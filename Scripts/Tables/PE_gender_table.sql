/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE gender 
	(
		id_gender NUMBER(2),
		description VARCHAR(50) CONSTRAINT gender_description_not_null NOT NULL,
	);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE pe.gender
IS 'Repository to store information regarding the person gender.';

	COMMENT ON COLUMN gender.id_gender
	IS 'Gender identification.';

	COMMENT ON COLUMN gender.description
	IS 'Gender description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE gender
ADD CONSTRAINT pk_gender PRIMARY KEY (id_gender)
USING INDEX
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE gender
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_gender
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTGender
BEFORE INSERT
ON pe.gender
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_gender:=s_gender.nextval;
END beforeINSERTGender;
/
CREATE OR REPLACE TRIGGER pe.beforeUpdateGender
BEFORE UPDATE
ON pe.gender
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdateGender;

