--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación de indices

--No unique
create index idx_name on TRANSACCION(CLAVE_BANCARIA);
create index idx_name on TARJETA_CREDITO(NUMERO);
create index idx_name on CLABE(CLABE);
create index idx_name on VIVIENDA(LONGITUD);
create index idx_name on VIVIENDA(LATITUD);
create index idx_name on VIVIENDA(DIRECCION);
create index idx_name on VIVIENDA(CAPACIDAD);
--unique
create unique index idx_name on VENTA(NUMERO_CATASTRAL);
create unique index idx_name on VENTA(FOLIO);
create unique index idx_name on ALQUILER(FOLIO);
create unique index idx_name on USUARIO(EMAIL);
create unique index idx_name on USUARIO(NOMBRE_USUARIO);
create unique index idx_name on CONTRATO(FOLIO);
create unique index idx_name on SERVICIO(NOMBRE);

--unique compuestos
create index idx_name on VENTA(VIVIENDA_ID, NUMERO_CATASTRAL);
create index idx_name on VENTA(VIVIENDA_ID, FOLIO);
create index idx_name on USUARIO(USUARIO_ID, EMAIL);
create index idx_name on USUARIO(USUARIO_ID, NOMBRE_USUARIO);

--basados en funciones
create index idx_name on USUARIO(LOWER(NOMBRE||APELLIDO_PATERNO||APELLIDO_MATERNO));
create index idx_name on
