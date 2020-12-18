/*
función que recibe un parametro, la coordenada del movimiento inicial y final.
Si el parametro ingresado no es correcto retorna alguno de los siguientes numeros {-1, -2, -3} segun corresponda.
*/
create or replace function f_mov (pcoord1 char, pcoord2 char)
return number is
	coordenada1 coordenadas_tablero.id_cord_tab%type;
	coordenada2 coordenadas_tablero.id_cord_tab%type;
	idFicha1 fichas.id_ficha%type;
	idFicha2 fichas.id_ficha%type;
	partida partida_activa.id_partida%type;
begin
	coordenada1 := f_coord (pcoord1);
	coordenada2 := f_coord (pcoord2);
	if coordenada1 < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('coordenada invalida');
	else
		partida := f_partida_activa;
		if partida < 0 then
			dbms_output.put_line(chr(13));
			dbms_output.put_line('Aun no se ha creado una partida');
		else
			idFicha1 := f_id_ficha (coordenada1);
			if idFicha1 < 0 then
				dbms_output.put_line(chr(13));
				dbms_output.put_line('Coordenada invalida');
			else
				select id_ficha
				into idFicha2
				from estado_partidas
				where id_partida = partida and id_coord_tab = coordenada2;
				if idFicha2 in (1,2,3,4,5,6) then
					dbms_output.put_line(chr(13));
					dbms_output.put_line('mover validando y captura');
				elsif idFicha2 is null then
					dbms_output.put_line(chr(13));
					dbms_output.put_line('mover validando sin captura');
				else
					dbms_output.put_line(chr(13));
					dbms_output.put_line('No puede mover es ficha propia');
				end if;
				dbms_output.put_line(chr(13));
				dbms_output.put_line('idFicha: '||idFicha);
			end if;
		end if;
		
	end if;
	
exception
	when NO_DATA_FOUND then
		-- coordenada invalida
		coordenada := -1;
	when VALUE_ERROR then
		-- Excede el numero de caracteres permitidos
		coordenada := -2;
	when OTHERS then
		coordenada := SQLCODE;
	return coordenada;
end;
/