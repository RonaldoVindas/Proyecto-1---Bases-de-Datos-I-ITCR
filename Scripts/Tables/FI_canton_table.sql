/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE canton(
	id_canton NUMBER(10),
	name VARCHAR2(30) CONSTRAINT canton_name_not_null NOT NULL,
	id_province NUMBER(5)
);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE canton
IS 'Repository to store information about the canton where Case Files happens.';

	COMMENT ON COLUMN canton.id_canton
	IS 'Canton identification.';

	COMMENT ON COLUMN canton.name
	IS 'Canton name.';

	COMMENT ON COLUMN canton.id_province
	IS 'Province identification.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE canton
ADD CONSTRAINT pk_canton PRIMARY KEY (id_canton)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);


/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/
/*En esquema FI ===============================================================*/
ALTER TABLE canton
ADD CONSTRAINT fk_canton_id_province FOREIGN KEY
(id_province) REFERENCES province(id_province);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE canton
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_canton
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertcanton
BEFORE UPDATE
ON fi.canton
FOR EACH ROW
BEGIN
	:new.id_canton := s_canton.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcanton; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEcanton
BEFORE UPDATE
ON fi.canton
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcanton; 
