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