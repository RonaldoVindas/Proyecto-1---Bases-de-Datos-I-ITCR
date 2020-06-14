CREATE TABLE community
(
    id_community NUMBER(6),
    community_name VARCHAR2(20),
    id_district NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table community
add constraint pk_community primary key(id_community)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE community
    ADD CONSTRAINT fk_community FOREIGN KEY (id_district) REFERENCES
district(id_district);

ALTER TABLE community
modify community_name constraint community_name_nn NOT NULL;

create sequence s_community
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTcommunity
BEFORE INSERT
ON gen.community
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_community:=s_community.nextval;
END beforeINSERTcommunity;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEcommunity
BEFORE UPDATE
ON gen.community
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEcommunity;