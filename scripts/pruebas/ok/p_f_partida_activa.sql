set serveroutput on
set verify OFF
declare
	partida partida_activa.id_partida%type;
begin
	partida := f_partida_activa;
	if partida < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Aun no se ha creado una partida');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('partida: '||partida);
	end if;
end;
/
