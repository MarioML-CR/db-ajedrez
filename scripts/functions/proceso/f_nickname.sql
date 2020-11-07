/*
función que recibe un parametro, el nickname, y retorna true si existe en la tabla jugadores, o false caso contrario.
*/
set verify OFF
create or replace function f_nickname (nombre VARCHAR2)
return boolean as
declare
	vnombre jugadores.nickname%type := '';
begin
	begin
		select
			nickname
		into vnombre
		from jugadores
		where nickname = nombre;
		if length(vnombre) then

		else
	  
	end if;
	exception
		when NO_DATA_FOUND then
			-- coordenada invalida
			coordenada := -1;
		when VALUE_ERROR then
			-- Excede el numero de caracteres permitidos
			coordenada := -2;
		when OTHERS then
			coordenada := -3;
	end;
	return coordenada;
end;
/