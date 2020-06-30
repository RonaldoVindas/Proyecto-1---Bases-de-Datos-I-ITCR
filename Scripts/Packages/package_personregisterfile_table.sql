create or replace package control_register_file is
procedure insert_person_REgister_file(p_id_person in number,p_criminal_record in number, 
                                            p_sentence_years in number, p_sentence_start in date, 
                                            p_sentence_end in date, p_sentence_expiration in date,
                                            p_sentence_date in date, p_sentence_number in number,
                                            p_house_for_jail in varchar2, p_resolution in varchar);
procedure remove_person_register_file(p_id_person in number,p_criminal_record in number);
procedure U_PRF_Person(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number);
procedure U_PRF_CriminalRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number);
procedure U_PRF_Sentence_years(p_id_person in number, p_id_criminal_record in number, new_sentence_years in number);
procedure U_PRF_Sentence_start(p_id_person in number, p_id_criminal_record in number, new_sentence_start in date);
procedure U_PRF_Sentence_end(p_id_person in number, p_id_criminal_record in number, new_sentence_end in date);
procedure U_PRF_Sentence_expiration(p_id_person in number, p_id_criminal_record in number, new_sentence_expiration in date);
procedure U_PRF_Sentence_date(p_id_person in number, p_id_criminal_record in number, new_sentence_date in date);
procedure U_PRF_Sentence_number(p_id_person in number, p_id_criminal_record in number, new_sentence_number in number);
procedure U_PRF_House_for_jail(p_id_person in number, p_id_criminal_record in number, new_House_for_jail in varchar2);
procedure U_PRF_Resolution(p_id_person in number, p_id_criminal_record in number, new_resolution in varchar2);
function getPRFSentence_years(pIdPerson in number, pIdCriminalRecord in number) return number;
function getPRFResolution(pIdPerson in number, pIdCriminalRecord in number) return varchar2;
function getPRFSentence_start(pIdPerson in number, pIdCriminalRecord in number) return date;
function getPRFSentence_end(pIdPerson in number, pIdCriminalRecord in number) return date;
function getPRFSentence_expiration(pIdPerson in number, pIdCriminalRecord in number) return date;
function getPRFSentence_date(pIdPerson in number, pIdCriminalRecord in number) return date;
function getPRFSentence_number(pIdPerson in number, pIdCriminalRecord in number) return number;
function getPRFHouse_For_Jail(pIdPerson in number, pIdCriminalRecord in number) return varchar2;
end control_register_file;
/
CREATE OR REPLACE PACKAGE BODY control_register_file IS
procedure insert_person_REgister_file(p_id_person in number,p_criminal_record in number, 
                                            p_sentence_years in number, p_sentence_start in date, 
                                            p_sentence_end in date, p_sentence_expiration in date,
                                            p_sentence_date in date, p_sentence_number in number,
                                            p_house_for_jail in varchar2, p_resolution in varchar)as
                                            
begin
insert into person_register_file(id_person, id_criminal_record, sentence_years, sentence_start, sentence_end, sentence_expiration, sentence_number, house_for_jail, resolution)

                            values( p_id_person, p_criminal_record, p_sentence_years, p_sentence_start, p_sentence_end, p_sentence_expiration, p_sentence_number, p_house_for_jail, p_resolution);
                            commit;
end insert_person_REgister_file;

procedure remove_person_register_file(p_id_person in number,p_criminal_record in number)as 
e_invalid_person EXCEPTION;
begin
    delete from person_register_file
    where id_person= p_id_person and id_criminal_record= p_criminal_record;
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
end remove_person_register_file;

procedure U_PRF_Person(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number)as
e_invalid_person EXCEPTION;
begin
    update person_register_file
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
end  U_PRF_Person;

procedure U_PRF_CriminalRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
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
end U_PRF_CriminalRecord;

procedure U_PRF_Sentence_years(p_id_person in number, p_id_criminal_record in number, new_sentence_years in number)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_years=new_sentence_years
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_years;
    
procedure U_PRF_Sentence_start(p_id_person in number, p_id_criminal_record in number, new_sentence_start in date)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_start=new_sentence_start
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_start;

procedure U_PRF_Sentence_end(p_id_person in number, p_id_criminal_record in number, new_sentence_end in date)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_end=new_sentence_end
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_end;

procedure U_PRF_Sentence_expiration(p_id_person in number, p_id_criminal_record in number, new_sentence_expiration in date)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_expiration=new_sentence_expiration
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_expiration;

procedure U_PRF_Sentence_date(p_id_person in number, p_id_criminal_record in number, new_sentence_date in date)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_date=new_sentence_date
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_date;

procedure U_PRF_Sentence_number(p_id_person in number, p_id_criminal_record in number, new_sentence_number in number)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set sentence_number=new_sentence_number
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Sentence_number;

procedure U_PRF_House_for_jail(p_id_person in number, p_id_criminal_record in number, new_House_for_jail in varchar2)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set House_for_jail=new_House_for_jail
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_House_for_jail;

procedure U_PRF_Resolution(p_id_person in number, p_id_criminal_record in number, new_resolution in varchar2)as 
e_invalid_person EXCEPTION;
begin
    update person_register_file
    set resolution=new_resolution
    where id_person=p_id_person and id_criminal_record = p_id_Criminal_Record;
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
end U_PRF_Resolution;

function getPRFSentence_years(pIdPerson in number, pIdCriminalRecord in number) return number
is vcName number(7);
begin
    select sentence_years
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFSentence_start(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_start
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFSentence_end(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_end
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFSentence_expiration(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_expiration
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFSentence_date(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_date
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFSentence_number(pIdPerson in number, pIdCriminalRecord in number) return number
is vcName number(25);
begin
    select sentence_number
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFHouse_For_Jail(pIdPerson in number, pIdCriminalRecord in number) return varchar2
is vcName varchar2(3);
begin
    select House_for_jail
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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

function getPRFResolution(pIdPerson in number, pIdCriminalRecord in number) return varchar2
is vcName varchar2(50);
begin
    select Resolution
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
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
END control_register_file;