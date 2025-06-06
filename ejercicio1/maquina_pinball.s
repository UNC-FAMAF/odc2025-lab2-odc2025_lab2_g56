.include "constantes.s"
//--------------------DECLARAMOS RUTINAS COMO GLOBALES-------------------
.global maquina_pinball
//--------------------IMPORTAMOS RUTINAS NECESARIAS----------------------
.extern pintar_circulo
.extern pintar circunferencia
.extern pintar_rectangulo
.extern pintar_rectangulo_aux
.extern pintar_escaleritas
//------------------------------------------------------------------------
//rutina maquina pinball
maquina_pinball:
    mov x22,lr
    mov x13,x1
    mov x14,x2
//pata 1
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#2
    add x2,x2,#24
    mov x4,#24    
    mov x5,#5     
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#4
    add x2,x2,#26
    mov x4,#22  
    mov x5,#3   
    bl pintar_rectangulo

//pata 2
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    add x2,x2,#24
    mov x4,#24    
    mov x5,#5     
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#62
    add x2,x2,#26
    mov x4,#22  
    mov x5,#3   
    bl pintar_rectangulo

//pata 3
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#46
    add x2,x2,#24
    mov x4,#18  
    mov x5,#5   
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#48
    add x2,x2,#26
    mov x4,#16  
    mov x5,#3   
    bl pintar_rectangulo

//pata 4
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#120
    sub x2,x2,#4
    mov x4,#31    
    mov x5,#5     
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#122
    mov x4,#28  
    mov x5,#3   
    bl pintar_rectangulo

//paralelogramo 1
    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    sub x2,x2,#2
    mov x7,#7
    mov x15,#72
    mov x21, #2
    bl pintar_escaleritas

    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    sub x2,x2,#2
    mov x7,#7
    mov x15,#12
    bl pintar_escaleritas

//paralelogramo 2
    movz x3, 0x00, lsl 16
	movk x3, 0x66CC, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    sub x2,x2,#2
    mov x7,#7
    mov x15,#12
    mov x21,#26
    bl pintar_escaleritas

    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    sub x2,x2,#2
    mov x7,#7
    mov x15,#12
    mov x21,#2
    bl pintar_escaleritas
    
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#60
    add x2,x2,#24
    mov x7,#7
    mov x15,#12
    bl pintar_escaleritas

//frente de la maquina
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    mov x4,#13
    mov x5,#32
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#2
    add x2,x2,#2
    mov x4,#11
    mov x5,#30
    bl pintar_rectangulo

    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#132
    sub x2,x2,#86
    mov x4,#50 
    mov x5,#1   
    bl pintar_rectangulo
    
//pantalla
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#66
    sub x2,x2,#88
    mov x4,#38  
    mov x5,#34  
    bl pintar_rectangulo

    movz x3, 0x91, lsl 16
	movk x3, 0x33ED, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#68
    sub x2,x2,#86
    mov x4,#36  
    mov x5,#32  
    bl pintar_rectangulo

    movz x3, 0x6D, lsl 16
	movk x3, 0xEEF4, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#72
    sub x2,x2,#82
    mov x4,#32  
    mov x5,#28  
    bl pintar_rectangulo

//detallitos

    //primer "OJO" de la maquina
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#12
    add x2,x2,#11
    mov x6,#4
    bl pintar_circulo

    movz x3, 0xFF, lsl 16
	movk x3, 0xDA47, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#3
    add x2,x2,#3
    mov x6,#2
    bl pintar_circulo
    
    //segundo "OJO" de la maquina
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#36
    add x2,x2,#2
    mov x6,#4
    bl pintar_circulo

    movz x3, 0xFF, lsl 16
	movk x3, 0xDA47, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#3
    add x2,x2,#3
    mov x6,#2
    bl pintar_circulo

    //parte externa de la "BOCA"
    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    sub x1,x1,#23
    add x2,x2,#3
    mov x6,#3
    bl pintar_circulo

    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#15
    add x2,x2,#2
    mov x6,#3
    bl pintar_circulo


    movz x3, 0x26, lsl 16
	movk x3, 0x00AF, lsl 00
    mov x1,x13
    mov x2,x14
    sub x1,x1,#10
    sub x2,x2,#1
    mov x4,#7  
    mov x5,#12 
    bl pintar_rectangulo_aux

    //parte interna de la "BOCA"
    movz x3, 0xFF, lsl 16
	movk x3, 0x54EB, lsl 00
    mov x1,x13
    mov x2,x14
    sub x1,x1,#11
    add x2,x2,#2
    mov x6,#1
    bl pintar_circulo
    
    movz x3, 0xFF, lsl 16
	movk x3, 0x54EB, lsl 00
    mov x1,x13
    mov x2,x14
    add x1,x1,#13
    add x2,x2,#1
    mov x6,#1
    bl pintar_circulo

    movz x3, 0xFF, lsl 16
	movk x3, 0x54EB, lsl 00
    mov x1,x13
    mov x2,x14
    sub x1,x1,#12
    mov x4,#3
    mov x5,#12
    bl pintar_rectangulo_aux
//retorno
    mov lr,x22
    br lr
//------------------------------------------------------------------------
