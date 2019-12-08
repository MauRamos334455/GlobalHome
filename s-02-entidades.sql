--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Creación de tablas (DDL)
--de la base de datos para el proyecto GlobalHome.

prompt CONECTANDO...
connect kgr_proy_admin/carima;

prompt TABLA USUARIOS
create table usuario(
    usuario_id number(10,0) default usuario_seq.nextval
      constraint usuario_pk primary key,
    email varchar2(40) not null,
    nombre_usuario varchar2(40) not null,
    nombre varchar2 (40) not null,
    apellido_paterno varchar2(40) not null,
    apellido_materno varchar2(40),
    contrasenia varchar2(15) not null,
    constraint usuario_email_uk unique (email),
    constraint usuario_nombre_usuario_uk unique(nombre_usuario),
    constraint usuario_contrasenia_chk check(LENGTH(contrasenia)>=8)
);

prompt TABLA STATUS_VIVIENDA
create table status_vivienda(
    status_vivienda_id number(10,0) default status_vivienda_seq.nextval
      constraint status_vivienda_pk primary key,
    clave varchar2(30) not null,
    descripcion varchar2(2000) not null,
    constraint sv_clave_chk check(
      clave in('DISPONIBLE','EN RENTA','ALQUILADA',
              'EN VENTA', 'VENDIDA', 'INACTIVA'))
);

prompt TABLA VIVIENDA
create table vivienda(
    vivienda_id number(10,0) default vivienda_seq.nextval
      constraint vivienda_pk primary key,
    longitud number(30, 15) not null,
    latitud number(30, 15) not null,
    direccion varchar2(100) not null,
    capacidad number(4,0) not null,
    descripcion varchar2(2000) not null,
    fecha_status date default sysdate not null,
    es_renta number(1,0) not null,
    es_vacacion number(1,0) not null,
    es_venta number(1,0) not null,
    status_vivienda_id number(10,0) not null,
    usuario_id number(10,0) not null,
    constraint vstat_vivienda_id_fk
      foreign key (status_vivienda_id)
      references status_vivienda(status_vivienda_id),
    constraint vstat_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint vivienda_es_renta_es_vacacion_es_venta_chk check (
      ((es_renta = 1 or es_vacacion = 1) and es_venta = 0) or
       (es_venta = 1 and es_renta = 0 and es_vacacion = 0))
);

prompt TABLA VIVIENDA_RENTA
create table vivienda_renta(
    vivienda_id number(10, 0)
      constraint vivienda_renta_pk primary key,
    renta_mensual number(20,2) not null,
    dia_deposito number(2,0) not null,
    constraint vr_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id),
    constraint vr_dia_deposito_chk check (
      dia_deposito > 0 and dia_deposito <=31),
    constraint vr_renta_mensual_chk check(renta_mensual>0)
);

prompt TABLA VIVIENDA_VENTA
create table vivienda_venta(
    vivienda_id number(10,0)
      constraint vivienda_venta_pk primary key,
    numero_catastral number(20,0) not null,
    folio varchar2(18) not null,
    avaluo blob not null,
    precio_inicial number(24,4) not null,
    constraint vven_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id),
    constraint vv_folio_uk unique (folio),
    constraint vv_numero_catastral_uk unique(numero_catastral)
);

prompt TABLA VIVIENDA_VACACION
create table vivienda_vacacion(
    vivienda_id number(10,0)
      constraint vivienda_vacacion_pk primary key,
    fecha_inicio date not null,
    fecha_fin date not null,
    precio_dia number(24,4) not null,
    numero_dias number(10, 0) not null,
    constraint vvac_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id),
    constraint vvac_precio_dia_chk check (precio_dia >0),
    constraint vvac_fecha_inicio_fecha_fin_chk check((fecha_fin-fecha_inicio)>0)
);

prompt TABLA CONTRATO
create table contrato(
    contrato_id number(10,0) default contrato_seq.nextval
      constraint contrato_pk primary key,
    folio varchar2(30) not null,
    fecha_contrato date not null,
    clausula_firmas blob not null,
    vivienda_id number(10,0) not null,
    usuario_id number(10,0) not null,
    constraint contrato_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda_renta(vivienda_id),
    constraint contrato_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint contrato_folio_uk unique (folio)
);

prompt TABLA ALQUILER
create table alquiler(
    alquiler_id number(10,0) default alquiler_seq.nextval
      constraint alquiler_pk primary key,
    folio varchar2(20) not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    dias_hospedaje as
      (fecha_fin - fecha_inicio) virtual,
    precio_total number(24,4) not null,
    usuario_id number(10,0) not null,
    vivienda_id number(10,0) not null,
    constraint alquiler_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint alquiler_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id),
    constraint alquiler_folio_uk unique (folio),
    constraint alquiler_fecha_chk check (fecha_fin-fecha_inicio>0)
);

prompt TABLA TRANSACCION
create table transaccion (
    transaccion_id number(10,0) default transaccion_seq.nextval
      constraint transaccion_pk primary key,
    comision number(24,4) not null,
    clave_interbancaria number(18,0) not null,
    usuario_id number(10,0) not null,
    vivienda_id number(10,0) not null,
    constraint transaccion_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint transaccion_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda_venta(vivienda_id),
    constraint transaccion_comision_chk check(comision>0)
);


prompt TABLA IMAGEN
create table imagen(
    vivienda_id number(10,0),
    numero number(2,0) not null,
    contenido blob not null,
    constraint imagen_pk
      primary key (vivienda_id, numero),
    constraint vivienda_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id)
);

prompt TABLA CLABE
create table  clabe(
    clabe_id number(10,0) default clabe_seq.nextval
      constraint clabe_pk primary key,
    clabe number(18,0) not null,
    vivienda_id number(10,0) not null,
    constraint clabe_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda_renta(vivienda_id)
);

prompt TABLA NOTIFICACION
create table notificacion(
    notificacion_id number(10,0) default notificacion_seq.nextval
      constraint notificacion_pk primary key,
    numero_celular number(15,0) not null,
    enviado number(1,0) not null,
    usuario_id number(10,0) not null,
    vivienda_id number(10,0) not null,
    constraint notificacion_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint notificacion_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda_vacacion(vivienda_id),
    constraint notificacion_enviado_chk check(enviado=1 or enviado=0)
);

prompt TABLA MENSAJE
create table mensaje(
    mensaje_id number(10,0) default mensaje_seq.nextval
      constraint mensaje_pk primary key,
    contenido varchar2(2000) not null,
    visto number(1,0) not null,
    respuesta_id number(10,0),
    usuario_id number(10,0) not null,
    vivienda_id number(10,0) not null,
    constraint mensaje_respuesta_id_fk
      foreign key (respuesta_id)
      references mensaje(mensaje_id),
    constraint mensaje_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint mensaje_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id),
    constraint mensaje_visto_chk check(visto=1 or visto=0)
);

prompt TABLA TARJETA_CREDITO
create table tarjeta_credito(
    tarjeta_credito_id number(10,0) default tarjeta_credito_seq.nextval
      constraint tarjeta_credito_pk primary key,
    numero_tarjeta number(16,0) not null,
    mes_expiracion number(2,0) not null,
    anio_expiracion number(2,0) not null,
    usuario_id number(10,0) not null,
    constraint tc_usuario_id_fk
      foreign key (usuario_id)
      references usuario(usuario_id),
    constraint tc_mes_expiracion_chk check(
      mes_expiracion > 0 and mes_expiracion < 13),
    constraint tc_anio_expiracion_chk check(anio_expiracion >= 20 )
);

prompt TABLA SERVICIO
create table servicio(
    servicio_id number(10,0) default servicio_seq.nextval
     constraint servicio_pk primary key,
    nombre varchar2(100) not null,
    descripcion varchar2(2000) not null,
    icono blob not null,
    constraint servicio_nombre_uk unique(nombre)
);

prompt TABLA VIVIENDA_SERVICIO
create table vivienda_servicio(
    vivienda_servicio_id number(10,0) default vivienda_servicio_seq.nextval
      constraint vivienda_servicio_pk primary key,
    servicio_id number(10,0) not null,
    vivienda_id number(10,0) not null,
    constraint vs_servicio_id_fk
      foreign key (servicio_id)
      references servicio(servicio_id),
    constraint vs_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id)
);

prompt TABLA HISTORICO_VIVIENDA
create table historico_vivienda(
    historico_vivienda_id number(10,0) default historico_vivienda_seq.nextval
      constraint historico_vivienda_pk primary key,
    fecha_status date not null,
    vivienda_id number(10,0) not null,
    status_vivienda_id number(10,0) not null,
    constraint hv_status_vivienda_id_fk
      foreign key (status_vivienda_id)
      references status_vivienda(status_vivienda_id),
    constraint hv_vivienda_id_fk
      foreign key (vivienda_id)
      references vivienda(vivienda_id)
);

prompt TABLA MENSUALIDAD
create table mensualidad(
    transaccion_id number(10,0),
    numero_pago number(2,0) not null,
    fecha_pago date default sysdate not null,
    importe number(24,4) not null,
    evidencia blob not null,
    constraint mensualidad_pk primary key(transaccion_id, numero_pago),
    constraint mensualidad_transaccion_id_fk
      foreign key (transaccion_id)
      references transaccion(transaccion_id),
    constraint mensualidad_importe_chk check(importe > 0)
);

prompt ¡LISTO!
disconnect;
