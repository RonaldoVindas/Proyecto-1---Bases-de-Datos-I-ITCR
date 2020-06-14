CREATE TABLE photo
(
    id_photo NUMBER(6),
    photo_description VARCHAR2(20),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table photo
add constraint pk_photo primary key(id_photo)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE photo
modify id_photo constraint id_photo_nn NOT NULL;

ALTER TABLE photo
modify photo_description constraint photo_description_nn NOT NULL;

create sequence s_photo
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTphoto
BEFORE INSERT
ON gen.photo
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_photo:=s_photo.nextval;
END beforeINSERTphoto;


CREATE OR REPLACE TRIGGER gen.beforeUPDATEphoto
BEFORE UPDATE
ON gen.photo
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEphoto;