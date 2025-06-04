//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_fondo_tablero
.global arcade_fondo_tablero_sup
// Importamos rutinas externas
.extern pintar_pixel_minimo


arcade_fondo_tablero:
//---------------------------------------------------------------------------------------------------------
//Pinto tablero de botones:
        mov x25, lr
		mov x3, x11					// Defino color                
		mov x7, #34					// Contador para loop_0
		mov x10, x11    	        // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pinto_tablero_0:
			sub x1, x7, #40
			sub x1, xzr, x1
			lsl x1, x1, #1
			add x1, x13, x1  
            sub x1, x1, #1
			mov x9, #10				// Contador para loop_1
			//x1 = x13 + (41-x7)*2
			sub x2, x14, #4                   
			loop_arcade_pinto_tablero_1:
				bl pintar_pixel_minimo	// llamada a la subrutina
				add x1, x1, TAM_PIXEL
				sub x2, x2, TAM_PIXEL
				sub x9, x9, #1
				cbnz x9, loop_arcade_pinto_tablero_1 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_1
				sub x7, x7, #1
				cbnz x7, loop_arcade_pinto_tablero_0 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_0
		mov x11, x10				// Restauro X11 luego de todas las llamadas pintar_pixel_minimo

		mov lr, x25
        br lr


//---------------------------------------------------------------------------------------------------------

arcade_fondo_tablero_sup:
	mov x25, lr
	mov x3, x11					// Defino color
	//pantalla frontal:
	add x1, x1, #2    			// variable x
	sub x2, x2, #143            // variable y
	mov x5, #79		            // ancho
	mov x4, #30			        // alto (en pixeles de TAM PIXEL)
	bl pintar_rectangulo_aux		// llamada a la subrutina
	mov lr, x25
	br lr
//---------------------------------------------------------------------------------------------------------

