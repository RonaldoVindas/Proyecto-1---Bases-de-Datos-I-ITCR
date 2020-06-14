CREATE TABLE crime_type
(
    id_crime_type NUMBER(6),
    crime_type_description VARCHAR2(20),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table crime_type
add constraint pk_crime_type primary key(id_crime_type)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE crime_type
modify crime_type_description constraint crime_type_description_nn NOT NULL;

create sequence s_crimetype
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTcrimetype
BEFORE INSERT
ON gen.crime_type
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_crime_type:=s_crimetype.nextval;
END beforeINSERTcrimetype;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEcrimetype
BEFORE UPDATE
ON gen.crime_type
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEcrimetype;