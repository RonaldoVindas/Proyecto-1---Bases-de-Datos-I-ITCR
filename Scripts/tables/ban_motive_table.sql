CREATE TABLE ban_motive
(
    id_ban_motive NUMBER(6),
    ban_motive_description VARCHAR2(20),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table ban_motive
add constraint pk_ban_motive primary key(id_ban_motive)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE ban_motive
modify ban_motive_description constraint ban_motive_description_nn NOT NULL;

create sequence s_banmotive
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTbanmotive
BEFORE INSERT
ON gen.ban_motive
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_ban_motive:=s_banmotive.nextval;
END beforeINSERTbanmotive;

/

CREATE OR REPLACE TRIGGER gen.beforeUPDATEbanmotive
BEFORE UPDATE
ON gen.ban_motive
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEbanmotive;