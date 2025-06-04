.include "constantes.s"

// Declaramos rutinas como globales
.global arcade_botones_frontales
// Importamos rutinas externas
.extern pintar_circulo
.extern pintar_circunferencia 

arcade_botones_frontales:
mov x25, lr

//Boton central
    //Relleno
    add x1, x1, #40            // variable x
    add x2, x2, #10            // variable y
    mov x6, #4                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
    //Bordes
    movz x3, 0x41, lsl 16       // defino un color
	movk x3, 0x1C8E, lsl 0      // termino de definir un color
    add x1, x1, #40            // variable x
    add x2, x2, #10            // variable y
    mov x6, #4                  // radio
    bl pintar_circunferencia    // llamada a la subrutina

mov lr, x25
br lr
