CREATE TABLE criminal_record
(
    id_criminal_record NUMBER(6),
    criminal_record_description VARCHAR2(20),
    id_crime NUMBER(6),
    id_community NUMBER(6),
    creation_date DATE,
    creation_user VARCHAR2(10),
    date_last_modification DATE,
    user_last_modification VARCHAR2(10)
);

alter table criminal_record
add constraint pk_criminal_record primary key(id_criminal_record)
using index tablespace gen_ind pctfree 20
storage(initial 10k next 10k pctincrease 0);

ALTER TABLE criminal_record
    ADD CONSTRAINT fk_criminal_record_crime FOREIGN KEY (id_crime) REFERENCES
crime_type(id_crime_type);

ALTER TABLE criminal_record
    ADD CONSTRAINT fk_criminal_record_community FOREIGN KEY (id_community) REFERENCES
community(id_community);

ALTER TABLE criminal_record
modify criminal_record_description constraint criminal_record_description_nn NOT NULL;

create sequence s_criminal_record
start with 0
increment by 1
minvalue 0
maxvalue 100;

CREATE OR REPLACE TRIGGER gen.beforeINSERTcriminal_record
BEFORE INSERT
ON gen.criminal_record
FOR EACH ROW
BEGIN
    :new.creation_date:=SYSDATE;
    :new.creation_user:=USER;
    :new.id_criminal_record:=s_criminal_record.nextval;
END beforeINSERTcriminal_record;
/
CREATE OR REPLACE TRIGGER gen.beforeUPDATEcriminal_record
BEFORE UPDATE
ON gen.criminal_record
FOR EACH ROW
BEGIN
    :new.date_last_modification:=SYSDATE;
    :new.user_last_modification:=USER;
END beforeUPDATEcriminal_record;