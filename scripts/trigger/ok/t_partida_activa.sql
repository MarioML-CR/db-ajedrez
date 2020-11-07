/*
Trigger para actualizar el estado de la partida en el tablero.
*/
CREATE or replace trigger t_partida_activa
  AFTER 
  insert ON partidas
  BEGIN
	declare
		partida partidas.id_partida%type;
		partida_vigente partidas.id_partida%type;
	begin
		-- se cargan el puntero con el id de la partida recien creada
		select max(id_partida) 
		into partida
		from partidas;
		-- se carga el puntero del id de la partida vigente
		select id_partida
		into partida_vigente
		from partida_activa;
		-- se hace un update de la tabla partida_activa, ya que contiene un registro
		update partida_activa
		set id_partida = partida;
	exception
		when NO_DATA_FOUND then
			-- se realiza la actualización del movimiento
			insert into partida_activa values (partida);
	end;
  END;
/

