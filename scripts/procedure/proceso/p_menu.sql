SET SERVEROUTPUT ON
create or replace procedure p_menu(opcion number)
 is
	
begin
	case opcion
		when 1 then
			dbms_output.put_line('Opcion 1');
		when 2 then
			dbms_output.put_line('Opcion 2');
		else
			dbms_output.put_line('Opcion invalida');
	end;
	
end;
/
