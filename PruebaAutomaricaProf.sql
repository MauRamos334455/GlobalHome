1 PROCEDURE spv_valida_creacion_inmueble IS
2
3   CURSOR CUR_INMUEBLE_RENTA(P_INMUEBLE_ID NUMBER) IS
4     SELECT I.INMUEBLE_ID,I.DIRECCION,I.LATITUD,I.LONGITUD,I.TIPO_INMUEBLE,
5       I.FOTO,I.CLIENTE_ID,I.STATUS_INMUEBLE_ID,RI.DIA_PAGO,
6       RI.RENTA_MENSUAL,RI.INTERES_MENSUAL
7     FROM INMUEBLE I
8     LEFT JOIN RENTA_INMUEBLE RI
9     ON I.INMUEBLE_ID = RI.INMUEBLE_ID
10     WHERE I.INMUEBLE_ID = P_INMUEBLE_ID;
11
12   CURSOR CUR_INMUEBLE_COMPRA(P_INMUEBLE_ID NUMBER) IS
13     SELECT I.INMUEBLE_ID,TIPO_INMUEBLE,CI.PRECIO_VENTA,CI.PLAZO,CI.TASA_INTERES
14     FROM INMUEBLE I
15     JOIN COMPRA_INMUEBLE CI
16     ON I.INMUEBLE_ID = CI.INMUEBLE_ID
17     WHERE I.INMUEBLE_ID = P_INMUEBLE_ID;
18
19
20   V_INMUEBLE_ID NUMBER;
21   V_COUNT NUMBER;
22
23 BEGIN
24
25
26   SP_CREA_INMUEBLE (
27     P_INMUEBLE_ID   => V_INMUEBLE_ID,
28     P_DIRECCION     => '0018 Maple Center',
29     P_LATITUD       => -6.80559,
30     P_LONGITUD      =>  110.76290,
31     P_TIPO          =>  'R',
32     P_DIA_PAGO      =>  15,
33     P_RENTA_MENSUAL =>   5600,
34     P_INTERES_MENSUAL => 10);
35
36
37   SPV_ASSERT(V_INMUEBLE_ID IS NOT NULL,'is not null',V_INMUEBLE_ID,
38     'El valor de salida para inmueble_id no fue inicializado');
39
40   FOR R IN CUR_INMUEBLE_RENTA(V_INMUEBLE_ID) LOOP
41
42     V_COUNT := 1;
43     SPV_ASSERT(R.DIRECCION='0018 Maple Center','0018 Maple Center',R.DIRECCION,
44       'Direccion invalida');
45     SPV_ASSERT(R.LATITUD=-6.80559,-6.80559,R.LATITUD,'Latitud inválida');
46     SPV_ASSERT(R.LONGITUD=110.76290,110.76290,R.LONGITUD,'Longitud inválida');
47     SPV_ASSERT(R.TIPO_INMUEBLE ='R','R',R.TIPO_INMUEBLE,'Tipo inmueble inválido');
48     SPV_ASSERT(R.FOTO IS NOT NULL,'null','not empty','Foto no fue incializada con blob_empty');
49     SPV_ASSERT(R.CLIENTE_ID IS NULL,'null',R.CLIENTE_ID,'Cliente id inválido');
50     SPV_ASSERT(R.STATUS_INMUEBLE_ID = 1,1,R.STATUS_INMUEBLE_ID,'status_inmueble_id inválido');
51     SPV_ASSERT(R.RENTA_MENSUAL=5600,5600,R.RENTA_MENSUAL,'Renta mensual es inválida');
52     SPV_ASSERT(R.INTERES_MENSUAL=10,10,R.INTERES_MENSUAL,' Interes mensual es inválido');
53
54     SPV_PRINT_OK('Registro en inmueble y su subtipo es valido, id '||V_INMUEBLE_ID);
55
56   END LOOP;
57
58   SPV_ASSERT(V_COUNT>0,1,V_COUNT,'No se encontró el registro del nuevo inmueble');
59
60
61   SELECT COUNT(*) INTO V_COUNT
62   FROM HISTORICO_STATUS_INMUEBLE WHERE INMUEBLE_ID = V_INMUEBLE_ID;
63
64   SPV_ASSERT(V_COUNT>0,1,V_COUNT,'Registro de inmueble no encontrado en historico. Id: '
65     ||V_INMUEBLE_ID);
66
67   SPV_PRINT_OK('Registro encontrado en historico con id '||V_INMUEBLE_ID);
68
69
70    SP_CREA_INMUEBLE (
71     P_INMUEBLE_ID   => V_INMUEBLE_ID,
72     P_DIRECCION     => '0018 Maple Center 2',
73     P_LATITUD       => -6.80559,
74     P_LONGITUD      =>  110.76290,
75     P_TIPO          =>  'C',
76     P_PRECIO_VENTA  =>  4895789,
77     P_PLAZO         =>   45,
78     P_TASA_INTERES  => 10);
79
80    SPV_ASSERT(V_INMUEBLE_ID IS NOT NULL,'is not null',V_INMUEBLE_ID,
81     'El valor de salida para inmueble_id no fue inicializado');
82
83   FOR R IN CUR_INMUEBLE_COMPRA(V_INMUEBLE_ID) LOOP
84
85     SPV_ASSERT(R.TIPO_INMUEBLE ='C','C',R.TIPO_INMUEBLE,'Tipo inmueble inválido');
86     SPV_ASSERT(R.PRECIO_VENTA=4895789,4895789,R.PRECIO_VENTA,'Precio venta es inválido');
87     SPV_ASSERT(R.PLAZO=45,45,R.PLAZO,'campo Plazo es invalido');
88     SPV_ASSERT(R.TASA_INTERES=10,10,R.TASA_INTERES,'Campo tasa_interes es inválida');
89     SPV_PRINT_OK('Registro en inmueble y su subtipo es valido, id '||V_INMUEBLE_ID);
90   END LOOP;
91
92
93   SELECT COUNT(*) INTO V_COUNT
94   FROM HISTORICO_STATUS_INMUEBLE WHERE INMUEBLE_ID = V_INMUEBLE_ID;
95
96   SPV_ASSERT(V_COUNT>0,1,V_COUNT,'Registro de inmueble no encontrado en historico. Id: '
97     ||V_INMUEBLE_ID);
98
99   SPV_PRINT_OK('Registro encontrado en historico con id '||V_INMUEBLE_ID);
100
101
102   BEGIN
103     SP_CREA_INMUEBLE (
104       P_INMUEBLE_ID   => V_INMUEBLE_ID,
105       P_DIRECCION     => '0018 Maple Center 2',
106       P_LATITUD       => -6.80559,
107       P_LONGITUD      =>  110.76290,
108       P_TIPO          =>  'R',
109       P_PRECIO_VENTA  =>  4895789,
110       P_PLAZO         =>   45,
111       P_TASA_INTERES  => 10);
112     SPV_THROW_ERROR('Se esperaba un error -20010 ya que se intenta insertar un'
113       ||' inmueble con tipo invertido. Id: '
114       ||V_INMUEBLE_ID);
115   EXCEPTION
116     WHEN OTHERS THEN
117       IF SQLCODE = -20010 THEN
118         SPV_PRINT_OK('Se generó error espperado -20010 al intentar insertar inmueble inválido');
119       ELSE
120         RAISE;
121       END IF;
122   END;
123
124
125   BEGIN
126    SP_CREA_INMUEBLE (
127       P_INMUEBLE_ID   => V_INMUEBLE_ID,
128       P_DIRECCION     => '0018 Maple Center',
129       P_LATITUD       => -6.80559,
130       P_LONGITUD      =>  110.76290,
131       P_TIPO          =>  'C',
132       P_DIA_PAGO      =>  15,
133       P_RENTA_MENSUAL =>   5600,
134       P_INTERES_MENSUAL => 10);
135     SPV_THROW_ERROR('Se esperaba un error -20010 ya que se intenta insertar un'
136       ||' inmueble con tipo invertido. Id: '
137       ||V_INMUEBLE_ID);
138   EXCEPTION
139     WHEN OTHERS THEN
140       IF SQLCODE = -20010 THEN
141         SPV_PRINT_OK('Se generó error espperado -20010 al intentar insertar inmueble inválido');
142       ELSE
143         RAISE;
144       END IF;
145   END;
146 END;
