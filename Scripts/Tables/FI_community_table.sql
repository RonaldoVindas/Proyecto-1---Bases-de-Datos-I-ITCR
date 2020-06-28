/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE community(
	id_community NUMBER(10),
	name VARCHAR2(30) CONSTRAINT community_name_nn NOT NULL,
	id_district NUMBER(10)
);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE community
IS 'Repository to store information about the community where Case Files happens.';

	COMMENT ON COLUMN community.id_community
	IS 'Community identification.';

	COMMENT ON COLUMN community.name
	IS 'Community name.';

	COMMENT ON COLUMN community.id_district
	IS 'District identification.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE community
ADD CONSTRAINT pk_community PRIMARY KEY (id_community)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FOR�?NEAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE community
ADD CONSTRAINT fk_community_id_district FOREIGN KEY
(id_district) REFERENCES district(id_district);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE community
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_community
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 9999999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertcommunity
BEFORE INSERT
ON fi.community
FOR EACH ROW
BEGIN
	:new.id_community := s_community.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcommunity; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEcommunity
BEFORE UPDATE
ON fi.community
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcommunity; 
