/*
Ingreso de movimientos
*/
SET SERVEROUTPUT ON
set verify OFF
declare
	vPos_ini coordenadas_tablero.id_cord_tab%type;
	vPos_final coordenadas_tablero.id_cord_tab%type;
	vcoord1 coordenadas_tablero.coordenada%type;
	vcoord2 coordenadas_tablero.coordenada%type;
	partida partidas.id_partida%type;
	null_value exception;
	pragma exception_init(null_value, -1400);
	partidaNoExiste   exception;
	pragma exception_init(jugadorNoExiste  , -02291);
begin
	vcoord1 := '&posicion_inicial';
	vcoord2 := '&posicion_inicial';
	partida := &numero_partida;
	vPos_ini := f_coord(vcoord1, partida);
	-- si la posicion inicial ingresada no existe
	if vPos_ini > 0 then
		dbms_output.put_line('se ingreso correcto '||vPos_ini);
	else
		dbms_output.put_line('La casilla ingresada es incorrecta');
	end if;
EXCEPTION
	when null_value then
		DBMS_OUTPUT.PUT_LINE('Debe ingresar el nickname de cada jugador, igual como se ingreso al crearlo ');
	when partidaNoExiste   then
		DBMS_OUTPUT.PUT_LINE('Uno o ambos jugadores no han sido creados');
	when others then
		DBMS_OUTPUT.PUT_LINE('Error de Oracle: '||SQLCODE||' detalle: '||SQLERRM );

end;
/