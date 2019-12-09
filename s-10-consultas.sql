--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Generación de consultas

--Consulta algebra relacional
prompt Viendas de tipo vacacion y renta pero que su cupo es mayor a 100
col direccion format a20
col descripcion format a20
select * from vivienda
where ES_VACACION = 1
union
select * from vivienda
where ES_RENTA = 1
minus
select * from vivienda
where capacidad < 100;

--Consulta que usa sinonimo
prompt LOS CLIENTES QUE NO HAN REGISTRADO VIVIENDAS SON:
col email format a20
col nombre_usuario format a20
select c.email, c.nombre_usuario from clientes c 
left join vivienda v
on c.usuario_id = v.usuario_id
where vivienda_id is null;

--Consulta que usa vista 
prompt PROMEDIO DE RENTA MENSUAL, MOSTRADO JUNTO A VIVIENDAS DE RENTA DISPONIBLES
select vd.*, (select avg(renta_mensual)
    from vivienda_renta) as promedio
from vivienda_disponible vd;

prompt REPORTE DE 
--Consulta que usa tabla temporal
prompt MOSTRAR EL CARRITO DEL CLIENE Y SUS MENSAJES JUNTO CON LOS SERVICIOS DE LA VIVIENDA
col contenido format a20
col nombre format a20
select i.nombre_usuario, i.email, i.longitud, i.latitud,
i.direccion, i.es_renta, i.es_venta, i.es_vacacion, 
m.contenido, m.visto, s.nombre 
from mensaje m 
join interesado i 
on m.usuario_id = i.usuario_id
join vivienda_servicio vs 
on i.vivienda_id = vs.vivienda_id 
join servicio s 
on vs.servicio_id = s.servicio_id;

--Consultas que usan tabla externa
prompt TOTAL DE VIVIENDAS OBSOLETA
select count(*) as numero_viviendas from vivienda_obsoleta;

prompt VIVIENDA MAS RECIENTE OBSOLETA POR DESCRIPCION
col causa_baja format a20
select causa_baja, max(fecha) from vivienda_obsoleta
group by causa_baja
order by causa_baja;
