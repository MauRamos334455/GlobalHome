--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación de indices

PROMPT INDICES NO UNIQUE...
create index trans_clave_ix   on TRANSACCION(CLAVE_INTERBANCARIA);
create index tarj_numero_ix   on TARJETA_CREDITO(NUMERO_TARJETA);
create index clave_clave_ix   on CLABE(CLABE);
create index vivienda_long_ix on VIVIENDA(LONGITUD);
create index vivienda_lat_ix  on VIVIENDA(LATITUD);
create index vivienda_dir_ix  on VIVIENDA(DIRECCION);
create index vivienda_cap_ix  on VIVIENDA(CAPACIDAD);
create index vivienda_prec_ix on VIVIENDA_VENTA(PRECIO_INICIAL);

prompt INDICES POR JOINS...
create index vivienda_status_ix on VIVIENDA(STATUS_VIVIENDA_ID);
create index vivser_viv_ix on VIVIENDA_SERVICIO(vivienda_id);
create index vivser_ser_ix on VIVIENDA_SERVICIO(servicio_id);
create index tarj_usua_ix on TARJETA_CREDITO(usuario_id);
create index mens_resp_ix on MENSAJE(respuesta_id);
create index mens_usua_ix on MENSAJE(usuario_id);
create index mens_viv_ix on MENSAJE(vivienda_id);

prompt INDICES COMPUESTOS...
create index vivienda_long_lat_ix on VIVIENDA(LONGITUD, LATITUD);

prompt INDICES BASADOS EN FUNCIONES...
create index usuario_nomcompleto_ix on USUARIO(LOWER(NOMBRE||APELLIDO_PATERNO||APELLIDO_MATERNO));
create index vacacion_aniofin_ix  on VIVIENDA_VACACION(extract(YEAR from FECHA_FIN));
create index vacacion_mesfin_ix   on VIVIENDA_VACACION(extract(MONTH from FECHA_FIN));
create index vacacion_diafin_ix   on VIVIENDA_VACACION(extract(DAY from FECHA_FIN));
create index vacacion_anioini_ix  on VIVIENDA_VACACION(extract(YEAR from FECHA_INICIO));
create index vacacion_mesini_ix   on VIVIENDA_VACACION(extract(MONTH from FECHA_INICIO));
create index vacacion_diaini_ix   on VIVIENDA_VACACION(extract(DAY from FECHA_INICIO));

prompt ¡LISTO!

