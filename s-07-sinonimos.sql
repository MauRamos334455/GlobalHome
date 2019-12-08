--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación de sinónimos
prompt CONECTANDO...
connect kgr_proy_admin/carima 

Prompt Creando sinónimos para el usuario kgr_proy_admin
create or replace public synonym servicios for kgr_proy_admin.vivienda_servicio;
create or replace public synonym historico for kgr_proy_admin.historico_vivienda;
create or replace public synonym clientes for kgr_proy_admin.usuario;

Prompt otorgando permisos a kgr_proy_invitado para leer tablas de kgr_proy_admin
grant select on kgr_proy_admin.vivienda to kgr_proy_invitado;
grant select on kgr_proy_admin.vivienda_venta to kgr_proy_invitado;
grant select on kgr_proy_admin.vivienda_renta to kgr_proy_invitado;
grant select on kgr_proy_admin.vivienda_vacacion to kgr_proy_invitado;

Prompt creando sinónimos para tablas con permisos de lectura
create or replace synonym kgr_proy_invitado.vivienda  for kgr_proy_admin.vivienda;
create or replace synonym kgr_proy_invitado.venta     for kgr_proy_admin.vivienda_venta;
create or replace synonym kgr_proy_invitado.renta     for kgr_proy_admin.vivienda_renta;
create or replace synonym kgr_proy_invitado.vacacion  for kgr_proy_admin.vivienda_vacacion;

prompt ¡LISTO!
disconnect;
