/*=======================================CONSULTAS PARA ADMINS===============================*/

/*En esquema FI ===============================*/
/*Listado de expedientes nuevos*/

create or replace function NewCriminalRecord return sys_refcursor
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
/

/*Listado de usuario con claves no modificadas*/ 

create or replace function UserWihtoutChange(pdays in number) return sys_refcursor
as
vcCursor sys_refcursor;
begin 
open vcCursor for
Select a.Id_person, a.first_name, a.last_name, a.user_name
from person a
join user_password_binnacle b 
on a.id_user_password_binnacle = b.id_user_password_binnacle
where sysdate - b.user_password_date >= pDays;

return vcCursor;
/**begin 
    for i in UserWihtoutChange(pdays) loop 
        dbms_output.put_line(i.id_person);
        dbms_output.put_line(i.first_name);
        dbms_output.put_line(i.last_name);
        dbms_output.put_line(i.user_name);
    end loop;**/
end;
        /
