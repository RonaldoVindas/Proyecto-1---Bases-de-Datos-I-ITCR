/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE ban (
	id_ban NUMBER(6),
	ban_time DATE,
	id_motive NUMBER(6)    
	);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE ban
IS 'Repository to store information about bans.';

	COMMENT ON COLUMN ban.id_ban
	IS 'Ban identification.';

	COMMENT ON COLUMN ban.ban_time
	IS 'Refers to how much time a person is banned.';

	COMMENT ON COLUMN ban.id_motive
	IS 'Ban´s motive identification.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE ban
ADD CONSTRAINT pk_ban PRIMARY KEY (id_ban)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CREACIÓN DE LLAVES FOR�?NEAS======================================================*/

/*En esquema PE ===============================================================*/
ALTER TABLE ban
ADD CONSTRAINT fk_ban_id_motive FOREIGN KEY
(id_motive) REFERENCES ban_motive(id_ban_motive);


/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/

ALTER TABLE ban
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_ban
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTban
BEFORE INSERT
ON pe.ban
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_ban:=s_ban.nextval;
END beforeINSERTban;
/
CREATE OR REPLACE TRIGGER pe.beforeUPDATEban
BEFORE UPDATE
ON pe.ban
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEban;

