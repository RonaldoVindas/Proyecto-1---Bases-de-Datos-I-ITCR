/*==================================================CREACIÓN DE TABLESPACES======================================================*/

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

/*==================================================CREACIÓN DE ESQUEMAS======================================================*/


CREATE USER PE
IDENTIFIED BY PE
DEFAULT TABLESPACE pe_data
QUOTA 10M ON pe_data
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
ALTER USER PE QUOTA UNLIMITED ON pe_data;
ALTER USER PE QUOTA UNLIMITED ON pe_ind;
GRANT REFERENCES ON PE.person TO FI;
