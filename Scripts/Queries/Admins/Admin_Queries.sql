/*=======================================CONSULTAS PARA ADMINS===============================*/

/*En esquema FI ===============================*/

*/Listado de expedientes nuevos*/

create or replace procedure NewCriminalRecord
as
cursor newCriminalRecord
is 
Select a.id_criminal_record, a.description descript1, c.description descript2, b.name
from Criminal_Record a
join Community b
on a.id_community = b.id_community
join crime_type c
on a.id_crime_type = c.id_crime_type
where sysdate = a.creation_date;
begin 
    for i in newCriminalRecord loop 
        dbms_output.put_line(i.id_criminal_record);
        dbms_output.put_line(i.descript1);
        dbms_output.put_line(i.name);
        dbms_output.put_line(i.descript2);
    end loop;
end NewCriminalRecord;



/*Listado de usuario con claves no modificadas*/ 

create or replace procedure UserWithoutChange(pDays in number)
as
cursor UserWithoutChange(pDays in number)
is 
Select a.Id_person, a.first_name, a.last_name, a.user_name
from person a
inner  join user_password_binnacle b 
on a.id_user_password_binnacle = b.id_user_password_binnacle
where sysdate - b.user_password_date >= pDays;
begin 
    for i in UserWithoutChange(pdays) loop 
        dbms_output.put_line(i.id_person);
        dbms_output.put_line(i.first_name);
        dbms_output.put_line(i.last_name);
        dbms_output.put_line(i.user_name);
    end loop;
end UserWithoutChange;
