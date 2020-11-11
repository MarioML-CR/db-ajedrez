set serveroutput on
set verify OFF
declare
	nMovimientos number;
begin
	nMovimientos := f_n_mov;
	if nMovimientos < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Aun no se han creado partidas');
	else
		dbms_output.put_line('Mueven: '||nMovimientos);
	end if;
end;
/
