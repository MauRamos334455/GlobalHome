--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--            César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Insertar icono en la BD
set serveroutput on
--guardar en la tabla
declare 
    v_blob blob;
    v_bfile bfile; --tipo de dato que almacena contenido multimedia pero gurdados en el sistema operativo...
    
begin 
    insert into servicio(servicio_id, nombre, descripcion,icono) 
    values(11,'LAVADO','Cuenta con lavadora y secadora',empty_blob()) returning icono into v_blob;
    v_bfile:=BFILENAME('MULTIMEDIA','lavado.png');
    DBMS_LOB.OPEN(v_bfile, DBMS_LOB.LOB_READONLY); --abrir imagen como un archivo y alojarlo en esta variable
    DBMS_LOB.LOADFROMFILE(v_blob,v_bfile, sys.dbms_lob.getlength(v_bfile)); --cargar esta imagen en el tipo de dato blob vbfile--v_blob... actualiza el registro del inicio
    DBMS_LOB.CLOSE(v_bfile); --objeto binario y se guarda en la tabla.
    COMMIT;
end;
