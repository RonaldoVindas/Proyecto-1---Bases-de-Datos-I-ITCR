Create table gender
(
gender_id number(2),
gender_description varchar2(20),
creation_date DATE,
creation_user VARCHAR2(10),
date_last_modification DATE,
user_last_modification VARCHAR2(10)
);


alter table gender
add constraint pk_gender primary key(gender_id)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);


create sequence s_gender
start with 0
increment by 1
minvalue 0
maxvalue 100;


CREATE OR REPLACE TRIGGER gen.beforeINSERTgender
BEFORE INSERT
ON gen.gender
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.gender_id:=s_gender.nextval;
END beforeINSERTgender;
/
CREATE OR REPLACE TRIGGER gen.beforeUpdateGender
BEFORE UPDATE
ON gen.gender
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdategender;