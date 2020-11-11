set serveroutput on
set verify OFF
declare
	nombre jugadores.nickname%type := '';
	registrado number;
begin
	nombre := upper('&nombre_jug');
	dbms_output.put_line('nombre '||nombre);
	registrado := f_existe_nickname (nombre);
	dbms_output.put_line('registrado '||registrado);
	if registrado = 1 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Jugador existe');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Jugador no existe...');
	end if;
exception
	when VALUE_ERROR then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Excede el numero de caracteres permitidos');
	when NO_DATA_FOUND then
			-- coordenada invalida
			dbms_output.put_line('Error Oracle '||SQLCODE);
end;
/