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
				select id_ficha
				into idFicha2
				from estado_partidas
				where id_partida = partida and id_cord_tab = coordenada2;
				dbms_output.put_line('idficha2 '||idFicha2);
				mueven := f_mueve;
				dbms_output.put_line('mueven '||mueven);
				if mueven = 'Blancas' then
					if idFicha2 in (7,8,9,10,11,12) then
						dbms_output.put_line(chr(13));
						dbms_output.put_line('mover validando y captura de pieza negra');
					elsif idFicha2 is null then
						dbms_output.put_line(chr(13));
						dbms_output.put_line('mover validando sin captura de pieza negra');
					else
						dbms_output.put_line(chr(13));
						dbms_output.put_line('No puede mover es ficha propia');
					end if;
				elsif mueven = 'Negras' then
					if idFicha2 in (1,2,3,4,5,6) then
						dbms_output.put_line(chr(13));
						dbms_output.put_line('mover validando y captura de pieza blanca');
					elsif idFicha2 is null then
						dbms_output.put_line(chr(13));
						dbms_output.put_line('mover validando sin captura de pieza blanca');
					else
						dbms_output.put_line(chr(13));
						dbms_output.put_line('No puede mover es ficha propia');
					end if;
				else
					dbms_output.put_line(chr(13));
					dbms_output.put_line('No se ha inicializado ninguna partiada...');
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