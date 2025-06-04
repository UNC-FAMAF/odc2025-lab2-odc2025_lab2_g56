.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_fichas_in
// Importamos rutinas externas
.extern pintar_pixel_minimo

arcade_fichas_in:
mov x25, lr
//Bordes
movz x3, 0x41, lsl 16       // defino un color
movk x3, 0x1C8E, lsl 0      // termino de definir un color
add x1, x13, #55            // variable x
add x2, x14, #27            // variable y
mov x4, #16			        // alto
mov x5, #21		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina
//Relleno 1
mov x3, x11
add x1, x13, #57            // variable x
add x2, x14, #29            // variable y
mov x4, #12			        // alto
mov x5, #7		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina
//Relleno 2
mov x3, x11
add x1, x13, #66            // variable x
add x2, x14, #29            // variable y
mov x4, #12			        // alto
mov x5, #8		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina
//Ranura moneda
movz x3, 0x41, lsl 16       // defino un color
movk x3, 0x1C8E, lsl 0      // termino de definir un color
add x1, x13, #69            // variable x
add x2, x14, #31            // variable y
mov x4, #7			        // alto
mov x5, #2		            // ancho
bl pintar_rectangulo_aux	// llamada a la subrutina

mov lr, x25
br lr
