--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Generación de consultas

prompt CONECTANDO...
connect kgr_proy_admin/carima

--Consulta algebra relacional
prompt TODAS LAS VIVIENDAS QUE TIENEN MENSUALIDADES EFECTUADAS
select * from vivienda 
minus 
select * from vivienda 
where ES_VACACION = 1 or ES_RENTA = 1
intersect
select * from transaccion
intersect 
select * from mensualidad;

--Consulta que usa sinonimo
prompt LOS CLIENTES QUE NO HAN REGISTRADO VIVIENDAS SON:
select c.email, c.nombre_usuario from clientes c 
left join vivienda v
on c.usuario_id = v.usuario_id
where vivienda_id is null;

--Consulta que usa vista 
prompt PROMEDIO DEL CUPO PARA VIVIENDAS DE RENTA DISPONIBLES POR RENTA MENSUAL Y PROMEDIO MAYOR A 100
select avg(cupo) as promedio 
from vivienda_disponible
group by renta_mensual
having avg(cupo)>100;

prompt REPORTE DE 
--Consulta que usa tabla temporal
prompt MOSTRAR EL CARRITO DEL CLIENE Y SUS MENSAJES JUNTO CON LOS SERVICIOS DE LA VIVIENDA
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

--Consulta que usa tabla externa
prompt TOTAL DE VIVIENDAS OBSOLETA
select count(*) as numero_viviendas from vivienda_obsoleta;

prompt VIVIENDA MAS RECIENTE OBSOLETA POR DESCRIPCION
select max(date) from (
    select * from vivienda_obsoleta
    group by descripcion
)
group by descripcion;

disconnect;