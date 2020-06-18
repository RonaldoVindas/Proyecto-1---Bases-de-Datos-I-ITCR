/*==================================================CREACIÓN DE TABLAS======================================================*/
/*En esquema PE ===============================================================*/
CREATE TABLE personXphoto(
	id_person NUMBER(8),
	id_photo  NUMBER(12)
);

/*==================================================COMENTARIOS EN TABLAS Y COLUMNAS======================================================*/

/*En esquema PE ===============================================================*/
COMMENT ON TABLE personXphoto
IS 'Repository to store the relationships between persons and their photos.';

	COMMENT ON COLUMN personXphoto.id_person
	IS 'Person identification.';

	COMMENT ON COLUMN personXphoto.id_photo
	IS 'Photo identification.';
/*==================================================CREACIÓN DE LLAVES PRIMARIAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE personXphoto
ADD CONSTRAINT pk_personXphoto PRIMARY KEY (id_person, id_photo)
USING INDEX 
TABLESPACE pe_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);
/*==================================================CREACIÓN DE LLAVES FORÁNEAS======================================================*/

/*En esquema PE ===============================================================*/

ALTER TABLE personXphoto
ADD CONSTRAINT fk_personXphoto_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personXphoto
ADD CONSTRAINT fk_personXphoto_id_photo FOREIGN KEY
(id_photo) REFERENCES photo(id_photo);


/*==================================================CAMPOS DE AUDITORÍA PARA TABLAS======================================================*/
/* CAMPOS DE AUDITORÍA AÚN NO TIENEN COMENTARIOS!!!!!!!!!*/

/*En esquema PE ===============================================================*/
ALTER TABLE personXphoto
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);


/*==================================================CREACIÓN DE TRIGGERS PARA TABLAS======================================================*/

CREATE OR REPLACE TRIGGER pe.beforeInsertpersonXphoto
BEFORE UPDATE
ON pe.personXphoto
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEpersonXphoto; 

/

CREATE OR REPLACE TRIGGER pe.beforeUPDATEpersonXphoto
BEFORE UPDATE
ON pe.personXphoto
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonXphoto; 