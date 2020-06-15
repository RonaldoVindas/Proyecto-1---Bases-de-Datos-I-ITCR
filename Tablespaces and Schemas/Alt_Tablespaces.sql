/*TABLESPACE para Persona = Person = pe*/
CREATE TABLESPACE pe_data
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\pedata01.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

CREATE TABLESPACE pe_ind
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\peind.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

/*TABLESPACE para Expediente = file = fi*/

CREATE TABLESPACE fi_data
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\fidata01.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

CREATE TABLESPACE fi_ind
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\fiind.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

/*TABLESPACE para Lugar = Place = pl*/

CREATE TABLESPACE pl_data
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\pldata01.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

CREATE TABLESPACE pl_ind
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\plind.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;


/*TABLESPACE para Parámetro = Parameter = par*/

CREATE TABLESPACE par_data
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\pardata01.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

CREATE TABLESPACE par_ind
DATAFILE 'C:\app\Ronaldo\oradata\DBPROYECTO\parind.dbf'
SIZE 10M
REUSE
AUTOEXTEND ON
NEXT 512K
MAXSIZE 200M;

/*==================================================CREACIÓN DE ESQUEMAS======================================================*/


CREATE USER PE
IDENTIFIED BY PE
DEFAULT TABLESPACE pe_data
QUOTA 10M ON pe_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;


CREATE USER FI
IDENTIFIED BY FI
DEFAULT TABLESPACE fi_data
QUOTA 10M ON fi_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;

CREATE USER PL
IDENTIFIED BY PL
DEFAULT TABLESPACE pl_data
QUOTA 10M ON pl_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;


CREATE USER PAR
IDENTIFIED BY PAR
DEFAULT TABLESPACE par_data
QUOTA 10M ON par_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;


/*==================================================PERMISOS DE ESQUEMAS======================================================*/
/*EN SYSTEM:*/

/*PERMISOS DE PE*/
GRANT connect to pe;
GRANT create session to pe;
GRANT create table to pe;
GRANT create sequence to pe;
GRANT create any trigger, alter any trigger, drop any trigger to pe;
ALTER USER ADM QUOTA UNLIMITED ON pe_data;
ALTER USER ADM QUOTA UNLIMITED ON pe_ind;

/*PERMISOS DE FI*/
GRANT connect to fi;
GRANT create session to fi;
GRANT create table to fi;
GRANT create sequence to fi;
GRANT create any trigger, alter any trigger, drop any trigger to fi;
ALTER USER ADM QUOTA UNLIMITED ON fi_data;
ALTER USER ADM QUOTA UNLIMITED ON fi_ind;

/*PERMISOS DE PL*/
GRANT connect to pl;
GRANT create session to pl;
GRANT create table to pl;
GRANT create sequence to pl;
GRANT create any trigger, alter any trigger, drop any trigger to pl;
ALTER USER ADM QUOTA UNLIMITED ON pl_data;
ALTER USER ADM QUOTA UNLIMITED ON pl_ind;


/*PERMISOS DE PAR*/
GRANT connect to par;
GRANT create session to par;
GRANT create table to par;
GRANT create sequence to par;
GRANT create any trigger, alter any trigger, drop any trigger to par;
ALTER USER ADM QUOTA UNLIMITED ON par_data;
ALTER USER ADM QUOTA UNLIMITED ON par_ind;
