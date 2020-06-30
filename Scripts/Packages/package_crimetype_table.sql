create or replace package control_crime_type is
procedure insert_Crime_type (p_description in varchar2);
procedure remove_Crime_type(p_id_Crime_type in number);
procedure update_Crime_type(p_description in varchar, p_id_Crime_type number);
function getCrimeTypeDescription(pId in number) return varchar2;
function getIDcrimetype(pcrime_type in varchar2)return number;
end control_crime_type;
/
CREATE OR REPLACE PACKAGE BODY control_crime_type IS
procedure insert_Crime_type (p_description in varchar2)as 
begin
    insert into Crime_type(description)
    values (p_description);
    commit;
end insert_Crime_type;

procedure remove_Crime_type(p_id_Crime_type in number)as 
e_invalid_crime_type EXCEPTION;
begin
    delete from Crime_type
    where id_Crime_type = p_id_Crime_type;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_crime_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_crime_type THEN
        DBMS_OUTPUT.PUT_LINE('No such crime.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_Crime_type;

procedure update_Crime_type(p_description in varchar, p_id_Crime_type number)as 
e_invalid_crime_type EXCEPTION;
begin
    update crime_type
    set description=p_description
    where id_Crime_type=p_id_Crime_type;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_crime_type;
    END IF;
    EXCEPTION
    WHEN e_invalid_crime_type THEN
        DBMS_OUTPUT.PUT_LINE('No such crime.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_Crime_type;

function getCrimeTypeDescription(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select description
    into vcName
    from crime_type
    where id_crime_type=pID ;
    return (VCNAME);
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcnombre.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
END;

function getIDcrimetype(pcrime_type in varchar2)return number
is vcID NUMBER(6);
begin
    select id_crime_type
    into vcID
    from crime_type
    where description=pcrime_type;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcrime_type.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;

END control_crime_type;