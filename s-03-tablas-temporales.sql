--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 08/12/2019
--@Descripción: Creación de tablas (DDL) temporales
--de la base de datos para el proyecto GlobalHome.

--Tabla que simula una especie de carrito de compras
prompt TABLA INTERESADO
create global temporary table interesado(
    usuario_id number(10,0) not null,
    nombre_usuario varchar2(40) not null,
    email   varchar2(40) not null,
    vivienda_id number(10,0) not null,
    longitud number(30, 15) not null,
    latitud number(30, 15) not null,
    direccion varchar2(100) not null,
    es_renta number(1,0) not null,
    es_vacacion number(1,0) not null,
    es_venta number(1,0) not null
) on commit preserve rows;

prompt ¡LISTO!
