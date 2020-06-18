/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE province(
	id_province NUMBER(5),
	name VARCHAR2(30) CONSTRAINT province_name_nn NOT NULL
	id_country NUMBER(5)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE province
IS 'Repository to store information about the province where Case Files happens.';

	COMMENT ON COLUMN province.id_province
	IS 'Province identification.';

	COMMENT ON COLUMN province.name
	IS 'Province name.';

	COMMENT ON COLUMN province.id_country
	IS 'Country identification.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE province
ADD CONSTRAINT pk_province PRIMARY KEY (id_province)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/
/*En esquema FI ===============================================================*/
ALTER TABLE province
ADD CONSTRAINT fk_province_id_country FOREIGN KEY
(id_country) REFERENCES country(id_country);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE province
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_province
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertprovince
BEFORE UPDATE
ON fi.province
FOR EACH ROW
BEGIN
	:new.id_province := s_province.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertprovince; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEprovince
BEFORE UPDATE
ON fi.province
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEprovince; 
