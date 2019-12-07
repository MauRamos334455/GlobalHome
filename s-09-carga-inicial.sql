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

prompt DATOS DE VIVIENDA...
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 11.4865869, 58.3786073, '75099 Rieder Terrace', 150, 'Casa diseñada para maxima comodidad', sysdate, 1, 1, 0, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 23.5966577, -6.1306709, '51 Sutherland Drive', 100, 'Oasis para pasarla bien', sysdate, 0, 1, 0, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 20.7487901, 42.4090329, '306 Porter Way', 30, 'La mejor casa del universo', sysdate, 1, 1, 0, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 119.549776, 26.489558, '7554 Ronald Regan Place', 2, 'Pequeño apartamento en venta', sysdate, 0, 0, 1, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -0.7117137, 6.6058668, '83499 Hagan Point', 3, 'Vecinos amigables', sysdate, 0, 0, 1, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -8.4270764, 40.1628977, '946 Pankratz Way', 15, 'Siempre querras estar aqui', sysdate, 1, 1, 0, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 48.3896404, 40.5742298, '11069 Carberry Terrace', 20, 'Casa roja de cinco pisos y dos baños', sysdate, 0, 0, 1, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 153.5799639, 5.5775857, '184 Dayton Parkway', 5, 'Casa para familia de cinco personas', sysdate, 1, 0, 0, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, 123.8401962, 9.7457208, '1857 Hayes Parkway', 5, 'El mejor hogar de la galaxia', sysdate, 0, 0, 1, 'valor de status');
insert into vivienda (vivienda_id, longitud, latitud, direccion, capacidad, descripcion, fecha_status, es_renta, es_vacacion, es_venta, status_vivienda_id) values (vivienda_seq.nextval, -85.1872878, 42.319384, '59 Menomonie Street', 182, 'Diseñada para fiestas extravagantes', sysdate, 0, 1, 0, 'valor de status');

prompt DATOS DE VIVIENDA_RENTA
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (1, 39012.191, 25);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (3, 31192.188, 23);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (6, 43113.717, 3);
insert into vivienda_renta (vivienda_id, renta_mensual, dia_deposito) values (8, 48059.376, 6);


prompt DATOS DE VIVIENDA_VACACION
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (4, 50365050493, '200ESNS601DYEF1796', null, 538711532.625);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (5, 28152434168, '391QUFG723PDKB7149', null, 273179743.768);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (7, 93119056300, '312IEQV053EIUY1865', null, 98027280.254);
insert into vivienda_venta (vivienda_id, numero_catastral, folio, avaluo, precio_inicial) values (9, 25263765175, '698UWLV392BELJ1738', null, 811009399.687);

prompt DATOS DE VIVIENDA_VENTA
