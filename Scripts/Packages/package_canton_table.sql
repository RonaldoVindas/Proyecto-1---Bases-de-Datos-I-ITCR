Create or replace package control_canton is
procedure insert_canton (p_name in varchar2, p_province_id number);
procedure remove_canton(p_id_canton in number);
procedure update_canton(p_name in varchar2, p_id_canton number);
function getCantonName(pId in number) return varchar2 ;
function getCantonProvince(pId in number) return number;
function getIDCanton(pcanton in varchar2)return number;
end control_canton;
/
CREATE OR REPLACE PACKAGE BODY control_canton IS

procedure insert_canton (p_name in varchar2, p_province_id number)as
begin
    insert into canton(name, id_province)
    values (p_name, p_province_id);
    commit;
end insert_canton;


procedure remove_canton(p_id_canton in number)as 
e_invalid_canton EXCEPTION;
begin
    delete from canton
    where id_canton = p_id_canton;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_canton;
    END IF;
    EXCEPTION
    WHEN e_invalid_canton THEN
        DBMS_OUTPUT.PUT_LINE('No such canton.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_canton;

procedure update_canton(p_name in varchar2, p_id_canton number)as 
e_invalid_canton EXCEPTION;
begin
    update canton
    set name=p_name
    where id_canton=p_id_canton;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_canton;
    END IF;
    EXCEPTION
    WHEN e_invalid_canton THEN
        DBMS_OUTPUT.PUT_LINE('No such canton.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_canton;

function getCantonName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from Canton
    where id_canton=pID ;
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

function getCantonProvince(pId in number) return number
is vcName number(5);
begin
    select id_province
    into vcName
    from Canton
    where id_canton=pID ;
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

function getIDCanton(pcanton in varchar2)return number
is vcID NUMBER(10);
begin
    select id_canton
    into vcID
    from canton
    where name=pcanton;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcanton.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_canton;