//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global arcade

// Importamos rutinas externas
.extern pintar_rectangulo
.extern pintar_pixel_minimo

//----------------------------------------------------------------------------------

//	ARCADE
arcade:
	//Frente rectangulo 1 
		//Bordes
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		mov x1, #320                // variable x
		mov x2, #318                // variable y
		mov x4, #52			        // alto (en pixeles de TAM PIXEL)
		mov x5, #42		            // ancho
		bl pintar_rectangulo		// llamada a la subrutina
		//Relleno 1
		movz x3, 0xD8, lsl 16       // defino un color
		movk x3, 0xB2FD, lsl 0      // termino de definir un color
		mov x1, #322                // variable x
		mov x2, #338	            // variable y
		mov x4, #41			        // alto (en pixeles de TAM PIXEL)
		mov x5, #40		            // ancho
		bl pintar_rectangulo		// llamada a la subrutina
		//Relleno 2
		movz x3, 0xD8, lsl 16       // defino un color
		movk x3, 0xB2FD, lsl 0      // termino de definir un color
		mov x1, #322                // variable x
		mov x2, #320	            // variable y
		mov x4, #8			        // alto (en pixeles de TAM PIXEL)
		mov x5, #40		            // ancho
		bl pintar_rectangulo		// llamada a la subrutina
	
	//Tablero
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		mov x1, #320                // variable x
		mov x2, #318                // variable y
		mov x9, #28					//Contador para loop
		loop_arcade_tablero_0:
			bl pintar_pixel_minimo		// llamada a la subrutina
			add x1, x1, TAM_PIXEL
			sub x2, x2, TAM_PIXEL
			cbnz x9, loop_arcade_tablero_0 //si no es 0 el contador, vuelvo a loop_arcade_tablero_0
