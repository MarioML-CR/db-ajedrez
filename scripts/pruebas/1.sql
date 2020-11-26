select max(movimiento)
into max_mov
from movimientos
where id_partida = 401;

select 
id_ficha, pos_final
into 
from movimientos
where id_partida = 401 and movimiento = max_mov;

if mod(max_mov,2) = 0 and idFicha1 = 6 and coordenada2 in (1, 2, 3, 4, 5, 6, 7, 8)  then
	-- último movimiento de blancas
	update movimientos
	set notacion = notacion ||'=D'
	where movimiento = prox_mov and id_partida = partida;
elsif mod(max_mov,2) <> 0 and idFicha1 = 12 and coordenada2 in (57, 58, 59, 60, 61, 62, 63, 64) then
	-- último movimiento de negras
	update movimientos
	set notacion = notacion ||'=d'
	where movimiento = prox_mov and id_partida = partida;
end if;