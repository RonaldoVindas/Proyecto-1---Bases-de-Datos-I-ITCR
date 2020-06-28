/*==================================================CREACIÓN DE TABLAS======================================================*/

/*En esquema FI ===============================================================*/

CREATE TABLE country(
	id_country NUMBER(5),
	name VARCHAR2(30) CONSTRAINT country_name_not_null NOT NULL
);


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema FI ===============================================================*/
COMMENT ON TABLE country
IS 'Repository to store information about the country where Case Files happens.';

	COMMENT ON COLUMN country.id_country
	IS 'Country identification.';

	COMMENT ON COLUMN country.name
	IS 'Country name.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema FI ===============================================================*/

ALTER TABLE country
ADD CONSTRAINT pk_country PRIMARY KEY (id_country)
USING INDEX 
TABLESPACE fi_ind PCTFREE 20
STORAGE (INITIAL 10k NEXT 10K PCTINCREASE 0);

/*==================================================CAMPOS DE AUDITOR�?A PARA TABLAS======================================================*/
/* CAMPOS DE AUDITOR�?A AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema FI ===============================================================*/

ALTER TABLE country
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);

/*==================================================CREACIÓN DE SECUENCIAS PARA ID´s DE TODAS LAS TABLAS======================================================*/


/*En esquema FI ===============================================================*/
CREATE SEQUENCE s_country
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999
NOCACHE
NOCYCLE;


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER fi.beforeInsertcountry
BEFORE INSERT
ON fi.country
FOR EACH ROW
BEGIN
	:new.id_country:=s_country.nextval;
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertcountry;

/

CREATE OR REPLACE TRIGGER fi.beforeUPDATEcountry
BEFORE UPDATE
ON fi.country
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEcountry; 
