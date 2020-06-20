/*==================================================CREACIÓN DE TABLESPACES======================================================*/

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

CREATE USER PAR
IDENTIFIED BY PAR
DEFAULT TABLESPACE par_data
QUOTA 10M ON par_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;

/*==================================================PERMISOS DE ESQUEMAS======================================================*/
/*PERMISOS DE PAR*/
GRANT connect to par;
GRANT create session to par;
GRANT create table to par;
GRANT create sequence to par;
GRANT create any trigger, alter any trigger, drop any trigger to par;
ALTER USER PAR QUOTA UNLIMITED ON par_data;
ALTER USER PAR QUOTA UNLIMITED ON par_ind;
GRANT CREATE PROCEDURE TO PAR;