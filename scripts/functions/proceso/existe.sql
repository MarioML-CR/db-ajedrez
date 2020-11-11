create or replace function existe(vnic varchar2) return varchar2
  is
	cant number(3);
begin
	select count(1) into cant
	from jugadores
	where nickname = vnic;
	if cant<>0 then
		return 'Si';
	else
		return 'No';
	end if;
 end;
 /