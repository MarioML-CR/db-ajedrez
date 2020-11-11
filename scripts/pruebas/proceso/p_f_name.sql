set serveroutput on
set verify OFF
declare
	nombre jugadores.nickname%type := '';
begin
	nombre := upper('&nombre_jug');
	nombre := f_existe_nickname (nombre);
	if nombre < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Jugador no existe');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Jugador existe ');
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