.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_fichas_out
// Importamos rutinas externas
.extern pintar_rectangulo_aux

arcade_fichas_out:
mov x25, lr
//Bordes
movz x3, 0x41, lsl 16       // defino un color
movk x3, 0x1C8E, lsl 0      // termino de definir un color
add x1, x1, #55            // variable x
add x2, x2, #45            // variable y
mov x4, #16			        // alto
mov x5, #21		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina
//Relleno 1
mov x3, x11
add x1, x1, #2            // variable x
sub x2, x2, #14            // variable y
mov x4, #12			        // alto
mov x5, #17		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina

mov lr, x25
br lr
