//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_estructura

// Importamos rutinas externas
.extern pintar_rectangulo
.extern pintar_pixel_minimo
.extern pintar_punto
.extern patron_cuadriculado

//----------------------------------------------------------------------------------

//	ARCADE

arcade_estructura:
	mov x25, lr //Guarado lr(posicion de retorno) en x25
	mov x13, x1 //Coordenada x de posicion de arcade (vertice inferior izq.)
	mov x14, x2 //Coordenada y de posicion de arcade (vertice inferior izq.)

	//Profundidad (pared lateral):
		movz x3, 0x49, lsl 16
		movk x3, 0x7C15, lsl 0
		sub x3, x11, x3
		add x1, x13, #83
		sub x2, x14, #150
		mov x5, #50		            // ancho
		mov x4, #244		        // alto
		bl pintar_rectangulo_aux
		
		//Sombras:
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		add x1, x13, #90
		sub x2, x14, #149
		mov x5, #20		            // ancho
		mov x4, #22			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl patron_cuadriculado
		mov x11, x7					// Restauro x7

		add x1, x13, #90
		add x2, x14, #2
		mov x5, #20		            // ancho
		mov x4, #46			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl patron_cuadriculado
		mov x11, x7					// Restauro x7

		add x1, x13, #116
		sub x2, x14, #80
		mov x5, #8		            // ancho
		mov x4, #28			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl patron_cuadriculado
		mov x11, x7	
	//Frente rectangulo 1 
		//Bordes
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		mov x1, x13                 // variable x
		mov x2, x14                 // variable y
		mov x5, #83		            // ancho
		mov x4, #94			        // alto
		bl pintar_rectangulo_aux		// llamada a la subrutina
		//Relleno 1
		mov x3, x11				    // defino color
		add x1, x13, #2				// Espesor del borde que se debe ver del rect. anterior
		add x2, x14, #20			// Espesor del borde que se debe ver del rect. anterior
		mov x5, #79		            // ancho
		mov x4, #72			        // alto (en pixeles de TAM PIXEL)
		bl pintar_rectangulo_aux	// llamada a la subrutina
		//Relleno 2
		add x1, x13, #2             // variable x
		add x2, x14, #2	            // variable y
		mov x5, #79		            // ancho
		mov x4, #16			        // alto (en pixeles de TAM PIXEL)
		bl pintar_rectangulo_aux	// llamada a la subrutina
	
	//Tablero de controles
		//borde izq:
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		mov x1, x13                	// variable x
		mov x2, x14               	// variable y
		mov x9, #13					// Contador para loop
		mov x10, x11    	        // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_tablero_bordeIzq:
			bl pintar_pixel_minimo	// llamada a la subrutina
			add x1, x1, TAM_PIXEL
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_tablero_bordeIzq    //si no es 0 el contador, vuelvo a loop_arcade_tablero_bordeIzq
		mov x11, x10								 // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//borde der:
		movz x3, 0x41, lsl 16       				 // defino un color
		movk x3, 0x1C8E, lsl 0      				 // termino de definir un color
		add x1, x13, #79            				 // variable x
		mov x2, x14	                				 // variable y
		mov x9, #13									 // Contador para loop
		mov x10, x11    	        				 // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_tablero_bordeDer:
			bl pintar_pixel_minimo					 // llamada a la subrutina
			add x1, x1, TAM_PIXEL
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_tablero_bordeDer    //si no es 0 el contador, vuelvo a loop_arcade_tablero_bordeDer
		mov x11, x10								 // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//Pinto tablero:
		mov x3, x11									 // Defino color
		mov x1, x13
		mov x2, x14                   
		mov x7, #39									 // Contador para loop_0
		mov x10, x11    	        				 // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pinto_tablero_0:
			sub x1, x7, #40
			sub x1, xzr, x1
			lsl x1, x1, #1
			add x1, x1, TAM_PIXEL
			add x1, x13, x1  
			mov x9, #13								 // Contador para loop_1
			//x1 = x13 + (41-x7)*2
			sub x2, x14, TAM_PIXEL                   
			loop_arcade_pinto_tablero_1:
				bl pintar_pixel_minimo				 // llamada a la subrutina
				add x1, x1, TAM_PIXEL
				sub x2, x2, TAM_PIXEL
				sub x9, x9, #1
				cbnz x9, loop_arcade_pinto_tablero_1 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_1
				sub x7, x7, #1
				cbnz x7, loop_arcade_pinto_tablero_0 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_0
		mov x11, x10								 // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
			
	//Pantalla
		//Bordes exteriores:
		//borde inf:
		movz x3, 0x49, lsl 16
		movk x3, 0x7C15, lsl 0
		sub x3, x11, x3 
		add x1, x13, #26
		sub x2, x14, #26            				// variable y
		mov x9, #40									//Contador para loop
		mov x10, x11    	        				// Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pantalla_borde_inf:
			bl pintar_pixel_minimo					// llamada a la subrutina
			add x1, x1, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_pantalla_borde_inf //si no es 0 el contador, vuelvo a loop_arcade_pantalla_borde_inf
		mov x11, x10								// Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//borde sup:
		add x1, x13, #26            				// variable x
		sub x2, x14, #82            				// variable y
		mov x9, #40									//Contador para loop
		mov x10, x11    	        				// Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pantalla_borde_sup:
			bl pintar_pixel_minimo					// llamada a la subrutina
			add x1, x1, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_pantalla_borde_sup //si no es 0 el contador, vuelvo a loop_arcade_pantalla_borde_sup
		mov x11, x10								// Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//borde izq:
		movz x3, 0x41, lsl 16       				// defino un color
		movk x3, 0x1C8E, lsl 0      				// termino de definir un color
		add x1, x13, #26            				// variable x
		sub x2, x14, #26            				// variable y
		mov x9, #28									//Contador para loop
		mov x10, x11    	        				// Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pantalla_borde_izq:
			bl pintar_pixel_minimo					// llamada a la subrutina
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_pantalla_borde_izq //si no es 0 el contador, vuelvo a loop_arcade_pantalla_borde_izq
		mov x11, x10								// Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//borde der:
		mov x9, #28									//Contador para loop
		add x1, x1, #79								//posiciono x1 en el borde derecho
		sub x2, x14, #26            				// variable y
		mov x10, x11    	        				// Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pantalla_borde_der:
			bl pintar_pixel_minimo					// llamada a la subrutina
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_pantalla_borde_der //si no es 0 el contador, vuelvo a loop_arcade_pantalla_borde_der
		mov x11, x10				                // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//Pintar fondo pantalla:
		movz x3, 0x19, lsl 16       // defino un color
		movk x3, 0x35FE, lsl 0      // termino de definir un color
		sub x3, x11, x3				// Defino color  
		add x1, x13, #28            // variable x
		sub x2, x14, #80            // variable y
		mov x5, #77					// ancho
		mov x4, #54					// alto
		bl pintar_rectangulo_aux
		//Bordes interiores pantalla:
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		add x1, x13, #31
		sub x2, x14, #77
		mov x5, #70		            // ancho
		mov x4, #51			        // alto 
		bl pintar_rectangulo_aux	// llamada a la subrutina

	//Parte superior:
		//borde izquierdo:
		movz x3, 0x41, lsl 16       // defino un color
		movk x3, 0x1C8E, lsl 0      // termino de definir un color
		add x1, x13, #26            // variable x
		sub x2, x14, #82            // variable y
		mov x9, #13					// contador para loop
		mov x10, x11    	        // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_sup_borde_izq:
			bl pintar_pixel_minimo                       //llamada a la subrutina
			sub x1, x1, TAM_PIXEL
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_sup_borde_izq
		mov x11, x10									 // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		//borde derecho:
		add x1, x13, #105           					 // variable x
		sub x2, x14, #82            					 // variable y
		mov x9, #13										 // contador para loop
		mov x10, x11    	        					 // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_sup_borde_der:
			bl pintar_pixel_minimo  					 // Llamada a la subrutina
			sub x1, x1, TAM_PIXEL
			sub x2, x2, TAM_PIXEL
			sub x9, x9, #1
			cbnz x9, loop_arcade_sup_borde_der
		mov x11, x10									 // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		
		//Pinto trapecio superior:
		movz x3, 0x19, lsl 16       					 // defino un color
		movk x3, 0x35FE, lsl 0      					 // termino de definir un color
		sub x3, x11, x3									 // Defino color           
		mov x7, #39										 // Contador para loop_0
		mov x10, x11    	                             // Resguardo X11 porque pintar_pixel_minimo la modifica
		loop_arcade_pinto_trapecio_sup_0:
			sub x1, x7, #40
			sub x1, xzr, x1
			lsl x1, x1, #1
			add x1, x13, x1
			add x1, x1, #24  
			mov x9, #13				                      // Contador para loop_1
			sub x2, x14, TAM_PIXEL 
			sub x2, x2, #82                  
			loop_arcade_pinto_trapecio_sup_1:
				bl pintar_pixel_minimo	                  // llamada a la subrutina
				sub x1, x1, TAM_PIXEL
				sub x2, x2, TAM_PIXEL
				sub x9, x9, #1
				cbnz x9, loop_arcade_pinto_trapecio_sup_1 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_1
				sub x7, x7, #1
				cbnz x7, loop_arcade_pinto_trapecio_sup_0 //si no es 0 el contador, vuelvo a loop_arcade_pinto_tablero_0
		mov x11, x10				                      // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
		 

		//tablero superior:
			//bordes:
			movz x3, 0x41, lsl 16       // defino un color
			movk x3, 0x1C8E, lsl 0      // termino de definir un color
			mov x1, x13                 // variable x
			sub x2, x14, #150           // variable y
			mov x5, #83		            // ancho
			mov x4, #44			        // alto (en pixeles de TAM PIXEL)
			bl pintar_rectangulo_aux	// llamada a la subrutina
			
			// detalle frontal (linea):
			mov x3, x11
			add x1, x13, #3     			// variable x
			sub x2, x14, #147               // variable y
			mov x9, #39					    // contador para loop
			loop_arcade_sup_detalle_tablero_sup:
				bl pintar_pixel_minimo
				add x1, x1, TAM_PIXEL
				sub x9, x9, #1
				cbnz x9, loop_arcade_sup_detalle_tablero_sup
			add x1, x13, #3     			// variable x
			sub x2, x14, #111               // variable y
			mov x9, #39					    // contador para loop
			loop_arcade_sup_detalle_tablero_inf:
				bl pintar_pixel_minimo
				add x1, x1, TAM_PIXEL
				sub x9, x9, #1
				cbnz x9, loop_arcade_sup_detalle_tablero_inf
			mov x11, x3				        // Restauro X11 luego de todas las llamadas pintar_pixel_minimo
				
	mov lr, x25
	br lr	
