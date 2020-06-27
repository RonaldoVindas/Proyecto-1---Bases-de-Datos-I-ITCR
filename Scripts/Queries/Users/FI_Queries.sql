/*=======================================CONSULTAS PARA USUARIOS===============================*/

/*En esquema FI ===============================*/

/*TOP N LUGARES MÁS PELIGROSOS=============*/

create or replace procedure MostDangerousZones(pNumber in number)
as
cursor MostDangerousZones(pnumber in number)
is 
Select a.name , count(1) counter 
from district a
join community b
on a.id_district= b.id_district
join criminal_record c 
on b.id_community = c.id_community
group by district order by contador desc
fetch first pnumber rows only;
begin 
    for i in MostDangerousZones(pnumber) loop 
        dbms_output.put_line(i.name);
        dbms_output.put_line(i.counter);
    end loop;
end MostDangerousZones;



/*LISTA DE USUARIOS*/
Create or replace procedure usersList
as
cursor usersList
is
Select user_name, count(1)
from person
where  ID_type_person = 1;
begin 
    for i in usersList loop 
        dbms_output.put_line(i.user_name);
    end loop;
end usersList;


/*LISTA DE USUARIOS BANEADOS Y MOTIVO*/

Create or replace procedure BanUsers
as
cursor banUsers
is
Select d.user_name, a.ban_motive_Description
from ban_motive a
join ban b
on a.id_ban_motive = b.ID_MOTIVE
join personxban c
on c.id_ban = b.ID_ban
join person d
on d.id_person = c.id_person
where  b.Ban_Time >Sysdate;
begin 
    for i in BanUsers loop 
        dbms_output.put_line(i.user_name);
        dbms_output.put_line(i.ban_motive_description);
    end loop;
end BanUsers;
