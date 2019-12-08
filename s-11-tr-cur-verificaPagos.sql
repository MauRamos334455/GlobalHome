--@Autores:
    --García García Ricardo
    --Kennedy Villa Carolina
    --Ramos Villaseñor César Mauricio
--@Fecha creación: 07/12/2019
--@Descripción: Creación del trigger que valida si ya debería cambair el status
--de una vivienda basandose en lo que se ha pagado de ella

Cada que se haga un nuevo pago de mensualidad verificar:

¿?
¿La vivienda es válida (Edo = EN VENTA)?

  Incerta el pago mensualida
  trae todos los pagos correspondientes a la trabnsacción_:id
  Recorre cada uano de los pagos..
    obten el valor de importe, ve sumandolo

  Al recorrer todos verifica:
    ¿? El importe total + comision es igual al pagado?
      En caso de ser así, actualiza edo vivienda
