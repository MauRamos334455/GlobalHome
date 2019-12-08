--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación de vistas

--Muestra todas las tarjetas de cŕedito junto con los datos su propietario
create or replace view datos_usaurio(
  user_name, nombre, ap_paterno, ap_materno, tarjeta
) as select nombre_usuario, nombre, apellido_paterno, apellido_materno,
 '****-****-***-'||substr(to_char(numero_tarjeta),13,4)
  from USUARIO
  natural join TARJETA_CREDITO;

--Muestra todas las viviendas dispobibles para renta
create or replace view vivienda_disponible(
  latitud, longitud, direccion, capacidad, descripcion, renta_mensual
)as select latitud, longitud, direccion, capacidad , descripcion, renta_mensual
  from VIVIENDA
  natural join VIVIENDA_RENTA
  where status_vivienda_id = 1;

--Muestra todas la viviendas que han sido alquiladas así como los datos del usuario que la alquiló
create or replace view historia_alquiler(
  folio, vivienda_id , direccion, capacidad, descripcion, precio_dia,
  fecha_inicio, fecha_fin, nombre, apellido_paterno
) as select A.folio, VI.vivienda_id, VI.direccion, VI.capacidad, VI.descripcion,
  VV.precio_dia, VV.fecha_inicio, VV.fecha_fin, US.nombre, US.apellido_paterno,
  from ALQUILER A
  join VIVIENDA_VACACION  VV on VV.vivienda_id = A.vivienda_id
  join VIVIENDA VI ON VV.vivienda_id = A.vivienda_id
  join USUARIO US on US.usuario_id = A.usuario_id;
