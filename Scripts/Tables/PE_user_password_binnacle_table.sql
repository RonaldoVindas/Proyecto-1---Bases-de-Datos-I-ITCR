/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema PE ===============================================================*/

CREATE TABLE user_password_binnacle(
	id_user_password_binnacle NUMBER(8),
	user_password_date DATE, 				
	old_password VARCHAR2(20) CONSTRAINT pass_binnacle_oldpassword_nn NOT NULL,
	new_password VARCHAR2(20) CONSTRAINT pass_binnacle_newpassword_nn NOT NULL
	);
/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE user_password_binnacle
IS 'Binnacle to store the control of dates and how many password changes has a specific person or user during time.';

	COMMENT ON COLUMN user_password_binnacle.id_user_password_binnacle
	IS 'Password change indentification of a specific user.';

	COMMENT ON COLUMN user_password_binnacle.user_password_date
	IS 'User´s password change date.';

	COMMENT ON COLUMN user_password_binnacle.old_password
	IS 'User old password.';

	COMMENT ON COLUMN user_password_binnacle.new_password
	IS 'User new password.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE user_password_binnacle
ADD CONSTRAINT pk_user_password_binnacle PRIMARY KEY (id_user_password_binnacle)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE user_password_binnacle
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema PE ===============================================================*/

CREATE SEQUENCE s_user_password_binnacle
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeInsertpassword_binnacle
BEFORE UPDATE
ON pe.user_password_binnacle
FOR EACH ROW
BEGIN
	:new.id_user_password_binnacle:=s_user_password_binnacle.nextval;
    :new.creation_date := SYSDATE;
    :new.date_last_modification:= SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEpassword_binnacle; 

/

CREATE OR REPLACE TRIGGER pe.beforeUPDATEpassword_binnacle
BEFORE UPDATE
ON pe.user_password_binnacle
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpassword_binnacle; 
