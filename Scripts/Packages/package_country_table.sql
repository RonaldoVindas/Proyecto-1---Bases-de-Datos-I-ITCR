create or replace package control_country is
procedure insert_country (p_name in varchar2);
procedure remove_country(p_id_country in number);
procedure update_country(p_name in varchar, p_id_country number);
function getCountryName(pId in number) return varchar2;
function getIDCountry(pcountry in varchar2)return number;
end control_country;
/
CREATE OR REPLACE PACKAGE BODY control_country IS
procedure insert_country (p_name in varchar2)as 
begin
    insert into country(name)
    values (p_name);
    commit;
end insert_country;

procedure remove_country(p_id_country in number)as 
e_invalid_country EXCEPTION;
begin
    delete from country
    where id_country = p_id_country;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_country;
    END IF;
    EXCEPTION
    WHEN e_invalid_country THEN
        DBMS_OUTPUT.PUT_LINE('No such country.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_country;

procedure update_country(p_name in varchar, p_id_country number)as 
e_invalid_country EXCEPTION;
begin
    update country
    set name=p_name
    where id_country=p_id_country;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_country;
    END IF;
    EXCEPTION
    WHEN e_invalid_country THEN
        DBMS_OUTPUT.PUT_LINE('No such country.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_country;

function getCountryName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from country
    where id_country=pID;
    return (VCNAME);
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pId.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
END;

function getIDCountry(pcountry in varchar2)return number
is vcID NUMBER(5);
begin
    select id_country
    into vcID
    from country
    where name=pcountry;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcountry.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_country;