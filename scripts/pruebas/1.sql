SET SERVEROUTPUT ON
set verify OFF
declare
	nuevo varchar2(20) := 'Nueva partida';
	continuar varchar2(20) := 'Continuar partida';
begin
	dbms_output.put_line(chr(13));
	dbms_output.put_line('.'||lpad('Menu',22, ' '));
	dbms_output.put_line('Ingrese el numero de la opcion que desea');
	dbms_output.put_line('________________________________________');
	dbms_output.put_line('1. '||lpad(nuevo, 37, ' '));
	dbms_output.put_line('2. '||lpad(continuar, 37, ' '));
end;
/
--start 2