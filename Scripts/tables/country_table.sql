CREATE TABLE country
(
    id_country NUMBER(6),
    country_name VARCHAR2(20),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table country
add constraint pk_country primary key(id_country)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE country
modify country_name constraint country_name_nn NOT NULL;

create sequence s_country
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTcountry
BEFORE INSERT
ON gen.country
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_country:=s_country.nextval;
END beforeINSERTcountry;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEcountry
BEFORE UPDATE
ON gen.country
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEcountry;