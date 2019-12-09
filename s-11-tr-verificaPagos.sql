--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación del trigger que valida si ya debería cambair el status
--de una vivienda basandose en lo que se ha pagado de ella

prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace trigger trg_verifica_pago
  for insert or update of importe on mensualidad
  compound trigger

  before each row is
      v_status_vivienda_id vivienda_venta.vivienda_id%type;
  begin
    select status_vivienda_id into v_status_vivienda_id
    from vivienda
    where vivienda_id = (
      select vivienda_id
      from transaccion
      where transaccion_id = :new.transaccion_id);

    if v_status_vivienda_id != 4  then
        raise_application_error ( -20011 ,'ERROR: la vivienda que se desea pagar no está en venta.');
    end if;
  end before each row;

  after each row is
    v_importe mensualidad.importe%type;
    v_precio_inicial vivienda_venta.precio_inicial%type;
    v_comision transaccion.comision%type;
    v_vivienda_id vivienda_venta.vivienda_id%type;
  begin
    select sum(importe) into v_importe
    from mensualidad
    where transaccion_id = :new.transaccion_id;

    select comision, vivienda_id
    into v_comision, v_vivienda_id
    from transaccion
    where transaccion_id = :new.transaccion_id;

    v_importe := v_importe + :new.importe + v_comision;

    select precio_inicial into v_precio_inicial
    from vivienda_venta
    where vivienda_id = v_vivienda_id;

    if v_importe = v_precio_inicial then
        update vivienda
        set status_vivienda_id = 5
        where vivienda_id = v_vivienda_id;
    end if;
    end after each row;
  end trg_verifica_pago;
  /
  show errors

disconnect;