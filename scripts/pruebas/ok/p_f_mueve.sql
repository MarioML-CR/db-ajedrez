set serveroutput on
set verify OFF
declare
	mueven varchar2(9);
begin
	mueven := f_mueve;
	dbms_output.put_line('mueven '||mueven);
	if mueven = 'NoExPar' then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Aun no se han creado partidas');
	else
		dbms_output.put_line(chr(13));
		dbms_output.put_line('Mueven: '||mueven);
	end if;
end;
/