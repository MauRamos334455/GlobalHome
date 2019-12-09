--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--            César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Insertar icono en la BD
set serveroutput on

declare 
    v_blob blob;
    v_bfile bfile; 
    
begin 
    insert into servicio(servicio_id, nombre, descripcion,icono) 
    values(11,'LAVADO','Cuenta con lavadora y secadora',empty_blob()) returning icono into v_blob;
    v_bfile:=BFILENAME('MULTIMEDIA','lavado.png');
    DBMS_LOB.OPEN(v_bfile, DBMS_LOB.LOB_READONLY); 
    DBMS_LOB.LOADFROMFILE(v_blob,v_bfile, sys.dbms_lob.getlength(v_bfile)); 
    DBMS_LOB.CLOSE(v_bfile); 
    COMMIT;
end;
