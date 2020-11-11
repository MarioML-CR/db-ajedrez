/*
Carga de movimientos
Condiciones que debe cumplir:

*/
set serveroutput on
set verify OFF
declare
	coordenada1 fichas.id_ficha%type := 0;
	coordenada2 fichas.id_ficha%type := 0;	
	pcoord1 coordenadas_tablero.coordenada%type;
	pcoord2 coordenadas_tablero.coordenada%type;
	idFicha fichas.id_ficha%type;
	nPartida partidas.id_partida%type;
	dumi varchar2(100);
begin
	-- fila y columna de la coordenada pasada por parametro
	pcoord1 := '&coordenada_posicion_inicial';
	pcoord2 := '&coordenada_posicion_final';
	dumi := '&partida';
	nPartida := coalesce(cast(dumi as number),-999);
	if nPartida = -999 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('El valor no puede ser nulo, debe ingresar un valor...');
	else
		dbms_output.put_line(chr(13));
		coordenada1 := f_coord (pcoord1);
		coordenada2 := f_coord (pcoord2);
		-- mensaje al usuario
		if coordenada1 = -1 then
			dbms_output.put_line('Coordenada invalida');
		else
		  
		end if;
		idFicha := f_id_fichas (1, 1);
		dbms_output.put_line('resulatado coord 1: '||coordenada1);
		dbms_output.put_line('resulatado coord 2: '||coordenada2);
		dbms_output.put_line('resulatado id_ficha: '||idFicha);
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