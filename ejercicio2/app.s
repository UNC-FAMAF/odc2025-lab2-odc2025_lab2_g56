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


//-----------------------------------MAIN-----------------------------------------------
main:
 	mov x20, x0				    		// guarda la direccion base del framebuffer en x20
	mov x19, SCREEN_WIDTH 	    		// guarda el ancho de la pantalla en x19

//------------------------------PINTAMOS FONDO------------------------------------------
	bl imagen_estatica					
	
//---------------------------------ANIMACION---------------------------------------------
	mov x1, #60							// coordenada x del del punto sup. der. del plano de animación
	mov x2, #350						// coordenada y del del punto sup. der. del plano de animación
	mov x4, #100						// defino ancho del plano de renderizado
	mov x5, #100						// defino alto del plano de renderizado
	mov x9, #500						// iteraciones de animación
	loop_animacion:
		bl backup_rectangulo			// backup de pixels del plano animado
		bl caracol			        	// renderizamos la figura a animar
		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0
		bl circulosg1
		mov x1, #370            // coordenada x
    	mov x2, #204    		// coordenada y
		bl letra_o

		movz x3, 0x75, lsl 16   // defino el color
		movk x3, 0xfcfc, lsl 0
		bl circulosg2
		mov x1, #466            // coordenada x 
    	mov x2, #204    		// coordenada y    
		bl letra_d

		movz x3, 0xfb, lsl 16   // defino el color
		movk x3, 0xd65a, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560            // coordenada x 
 		mov x2, #204    		// coordenada y   
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
		mov x1, #370            // coordenada x 
    	mov x2, #204    		// coordenada y    
		bl letra_o

		movz x3, 0xfb, lsl 16   // defino el color
		movk x3, 0xd65a, lsl 0  // termino de definir un color
		bl circulosg2
		mov x1, #466            // coordenada x 
    	mov x2, #204    		// coordenada y    
		bl letra_d

		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560            // coordenada x 
 		mov x2, #204    		// coordenada y   
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
		mov x1, #370            // coordenada x
    	mov x2, #204    		// coordenada y    
		bl letra_o

		movz x3, 0xfc, lsl 16   // defino el color
		movk x3, 0x52f7, lsl 0  // termino de definir un color
		bl circulosg2
		mov x1, #466            // coordenada x
    	mov x2, #204    		// coordenada y    
		bl letra_d

		movz x3, 0x75, lsl 16   // defino el color
		movk x3, 0xfcfc, lsl 0  // termino de definir un color
		bl circulosg3
		mov x1, #560            // coordenada x 
 		mov x2, #204    		// coordenada y   
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
