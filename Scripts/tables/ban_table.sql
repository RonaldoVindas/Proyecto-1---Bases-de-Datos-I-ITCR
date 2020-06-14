CREATE TABLE ban
(
    id_ban NUMBER(6),
    ban_time DATE,
    id_motive NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table ban
add constraint pk_id_ban primary key(id_ban)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE ban
    ADD CONSTRAINT fk_ban_banmotive FOREIGN KEY (id_motive) REFERENCES
ban_motive(id_ban_motive);

create sequence s_ban
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTban
BEFORE INSERT
ON gen.ban
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_ban:=s_ban.nextval;
END beforeINSERTban;

/

CREATE OR REPLACE TRIGGER gen.beforeUPDATEban
BEFORE UPDATE
ON gen.ban
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEban;