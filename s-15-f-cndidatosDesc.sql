--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 09/12/2019
--@Descripción: A partir del Id del usuario verifica sus últimos alquileres y en
--base a ello indica si el usuario es candidato para recibir algún cupón (10, 20, 40, 100)

prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace function descuento(
  str_usuario_id usuario.usuario_id%type
) return number is
  v_fecha_prim_uso date;
  v_visitas_anual number;
  v_ingresos_anual number;
  v_visitas_total number;
  v_puntos_total number;
begin
  v_puntos_total := 0;
  select count(*) into v_visitas_total
  from alquiler
  where usuario_id = 1;

  if v_visitas_total > 0 then
    select count(*), sum(precio_total) into v_visitas_anual, v_ingresos_anual
    from alquiler
    where usuario_id = str_usuario_id and fecha_inicio >= sysdate -365;

    select fecha_inicio into v_fecha_prim_uso
    from( select fecha_inicio
          from alquiler
          where usuario_id = str_usuario_id
          order by fecha_inicio asc)
    where ROWNUM = 1;
    if v_fecha_prim_uso >= sysdate - 365 * 3 then
      v_puntos_total := .5;
    end if;
    if v_ingresos_anual > 10000 then
      v_puntos_total := 1 + v_puntos_total;
    end if;
    if  v_visitas_anual > 5 then
      v_puntos_total := 1 + v_puntos_total;
    end if;
  end if;
  return v_puntos_total;
end descuento;
/
show errors

disconnect;