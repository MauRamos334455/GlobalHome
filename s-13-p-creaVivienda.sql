--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Valida y modifica los registros para alquilar una vivienda,
-- Valida que la vivienda que se quiere alquilar, vender o rentar esté disponible,
-- de estarlo modifica todos los valores necesarios para su incersión

prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace procedure creaVivienda(
p_vivienda_id  out number,
p_longitud number,
p_latitud number,
p_direccion varchar2,
p_capacidad number,
p_descripcion varchar2,
p_es_renta number,
p_es_vacacion number,
p_es_venta number,
p_usuario_id number,
--Para renta
  p_renta_mensual number default null,
  p_dia_deposito number default null,
--Para vacaionar
  p_fecha_inicio date default null,
  p_fecha_fin date default null,
  p_precio_dia number default null,
--Para venta
  p_numero_catastral number default null,
  p_folio varchar2 default null,
  p_avaluo blob default EMPTY_BLOB(),
  p_precio_inicial number default null
)is

v_vivienda_id number;
v_numero_dias number;

begin
  v_vivienda_id := vivienda_seq.nextval;

  insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad,
    descripcion, fecha_status, es_renta, es_vacacion, es_venta,
    status_vivienda_id, usuario_id)
  values (v_vivienda_id, p_longitud, p_latitud, p_direccion, p_capacidad,
    p_descripcion, sysdate, p_es_renta, p_es_vacacion, p_es_venta, 1, p_usuario_id);

  dbms_output.put_line('La vivienda fue creada exitosamente: '||v_vivienda_id);

  if p_es_renta = 0 and p_es_vacacion = 0 and p_es_venta = 1 then
    insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo,
      precio_inicial)
    values
      (v_vivienda_id, p_numero_catastral, p_folio, p_avaluo, p_precio_inicial);
    dbms_output.put_line('La vivienda  tipo venta fue creada exitosamente: '||v_vivienda_id);
  else
    raise_application_error ( -40010 ,'ERROR: Una vivienda en venta no puede rentarse o alquilar.');
  end if;

  if p_es_renta = 1 then
    insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito)
    values (v_vivienda_id, p_renta_mensual, p_dia_deposito);
  end if;

  if p_es_vacacion = 1 then
    v_numero_dias := p_fecha_fin - p_fecha_inicio;
    if v_numero_dias >0 then
      insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin,
        precio_dia, numero_dias)
      values (v_vivienda_id, p_fecha_inicio, p_fecha_fin, p_precio_dia, v_numero_dias);
    else
      raise_application_error ( -40011 ,'ERROR: La fecha fin no puede ser igual o menor a la fecha de inicio.');
    end if;
  end if;
end creaVivienda;
/
show errors

disconnect;