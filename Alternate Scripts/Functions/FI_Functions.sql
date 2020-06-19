create or replace function getCantonName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from Canton
    where id_canton=pID ;
    return (VCNAME);

END;
/
create or replace function getCantonProvince(pId in number) return number
is vcName number(7);
begin
    select id_province
    into vcName
    from Canton
    where id_canton=pID ;
    return (VCNAME);

END;
/
create or replace function getCommunityName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from community
    where id_community=pID ;
    return (VCNAME);

END;
/
create or replace function getCommunityDistict(pId in number) return number
is vcName number(7);
begin
    select id_district
    into vcName
    from community
    where id_community=pID ;
    return (VCNAME);

END;
/

create or replace function getCountryName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from country
    where id_country=pID ;
    return (VCNAME);

END;

/
create or replace function getCrimeTypeDescription(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select description
    into vcName
    from crime_type
    where id_crime_type=pID ;
    return (VCNAME);

END;
/
create or replace function getCriminalRecordDescription(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select description
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
    return (VCNAME);

END;
/
create or replace function getCriminalRecordCrimeType(pId in number) return number
is vcName number(7);
begin
    select id_crime_type
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
    return (VCNAME);

END;
/
create or replace function getCriminalRecordCommunity(pId in number) return number
is vcName number(7);
begin
    select id_community
    into vcName
    from criminal_record
    where id_criminal_record=pID ;
    return (VCNAME);

END;
/
create or replace function getDistrictName(pId in number) return varchar2 
is vcName varchar2(30);
begin
    select name
    into vcName
    from district
    where id_district=pID ;
    return (VCNAME);

END;
/
create or replace function getDistrictCanton(pId in number) return number
is vcName number(7);
begin
    select id_canton
    into vcName
    from district
    where id_district=pID ;
    return (VCNAME);

END;
/


create or replace function getPRFSentence_years(pIdPerson in number, pIdCriminalRecord in number) return number
is vcName number(7);
begin
    select sentence_years
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFSentence_start(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_start
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFSentence_end(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_end
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFSentence_expiration(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_expiration
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/

create or replace function getPRFSentence_date(pIdPerson in number, pIdCriminalRecord in number) return date
is vcName date;
begin
    select sentence_date
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFSentence_number(pIdPerson in number, pIdCriminalRecord in number) return number
is vcName number(25);
begin
    select sentence_number
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFHouse_For_Jail(pIdPerson in number, pIdCriminalRecord in number) return varchar2
is vcName varchar2(3);
begin
    select House_for_jail
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/
create or replace function getPRFResolution(pIdPerson in number, pIdCriminalRecord in number) return varchar2
is vcName varchar2(50);
begin
    select Resolution
    into vcName
    from Person_register_File
    where id_person=pIdPerson and id_criminal_record=pIdCriminalRecord ;
    return (VCNAME);

END;
/

Create or replace  function getProvinceName(pId in number) return varchar2
is vcName varchar2(20);
begin 
    select name
    into vcName
    from province
    where id_province=pid;
    return (vcname);
end;
/
Create or replace function getProvinceCountry(pId in number) return number
is vcName number(8);
begin
    select id_country
    into vcName
    from province
    where id_province=pid;
    return (vcname);
end;





