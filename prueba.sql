--BORRADOR DEL MAIN
prompt ----------------¡BIENVENIDO!--------------

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