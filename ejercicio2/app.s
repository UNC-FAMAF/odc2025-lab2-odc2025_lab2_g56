//---------------------INCLUIMOS CONTANTES DEFINIDAS-------------------------------------
.include "constantes.s"
//---------------------DECLARAMOS RUTINAS COMO GLOBALES----------------------------------
.globl main
// Importamos rutinas externas
.extern imagen_estatica
.extern caracol
.extern pintar_fondo_sala
.extern backup_rectangulo
.extern restore_rectangulo

//--------------------------------------------------------------------------------------
// CONVENCIONES:
	// x0 lo utilizamos para pintar el framebuffer
	// (x1, x2) = coordenadas (x, y) de un pixel para rutinas 
	// x3 = color a pintar
	// x4, x5, x6 = parametros alto, ancho, radio para rutinas
	// x7 = cantidad
	// x9 - x15  temporales de uso general
	// x19 Guarda el ancho de la pantalla
	// x20 Guarda la dirección base del framebuffer
	// x27,...,x21 Guarda temporalmente direcciones de memoria para hacer branch
//--------------------------------------------------------------------------------------
//-----------------------------------MAIN-----------------------------------------------
main:
 	mov x20, x0				    		// Guarda la direccion base del framebuffer en x20
	mov x19, SCREEN_WIDTH 	    		// Guarda el ancho de la pantalla en x19
//---------------------------------------- CODIGO ---------------------------------------
	bl imagen_estatica
//Animación:-----------------------------------------------------------------------------
	mov x1, #60							// Coordenada x del del punto sup. der. del plano de animación
	mov x2, #350						// Coordenada y del del punto sup. der. del plano de animación
	mov x4, #100						// Defino ancho del plano de renderizado
	mov x5, #100						// Defino alto del plano de renderizado
	mov x9, #500						// Iteraciones de animación
	loop_animacion:
		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol			        	// Renderizamos la figura a animar
		
		
		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0  // termino de definir un color
		bl circulosg1
		mov x1, #370            // coordenada x del centro
    	mov x2, #204    
		bl letra_o

		movz x3, 0x75, lsl 16   // defino el color
		movk x3, 0xfcfc, lsl 0  // termino de definir un color
		bl circulosg2
		mov x1, #466                    // coordenada x del centro
    	mov x2, #204    
		bl letra_d

		movz x3, 0xfb, lsl 16   // defino el color
		movk x3, 0xd65a, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560                    // coordenada x del centro
 		mov x2, #204   
		bl letra_c

		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones


		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol
		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones

		// Repetimos el proceso con los colores cambiados
		
		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol
		movz x3, 0x75, lsl 16   // defino el color
		movk x3, 0xfcfc, lsl 0  // termino de definir un color
		bl circulosg1
		mov x1, #370            // coordenada x del centro
    	mov x2, #204    
		bl letra_o

		movz x3, 0xfb, lsl 16   // defino el color
		movk x3, 0xd65a, lsl 0  // termino de definir un color
		bl circulosg2
		mov x1, #466                    // coordenada x del centro
    	mov x2, #204    
		bl letra_d

		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560                    // coordenada x del centro
 		mov x2, #204   
		bl letra_c


		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones

		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol
		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones

		// Repetimos el proceso con los colores cambiados

		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol
		movz x3, 0xfb, lsl 16   // defino el color
		movk x3, 0xd65a, lsl 0  // termino de definir un color
		bl circulosg1
		mov x1, #370            // coordenada x del centro
    	mov x2, #204    
		bl letra_o

		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0  // termino de definir un color
		bl circulosg2
		mov x1, #466                    // coordenada x del centro
    	mov x2, #204    
		bl letra_d

		movz x3, 0x75, lsl 16   // defino el color
		movk x3, 0xfcfc, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560                    // coordenada x del centro
 		mov x2, #204   
		bl letra_c

		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones

		bl backup_rectangulo			// Backup de pixels del plano animado
		bl caracol
		movz x10, 0x04FF, lsl 16       	// Defino timpo del delay
		movk x10, 0xFFFF, lsl 0      	// termino de definir tiempo del delay
		bl delay						// Subrutina de delay	
		bl restore_rectangulo
		add x1,x1,#1					// Intervalo de desplazamiento
		sub x9,x9,#1					// Decremento de contador de iteraciones
		
		// Repetimos el proceso con los colores cambiados

		cbnz x9,loop_animacion

//--------------------------------------------------------------------------------------

InfLoop:
	b InfLoop
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
//-------------------------------FINAL DEL CODIGO---------------------------------------


