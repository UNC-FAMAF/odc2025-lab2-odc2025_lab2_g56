//---------------------INCLUIMOS CONTANTES DEFINIDAS-------------------------------------

.include "constantes.s"

//---------------------DECLARAMOS RUTINAS COMO GLOBALES----------------------------------

.global arcade_fichas_in

//---------------------IMPORTAMOS RUTINAS EXTERNAS---------------------------------------

.extern pintar_pixel_minimo

//-----------------------------------------------------------------------------------------
arcade_fichas_in:
mov x25, lr
//Bordes
    movz x3, 0x41, lsl 16       // defino un color
    movk x3, 0x1C8E, lsl 0      // termino de definir un color
    add x1, x1, #55             // variable x
    add x2, x2, #27             // variable y
    mov x4, #16			        // alto
    mov x5, #21		            // ancho
    bl pintar_rectangulo_aux	// llamada a la subrutina
//Relleno 1
    mov x3, x11
    add x1, x1, #2              // variable x
    sub x2, x2, #14             // variable y
    mov x4, #12			        // alto
    mov x5, #7		            // ancho
    bl pintar_rectangulo_aux	// llamada a la subrutina
//Relleno 2
    mov x3, x11
    add x1, x1, #9              // variable x
    sub x2, x2, #12             // variable y
    mov x4, #12			        // alto
    mov x5, #8		            // ancho
    bl pintar_rectangulo_aux	// llamada a la subrutina
//Ranura moneda
    movz x3, 0x41, lsl 16       // defino un color
    movk x3, 0x1C8E, lsl 0      // termino de definir un color
    add x1, x1, #3              // variable x
    sub x2, x2, #10             // variable y
    mov x4, #7			        // alto
    mov x5, #2		            // ancho
    bl pintar_rectangulo_aux	// llamada a la subrutina

mov lr, x25
br lr
