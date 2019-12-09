--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 08/12/2019
--@Descripción: Calcula el valor de ingresos a lo largo del tiempo de una
--vivienda por todas sus contratos de renta.

prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace function calculaIngresosRenta(
    str_vivienda_id vivienda.vivienda_id%type
)return number is

cursor cur_historico is
  select fecha_status, status_vivienda_id
  from historico_vivienda
  where vivienda_id = str_vivienda_id and status_vivienda_id in (1,2);--renta y disp

cursor cur_contratos is
  select fecha_contrato
  from contrato
  where vivienda_id = str_vivienda_id;

  v_fecha_fin date;
  v_fecha_inicio date;
  v_fecha date;
  v_status number;
  v_meses_renta number;
  v_ingresos number;
  v_renta_mensual number;

begin
  v_ingresos := 0;
  open cur_historico;
  open cur_contratos;
  fetch cur_contratos into v_fecha_inicio;
  fetch cur_historico into v_fecha, v_status;
  loop
    exit when cur_contratos%notfound;
    while v_fecha_inicio = v_fecha and v_status = 2 loop --Verifica si se lelgó a la fecha de inicio de la renta
      fetch cur_historico into v_fecha, v_status;
    end loop;
    fetch cur_historico into v_fecha_fin, v_status;
    if v_status = 1 then
        v_meses_renta := ceil((v_fecha_fin - v_fecha_inicio)/30);
    else
      raise_application_error ( -40011 ,'ERROR: ¡Inconsistencia de datos! el estado debería ser disponible.');
    end if;
    select renta_mensual into v_renta_mensual
    from vivienda_renta
    where vivienda_id = str_vivienda_id;
    v_ingresos := v_ingresos + v_meses_renta * v_renta_mensual;
    fetch cur_contratos into v_fecha_inicio;
  end loop;
  close cur_contratos;
  close cur_historico;
  return v_ingresos;
end;
/
show errors
