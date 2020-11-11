/*
función que valida la ficha que se va a mover según sea pieza blanca o negra.
*/
create or replace function f_val_ficha_a_mover (coord number, color varchar2)
return number is
	ficha fichas.id_ficha%type;
begin
	begin
		if color = 'Blanca' then
			select id_ficha
			into ficha
			from estado_partidas
			where id_ficha in (select id_ficha 
				from fichas
				where id_ficha in(1, 2, 3, 4, 5, 6) ) and id_cord_tab = coord;
		else
			select id_ficha
			into ficha
			from estado_partidas
			where id_ficha in (select id_ficha
				from fichas
				where id_ficha in(7, 8, 9, 10, 11, 12) ) and id_cord_tab = coord;
		end if;
	exception
		when NO_DATA_FOUND then
			-- coordenada invalida
			ficha := -1;
		when OTHERS then
			ficha := -2;
	end;
	return ficha;
end;
/