-----Tabla Canton----
Create or replace procedure insert_canton (p_name in varchar2, p_province_id number)as
begin
    insert into canton(name, id_province)
    values (p_name, p_province_id);
    commit;
end insert_canton;

/
create or replace procedure remove_canton(p_id_canton in number)as 
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

/

create or replace procedure update_canton(p_name in varchar, p_id_canton number)as 
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
/
-----Tabla Community-----
Create or replace procedure insert_community (p_name in varchar2, p_district_id number)as 
begin
    insert into community(name, id_district)
    values (p_name, p_district_id);
    commit;
end insert_community;

/
create or replace procedure remove_community(p_id_community in number)as 
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

/

create or replace procedure update_community(p_name in varchar, p_id_community number)as 
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

/
-----Tabla country----
Create or replace procedure insert_country (p_name in varchar2)as 
begin
    insert into country(name)
    values (p_name);
    commit;
end insert_country;

/
create or replace procedure remove_country(p_id_country in number)as 
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

/

create or replace procedure update_country(p_name in varchar, p_id_country number)as 
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
/
-----Tabla Crime_type-----
Create or replace procedure insert_Crime_type (p_description in varchar2)as 
begin
    insert into Crime_type(description)
    values (p_description);
    commit;
end insert_Crime_type;

/
create or replace procedure remove_Crime_type(p_id_Crime_type in number)as 
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

/

create or replace procedure update_Crime_type(p_description in varchar, p_id_Crime_type number)as 
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

/
-----Tabla disctrict-----
Create or replace procedure insert_district (p_name in varchar2, p_canton_id number)as 
begin
    insert into district(name, id_canton)
    values (p_name, p_canton_id);
    commit;
end insert_district;

/
create or replace procedure remove_district(p_id_district in number)as
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

/

create or replace procedure update_district(p_name in varchar, p_id_district number)as
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
/
------tabla Province-----
Create or replace procedure insert_Province (p_name in varchar2, p_country_id number)as 
begin
    insert into province(name, id_country)
    values (p_name, p_country_id);
    commit;
end insert_Province;
/

create or replace procedure remove_Province(p_id_Province in number)as 
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

/

create or replace procedure update_Province(p_name in varchar, p_id_Province number)as 
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
/

------Tabla Criminal_Record-----
Create or replace procedure insert_Criminal_Record (p_description in varchar2, p_community_id number,p_id_crime_type in number,p_crime_date IN DATE)as 
begin
    insert into Criminal_Record(description, id_crime_type, id_community,crime_date)
    values (p_description,  p_community_id,p_id_crime_type,p_crime_date);
    commit;
end insert_Criminal_Record;

/
create or replace procedure remove_Criminal_Record(p_id_Criminal_Record in number)as 
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

/
create or replace procedure UCriminalRecordDescription(p_description in varchar, p_id_Criminal_Record number)as 
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

/
create or replace procedure UCriminalRecordCrimeType(p_crime_type in number, p_id_Criminal_Record number)as 
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

/
create or replace procedure UCriminalRecordCrimeDate(pcrime_date in date, p_id_Criminal_Record number)as 
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

/
create or replace procedure UCriminalRecordCommunity(p_community in number, p_id_Criminal_Record number)as 
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
/
----Tabla person_has_file----
Create or replace procedure insert_person_has_file (p_id_person in number, p_id_criminal_record in number)as
begin
    insert into person_has_file(id_person, id_criminal_record)
    values (p_id_person, p_id_criminal_record);
    commit;
end insert_person_has_file;

/

create or replace procedure remove_person_has_file(p_id_person in number,p_id_criminal_record in number )as 
e_invalid_person EXCEPTION;
begin
    delete from person_has_file
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
end remove_person_has_file;


/


create or replace procedure UPersonHasFilePerson(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number)as 
e_invalid_person EXCEPTION;
begin
    update person_has_file
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
end UPersonHasFilePerson;
/

create or replace procedure UPersonHasFileCriminalRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number)as 
e_invalid_person EXCEPTION;
begin
    update person_has_file
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
end UPersonHasFileCriminalRecord;

/


-------Tabla Person_register_file--------
Create or replace procedure insert_person_REgister_file(p_id_person in number,p_criminal_record in number, 
                                            p_sentence_years in number, p_sentence_start in date, 
                                            p_sentence_end in date, p_sentence_expiration in date,
                                            p_sentence_date in date, p_sentence_number in number,
                                            p_house_for_jail in varchar2, p_resolution in varchar)as
                                            
begin
insert into person_register_file(id_person, id_criminal_record, sentence_years, sentence_start, sentence_end, sentence_expiration, sentence_number, house_for_jail, resolution)

                            values( p_id_person, p_criminal_record, p_sentence_years, p_sentence_start, p_sentence_end, p_sentence_expiration, p_sentence_number, p_house_for_jail, p_resolution);
                            commit;
end insert_person_REgister_file;

/

create or replace procedure remove_person_register_file(p_id_person in number,p_criminal_record in number)as 
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

/

create or replace procedure U_PRF_Person(current_id_person in number,p_id_Criminal_Record in number, new_id_person in number)as
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

/

create or replace procedure U_PRF_CriminalRecord(current_id_Criminal_record in number,p_id_person in number, new_id_criminal_record in number)as 
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

/

create or replace procedure U_PRF_Sentence_years(p_id_person in number, p_id_criminal_record in number, new_sentence_years in number)as 
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
    
/

create or replace procedure U_PRF_Sentence_start(p_id_person in number, p_id_criminal_record in number, new_sentence_start in date)as 
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

/

create or replace procedure U_PRF_Sentence_end(p_id_person in number, p_id_criminal_record in number, new_sentence_end in date)as 
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

/

create or replace procedure U_PRF_Sentence_expiration(p_id_person in number, p_id_criminal_record in number, new_sentence_expiration in date)as 
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
/

create or replace procedure U_PRF_Sentence_date(p_id_person in number, p_id_criminal_record in number, new_sentence_date in date)as 
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

/
create or replace procedure U_PRF_Sentence_number(p_id_person in number, p_id_criminal_record in number, new_sentence_number in number)as 
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
/

create or replace procedure U_PRF_House_for_jail(p_id_person in number, p_id_criminal_record in number, new_House_for_jail in varchar2)as 
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

/

create or replace procedure U_PRF_Resolution(p_id_person in number, p_id_criminal_record in number, new_resolution in varchar2)as 
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