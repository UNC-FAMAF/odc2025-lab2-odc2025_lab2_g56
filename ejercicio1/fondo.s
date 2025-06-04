//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global pintar_fondo_sala
.global patron_cuadriculado

// Importamos rutinas externas
.extern pintar_pixel_minimo
.extern pintar_rectangulo
.extern escaleritas

// --------------------- pintar_fondo ------------------------------------------
// Pinta las paredes con los patrones y los mosaicos del piso
    pintar_fondo_sala:
        //  PINTAMOS LINEA DIVISORIA 
            mov x1, #404                // variable x
            mov x2, #0                  // variable y
            movz x3, 0x8D, lsl 16    
            movk x3, 0x31DD, lsl 00 
            mov x4, #240	            // alto (en pixeles de TAM PIXEL)
            mov x5, #2			        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
        //--------------------------------------------------------------------------------

        //  PINTAMOS PARED DER
            mov x1, #406                // variable x
            mov x2, #0                  // variable y
            movz x3, 0xBE, lsl 16    
            movk x3, 0x7DFF, lsl 00 
            mov x4, #240	            // alto (en pixeles de TAM PIXEL)
            mov x5, #117		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
        //--------------------------------------------------------------------------------

        //  PINTAMOS CARTEL
            mov x1, #418                // variable x
            mov x2, #24                  // variable y
            movz x3, 0x1D, lsl 16    
            movk x3, 0x01AD, lsl 00 
            mov x4, #26	            // alto (en pixeles de TAM PIXEL)
            mov x5, #111		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
            // ---------------------------------------------
            mov x1, #420                // variable x
            mov x2, #26                 // variable y
            movz x3, 0x7B, lsl 16    
            movk x3, 0x41F7, lsl 00 
            mov x4, #24	                // alto (en pixeles de TAM PIXEL)
            mov x5, #111		        // ancho
            mov x25, lr
            bl patron_cuadriculado
            mov lr, x25
        //--------------------------------------------------------------------------------

        //  PINTAMOS PARED IZQ
            mov x1, #0                  // variable x
            mov x2, #0                  // variable y
            movz x3, 0xFE, lsl 16    
            movk x3, 0x89F2, lsl 00 
            mov x4, #240                // alto (en pixeles de TAM PIXEL)
            mov x5, #202			    // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
            // ---------------------------------------------
            mov x1, #348                // variable x
            mov x2, #0                 // variable y
            movz x3, 0xCC, lsl 16    
            movk x3, 0x77ED, lsl 00 
            mov x4, #61	                // alto (en pixeles de TAM PIXEL)
            mov x5, #29		            // ancho
            mov x25, lr
            bl patron_cuadriculado
            mov lr, x25
            // ---------------------------------------------
            mov x1, #258                // variable x
            mov x2, #0                 // variable y
            movz x3, 0xCC, lsl 16    
            movk x3, 0x77ED, lsl 00 
            mov x4, #188	                // alto (en pixeles de TAM PIXEL)
            mov x5, #26		            // ancho
            mov x25, lr
            bl patron_punteado
            mov lr, x25
        //--------------------------------------------------------------------------------

        //  PINTAMOS HABITACION 2
            // FONDO ----------------------------------------
            mov x1, #16                // variable x
            mov x2, #62                  // variable y
            movz x3, 0x1D, lsl 16    
            movk x3, 0x01AD, lsl 00 
            mov x4, #159	            // alto (en pixeles de TAM PIXEL)
            mov x5, #112		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
            // ---------------------------------------------
            mov x1, #16                // variable x
            mov x2, #64                 // variable y
            movz x3, 0x83, lsl 16    
            movk x3, 0x3FF4, lsl 00 
            mov x4, #131                // alto (en pixeles de TAM PIXEL)
            mov x5, #112	            // ancho
            mov x25, lr
            bl patron_cuadriculado
            mov lr, x25

            // MARCO PUERTA ---------------------------------
            mov x1, #15                // variable x
            mov x2, #62                 // variable y
            movz x3, 0x8D, lsl 16    
            movk x3, 0x31DD, lsl 00 
            mov x4, #186	            // alto (en pixeles de TAM PIXEL)
            mov x5, #1  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25

            mov x1, #0                // variable x
            mov x2, #432                 // variable y
            movz x3, 0x8D, lsl 16    
            movk x3, 0x31DD, lsl 00 
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25

            mov x1, #254                // variable x
            mov x2, #62                 // variable y
            movz x3, 0x8D, lsl 16    
            movk x3, 0x31DD, lsl 00 
            mov x4, #159	            // alto (en pixeles de TAM PIXEL)
            mov x5, #1  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25

            mov x1, #240                // variable x
            mov x2, #64                 // variable y
            movz x3, 0xFE, lsl 16    
            movk x3, 0x57EC, lsl 00  
            mov x4, #158	            // alto (en pixeles de TAM PIXEL)
            mov x5, #7  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
            
        //--------------------------------------------------------------------------------
            
        //  PINTAMOS PISO
            mov x1, #0                // variable x
            mov x2, #432                 // variable y
            movz x3, 0xBF, lsl 16    
            movk x3, 0x7CFF, lsl 00 
            mov x4, #24	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25

            mov x1, #0                // variable x
            mov x2, #432                 // variable y
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00      
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25

            mov x1, #0                // variable x
            mov x2, #448                 // variable y
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00   
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
            
            mov x1, #0                // variable x
            mov x2, #464                 // variable y
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00   
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            mov x25, lr
            bl pintar_rectangulo
            mov lr, x25
    br lr


//------------------------SUB-RUTINAS/FUNCIONES-----------------------------------

// -----------------patron_cuadriculado (x, y, color): -----------------
//Genera el patron cuadriculado basico
	patron_cuadriculado:
			mov x27, lr 				// Guardamos direccion del main para saltar de nuevo
			bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
			mov lr, x27 				// Restablecemos la direccion del main para poder volver
			mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
			mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
            mov x21, TAM_PIXEL          // Guardo tam_pixel para poder multiplicarlo por 2
			lsl x21, x21, #1			// Mult. x 2 para saltear un pixel
            mov x22, #0                 // X22 flag para correr_pixeles 1 pixel a la der            
            and x23, x5, #1             // Separo bit menos signif. para ver si es par
            lsr x5, x5, #1              // Divido en 2 el ancho
        loop_1_patron_cuadr:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_patron_cuadr:		
			mov x26, lr
			bl pintar_pixel_minimo
			mov lr, x26
            add x1, x1, x21 		    // Siguiente pixel coordenada x avanzamos salteando de a 1
            mov x27, lr
			bl calcular_direccion
			mov lr, x27
            sub x9, x9, 1	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_patron_cuadr      	// Si no terminó la fila, salto (osea si x9 > 0)

            sub x10, x10, 1				// Decrementar contador Y
			mov x1, x15					// Restablezco referencia de x

            cbnz x22, no_correr_pixeles // pregunto si se corrieron pixeles en la vuelta previa
        //correr_pixeles    
            add x1, x1, TAM_PIXEL       // Corro 'x' 1 pixel a la der
            mov x22, #1                 // Seteo flag correr_pixel en false para la prox ciclo (!= 0)
            cbnz x23, end_if_correr_pixeles
            sub x5, x5, #1              // Resto 1 al ancho
            b end_if_correr_pixeles
        
        no_correr_pixeles:
            mov x22, xzr
            cbnz x23, end_if_correr_pixeles
            add x5, x5, #1              // Restauro el ancho
    
        end_if_correr_pixeles:
            add x2, x2, TAM_PIXEL 	    // Pasamos a la fila siguiente 
            mov x27, lr
			bl calcular_direccion
			mov lr, x27
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_patron_cuadr 	    // Si no es la última fila, salto (osea si x10 > 0)
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_punteado (x, y, color): -----------------
//Genera el patron punteado
	patron_punteado:
			mov x27, lr 				// Guardamos direccion del main para saltar de nuevo
			bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
			mov lr, x27 				// Restablecemos la direccion del main para poder volver
			mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
			mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
            mov x16, TAM_PIXEL          // Guardo tam_pixel para poder multiplicarlo por 2
			lsl x16, x16, #1			// Mult. x 2 para saltear un pixel
		
        loop_1_patron_punt:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_patron_punt:		
			mov x26, lr
			bl pintar_pixel_minimo
			mov lr, x26
            add x1, x1, x16 		    // Siguiente pixel coordenada x avanzamos salteando de a 1
            mov x27, lr
			bl calcular_direccion
			mov lr, x27
            sub x9, x9, 2	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_patron_punt    	// Si no terminó la fila, salto (osea si x9 > 0)
            sub x10, x10, 2				// Decrementar contador Y
			mov x1, x15					// Restablezco referencia de x            
            add x2, x2, x16 	        // Pasamos a la fila siguiente 
            mov x27, lr
			bl calcular_direccion
			mov lr, x27
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_patron_punt     // Si no es la última fila, salto (osea si x10 > 0)
	br lr
//-----------------------------------------------------------------------------------
