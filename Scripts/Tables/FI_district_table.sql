/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE district(
	id_district NUMBER(10),
	name VARCHAR2(30) CONSTRAINT district_name_nn NOT NULL,
	id_canton NUMBER(10)
);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE district
IS 'Repository to store information about the district where Case Files happens.';

	COMMENT ON COLUMN district.id_district
	IS 'District identification.';

	COMMENT ON COLUMN district.name
	IS 'District name.';

	COMMENT ON COLUMN district.id_canton
	IS 'Canton identification.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE district
ADD CONSTRAINT pk_district PRIMARY KEY (id_district)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);


/*==================================================CREACIÓN DE LLAVES FOR�?NEAS======================================================*/
/*En esquema FI ===============================================================*/
ALTER TABLE district
ADD CONSTRAINT fk_district_id_canton FOREIGN KEY
(id_canton) REFERENCES canton(id_canton);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE district
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_district
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertdistrict
BEFORE INSERT
ON fi.district
FOR EACH ROW
BEGIN
	:new.id_district := s_district.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertdistrict; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEdistrict
BEFORE UPDATE
ON fi.district
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEdistrict; 
