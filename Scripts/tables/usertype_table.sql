CREATE TABLE user_type
(
    id_user NUMBER(6),
    user_description VARCHAR2(20),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table user_type
add constraint pk_user_type primary key(id_user)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE user_type
modify id_user constraint id_user_nn NOT NULL;

ALTER TABLE user_type
modify user_description constraint user_description_nn NOT NULL;

create sequence s_usertype
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTusertype
BEFORE INSERT
ON gen.user_type
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_user:=s_usertype.nextval;
END beforeINSERTusertype;



CREATE OR REPLACE TRIGGER gen.beforeUPDATEusertype
BEFORE UPDATE
ON gen.user_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEusertype;