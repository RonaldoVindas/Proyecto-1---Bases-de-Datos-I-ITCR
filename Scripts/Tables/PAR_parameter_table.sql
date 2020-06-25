/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema PAR ===============================================================*/

CREATE TABLE parameter(
	id_parameter NUMBER(8),
	name VARCHAR2(20) CONSTRAINT parameter_name_nn NOT NULL,
	value VARCHAR2(40)
    );


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PAR ===============================================================*/
COMMENT ON TABLE par.parameter
IS 'Repository to store informtion about different joins parameters.';

	COMMENT ON COLUMN parameter.id_parameter
	IS 'Parameter identification.';

	COMMENT ON COLUMN parameter.name
	IS 'Parameter name.';

	COMMENT ON COLUMN parameter.value
	IS 'Parameter Valor.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PAR ===============================================================*/

ALTER TABLE parameter
ADD CONSTRAINT pk_parameter PRIMARY KEY (id_parameter)
USING INDEX 
TABLESPACE par_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PAR ===============================================================*/

ALTER TABLE parameter
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/

CREATE SEQUENCE s_parameter
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999999999999999999999999999999999
NOCACHE
NOCYCLE;

/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER par.beforeInsertparameter
BEFORE INSERT
ON par.parameter
FOR EACH ROW
BEGIN
	 :new.id_parameter:=s_parameter.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertparameter;
/

CREATE OR REPLACE TRIGGER par.beforeUPDATEparameter
BEFORE UPDATE
ON par.parameter
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEparameter; 
