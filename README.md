# Proyecto DBChess
## Juego de ajedrez en línea

## El ajedrez
El origen del ajedrez es incierto, así como su inventor, algunas leyendas apuntan su origen en la india, junto con la leyenda no menos famosa del valor factorial que al llegar a la casilla 64 su valor llega a 1.26 x 1089. Otras apuntan a los griegos en asedio a Troya en el año 1000 AC.

Pero sea cual fuere su origen e inventor, este ha venido evolucionando y aumentando sus adeptos, ya que es un juego de estrategia.

## Métodos aplicados
### Bloques PL?SQL anónimos

a)	**partida_activa**, bloque que indica si existe una partida activa, mostrando el número de partida.

b)	**ini**, bloque que establece como activa una partida, se necesitan los nicknames de ambos jugadores y el identificador de la partida para poder ejecutarlo.

c)	**mov**, bloque con el cual se pueden realizar movimientos de las fichas en el tablero, se ingresa la coordenada de origen, es decir la coordenada del tablero donde se ubica la ficha que se quiere mover, posteriormente se ingresa la coordenada de destino de la ficha.
d)	**viewTablero**, bloque con el cual se puede visualizar el tablero de la partida que se encuentra activa.
e)	**insertJugadores**, bloque con el que se pueden insertar nuevos jugadores.
f)	**insertPartidas**, bloque para poder insertar partidas nuevas.

### Datos almacenados
En el siguiente apartado se detallan los procedimientos, funciones y trigger almacenados en la base de datos del juego, estas son:

#### Procedimientos

* a)	**p_empate**, este procedimiento permite al jugador solicitar al oponente un empate.
* b)	**p_empate_respuesta**, procedimiento que agrega en la tabla partida en la columna resultado la leyenda de empate y en la columna anotación coloca el texto "=”.
* c)	**e_enroque_c**, permite realizar un enroque corto.
* d)	**p_enroque_l**, procedimiento permite realizar un enroque largo.
* e)	**p_hist_partidas**, permite visualizar el historial de partidas de un jugador, se necesita ingresar el nickname del jugador.
* f)	**p_mate**, este procedimiento finaliza la partida mediante la aceptación de un jaque mate.
* g)	**p_mov**, procedimiento imprime los movimientos de la partida activa.
* h)	**p_mov_his**, permite observar los movimientos realizados en una partida, mediante el identificador de la partida.

#### Funciones
