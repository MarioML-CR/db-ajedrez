SET SERVEROUTPUT ON
set verify OFF
declare
	opcion number;
	dumi varchar2(100);
begin
	dumi := '&partida';
	opcion := coalesce(cast(dumi as number),-999);
	if opcion = -999 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('El valor no puede ser nulo, debe ingresar un valor...');
	else
		if opcion = 1 then
			start viewTablero
		else
			dbms_output.put_line('quieto en primera');
		end if;
	end if;
exception
	when VALUE_ERROR then
			-- Excede el numero de caracteres permitidos
			coordenada1 := -2;
			dbms_output.put_line('Excede el numero de caracteres permitidos '||coordenada1);
	when OTHERS then
		coordenada1 := -3;
		dbms_output.put_line('ficha: '||coordenada1||' codigo '||SQLCODE);
end;
/

