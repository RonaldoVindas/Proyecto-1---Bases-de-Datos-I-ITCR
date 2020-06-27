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
