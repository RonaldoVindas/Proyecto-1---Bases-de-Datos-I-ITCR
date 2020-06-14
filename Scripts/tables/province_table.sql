CREATE TABLE province
(
    id_province NUMBER(6),
    province_name VARCHAR2(20),
    id_country NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table province
add constraint pk_province primary key(id_province)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE province
    ADD CONSTRAINT fk_province FOREIGN KEY (id_country) REFERENCES
country(id_country);


ALTER TABLE province
modify province_name constraint province_name_nn NOT NULL;

create sequence s_province
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTprovince
BEFORE INSERT
ON gen.province
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_province:=s_province.nextval;
END beforeINSERTprovince;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEprovince
BEFORE UPDATE
ON gen.province
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEprovince;