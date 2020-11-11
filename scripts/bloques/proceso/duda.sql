SET SERVEROUTPUT ON
set verify OFF
declare
	vnombre jugadores.nickname%type;
	nombre jugadores.nickname%type;
begin
	nombre := upper('&nombre_jugador');
	dbms_output.put_line('largo '||length(nombre));
	dbms_output.put_line('nombre '||nombre);
	if length(nombre) > 0 then
		select
		nickname
		into vnombre
		from jugadores
		where nickname = nombre;
		dbms_output.put_line('resultado 1: '||vnombre);
	else
	  dbms_output.put_line('resultado 2: '||length(nombre));
	end if;
end;
/
