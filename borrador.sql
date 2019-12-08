prompt CONTRASEÑA SYSTEM:
connect sys as sysdba;

prompt BORRANDO...
drop user kgr_proy_invitado cascade;
drop user kgr_proy_admin cascade;
drop role rol_admin;
drop role rol_invitado;
drop directory multimedia;

prompt ¡LISTO!
disconnect;