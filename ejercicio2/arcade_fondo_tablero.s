//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_fondo_tablero
.global arcade_fondo_tablero_sup
.global arcade_controles_palanca
.global arcade_controles_botones
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

arcade_controles_palanca:
mov x25, lr
	//Esfera superior:
	add x1, x1, #53            // variable x
    sub x2, x2, #25            // variable y
    mov x6, #4                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
	//Eje:
	movz x3, 0x41, lsl 16       // defino un color
	movk x3, 0x1C8E, lsl 0      // termino de definir un color
	add x2, x2, #5 
	mov x5, #2		            // ancho
	mov x4, #6			        // alto (en pixeles de TAM PIXEL)
	bl pintar_rectangulo_aux
mov lr, x25
br lr
//---------------------------------------------------------------------------------------------------------

arcade_controles_botones:
mov x25, lr
	//Boton superior derecho:
	movz x3, 0x41, lsl 16       	// defino un color
	movk x3, 0x1C8E, lsl 0      	// termino de definir un color
	add x1, x1, #79            		// variable x
    sub x2, x2, #17            		// variable y
    mov x6, #2                  	// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	movz x3, 0xFF, lsl 16       	// defino color principal (ROSA)
	movk x3, 0x7CED, lsl 0      	// termino de definir color ppal
	mov x6, #1                  	// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	//Boton superior izquierdo:
	movz x3, 0x41, lsl 16       	// defino un color
	movk x3, 0x1C8E, lsl 0      	// termino de definir un color
	sub x1, x1, #48            		// variable x
    mov x6, #2                 		// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	movz x3, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x3, 0xF8FC, lsl 0      	// termino de definir color ppal
	mov x6, #1                  	// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	//Boton inferior izquierdo:
	movz x3, 0x41, lsl 16       	// defino un color
	movk x3, 0x1C8E, lsl 0      	// termino de definir un color
	sub x1, x1, #8            		// variable x
	add x2, x2, #8            		// variable y
    mov x6, #2                 		// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	movz x3, 0xFF, lsl 16       	// defino color principal (ROSA)
	movk x3, 0x7CED, lsl 0      	// termino de definir color ppal
	mov x6, #1                  	// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	//Boton inferior derecho:
	movz x3, 0x41, lsl 16       	// defino un color
	movk x3, 0x1C8E, lsl 0      	// termino de definir un color
	add x1, x1, #48            		// variable x
    mov x6, #2                 		// Radio
    bl pintar_circulo	        	// llamada a la subrutina
	movz x3, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x3, 0xF8FC, lsl 0      	// termino de definir color ppal
	mov x6, #1                  	// Radio
    bl pintar_circulo	        	// llamada a la subrutina
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

