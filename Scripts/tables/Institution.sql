create table institution
(
institution_id number(6),
institution_name varchar2(50),
creation_date DATE,
creation_user VARCHAR2(10),
date_last_modification DATE,
user_last_modification VARCHAR2(10)
);

alter table institution
add constraint pk_institution primary key(institution_id)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);


alter table institution
modify institution_name constraint institution_name_nn NOT NULL;

create sequence s_institution
start with 0
increment by 1
minvalue 0
maxvalue 10000;


CREATE OR REPLACE TRIGGER gen.beforeINSERTinstitution
BEFORE INSERT
ON gen.institution
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.institution_id:=s_institution.nextval;
END beforeinsertinstitution;
/
CREATE OR REPLACE TRIGGER gen.beforeUpdateinstitution
before update
ON gen.institution
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUpdateinstitution;
