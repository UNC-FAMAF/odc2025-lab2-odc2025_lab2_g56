//---------------------INCLUIMOS CONSTANTES DEFINIDAS-------------------------------------
.include "constantes.s"
//---------------------DECLARAMOS RUTINAS COMO GLOBALES-----------------------------------
.globl main
//------------------------IMPORTAMOS RUTINAS EXTERNAS-------------------------------------
.extern imagen_estatica

//----------------------------------------------------------------------------------------
// CONVENCIONES PARA EL PROYECTO:
	// x0 lo utilizamos para pintar el framebuffer
	// (x1, x2) = coordenadas (x, y) de un pixel para rutinas 
	// x3 = color a pintar
	// x4, x5, x6 = parametros alto, ancho, radio para rutinas
//---------------------------------------------------------------------------------------

//-----------------------------------MAIN------------------------------------------------
main:
 	mov x20, x0				    		// Guarda la direccion base del framebuffer en x20
	mov x19, SCREEN_WIDTH 	    		// Guarda el ancho de la pantalla en x19

	bl imagen_estatica

//--------------------------------------------------------------------------------------

InfLoop:
	b InfLoop

//-------------------------------FINAL DEL CODIGO----------------------------------------
