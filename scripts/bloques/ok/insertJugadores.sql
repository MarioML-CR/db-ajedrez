/*
Ingreso de jugadores a la table jugadores
*/
set verify OFF
column nickname format a18;
column nombre format a18;
column apellido1 format a18;
column apellido2 format a18;
SET SERVEROUTPUT ON
DECLARE
	apodo jugadores.nickname%type;
	vnombre jugadores.nombre%type;
	apellido_1 jugadores.apellido1%type;
	apellido_2 jugadores.apellido2%type;
	null_value exception;
	pragma exception_init(null_value, -1400);
	largo_texto exception;
	pragma exception_init(largo_texto, -6502);
BEGIN
	-- TODO: Mejorar veficando primero si existe el nickname
	-- captura de variables lexicas
	apodo := upper('&nickname');
	vnombre := upper('&nombre');
	apellido_1 := upper('&apellido');
	apellido_2 := upper('&apellido2');
	-- se carga la informacion en la tabla jugadores
	insert into jugadores values (apodo,vnombre,apellido_1,apellido_2);
	-- encabezado de el texto de salida
	dbms_output.put_line(chr(13));
	dbms_output.put_line('La inforamcion se ha cargado satisfactoriamente, y se muestra a continuacion...');
	dbms_output.put_line(chr(13));
	dbms_output.put_line('Nickname          Nombre            Primer apellido   Segundo apellido');
	dbms_output.put_line('_______________   _______________   _______________   ________________');
	-- se crea un cursor para cargar la informacion ingresada a la tabla jugadores
	declare
		cursor jugadores is
		select
		nickname,
		nombre,
		apell
		apellido2
		from jugadores
		where nickname = apodo;
	begin
		for jug in jugadores loop
		dbms_output.put_line(rpad(jug.nickname, 18, ' ')||rpad(jug.nombre, 18, ' ')||rpad(jug.apellido1, 18, ' ')||rpad(jug.apellido2, 19, ' '));
		end loop;
	end;
EXCEPTION
	when dup_val_on_index then
		dbms_output.put_line(chr(13));
		DBMS_OUTPUT.PUT_LINE('Ya existe un jugador con ese nickname: por favor ingrese otro');
	when null_value then
		dbms_output.put_line(chr(13));
		DBMS_OUTPUT.PUT_LINE('Solamente el segundo apellido puede ser nulo, por favor ingrese la informacion solicitada ');
	when largo_texto then
		dbms_output.put_line(chr(13));
		DBMS_OUTPUT.PUT_LINE('El texto que intenta ingresar es muy largo, por favor ingrese uno mas corto.');
	when others then
		dbms_output.put_line(chr(13));
		DBMS_OUTPUT.PUT_LINE('Error de Oracle: '||SQLCODE||' - '||SQLERRM );
END; 
/