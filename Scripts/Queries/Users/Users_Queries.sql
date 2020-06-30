/*=======================================CONSULTAS PARA USUARIOS===============================*/

/*En esquema FI ===============================*/

/*TOP N LUGARES MÁS PELIGROSOS=============*/

create or replace function MostDangerousZones(pNumber in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select *
from(
Select a.name , count(1) counter 
from FI.district a
join fi.community b
on a.id_district= b.id_district
inner join fi.criminal_record c 
on b.id_community = c.id_community
group by a.name order by counter desc)
where rownum <= 10;
return vcCursor;
end;

/
/*LISTA DE USUARIOS*/
Create or replace function usersList
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select user_name
from person
where  ID_type_person = 0;
return vcCursor;
end;

/
/*LISTA DE USUARIOS BANEADOS Y MOTIVO*/

Create or replace function BanUsers
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select d.user_name, a.ban_motive_Description
from ban_motive a
join ban b
on a.id_ban_motive = b.ID_MOTIVE
join personxban c
on c.id_ban = b.ID_ban
join person d
on d.id_person = c.id_person
where  b.Ban_Time >Sysdate;
return vcCursor;
end;
/

/*LISTA DE CONDENAS Y DENUNCIADOS PROXIMOS A VENCER*/


create or replace function ExpiringRecordWithPerson
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select a.id_criminal_record,a.description recordDescription , b.sentence_expiration, c.id_person, c.first_name, c.last_name, d.description genderDescription
from fi.criminal_record a
inner join fi.person_Register_file b
on a.id_criminal_record = b.id_criminal_record
inner join person c
on b.id_person = c.id_person
join gender d 
on c.id_gender = d.id_gender
where b.sentence_expiration < sysdate or (sysdate - b.sentence_expiration) < 30;
return vcCursor;

end; 
/
/*Recuperar información del usuario*/

create or replace function recoverInfo(pid IN NUMBER)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select a.first_name, a.last_name, a.email, a.user_name, b.description genderDescription, c.institution_name
from person a
inner join gender b
on a.id_gender = b.id_gender
inner join institution c
on a.id_institution = c.id_institution
join type_person d 
on a.id_type_person = d.id_type_person
where a.id_person=pid;
return vcCursor;
end;
/
/*Crimenes en un mismo día*/
create or replace function crimesAmountOneDay(pdate IN DATE)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select a.description
from FI.criminal_record a
where a.crime_date=pdate;
return vccursor;
end;
/
/*Persona tiene o no tiene expediente*/
create or replace function personHasFile(pid_person in number)return sys_refcursor
as
vcCursor sys_refcursor;
begin
open vcCursor for
select a.first_name, a.last_name, c.description file_name,d.description crimeDescription,e.name community_name
from person a
inner join fi.person_register_file b
on a.id_person=b.id_person
inner join fi.criminal_record c
on b.id_criminal_record=c.id_criminal_record
inner join fi.crime_type d
on c.id_crime_type=d.id_crime_type
inner join fi.community e
on c.id_community=e.id_community
where a.id_person=pid_person;
return vcCursor;
end;

/*Expedientes por genero*/
/
create or replace function filesbygender(pid_gender in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin
open vcCursor for
select b.description gender, a.first_name, a.last_name, d.description filename
from person a
inner join gender b
on a.id_gender=b.id_gender
inner join FI.person_create_file c
on a.id_person=c.id_person
inner join fi.criminal_record d
on c.id_criminal_record=d.id_criminal_record
where a.id_gender =pid_gender;
return vcCursor;
end;
/
/*crimenes por mes en un año*/
create or replace function crimes_per_month(pyear number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
select Extract(MONTH from a.crime_date) month ,COUNT(1) crime_quantity
from fi.criminal_record a
Where extract(YEAR from a.crime_date)= pyear
group by Extract(MONTH from a.crime_date);
return vcCursor;
end;
/
/*Personas con mas expedientes ligados*/
create or replace function topPersonMostFiles(pNumber in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin
open vcCursor for
select *
from(
Select a.first_name,a.last_name,c.description filename , count(1) counter
from person a
inner join FI.person_create_file b
on a.id_person= b.id_person
join fi.criminal_record c
on b.id_criminal_record = c.id_criminal_record
group by c.description order by counter desc)
where rownum <= 10;
return vcCursor;
end;
/
/*Listado de personas que han cometido un crimen específico*/

create or replace function personbycrime(pid_crime in number)
return sys_refcursor
as
vcCursor sys_refcursor;
begin
open vcCursor for
select b.description crime ,a.description filename, d.last_name, d.first_name
from FI.criminal_record a
inner join FI.crime_type b
on a.id_crime_type=b.id_crime_type
inner join FI.person_create_file c
on a.id_criminal_record=c.id_criminal_record
inner join person d
on c.id_person=d.id_person
where b.id_crime_type = pid_crime;
return vcCursor;
end;

