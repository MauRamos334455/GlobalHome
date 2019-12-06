--@Autor(es): <Nombre de los integrantes>
--@Fecha creación: dd/mm/aaaa
--@Descripción: <breve descripción del contenido y propósito del archivo>

prompt INGRESANDO COMO SYSDBA...
connect sys as sysdba

prompt CREANDO USUARIOS...
create user kgr_proy_invitado
identified by carima
quota 1024m on users;

create user kgr_proy_admin
identified by carima
quota 1024m on users;

prompt CREANDO ROLES...
create role rol_admin;
grant create table, create sequence, 
      create session, create procedure,
      create synonym, create index,
      create view, create public synonym,
      create trigger to kgr_proy_admin;
create role rol_invitado;
grant create session to kgr_proy_invitado;

prompt ASIGNANDO ROLES..
grant rol_admin to kgr_proy_admin;
grant rol_invitado to kgr_proy_invitado;

prompt ¡LISTO!
disconnect;