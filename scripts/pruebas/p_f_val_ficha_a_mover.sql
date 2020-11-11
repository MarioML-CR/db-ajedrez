
set serveroutput on
set verify OFF
declare
	ficha number;
	coordenada fichas.id_ficha%type := 0;
	color varchar2(7);
	pcoord1 coordenadas_tablero.coordenada%type;
	--pcoord1 coordenadas_tablero.coordenada%type;
begin
	color := '&color';
	pcoord1 := '&coordenada_posicion_inicial';
	coordenada := f_coord (pcoord1);
	ficha := f_val_ficha_a_mover(coordenada, color);
	dbms_output.put_line('ficha: '||ficha);
exception
		when NO_DATA_FOUND then
			-- coordenada invalida
			dbms_output.put_line('insert');
end;
/