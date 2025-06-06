.include "constantes.s"

.global adorno_luminoso

.extern pintar_pixel_minimo
.extern pintar_rectangulo
.extern pintar_rectangulo_aux

//pintar pixel minimo usa x10 x11 x12 x9
adorno_luminoso:
    sub sp, sp, #8
    stur lr, [sp]
//cuerpo
	movz x3, 0xFF, lsl 16
	movk x3, 0xDB4D, lsl 00
    
    mov x26,lr
    mov x13,x1
    mov x14,x2
//recuadro
    mov x7,#48
    loop_adorno_1:
        bl pintar_pixel_minimo
        add x1,x1,#4
        sub x7,x7,#1
        cbnz x7, loop_adorno_1
        
    mov x1,x13
    mov x2,x14
    add x2,x2,#40
    mov x7,#48
    loop_adorno_2:
        bl pintar_pixel_minimo
        add x1,x1,#4
        sub x7,x7,#1
        cbnz x7, loop_adorno_2

    mov x1,x13
    mov x2,x14
    mov x7,#10
    loop_adorno_3:
        bl pintar_pixel_minimo
        add x2,x2,#4
        sub x7,x7,#1
        cbnz x7, loop_adorno_3

    mov x1,x13
    mov x2,x14
    mov x7,#10
    add x1,x1,#188
    loop_adorno_4:
        bl pintar_pixel_minimo
        add x2,x2,#4
        sub x7,x7,#1
        cbnz x7, loop_adorno_4

//--------------
//dibujos
//primera fila
    movz x3, 0xFF, lsl 16
	movk x3, 0x57EE, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo

    movz x3, 0x78, lsl 16
	movk x3, 0xF8FF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    add x2,x2,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
    movz x3, 0xFF, lsl 16
	movk x3, 0x57EE, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#120
    add x2,x2,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
    movz x3, 0x78, lsl 16
	movk x3, 0xF8FF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#180
    add x2,x2,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo 
//----------------------------
//segunda fila
	movz x3, 0xFF, lsl 16
	movk x3, 0xDB4D, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#17
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo

    movz x3, 0xFF, lsl 16
	movk x3, 0x57EE, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    add x2,x2,#17
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
	movz x3, 0xFF, lsl 16
	movk x3, 0xDB4D, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#120
    add x2,x2,#17
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
    movz x3, 0xFF, lsl 16
	movk x3, 0x57EE, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#180
    add x2,x2,#17
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo

//tercera fila
    movz x3, 0x78, lsl 16
	movk x3, 0xF8FF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#30
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo

	movz x3, 0xFF, lsl 16
	movk x3, 0xDB4D, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    add x2,x2,#30
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
    movz x3, 0x78, lsl 16
	movk x3, 0xF8FF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#120
    add x2,x2,#30
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo

	movz x3, 0xFF, lsl 16
	movk x3, 0xDB4D, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#180
    add x2,x2,#30
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    add x1,x1,#4
    bl pintar_pixel_minimo
    sub x1,x1,#2
    add x2,x2,#2
    bl pintar_pixel_minimo
    
    ldur lr, [sp] 
    add sp, sp, #8
    br lr






    




































    mov lr,x26

br lr
