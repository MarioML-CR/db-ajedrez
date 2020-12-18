update fichas set nombre = 'Peon' where id_ficha = 6;
update fichas set nombre = 'peon' where id_ficha = 12;
alter table movimientos add movimiento number(3) not null; -- debe estar vacia la tabla
alter table movimientos modify notacion varchar2(12);
alter table coordenadas_tablero drop column fila;
alter table coordenadas_tablero drop column col;
alter table partidas modify resultado varchar2(60);