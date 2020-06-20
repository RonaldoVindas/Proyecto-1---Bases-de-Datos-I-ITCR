/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE photo (
	id_photo NUMBER(12),
	description VARCHAR2(50) CONSTRAINT photo_description_nn NOT NULL
	/*photo VARBINARY()   varbinary permite contener un puntero a la imagen*/
	);


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE photo
IS 'Repository to store people photos.';

	COMMENT ON COLUMN photo.id_photo
	IS 'Photo´s identification.';

	COMMENT ON COLUMN photo.description
	IS 'Photo´s description.';


/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE photo
ADD CONSTRAINT pk_photo PRIMARY KEY (id_photo)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/

ALTER TABLE photo
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_photo
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTphoto
BEFORE INSERT
ON pe.photo
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_photo:=s_photo.nextval;
END beforeINSERTphoto;
/
CREATE OR REPLACE TRIGGER pe.beforeUpdatephoto
BEFORE UPDATE
ON pe.photo
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdatephoto;

