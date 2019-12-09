--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Crea un reporte considerando todos los inmuebles creados entre
-- esas fechas, el reporte muestra los ingresos obtenidos por ventas y vacaiones
--de un determinado inmueble
prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace procedure creaReporte(
  p_fecha_inicio date,
  p_fecha_fin date,
  p_vivienda_id vivienda.vivienda_id%type
)is
v_ingresos number;
v_numero_dias number;
begin
  v_numero_dias := p_fecha_fin - p_fecha_inicio;
  if v_numero_dias >0 then
    select sum(A.precio_total) into v_ingresos
    from vivienda V
    join historico_vivienda HV on V.vivienda_id = HV.vivienda_id
    left join alquiler A on V.vivienda_id = A.vivienda_id
    where V.vivienda_id = p_vivienda_id and
       HV.fecha_status >= p_fecha_inicio and
       HV.fecha_status <= p_fecha_fin;
    dbms_output.put_line('La vivienda '||p_vivienda_id||' ha generado de alquiler ingresos por: '||v_ingresos);
  else
    raise_application_error ( -40011 ,'ERROR: La fecha fin no puede ser igual o menor a la fecha de inicio.');
  end if;
end creaReporte;
/
show errors

disconnect;