--Consulta algebra relacional


--Consulta que usa sinonimo
prompt LOS CLIENTES QUE NO HAN REGISTRADO VIVIENDAS SON:
select * from clientes c 
left join vivienda v
where vivienda_id is null;
--Consulta que usa vista 

--Consulta que usa tabla temporal

--Consulta que usa tabla externa