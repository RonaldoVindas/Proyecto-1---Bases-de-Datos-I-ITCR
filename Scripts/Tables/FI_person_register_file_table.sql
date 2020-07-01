/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE person_register_file(
	id_person NUMBER (8),
	id_criminal_record NUMBER(6),
	sentence_years NUMBER(6),
	sentence_start DATE,
	sentence_end DATE,
	sentence_expiration DATE,
	sentence_date DATE,
	sentence_number NUMBER(6),
    	house_for_jail VARCHAR2(3) CONSTRAINT personRegfile_houseforjail_nn NOT NULL,
	resolution VARCHAR2(50) CONSTRAINT personRegfile_resolution_nn NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE person_register_file
IS 'Repository to store information about the relationship between Person and Case File creators.';

	COMMENT ON COLUMN person_register_file.id_person
	IS 'Person´s identification.';

	COMMENT ON COLUMN person_register_file.id_criminal_record
	IS 'Case File identification.';

	COMMENT ON COLUMN person_register_file.sentence_years
	IS 'Case File Years of sentence to the Person.';

	COMMENT ON COLUMN person_register_file.sentence_start
	IS 'Case File start of the sentence to the Person.';

	COMMENT ON COLUMN person_register_file.sentence_end
	IS 'Case File end of the sentence to the Person.';

	COMMENT ON COLUMN person_register_file.sentence_expiration
	IS 'Case File expiration of the sentence to the Person.';

	COMMENT ON COLUMN person_register_file.sentence_date
	IS 'Case File date of sentence.';

	COMMENT ON COLUMN person_register_file.sentence_number
	IS 'Case File number of sentence.';

	COMMENT ON COLUMN person_register_file.resolution
	IS 'Case File final resolution about the judgement.';

	COMMENT On COLUMN person_register_file.house_for_jail
	IS 'Case File allows or not house for jail option to the person.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE person_register_file
ADD CONSTRAINT pk_person_register_file PRIMARY KEY (id_person, id_criminal_record)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FOR�?NEAS======================================================*/
/*En esquema FI ===============================================================*/
ALTER TABLE fi.person_register_file
ADD CONSTRAINT fk_personRegfile_id_person FOREIGN KEY
(id_person) REFERENCES pe.person(id_person);

ALTER TABLE person_register_file
ADD CONSTRAINT fk_personRegfile_idcrimerecord FOREIGN KEY
(id_criminal_record) REFERENCES criminal_record(id_criminal_record);
/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE person_register_file
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertperRegFile
BEFORE INSERT
ON fi.person_register_file
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertperRegFile; 

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEpersonregisterfile
BEFORE UPDATE
ON fi.person_register_file
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonregisterfile; 
