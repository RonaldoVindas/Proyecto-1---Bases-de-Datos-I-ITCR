/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE ban_motive
(
    id_ban_motive NUMBER(6),
    ban_motive_description VARCHAR2(20) CONSTRAINT person_first_name_nn NOT NULL
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE ban_motive
IS 'Repository to store information about ban reasons.';

	COMMENT ON COLUMN ban_motive.id_ban_motive
	IS 'Ban reason identification.';

	COMMENT ON COLUMN ban_motive.ban_motive_description
	IS 'Ban reason description.';

/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE ban_motive
ADD CONSTRAINT pk_ban_motive PRIMARY KEY (id_ban_motive)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/

ALTER TABLE ban_motive
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE  TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_ban_motive
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeINSERTban_motive
BEFORE INSERT
ON pe.ban_motive
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_ban_motive:=s_ban_motive.nextval;
END beforeINSERTbban_motive;

/
CREATE OR REPLACE TRIGGER pe.beforeUPDATEban_motive
BEFORE UPDATE
ON pe.ban_motive
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEban_motive;

