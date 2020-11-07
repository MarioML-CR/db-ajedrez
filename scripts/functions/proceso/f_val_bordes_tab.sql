/*
Validar si el valor ingresado sale del tablero
*/
create or replace function val_bordes_tab(coord in char(2), partida in number)    
return number    
is     
n1 number := 0;  
n2 number := 0;  
begin    
	declare
		vfila coordenadas_tablero.fila%type;
		vcol coordenadas_tablero.col%type;
		vcoord coordenadas_tablero.coordenada%type;
	begin
		-- se determina el numero de fila y columna de la referencia
		select fila, col
		into vfila, vcol
		from coordenadas_tablero
		where coordenada = lower(coord);
		-- se determina el numero de fila y columna de la referencia
		select 
	end;
	n3 :=n1+n2;    
return n3;    
end;    
/  

-- TODO: pendiente