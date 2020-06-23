/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE person_has_file(
	id_person NUMBER(8),
	id_criminal_record NUMBER(6)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE person_has_file
IS 'Repository to store information about the relationship between the guilty Person and Case File.';

	COMMENT ON COLUMN person_has_file.id_person
	IS 'Person identification.';

	COMMENT ON COLUMN person_has_file.id_criminal_record
	IS 'Case File identification.';


/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE person_has_file
ADD CONSTRAINT pk_person_has_file PRIMARY KEY (id_person, id_criminal_record)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);
/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/
/*En esquema FI ===============================================================*/

ALTER TABLE person_has_file
ADD CONSTRAINT fk_personhasfile_id_person FOREIGN KEY
(id_person) REFERENCES pe.person(id_person);

ALTER TABLE person_has_file
ADD CONSTRAINT fk_personhasfile_idcrimrecord FOREIGN KEY
(id_criminal_record) REFERENCES criminal_record(id_criminal_record);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE person_has_file
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertperson_has_file
BEFORE UPDATE
ON fi.person_has_file
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertperson_has_file; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEperson_has_file
BEFORE UPDATE
ON fi.person_has_file
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEperson_has_file; 
