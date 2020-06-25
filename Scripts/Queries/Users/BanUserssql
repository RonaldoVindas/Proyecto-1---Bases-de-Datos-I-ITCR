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