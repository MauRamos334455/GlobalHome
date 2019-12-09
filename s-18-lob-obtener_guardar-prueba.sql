--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--            César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Prueba para programas anónimos s-17-lob-*.sql

prompt "Guardando nuevo servicio de Lavado en la BD"
@s-17-lob-guardar_lob.sql
prompt Comprobando en tabla SERVICIO
column servicio_id format a5
column nombre format a15
column descripcion format a20
column icono format a20

select * from servicio where nombre='LAVADO';
prompt Listo!

prompt "Obteniendo icono de SPA"
@s-17-lob-obtener_icono.sql
prompt "Ver imagen(recupera.png) en directorio de MULTIMEDIA"
prompt Listo!
