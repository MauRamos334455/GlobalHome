--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 09/12/2019
--@Descripción: Archivo main que ejecuta
--todos los scripts de definicion e implementacion
--del proyecto GlobalHome (no triggers ni programas)

prompt -------------------¡BIENVENIDO!-------------------

whenever sqlerror exit rollback

prompt CONTRASEÑA SYSTEM:

connect sys as sysdba;

prompt BORRANDO...

drop user kgr_proy_invitado cascade;
drop user kgr_proy_admin cascade;
drop role rol_admin;
drop role rol_invitado;
drop directory multimedia;

prompt EJECUTANDO SCRIPTS... 

start s-01-usuarios.sql

prompt CONECTANDO...

connect kgr_proy_admin/carima

start s-05-secuencias.sql
start s-02-entidades.sql
start s-03-tablas-temporales.sql
start s-04-tablas-externas.sql
start s-06-indices.sql
start s-07-sinonimos.sql
start s-08-vistas.sql
start s-09-carga-inicial.sql
start s-10-consultas.sql

prompt ----------------------¡ADIOS!------------------------


disconnect