--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 08/12/2019
--@Descripción: que notifica a todos los usuarios interesados
--en un alquiler si la vivienda que desean ya fue desocupada, en caso de ser así
--envía notificación y cambia la bandera de notificación

prompt CONECTANDO...
connect kgr_proy_admin/carima;
create or replace trigger trg_status_vivienda
  after insert or update of status_vivienda_id on vivienda
  for each row
  declare

  begin
    insert into historico_vivienda (historico_vivienda_id, fecha_status,
    vivienda_id, status_vivienda_id)
    values (historico_vivienda_seq.nextval, sysdate, :new.vivienda_id,
    :new.status_vivienda_id);

    if updating ('status_vivienda_id') then
      if :old.status_vivienda_id = 3 and :new.status_vivienda_id = 1 then
        update notificacion
        set enviado = 1
        where vivienda_id = :new.vivienda_id;
      end if;
    end if;
  end trg_status_vivienda;
  /
  show errors

disconnect;