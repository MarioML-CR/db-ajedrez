set serveroutput on
set verify OFF
declare
	idFicha fichas.id_ficha%type;
	coordenada fichas.id_ficha%type;
	partida partida_activa.id_partida%type;
	pcoord1 coordenadas_tablero.coordenada%type;
begin
	pcoord1 := '&coordenada1';
	coordenada := f_coord (pcoord1);
	if coordenada < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('coordenada invalida');
	else
		partida := f_partida_activa;
		idFicha := f_id_ficha (coordenada);
		if idFicha < 0 then
			dbms_output.put_line(chr(13));
			dbms_output.put_line('Coordenada invalida');
		else
			dbms_output.put_line(chr(13));
			dbms_output.put_line('idFicha: '||idFicha);
		end if;
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