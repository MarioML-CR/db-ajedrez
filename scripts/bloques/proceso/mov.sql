/*
Ingreso de movimientos
*/
SET SERVEROUTPUT ON
set verify OFF
declare
	pcoord1 coordenadas_tablero.coordenada%type;
	pcoord2 coordenadas_tablero.coordenada%type;
	coordenada1 coordenadas_tablero.id_cord_tab%type;
	coordenada2 coordenadas_tablero.id_cord_tab%type;
	mueven varchar2(9);
	idFicha1 fichas.id_ficha%type;
	idFicha2 fichas.id_ficha%type;
	partida partida_activa.id_partida%type;
	validar number(2);
	nombreFicha fichas.nombre%type;
begin
	pcoord1 := '&coordenada1';
	pcoord2 := '&coordenada1';	
	coordenada1 := f_coord (pcoord1);
	coordenada2 := f_coord (pcoord2);
	dbms_output.put_line('coordenada1 '||coordenada1);
	dbms_output.put_line('coordenada2 '||coordenada2);
	if coordenada1 < 0 then
		dbms_output.put_line(chr(13));
		dbms_output.put_line('coordenada invalida');
	else
		partida := f_partida_activa;
		dbms_output.put_line('f_partida_activa '||f_partida_activa);
		if partida < 0 then
			dbms_output.put_line(chr(13));
			dbms_output.put_line('Aun no se ha creado una partida');
		else
			idFicha1 := f_id_ficha (coordenada1);
			dbms_output.put_line('idFicha1 '||idFicha1);
			if idFicha1 < 0 then
				dbms_output.put_line(chr(13));
				dbms_output.put_line('Coordenada invalida');
			else
				-- se carga el id_ficha de la posicion final
				select id_ficha
				into idFicha2
				from estado_partidas
				where id_partida = partida and id_cord_tab = coordenada2;
				dbms_output.put_line('idficha2 '||idFicha2);
				-- se carga el color de la ficha que mueve
				mueven := f_mueve;
				dbms_output.put_line('mueven '||mueven);
				-- se carga el nombre de la ficha que va a mover
				nombreFicha := f_nombre_ficha(idFicha1);
				if mueven = 'Blancas' and idFicha2 in (1,2,3,4,5,6) then
					dbms_output.put_line(chr(13));
					dbms_output.put_line('La coordenada '||pcoord1||' contiene la ficha '||nombreFicha||' blanca');
				elsif mueven = 'Negras' and idFicha2 in (7,8,9,10,11,12) then
					dbms_output.put_line(chr(13));
					dbms_output.put_line('La coordenada '||pcoord1||' contiene la ficha '||nombreFicha||' negra');
				else
					validar := f_validar(coordenada1, coordenada2, idFicha1, mueven);
					if validar <> 1 then
						dbms_output.put_line(chr(13));
						dbms_output.put_line('El movimiento que intenta hacer de la pieza '||nombreFicha||' no es permitido');
					else
						-- Se realizan lo update en las tablas movimientos, estado partidas
						dbms_output.put_line('update tabla estado_partida agregando la pieza blanca');
						dbms_output.put_line('insert en tabla movimientos');
						commit;
						--if mueven = 'Blancas' then
							--if idFicha2 in (7,8,9,10,11,12) then
								--dbms_output.put_line(chr(13));
								--dbms_output.put_line('mover validando y captura de pieza negra');
							--else
								--dbms_output.put_line(chr(13));
								--dbms_output.put_line('mover validando sin captura de pieza negra');
							--end if;
						--else
							--if idFicha2 in (1,2,3,4,5,6) then
								--dbms_output.put_line(chr(13));
								--dbms_output.put_line('mover validando y captura de pieza blanca');
							--else
								--dbms_output.put_line(chr(13));
								--dbms_output.put_line('mover validando sin captura de pieza blanca');
							--end if;
						--end if;
					end if;
				end if;
			end if;
		end if;
		
	end if;
	
exception
	when NO_DATA_FOUND then
		-- coordenada invalida
		dbms_output.put_line('coordenada invalida');
		--coordenada := -1;
	when VALUE_ERROR then
		-- Excede el numero de caracteres permitidos
		dbms_output.put_line('Excede el numero de caracteres permitidos');
		--coordenada := -2;
	when OTHERS then
		dbms_output.put_line('Error '||SQLCODE|| ' detalle '||SQLERRM);
		--coordenada := SQLCODE;
	--return coordenada;
end;
/