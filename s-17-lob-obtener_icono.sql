--@Autor(es): Carolina Kennedy Villa
--            Ricardo Garcia Garcia
--            César Mauricio Ramos Villaseñor
--@Fecha creación: 06/12/2019
--@Descripción: Obtener la imagen de la BD
set serveroutput on
declare 
    v_blob blob;
    v_imagen UTL_FILE.FILE_TYPE;
    v_offset number:=1;                                                     --Intervalo de bloques
    
begin 
    select icono into v_blob from servicio where nombre='SPA';
    v_imagen := UTL_FILE.FOPEN('MULTIMEDIA','recupera.png','WB',32767);     --32K
    loop 
        exit when v_offset>DBMS_LOB.GETLENGTH(v_blob);
        UTL_FILE.PUT_RAW(v_imagen,DBMS_LOB.SUBSTR(v_blob,32767,v_offset));
        v_offset:=v_offset+32767; 
    end loop;
    UTL_FILE.FCLOSE(v_imagen);                                              --Cuando se cierra, se obtiene la nueva imagen
END;