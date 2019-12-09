--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación del trigger que verifica si existe por lo menos
--una tarjeta registrada para realizar un alquiler y si la fecha de alquiler es
--valida.
prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace trigger trg_valida_targeta_alq
  before insert on alquiler
  for each row
  declare
  cursor cur_tarjetas is
    select mes_expiracion, anio_expiracion
    from tarjeta_credito
    where usuario_id = :new.usuario_id;
    v_mes_expiracion tarjeta_credito.mes_expiracion%type;
    v_anio_expiracion tarjeta_credito.anio_expiracion%type;
    v_targeta_valida number;
    v_anio_actual number;
    v_mes_actual number;
    v_fecha_inicio alquiler.fecha_inicio%type;
    v_fecha_fin alquiler.fecha_fin%type;
  begin
    v_targeta_valida := 0;
    v_anio_actual := extract(YEAR from sysdate);
    v_mes_actual  := extract(MONTH from sysdate);

    select fecha_fin, fecha_inicio
    into v_fecha_fin, v_fecha_inicio
    from vivienda_vacacion
    where vivienda_id = :new.vivienda_id;

    open cur_tarjetas;
    loop
        fetch cur_tarjetas into
        v_mes_expiracion, v_anio_expiracion;
        if v_anio_actual <= v_anio_expiracion and v_mes_actual < v_mes_expiracion then
            v_targeta_valida := 1;
        end if;
        exit when cur_tarjetas%notfound or v_targeta_valida = 1;
    end loop;
    close cur_tarjetas;

    if v_targeta_valida = 1 then
      if :new.fecha_fin <= v_fecha_fin and :new.fecha_inicio >= v_fecha_inicio then
        insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin,
          precio_total, usuario_id, vivienda_id)
        values (:new.alquiler_id, :new.folio,
          :new.fecha_inicio, :new.fecha_fin, :new.precio_total, :new.usuario_id,
          :new.vivienda_id);

        update vivienda
        set status_vivienda_id = 3
        where vivienda_id = :new.vivienda_id;
      else
          raise_application_error ( -30010 ,'ERROR: La vivienda no puede estar alquilada en ese periodo.');
      end if;
    else
      raise_application_error ( -20010 ,'ERROR: el usuario requiere al menos una tarjeta de crédito válida.');
    end if;
  end trg_valida_targeta_alq;
  /
  show errors

disconnect;