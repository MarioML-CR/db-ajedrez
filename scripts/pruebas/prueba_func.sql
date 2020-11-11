
set serveroutput on
set verify OFF
declare
	ficha number;
	vcoordenada coordenadas_tablero.coordenada%type;
	color varchar2;
	pcoord char(2);
begin
	color := '&color';
	pcoord := '&coord'
	vcoordenada := f_coord(pcoord);
	ficha := f_val_ficha_a_mover(vcoordenada, color);
	dbms_output.put_line('ficha: '||ficha);
exception
		when NO_DATA_FOUND then
			-- coordenada invalida
			dbms_output.put_line('insert');
end;
/