/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE crime_type(
	id_crime_type NUMBER(6),
	crime_level NUMBER(2),
	description VARCHAR2(50) CONSTRAINT type_crime_description_nn NOT NULL
);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE crime_type
IS 'Repository to store information about crime types.';

	COMMENT ON COLUMN crime_type.id_crime_type
	IS 'Crime Type identification.';

	COMMENT ON COLUMN crime_type.crime_level
	IS 'Crime Type severity level.';

	COMMENT ON COLUMN crime_level.description
	IS 'Crime Type description.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE crime_type
ADD CONSTRAINT pk_crime_type PRIMARY KEY (id_crime_type)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE crime_type
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_crime_type
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertcrime_type
BEFORE UPDATE
ON fi.crime_type
FOR EACH ROW
BEGIN
	:new.id_crime_type:=s_crime_type.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcrime_type; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEcrime_type
BEFORE UPDATE
ON fi.crime_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcrime_type; 
