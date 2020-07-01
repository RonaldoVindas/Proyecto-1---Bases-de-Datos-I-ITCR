create or replace package control_queries is
function NewCriminalRecord return sys_refcursor;
function UserWithoutChange(pdays in number) return sys_refcursor;
function MostDangerousZones(pNumber in number)return sys_refcursor;
function usersList return sys_refcursor;
function BanUsers return sys_refcursor;
function ExpiringRecordWithPerson return sys_refcursor;
function personHasFile(pid_person in number) return sys_refcursor;
function filesbygender(pid_gender in number) return sys_refcursor;
function crimes_per_month(pyear number) return sys_refcursor;
function topPersonMostFiles(pNumber in number) return sys_refcursor;
function personbycrime(pid_crime in number) return sys_refcursor;
end control_queries;
/
CREATE OR REPLACE PACKAGE BODY control_queries IS
/*=======================================CONSULTAS PARA ADMINS===============================*/

/*En esquema FI ===============================*/
/*Listado de expedientes nuevos*/

function NewCriminalRecord return sys_refcursor
as
vcCursor sys_refcursor;
begin
open vcCursor for
Select a.id_criminal_record, a.description descript1, c.description descript2, b.name
from fi.Criminal_Record a
join fi.Community b
on a.id_community = b.id_community
join fi.crime_type c
on a.id_crime_type = c.id_crime_type
where sysdate = a.creation_date;
return vcCursor;

end;

/*Listado de usuario con claves no modificadas*/ 

function UserWithoutChange(pdays in number) return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select a.Id_person, a.first_name, a.last_name, a.user_name
from person a
join user_password_binnacle b 
on a.id_user_password_binnacle = b.id_user_password_binnacle
where sysdate - b.creation_date >= pDays;
return vcCursor;
end;

/*=======================================CONSULTAS PARA USUARIOS===============================*/

/*En esquema FI ===============================*/

/*TOP N LUGARES MÁS PELIGROSOS=============*/

function MostDangerousZones(pNumber in number)return sys_refcursor
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


/*LISTA DE USUARIOS*/

function usersList return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select user_name
from person
where  ID_type_person = 0;
return vcCursor;
end;


/*LISTA DE USUARIOS BANEADOS Y MOTIVO*/

function BanUsers return sys_refcursor
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


/*LISTA DE CONDENAS Y DENUNCIADOS PROXIMOS A VENCER*/

function ExpiringRecordWithPerson return sys_refcursor
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

/*Recuperar información del usuario. Query opcional*/

function recoverInfo(pid IN NUMBER)
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

/*Crimenes en un mismo día. Query opcional*/


function crimesAmountOneDay(pdate IN DATE)
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

/*Persona tiene o no tiene expediente. Query adicional necesario*/

function personHasFile(pid_person in number)return sys_refcursor
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

/*Expedientes por genero. Query adicional necesario*/

function filesbygender(pid_gender in number)return sys_refcursor
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

/*crimenes por mes en un año. Query adicional necesario*/

function crimes_per_month(pyear number)return sys_refcursor
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

/*Personas con mas expedientes ligados. Query adicional necesario*/

function topPersonMostFiles(pNumber in number)return sys_refcursor
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
group by a.id_person order by counter desc)
where rownum <= 10;
return vcCursor;
end;

/*Listado de personas que han cometido un crimen específico. Query adicional necesario*/

function personbycrime(pid_crime in number) return sys_refcursor
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


END control_queries;