create or replace package control_province is
procedure insert_Province (p_name in varchar2, p_country_id number);
procedure remove_Province(p_id_Province in number);
procedure update_Province(p_name in varchar, p_id_Province number);
function getProvinceName(pId in number) return varchar2;
function getProvinceCountry(pId in number) return number;
function getIDprovince(pprovince in varchar2)return number;
end control_province;
/
CREATE OR REPLACE PACKAGE BODY control_province IS

procedure insert_Province (p_name in varchar2, p_country_id number)as 
begin
    insert into province(name, id_country)
    values (p_name, p_country_id);
    commit;
end insert_Province;

procedure remove_Province(p_id_Province in number)as 
e_invalid_province EXCEPTION;
begin
    delete from Province
    where id_Province = p_id_Province;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_province;
    END IF;
    EXCEPTION
    WHEN e_invalid_province THEN
        DBMS_OUTPUT.PUT_LINE('No such province.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_Province;

procedure update_Province(p_name in varchar, p_id_Province number)as 
e_invalid_province EXCEPTION;
begin
    update Province
    set name=p_name
    where id_Province=p_id_Province;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_province;
    END IF;
    EXCEPTION
    WHEN e_invalid_province THEN
        DBMS_OUTPUT.PUT_LINE('No such province.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_Province;

function getProvinceName(pId in number) return varchar2
is vcName varchar2(20);
begin 
    select name
    into vcName
    from province
    where id_province=pid;
    return (vcname);
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
end;

function getProvinceCountry(pId in number) return number
is vcName number(8);
begin
    select id_country
    into vcName
    from province
    where id_province=pid;
    return (vcname);
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
end;

function getIDprovince(pprovince in varchar2)return number
is vcID NUMBER(10);
begin
    select id_province
    into vcID
    from province
    where name=pprovince;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pprovince.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_province;