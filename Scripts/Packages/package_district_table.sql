create or replace package control_district is
procedure insert_district (p_name in varchar2, p_canton_id number);
procedure remove_district(p_id_district in number);
procedure update_district(p_name in varchar, p_id_district number);
function getDistrictName(pId in number) return varchar2;
function getDistrictCanton(pId in number) return number;
function getIDdistrict(pdistrict in varchar2)return number;
end control_district;
/
CREATE OR REPLACE PACKAGE BODY control_district IS
procedure insert_district (p_name in varchar2, p_canton_id number)as 
begin
    insert into district(name, id_canton)
    values (p_name, p_canton_id);
    commit;
end insert_district;

procedure remove_district(p_id_district in number)as
e_invalid_district EXCEPTION;
begin
    delete from district
    where id_district = p_id_district;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_district;
    END IF;
    EXCEPTION
    WHEN e_invalid_district THEN
        DBMS_OUTPUT.PUT_LINE('No such district.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_district;

procedure update_district(p_name in varchar, p_id_district number)as
e_invalid_district EXCEPTION;
begin
    update district
    set name=p_name
    where id_district=p_id_district;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_district;
    END IF;
    EXCEPTION
    WHEN e_invalid_district THEN
        DBMS_OUTPUT.PUT_LINE('No such district.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_district;

function getDistrictName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from district
    where id_district=pID ;
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

function getDistrictCanton(pId in number) return number
is vcName number(7);
begin
    select id_canton
    into vcName
    from district
    where id_district=pID ;
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

function getIDdistrict(pdistrict in varchar2)return number
is vcID NUMBER(10);
begin
    select id_district
    into vcID
    from district
    where name=pdistrict;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pdistrict.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_district;