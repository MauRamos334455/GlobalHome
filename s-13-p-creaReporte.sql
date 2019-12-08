--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Crea un reporte considerando todos los inmuebles creados entre
-- esas fechas.

prompt CONECTANDO...
connect kgr_proy_admin/carima;

create or replace procedure creaReporte(
  p_fecha_inicio date,
  p_fecha_fin date,
)is

v_vivienda_id number;
v_numero_dias number;

begin

end creaReporte;
/
show errors
