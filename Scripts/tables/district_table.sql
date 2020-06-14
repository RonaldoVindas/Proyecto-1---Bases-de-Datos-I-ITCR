CREATE TABLE district
(
    id_district NUMBER(6),
    district_name VARCHAR2(20),
    id_canton NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table district
add constraint pk_district primary key(id_district)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE district
    ADD CONSTRAINT fk_district FOREIGN KEY (id_canton) REFERENCES
canton(id_canton);

ALTER TABLE district
modify district_name constraint district_name_nn NOT NULL;

create sequence s_district
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTdistrict
BEFORE INSERT
ON gen.district
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_district:=s_district.nextval;
END beforeINSERTdistrict;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEdistrict
BEFORE UPDATE
ON gen.district
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEdistrict;