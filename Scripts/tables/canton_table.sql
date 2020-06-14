CREATE TABLE canton
(
    id_canton NUMBER(6),
    canton_name VARCHAR2(20),
    id_province NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table canton
add constraint pk_canton primary key(id_canton)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE canton
    ADD CONSTRAINT fk_canton FOREIGN KEY (id_province) REFERENCES
province(id_province);

ALTER TABLE canton
modify canton_name constraint canton_name_nn NOT NULL;

create sequence s_canton
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTcanton
BEFORE INSERT
ON gen.canton
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_canton:=s_canton.nextval;
END beforeINSERTcanton;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEcanton
BEFORE UPDATE
ON gen.canton
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEcanton;