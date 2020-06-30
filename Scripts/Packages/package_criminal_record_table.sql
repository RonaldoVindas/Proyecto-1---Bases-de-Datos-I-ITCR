create or replace package control_criminal_record is
procedure insert_Criminal_Record (p_description in varchar2, p_community_id number,p_id_crime_type in number,p_crime_date IN DATE);
procedure remove_Criminal_Record(p_id_Criminal_Record in number);
procedure UCriminalRecordDescription(p_description in varchar, p_id_Criminal_Record number);
procedure UCriminalRecordCrimeType(p_crime_type in number, p_id_Criminal_Record number);
procedure UCriminalRecordCrimeDate(pcrime_date in date, p_id_Criminal_Record number);
procedure UCriminalRecordCommunity(p_community in number, p_id_Criminal_Record number);
function getCriminalRecordDescription(pId in number) return varchar2;
function getCriminalRecordCrimeType(pId in number) return number;
function getCriminalRecordCommunity(pId in number) return number;
function getCriminalCrimeDate(pId in number) return date;
end control_criminal_record;
/
CREATE OR REPLACE PACKAGE BODY control_criminal_record IS
procedure insert_Criminal_Record (p_description in varchar2, p_community_id number,p_id_crime_type in number,p_crime_date IN DATE)as 
begin
    insert into Criminal_Record(description, id_crime_type, id_community,crime_date)
    values (p_description,  p_community_id,p_id_crime_type,p_crime_date);
    commit;
end insert_Criminal_Record;


procedure remove_Criminal_Record(p_id_Criminal_Record in number)as 
e_invalid_criminal_record EXCEPTION;
begin
    delete from Criminal_Record
    where id_Criminal_Record = p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_criminal_record;
    END IF;
    EXCEPTION
    WHEN e_invalid_criminal_record THEN
        DBMS_OUTPUT.PUT_LINE('No such criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to remove.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end remove_Criminal_Record;


procedure UCriminalRecordDescription(p_description in varchar, p_id_Criminal_Record number)as 
e_invalid_criminal_record EXCEPTION;
begin
    update Criminal_Record
    set description=p_description
    where id_Criminal_Record=p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_criminal_record;
    END IF;
    EXCEPTION
    WHEN e_invalid_criminal_record THEN
        DBMS_OUTPUT.PUT_LINE('No such criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UCriminalRecordDescription;


procedure UCriminalRecordCrimeType(p_crime_type in number, p_id_Criminal_Record number)as 
e_invalid_criminal_record EXCEPTION;
begin
    update Criminal_Record
    set ID_crime_type=p_crime_type
    where id_Criminal_Record=p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_criminal_record;
    END IF;
    EXCEPTION
    WHEN e_invalid_criminal_record THEN
        DBMS_OUTPUT.PUT_LINE('No such criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UCriminalRecordCrimeType;


procedure UCriminalRecordCrimeDate(pcrime_date in date, p_id_Criminal_Record number)as 
e_invalid_criminal_record EXCEPTION;
begin
    update Criminal_Record
    set crime_date=pcrime_date
    where id_Criminal_Record=p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_criminal_record;
    END IF;
    EXCEPTION
    WHEN e_invalid_criminal_record THEN
        DBMS_OUTPUT.PUT_LINE('No such criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UCriminalRecordCrimeDate;

procedure UCriminalRecordCommunity(p_community in number, p_id_Criminal_Record number)as 
e_invalid_criminal_record EXCEPTION;
begin
    update Criminal_Record
    set ID_community=p_community
    where id_Criminal_Record=p_id_Criminal_Record;
    commit;
    IF SQL%NOTFOUND THEN 
        RAISE e_invalid_criminal_record;
    END IF;
    EXCEPTION
    WHEN e_invalid_criminal_record THEN
        DBMS_OUTPUT.PUT_LINE('No such criminal record.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error has ocurred in the attempt to update.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
        DBMS_OUTPUT.PUT_LINE(SQLCODE);
end UCriminalRecordCommunity;

function getCriminalRecordDescription(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select description
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
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

function getCriminalRecordCrimeType(pId in number) return number
is vcName number(7);
begin
    select id_crime_type
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
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

function getCriminalRecordCommunity(pId in number) return number
is vcName number(7);
begin
    select id_community
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
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

function getCriminalCrimeDate(pId in number) return date
is vcName date;
begin
    select crime_date
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
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
END control_criminal_Record;