/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE criminal_record(
	id_criminal_record NUMBER(6),
	description VARCHAR(100) CONSTRAINT criminal_record_description_nn NOT NULL,
	id_crime_type NUMBER(6),
	id_community NUMBER(10)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE criminal_record
IS 'Repository to store information about case files.';

	COMMENT ON COLUMN criminal_record.id_criminal_record
	IS 'Case File identification.';

	COMMENT ON COLUMN criminal_record.description
	IS 'Case File description';

	COMMENT ON COLUMN criminal_record.id_crime_type
	IS 'Case File type of crime identification.';

	COMMENT ON COLUMN criminal_record.id_community
	IS 'Case File community identification.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE criminal_record
ADD CONSTRAINT pk_criminal_record PRIMARY KEY (id_criminal_record)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FOR�?NEAS======================================================*/
/*En esquema FI ===============================================================*/
ALTER TABLE criminal_record
ADD CONSTRAINT fk_criminalrecord_id_crimetype FOREIGN KEY
(id_crime_type) REFERENCES crime_type(id_crime_type);

ALTER TABLE criminal_record
ADD CONSTRAINT fk_criminalrecord_id_community FOREIGN KEY
(id_community) REFERENCES community(id_community);
/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE criminal_record
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_criminal_record
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertcriminal_record
BEFORE INSERT
ON fi.criminal_record
FOR EACH ROW
BEGIN
	:new.id_criminal_record := s_criminal_record.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcriminal_record; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEcriminal_record
BEFORE UPDATE
ON fi.criminal_record
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcriminal_record; 
