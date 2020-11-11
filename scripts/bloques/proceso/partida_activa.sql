/*
Programa que actualiza la partida activa en los casos que el usuario no cree una partida, sino que ingrese directo a elegir la partida.
*/
SET SERVEROUTPUT ON
set verify OFF
declare
	partida partida_activa.id_partida%type;
begin
	partida := f_partida_activa;
	dbms_output.put_line('partida activa: '||partida);
end;
/