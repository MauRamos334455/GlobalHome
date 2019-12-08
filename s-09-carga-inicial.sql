--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--            César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Creación de datos (DML)
--de la base de datos para el proyecto GlobalHome.

prompt DATOS DE USUARIOS...
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'rjeppensen0@free.fr', 'rjeppensen0', 'Ripley', 'Kinder', 'Jeppensen', '4Vlskn19T');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'gswains1@businessweek.com', 'gswains1', 'Germana', 'Sey', 'Swains', 'EJfxxq09');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'nfrizell2@i2i.jp', 'nfrizell2', 'Netti', 'Tavener', 'Frizell', 'vtSk9fhn5F');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'mburgen3@gizmodo.com', 'mburgen3', 'Malanie', 'Crowdson', 'Burgen', 'pSO0tbYW09eV');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'sbienvenu4@amazon.co.jp', 'sbienvenu4', 'Shelley', 'Levins', 'Bienvenu', 'QdLib5bTNM');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'nsanchiz5@yandex.ru', 'nsanchiz5', 'Noami', 'McGeagh', 'Sanchiz', 'dEIr4kX51lRX');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'dlait6@woothemes.com', 'dlait6', 'Dick', 'Rois', 'Lait', 'u5tCvey5qHDl');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'cridgley7@reddit.com', 'cridgley7', 'Casey', 'Drinkwater', 'Ridgley', 'ZoYJZUovy0');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'rgenese8@unesco.org', 'rgenese8', 'Rey', 'O''Neal', 'Genese', 'i46JRaxsMwAr');
insert into usuario (usuario_id, email, nombre_usuario, nombre, apellido_paterno, apellido_materno, contrasenia) values (usuario_seq.nextval, 'kbrailsford9@walmart.com', 'kbrailsford9', 'Kerk', 'Bouldon', 'Brailsford', '8iFB1lup');

prompt DATOS STATUS_VIVIENDA
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'DISPONIBLE', 'La vivienda se encuntra disponible para rentarse o alquilarse');
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'EN RENTA', 'La vivienda se encuntra rentada por alguien');
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'ALQUILADA', 'La vivienda se encuntra alquilada por alguien');
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'EN VENTA', 'La vivienda se encuentra en disponible para venta');
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'VENDIDA', 'La vivienda fue vendida a alguien');
insert into status_vivienda (status_vivienda_id, clave, descripcion) values (status_vivienda_seq.nextval, 'INACTIVA', 'La vivienda no se encuentra más disponible');

prompt DATOS DE VIVIENDA...
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 11.4865869, 58.3786073, '75099 Rieder Terrace', 150, 'Casa diseñada para maxima comodidad', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 2);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 23.5966577, -6.1306709, '51 Sutherland Drive', 100, 'Oasis para pasarla bien', to_date('05/12/2019', 'dd/mm/yyyy'), 0, 1, 0, 3);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 20.7487901, 42.4090329, '306 Porter Way', 30, 'La mejor casa del universo', to_date('01/01/2019', 'dd/mm/yyyy'), 1, 1, 0, 2);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 119.549776, 26.489558, '7554 Ronald Regan Place', 2, 'Pequeño apartamento en venta', to_date('05/10/2019', 'dd/mm/yyyy'), 0, 0, 1, 4);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -0.7117137, 6.6058668, '83499 Hagan Point', 3, 'Vecinos amigables', to_date('05/12/2019', 'dd/mm/yyyy'), 0, 0, 1, 6);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -8.4270764, 40.1628977, '946 Pankratz Way', 15, 'Siempre querras estar aqui', to_date('05/12/2019', 'dd/mm/yyyy'), 1, 1, 0, 3);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 48.3896404, 40.5742298, '11069 Carberry Terrace', 20, 'Casa roja de cinco pisos y dos baños', to_date('27/06/2019', 'dd/mm/yyyy'), 0, 0, 1, 5);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 153.5799639, 5.5775857, '184 Dayton Parkway', 5, 'Casa para familia de cinco personas', to_date('07/12/2019', 'dd/mm/yyyy'), 1, 0, 0, 1);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 123.8401962, 9.7457208, '1857 Hayes Parkway', 5, 'El mejor hogar de la galaxia', to_date('07/06/2018', 'dd/mm/yyyy'), 0, 0, 1, 5);
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -85.1872878, 42.319384, '59 Menomonie Street', 182, 'Diseñada para fiestas extravagantes', to_date('07/12/2019', 'dd/mm/yyyy'), 0, 1, 0, 1);

prompt DATOS DE VIVIENDA_RENTA
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (1, 39012.191, 25);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (3, 31192.188, 23);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (6, 43113.717, 3);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (8, 48059.376, 6);

prompt DATOS DE VIVIENDA_VENTA
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (4, 50365050493, '200ESNS601DYEF1796', bfilename('multimedia','prueba.pdf'), 538711532.625);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (5, 28152434168, '391QUFG723PDKB7149', bfilename('multimedia','prueba.pdf'), 273179743.768);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (7, 93119056300, '312IEQV053EIUY1865', bfilename('multimedia','prueba.pdf'), 98027280.254);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (9, 25263765175, '698UWLV392BELJ1738', bfilename('multimedia','prueba.pdf'), 811009399.687);

prompt DATOS DE VIVIENDA_VACACION
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (1, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 1868.18, 2);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (2, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 8161.18, 3);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (3, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 1398.75, 5);
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (6, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 2759.4, 10;
insert into vivienda_vacacion (vivienda_id, fecha_inicio, fecha_fin, precio_dia, numero_dias) values (10, to_date('07/12/2019', 'dd/mm/yyyy'), to_date('07/12/2020', 'dd/mm/yyyy'), 8992.98, 2);

prompt DATOS CONTRATO
insert into contrato (contrato_id, folio, fecha_contrato, clausula_firmas, vivienda_id, usuario_id) values (contrato_seq.nextval, '5004SNZ601TYEF1796', to_date('05/12/2019', 'dd/mm/yyyy'), bfilename('multimedia','prueba.pdf'), 1, 1);
insert into contrato (contrato_id, folio, fecha_contrato, clausula_firmas, vivienda_id, usuario_id) values (contrato_seq.nextval, '7005UNZ601TY4F1796', to_date('05/12/2019', 'dd/mm/yyyy'), bfilename('multimedia','prueba.pdf'), 3, 2);

prompt DATOS ALQUILER
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '0005UYZ601TY4F17934', to_date('15/12/2019', 'dd/mm/yyyy'), to_date('01/01/2020', 'dd/mm/yyyy'), 4, 2);
insert into alquiler (alquiler_id, folio, fecha_inicio, fecha_fin, precio_total, usuario_id, vivienda_id) values (alquiler_seq.nextval, '2305UT8U01TY4F14934', to_date('17/12/2019', 'dd/mm/yyyy'), to_date('03/02/2020', 'dd/mm/yyyy'), 5, 6);

prompt DATOS TRANSACCION
insert into transaccion (transaccion_id, comision, clave_interbancaria, usuario_id, vivienda_id) values(transaccion_seq.nextval, 110.99,923476590123674857,10,7);
insert into transaccion (transaccion_id, comision, clave_interbancaria, usuario_id, vivienda_id) values(transaccion_seq.nextval, 110.99,995466598193174857,9,9);

prompt DATOS IMAGEN
insert into imagen (vivienda_id, numero, contenido) values (1, 1, bfilename('multimedia','imagen1.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (1, 2, bfilename('multimedia','imagen2.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (1, 3, bfilename('multimedia','imagen3.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (2, 1, bfilename('multimedia','imagen4.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (2, 2, bfilename('multimedia','imagen5.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (2, 3, bfilename('multimedia','imagen6.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (3, 1, bfilename('multimedia','imagen1.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (4, 1, bfilename('multimedia','imagen2.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (5, 1, bfilename('multimedia','imagen3.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (6, 1, bfilename('multimedia','imagen4.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (7, 1, bfilename('multimedia','imagen4.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (8, 1, bfilename('multimedia','imagen4.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (9, 1, bfilename('multimedia','imagen4.jpeg'));
insert into imagen (vivienda_id, numero, contenido) values (10, 1, bfilename('multimedia','imagen4.jpeg'));

prompt DATOS CLABE
insert into clabe (clabe_id, clabe, vivienda_id) values (clabe_seq.nextval, 123456789101213142, 8);
insert into clabe (clabe_id, clabe, vivienda_id) values (clabe_seq.nextval, 321456789101213142, 8);
insert into clabe (clabe_id, clabe, vivienda_id) values (clabe_seq.nextval, 312456789101213142, 3);
insert into clabe (clabe_id, clabe, vivienda_id) values (clabe_seq.nextval, 411456789101213142, 6);
insert into clabe (clabe_id, clabe, vivienda_id) values (clabe_seq.nextval, 123456789101213142, 1);

prompt DATOS NOTIFICACION
insert into notificacion (notificacion_id, numero_celular, enviado, usuario_id, vivienda_id) values (notificacion_seq.nextval, 5512345678,0,7,10);
insert into notificacion (notificacion_id, numero_celular, enviado, usuario_id, vivienda_id) values (notificacion_seq.nextval, 5524436587,1,5,10);

prompt DATOS MENSAJE
insert into mensaje (mensaje_id, contenido, visto, respuesta_id, usuario_id, vivienda_id) values (mensaje_seq.nextval, 'me interesa la casa, cuanto cuesta', 0, null,  8, 8);
insert into mensaje (mensaje_id, contenido, visto, respuesta_id, usuario_id, vivienda_id) values (mensaje_seq.nextval, 'necesito informes', 1, 3, 5, 2);
insert into mensaje (mensaje_id, contenido, visto, respuesta_id, usuario_id, vivienda_id) values (mensaje_seq.nextval, 'te paso mi numero para los informes 5534567709', 0, null,  10, 2);

prompt DATOS TARJETA_CREDITO
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 5204165313218765, 1, 20, 2);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 2094351172086681, 7, 23, 8);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 5402195718238460, 10, 24, 6);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 1304925446210725, 3, 27, 3);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 6328156332410233, 12, 23, 1);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 2884567012146583, 8, 25, 5);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 0954287650412347, 2, 24, 7);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 7613147249572810, 7, 26, 4);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 1234235609725183, 5, 21, 9);
insert into tarjeta_credito (tarjeta_credito_id, numero_tarjeta, mes_expiracion, anio_expiracion, usuario_id) values (tarjeta_credito_seq.nextval, 8423065138913307, 11, 22, 10);

prompt DATOS SERVICIO
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'GIMNASIO','Gimnasio incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'WIFI','Internet incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'ALBERCA','Alberca incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'SPA','Spa de belleza incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'ESTACIONAMIENTO','Lugar de estacionamiento incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'TELEVISION','Television incluida en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'AIRE ACONDICIONADO','Aire acondicionado incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'REFRIGERADOR','Refrigerador incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'BAÑO','Baño completo incluido en la vivienda', bfilename('multimedia','imagen.png'));
insert into servicio (servicio_id, nombre, descripcion, icono blob) values (servicio_seq.nextval, 'PATIO','Patio incluido en la vivienda', bfilename('multimedia','imagen.png'));

prompt DATOS VIVIENDA_SERVICIO
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 1, 1);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 2, 1);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 3, 2);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 4, 2);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 5, 2);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 1, 3);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 4, 5);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 9, 6);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 10, 7);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 1, 8);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 3, 9);
insert into vivienda_servicio (vivienda_servicio_id, servicio_id, vivienda_id) values (vivienda_servicio_seq.nextval, 4, 10);

prompt DATOS HISTORICO_VIVIENDA
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('03/12/2019', 'dd/mm/yyyy'), 1, 4);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/12/2019', 'dd/mm/yyyy'), 1, 5);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('01/11/2019', 'dd/mm/yyyy'), 2, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/12/2019', 'dd/mm/yyyy'), 2, 3);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('01/01/2019', 'dd/mm/yyyy'), 3, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/12/2019', 'dd/mm/yyyy'), 3, 2);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/10/2019', 'dd/mm/yyyy'), 4, 4);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/02/2018', 'dd/mm/yyyy'), 5, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/12/2019', 'dd/mm/yyyy'), 5, 6);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/2/2018', 'dd/mm/yyyy'), 6, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('05/12/2019', 'dd/mm/yyyy'), 6, 3);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('27/01/2018', 'dd/mm/yyyy'), 7, 4);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('27/06/2019', 'dd/mm/yyyy'), 7, 5);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('07/12/2019', 'dd/mm/yyyy'), 8, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('07/12/2016', 'dd/mm/yyyy'), 9, 1);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('07/12/2017', 'dd/mm/yyyy'), 9, 4);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('07/06/2018', 'dd/mm/yyyy'), 9, 5);
insert into historico_vivienda (historico_vivienda_id, fecha_status, vivienda_id, status_vivienda_id) values (historico_vivienda_seq.nextval, to_date('07/12/2019', 'dd/mm/yyyy'), 10, 1);


prompt DATOS MENSUALIDAD
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (1,1,to_date('01/08/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (1,2,to_date('01/09/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (1,3,to_date('01/10/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (1,4,to_date('01/11/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (1,5,sysdate,500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (2,1,to_date('01/08/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (2,2,to_date('01/09/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (2,3,to_date('01/10/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (2,4,to_date('01/11/2019','dd/mm/yyyy'),500, bfilename('multimedia','prueba.pdf'));
insert into mensualidad (transaccion_id, numero_pago, fecha_pago, importe, evidencia) values (2,5,sysdate,500, bfilename('multimedia','prueba.pdf'));
