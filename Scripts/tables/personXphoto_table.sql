CREATE TABLE personXphoto(
	id_person NUMBER(8),
	id_photo  NUMBER(12),
);

COMMENT ON personXphoto
IS 'Repository to store the relationships between persons and their photos.';

	COMMENT ON personXphoto.id_person
	IS 'Person identification.';

	COMMENT ON personXphoto.id_photo
	IS 'Photo identification.';


ALTER TABLE personXphoto
ADD CONSTRAINT pk_personXphoto PRIMARY KEY (id_person, id_photo)
USING INDEX gen_ind PCTFREE 20
STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 0);

ALTER TABLE personXphoto
ADD CONSTRAINT fk_personXphoto_id_person FOREIGN KEY
(id_person) REFERENCES person(id_person);

ALTER TABLE personXphoto
ADD CONSTRAINT fk_personXphoto_id_photo FOREIGN KEY
(id_photo) REFERENCES photo(id_photo);

ALTER TABLE personXphoto
ADD creation_date DATE;
ADD creation_user VARCHAR(10);
ADD date_last_modification DATE;
ADD user_last_modification VARCHAR(10);


/*
CREATE SEQUENCE s_personXphoto_id_person
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 99999999
NOCACHE
NOCYCLE;

CREATE SEQUENCE s_personXphoto_id_photo
INCREMENT BY 1
MINVALUE 0
MAXVALUE 999999
NOCACHE
NOCYCLE;
*/

CREATE OR REPLACE TRIGGER gen.beforeInsertpersonXphoto
BEFORE UPDATE
ON gen.personXphoto
FOR EACH ROW
BEGIN
    :new.creation_date := SYSDATE;
    :new.creation_user := USER;
END beforeUPDATEpersonXphoto; 


CREATE OR REPLACE TRIGGER gen.beforeUPDATEpersonXphoto
BEFORE UPDATE
ON gen.personXphoto
FOR EACH ROW
BEGIN
    :new.date_last_modification:= SYSDATE;
    :new.user_last_modification:= USER;
END beforeUPDATEpersonXphoto; 