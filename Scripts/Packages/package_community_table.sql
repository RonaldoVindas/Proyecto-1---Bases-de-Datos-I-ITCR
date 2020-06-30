Create or replace package control_community is
procedure insert_community (p_name in varchar2, p_district_id number);
procedure remove_community(p_id_community in number);
procedure update_community(p_name in varchar, p_id_community number);
function getCommunityName(pId in number) return varchar2;
function getCommunityDistrict(pId in number) return number;
function getIDCommunity(pcommunity in varchar2)return number;
end control_community;
/
CREATE OR REPLACE PACKAGE BODY control_community IS
procedure insert_community (p_name in varchar2, p_district_id number)as 
begin
    insert into community(name, id_district)
    values (p_name, p_district_id);
    commit;
end insert_community;

procedure remove_community(p_id_community in number)as 
e_invalid_community EXCEPTION;
begin
    delete from community
    where id_community = p_id_community;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_community;
    END IF;
    EXCEPTION
    WHEN e_invalid_community THEN
        DBMS_OUTPUT.PUT_LINE('No such community.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_community;

procedure update_community(p_name in varchar, p_id_community number)as 
e_invalid_community EXCEPTION;
begin
    update community
    set name=p_name
    where id_community=p_id_community;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_community;
    END IF;
    EXCEPTION
    WHEN e_invalid_community THEN
        DBMS_OUTPUT.PUT_LINE('No such community.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end update_community;

function getCommunityName(pId in number) return varchar2
is vcName varchar2(30);
begin
    select name
    into vcName
    from community
    where id_community=pID;
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

function getCommunityDistrict(pId in number) return number
is vcName number(7);
begin
    select id_district
    into vcName
    from community
    where id_community=pID ;
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

function getIDCommunity(pcommunity in varchar2)return number
is vcID NUMBER(10);
begin
    select id_community
    into vcID
    from community
    where name=pcommunity;
    return vcID;
    EXCEPTION
        WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE ('Your SELECT statement retrieved multiple rows.');
        WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Could not find a register with the name||pcommunity.');
        WHEN STORAGE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('PL/SQL ran out of memory or memory is corrupted.');
        WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE ('An arithmetic, conversion, truncation, or size constraint error ocurred.');
        WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE ('Unexpected error.');
end;
END control_community;
