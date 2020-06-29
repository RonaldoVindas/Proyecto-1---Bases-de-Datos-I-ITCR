/*=======================================CONSULTAS PARA USUARIOS===============================*/

/*En esquema FI ===============================*/

/*TOP N LUGARES MÃ?S PELIGROSOS=============*/

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
end;

/
/*LISTA DE USUARIOS*/
Create or replace function usersList
return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select user_name, count(1)
from person
where  ID_type_person = 1;
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