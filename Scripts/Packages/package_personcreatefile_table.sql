create or replace package control_create_file is
procedure insert_person_create_file (p_id_person in number, p_id_criminal_record in number);
procedure remove_person_create_file(p_id_person in number,p_id_criminal_record in number );
procedure UPersonCreateFilePerson(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number);
procedure UPersonCreateFileRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number);
end control_create_file;
/
CREATE OR REPLACE PACKAGE BODY control_create_file IS
procedure insert_person_create_file (p_id_person in number, p_id_criminal_record in number)as
begin
    insert into person_create_file(id_person, id_criminal_record)
    values (p_id_person, p_id_criminal_record);
    commit;
end insert_person_create_file;

procedure remove_person_create_file(p_id_person in number,p_id_criminal_record in number )as 
e_invalid_person EXCEPTION;
begin
    delete from person_create_file
    where id_person = p_id_person and id_criminal_record = p_id_criminal_record ;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person or criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_person_create_file;

procedure UPersonCreateFilePerson(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number)as 
e_invalid_person EXCEPTION;
begin
    update person_create_file
    set ID_person=new_id_person
    where id_person=current_id_person and id_criminal_record = p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person or criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UPersonCreateFilePerson;

procedure UPersonCreateFileRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number)as 
e_invalid_person EXCEPTION;
begin
    update person_create_file
    set ID_criminal_record=new_id_criminal_record
    where id_person=p_id_person and id_criminal_record = current_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_person;
    END IF;
    EXCEPTION
    WHEN e_invalid_person THEN
        DBMS_OUTPUT.PUT_LINE('No such person or criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UPersonCreateFileRecord;

END control_create_file;