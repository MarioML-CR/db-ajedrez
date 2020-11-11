set serveroutput on
set verify OFF
declare
	coordenada fichas.id_ficha%type;
	pcoord1 coordenadas_tablero.coordenada%type;
begin
	pcoord1 := '&coordenada_posicion_inicial';
	coordenada := f_coord (pcoord1);
	if coordenada < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('coordenada invalida');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('coordenada: '||coordenada);
	end if;
exception
	when VALUE_ERROR then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Excede el numero de caracteres permitidos');
	when NO_DATA_FOUND then
			-- coordenada invalida
			dbms_output.put_line('insert');
end;
/