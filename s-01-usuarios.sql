--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Creación y asignación de
--privilegios a los usuarios de la base de
--datos para el proyecto GlobalHome.

prompt CREANDO USUARIOS...
create user kgr_proy_invitado
identified by carima
quota 1024m on users;

create user kgr_proy_admin
identified by carima
quota 1024m on users;

prompt CREANDO DIRECTORIO MULTIMEDIA...
!cp -r multimedia /tmp/
!chmod 777 /tmp/multimedia
create directory multimedia as '/tmp/multimedia';
grant read, write on directory multimedia to kgr_proy_admin;
grant read, write on directory multimedia to kgr_proy_invitado;

prompt CREANDO ROLES...
create role rol_admin;
grant create table, create sequence,
      create session, create procedure,
      create synonym, create view,
      create public synonym,
      create any synonym,
      create trigger to kgr_proy_admin;
create role rol_invitado;
grant create session to kgr_proy_invitado;

prompt ASIGNANDO ROLES...
grant rol_admin to kgr_proy_admin;
grant rol_invitado to kgr_proy_invitado;

prompt ¡LISTO!

