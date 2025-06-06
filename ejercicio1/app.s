//---------------------INCLUIMOS CONTANTES DEFINIDAS-------------------------------------
.include "constantes.s"
//---------------------DECLARAMOS RUTINAS COMO GLOBALES----------------------------------
.globl main
// Importamos rutinas externas
.extern imagen_estatica

//---------------------------------------------------------------------------------------
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
//---------------------------------------------------------------------------------------
//-----------------------------------MAIN------------------------------------------------
main:
 	mov x20, x0				    		// Guarda la direccion base del framebuffer en x20
	mov x19, SCREEN_WIDTH 	    		// Guarda el ancho de la pantalla en x19

//----------------------------------CODIGO-----------------------------------------------

	bl imagen_estatica

InfLoop:
	b InfLoop

//---------------------------------------------------------------------------------------
//-------------------------------FINAL DEL CODIGO----------------------------------------
