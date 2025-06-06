//---------------------INCLUIMOS CONTANTES DEFINIDAS-------------------------------------

.include "constantes.s"

//---------------------DECLARAMOS RUTINAS COMO GLOBALES----------------------------------
.global arcade_botones_frontales_bordes
.global arcade_botones_frontales_relleno
//---------------------IMPORTAMOS RUTINAS EXTERNAS---------------------------------------
.extern pintar_circulo

arcade_botones_frontales_bordes:
mov x25, lr
    //boton2
    add x1, x1, #40             // variable x
    add x2, x2, #10             // variable y
    mov x6, #6                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
    //boton3
    add x1, x1, #23             // variable x
    mov x6, #6                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
    //boton1
    sub x1, x1, #46             // variable x
    mov x6, #6                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
mov lr, x25
br lr

arcade_botones_frontales_relleno:
mov x25, lr
    //boton2
    add x1, x1, #40             // variable x
    add x2, x2, #10             // variable y
    mov x6, #4                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
    //boton3
    add x1, x1, #23             // variable x
    mov x6, #4                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
    //boton1
    sub x1, x1, #46             // variable x
    mov x6, #4                  // Radio
    bl pintar_circulo	        // llamada a la subrutina
mov lr, x25
br lr
