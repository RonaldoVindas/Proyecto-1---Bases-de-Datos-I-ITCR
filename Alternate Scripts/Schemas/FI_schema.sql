/*==================================================CREACIÓN DE TABLESPACES======================================================*/

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

/*==================================================CREACIÓN DE ESQUEMAS======================================================*/


CREATE USER FI
IDENTIFIED BY FI
DEFAULT TABLESPACE fi_data
QUOTA 10M ON fi_data
TEMPORARY TABLESPACE temp
QUOTA 5M ON system;

/*==================================================PERMISOS DE ESQUEMAS======================================================*/
/*PERMISOS DE FI*/
GRANT connect to fi;
GRANT create session to fi;
GRANT create table to fi;
GRANT create sequence to fi;
GRANT create any trigger, alter any trigger, drop any trigger to fi;
ALTER USER FI QUOTA UNLIMITED ON fi_data;
ALTER USER FI QUOTA UNLIMITED ON fi_ind;