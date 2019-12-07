--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Creación de tablas (DDL)
--de la base de datos para el proyecto GlobalHome.

connect kgr_proy_admin;

prompt TABLA USUARIOS
create table usuario(
    usuario_id number(10,0)
      constraint usuario_pk primary key,
    email varchar2(40) not null,
    nombre_usuario varchar2(40) not null,
    nombre varchar2 (40) not null,
    apellido_paterno varchar2(40) not null,
    apellido_materno varchar2(40),
    contrasenia varchar2(15) not null


);

prompt TABLA VIVIENDA
create table vivienda(
    vivienda_id number(10,0)
      constraint vivienda_pk primary key,
    longitud varchar2(40) not null,
    latitud varchar2(40) not null,
    direccion varchar2(100) not null,
    capacidad number(10,0) not null,
    descripcion varchar2(2000) not null,
    fecha_status date not null,
    es_renta number(1,0) not null,
    es_vacacion number(1,0) not null,
    es_venta number(1,0) not null
);

prompt TABLA VIVIENDA_RENTA
create table vivienda_renta(
    vivienda_id number(10, 0)
      constraint vivienda_renta_pk primary key,
    renta_mensual number(20,2) not null,
    dia_deposito number(2,0) not null

);

prompt TABLA VIVIENDA_VENTA
create table venta(
    vivienda_id number(10,0)
      constraint vivienda_venta_pk primary key,
    numero_catastral number(20,0) not null,
    folio varchar2(18) not null,
    avaluo blob not null,
    precio_inicial number(24,4) not null,

);

prompt TABLA VIVIENDA_VACACION
create table vacacion(
    vivienda_id number(10,0)
      constraint vivienda_vacacion_pk primary key,
    fecha_inicio date not null,
    fecha_fin date not null,
    numero_dias number(10,0) not null --virtual?

);

prompt TABLA CONTRATO
create table contrato(
    contrato_id number(10,0)
      constraint contrato_pk primary key,
    folio varchar2(30) not null,
    fecha_contrato date not null,
    clausula_firmas blob not null,

);

prompt TABLA ALQUILER
create table alquiler(
    alquiler_id number(10,0)
      constraint alquiler_pk primary key,
    folio varchar2(20) not null,

);

prompt TABLA IMAGEN
create table imagen(
    vivienda_id number(10,0)
    numero number(2,0),
    contenido blob not null,
    constraint imagen_pk primary key (vivienda_id, numero),

);

prompt TABLA CLABE
create table  clabe(
    clabe_id number(10,0)
      constraint clabe_pk primary key,
    clabe varchar2(40) not null,

);

prompt TABLA NOTIFICACION
create table notificacion(
    notificacion_id number(10,0)
      constraint notificacion_pk primary key,
    numero_celular number(15,0) not null,

);

prompt TABLA MENSAJE
create table mensaje(
    mensaje_id number(10,0)
      constraint mensaje_pk primary key,
    contenido varchar2(2000) not null,
    visto number(1,0) not null,

);

prompt TABLA TARJETA_CREDITO
create table tarjeta_credito(
    tarjeta_credito_id number(10,0)
      constraint tarjeta_credito_pk primary key,
    numero_tarjeta number(16,0) not null,
    mes_expiracion number(2,0) not null,
    anio_expiracion number(2,0) not null,

);

prompt TABLA TRANSACCION
create table transaccion (
    transaccion_id number(10,0)
      constraint transaccion_pk primary key,
    comision number(24,4) not null,
    clave_interbancaria varchar2(40) not null,

);

prompt TABLA SERVICIO
create table servicio(
    servicio_id number(10,0)
     constraint servicio_pk primary key,
    nombre varchar2(100) not null,
    descripcion varchar2(2000) not null,
    icono blob not null,

);

prompt TABLA VIVIENDA_SERVICIO
create table vienda_servicio(
    vivienda_servicio_id number(10,0)
      constraint vivienda_servicio_pk primary key,

);

prompt TABLA STATUS_VIVIENDA
create table status_vivienda(
    status_vivienda_id number(10,0)
      constraint status_vivienda_pk primary key,
    clave varchar2(30) not null,
    descripcion varchar2(2000) not null
);

prompt TABLA HISTORICO_VIVIENDA
create table historico_vivienda(
    historico_vivienda_id number(10,0)
      constraint historico_vivienda_pk primary key,
    fecha_status date not null
);

prompt TABLA MENSUALIDAD
create table mensualidad(
    transaccion_id number(10,0),
    numero_pago number(2,0) not null,
    fecha_pago date not null,
    importe number(24,4) not null,
    evidencia blob not null,
    constraint mensualidad_pk primary key(transaccion_id, numero_pago),
);

prompt ¡LISTO!
disconnect;