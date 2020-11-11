set serveroutput on
set verify OFF
declare
	jugador varchar2(47);
	numJugador number;
begin
	numJugador := &Jugador_numero;
	jugador := f_full_name (numJugador);
	if jugador = 'NoExPar' then -- no existe partida
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Aun no existe partida...');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('jugador: '||jugador);
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