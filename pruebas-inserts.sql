--Usuario sin ningun alquiler
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (20, 'emalare3344@gmail', 'emaloco', 'Emanuel', 'Rodriguez', 'Castillo', '1q2w3e4r');

--Usuario con 6 alquileres donde la suma del precio total es <10000
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (21, 'josejose3344@gmail', 'elprincipe', 'Jose', 'Algo', 'Dealgo', 'otracuba123');

insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (35, 12.9466769, 59.3281073, '16893 Avenida Siempreviva', 100, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (36, 13.8565869, 57.3382072, '123 Canal de Chalco', 98, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (37, 14.7664869, 56.1783073, '139874 Polanco Alto', 23, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (38, 15.9861869, 55.3785071, '1234974 La Concepcion', 15, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (39, 16.5863869, 54.5488073, '987423 Atrabajar Seguido', 140, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id, usuario_id) values (40, 17.4862869, 28.6786073, '432344 Tendedero Suicida', 6, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3, 11);

insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (35, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (36, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (37, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (38, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (39, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (40, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 100, 2);

insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '9235ZTP611TY4F17934', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 35);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '1245SUP611TY4T17EF4', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 36);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '75353TR61VTY4FAT934', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 37);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '1335XTPG11HY4Y1U9P4', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 38);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '0234ZGBR1XTY4F17934', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 39);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, 'BN35ZVPS1HTY4F17934', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'),16734, 20, 40);

