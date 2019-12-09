--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--           César Mauricio Ramos Villaseñor
--@Fecha creación: 08/12/2019
--@Descripción: Creación de tablas (DDL) externas
--de la base de datos para el proyecto GlobalHome.

--ESTA TABLA CONTIENE AL ARCHIVO VIVIENDAS_OBSOLETAS.txt
--TODAS ESTAS VIVIENDAS FUERON ELIMINADAS DEL SISTEMA POR ALGUNA RAZON
create table vivienda_obsoleta (
    vivienda_id number(10,0),
    longitud number(30,15),
    latitud number(30,15),
    descripcion varchar2(40),
    causa_baja varchar2(200),
    fecha date
)
organization external (
    type oracle_loader 
    default directory multimedia 
    access parameters (
        records delimited by newline 
        badfile multimedia:'vivienda_obsoleta_bad.log'
        logfile multimedia:'vivienda_obsoleta.log'
        fields terminated by ','
        lrtrim
        missing field values are null (
            vivienda_id, longitud, latitud,
            descripcion, causa_baja, fecha date mask "dd/mm/yyyy"
        )
    )
    location ('vivienda_obsoleta.txt')
)
reject limit unlimited;

prompt ¡LISTO!