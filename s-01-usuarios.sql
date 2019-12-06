--@Autor(es): <Nombre de los integrantes>
--@Fecha creación: dd/mm/aaaa
--@Descripción: <breve descripción del contenido y propósito del archivo>

connect sys as sysdba

create user kgr_proy_invitado;

create user kgr_proy_admin;

create role rol_admin;

create role rol_invitado;