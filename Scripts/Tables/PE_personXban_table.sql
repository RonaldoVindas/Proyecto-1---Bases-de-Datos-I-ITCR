/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE personXban(
	id_person NUMBER(8),
	id_ban NUMBER(6)
);


/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE personXban
IS 'Repository to store the relationships between persons and bans.';

	COMMENT ON COLUMN personXban.id_person
	IS 'Person identification.';

	COMMENT ON COLUMN personXban.id_ban
	IS 'Ban identification.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE personXban
ADD CONSTRAINT pk_personXban PRIMARY KEY (id_person, id_ban)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE personXban
ADD CONSTRAINT fk_personXban_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personXban
ADD CONSTRAINT fk_personXban_id_ban FOREIGN KEY
(id_ban) REFERENCES ban(id_ban);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE personXban
ADD creation_date DATE
ADD creation_user VARCHAR(10)
ADD date_last_modification DATE
ADD user_last_modification VARCHAR(10);


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeInsertpersonXban
BEFORE UPDATE
ON pe.personXban
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeInsertpersonXban; 

/

CREATE OR REPLACE TRIGGER pe.beforeUPDATEpersonXban
BEFORE UPDATE
ON pe.personXban
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonXban; 