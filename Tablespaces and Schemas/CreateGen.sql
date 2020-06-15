CREATE TABLESPACE gen_data
    Datafile 'C:\app\andres\oradata\BDProyecto\gendata01.dbf'
    Size 10m
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
    
CREATE TABLESPACE gen_ind
    Datafile 'C:\app\andres\oradata\BDProyecto\genind01.dbf'
    Size 10m
    REUSE
    AUTOEXTEND ON
    NEXT 512K
    MAXSIZE 200M;
    
/*If you run the 'create tablespace' script make sure to redefine the path for your pc*/
    

CREATE USER gen
    IDENTIFIED BY gen
    DEFAULT TABLESPACE gen_data
    QUOTA 10m ON gen_data
    TEMPORARY TABLESPACE temp
    QUOTA 5m on SYSTEM ;

GRANT  CONNECT TO gen;

GRANT CREATE SESSION TO gen;

Grant create table to gen;

Grant create view to gen;

grant create trigger to gen;

ALTER USER gen QUOTA UNLIMITED ON gen_data;
ALTER USER gen QUOTA UNLIMITED ON gen_ind;

grant create procedure to gen;
grant create sequence to gen;