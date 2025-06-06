.global caracol
.extern pintar_rectangulo
.extern pintar_pixel_minimo
caracol:	
//e38a76

    mov x25,lr
    mov x13,x1
    mov x14,x2
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    add x1,x1,#14
    mov x4,#1
    mov x5,#6
    bl pintar_rectangulo
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    mov x4,#22
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#10
    add x2,x2,#2
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    mov x4,#21
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#8
    add x2,x2,#4
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#18
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#6
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#15
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#4
    add x2,x2,#8
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#11
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#2
    add x2,x2,#12
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#7
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x2,x2,#18
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#7
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#26
    add x2,x2,#2
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    mov x4,#21
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#30
    add x2,x2,#4
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#20
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#32
    add x2,x2,#6
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#5
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#15
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo


    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#44
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#14
    bl pintar_rectangulo
    sub x1,x1,#2
    bl pintar_pixel_minimo
//ojo
    mov x1,x13
    mov x2,x14
    add x1,x1,#34
    add x2,x2,#4
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#5
    bl pintar_rectangulo
    mov x4,#7
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    mov x4,#5
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    bl pintar_rectangulo
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    mov x5,#2
    mov x4,#12
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x5,#4
    mov x4,#1
    bl pintar_rectangulo


    mov x1,x13
    mov x2,x14
    add x1,x1,#36
    add x2,x2,#34
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#1
    bl pintar_rectangulo
    movz x3, 0xe3, lsl 16
	movk x3, 0x8a76, lsl 00
    bl pintar_rectangulo
    sub x2,x2,#2
    add x1,x1,#2
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    bl pintar_rectangulo

//ojo
    mov x1,x13
    mov x2,x14
    add x1,x1,#50
    add x2,x2,#4
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#5
    bl pintar_rectangulo
    mov x4,#7
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    mov x4,#5
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#9
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#4
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    bl pintar_rectangulo
//#66c0de




    mov x1,x13
    mov x2,x14
    add x1,x1,#48
    add x2,x2,#6
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#5
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#54
    add x2,x2,#18
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    mov x4,#13
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#50
    add x2,x2,#36
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#4
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#1
    mov x5,#4
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#56
    add x2,x2,#18
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#13
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#38
    add x2,x2,#16
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#9
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#10
    add x2,x2,#46
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    mov x4,#1
    mov x5,#23
    bl pintar_rectangulo
    add x1,x1,#2
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    mov x5,#10
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#6
    add x2,x2,#46
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    bl pintar_rectangulo
    add x1,x1,#4
    sub x2,x2,#2
    bl pintar_pixel_minimo

    mov x1,x13
    mov x2,x14
    add x1,x1,#32
    add x2,x2,#48
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    add x1,x1,#4
    mov x5,#10
    bl pintar_rectangulo
    sub x2,x2,#4
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    bl pintar_rectangulo
    sub x2,x2,#6
    sub x1,x1,#2
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    mov x5,#12
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#44
    add x2,x2,#6
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#5
    mov x5,#1
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#2
    bl pintar_rectangulo
    mov x4,#5
    add x1,x1,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#6
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#44
    add x2,x2,#6
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#5
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#40
    add x2,x2,#18
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo
    mov x4,#4
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    bl pintar_rectangulo
    sub x2,x2,#10
    add x1,x1,#2
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    mov x4,#5
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#5
    bl pintar_rectangulo
    mov x4,#2
    mov x5,#2
    bl pintar_rectangulo
    sub x2,x2,#2
    sub x1,x1,#2
    mov x4,#1
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#46
    add x2,x2,#30
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    mov x4,#5
    mov x5,#1
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#2
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#1
    mov x5,#4
    bl pintar_rectangulo
    movz x3, 0x66, lsl 16
	movk x3, 0xc0de, lsl 00
    add x1,x1,#6
    mov x5,#1
    bl pintar_rectangulo
    movz x3, 0xc4, lsl 16
	movk x3, 0xe067, lsl 00
    mov x5,#2
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    bl pintar_rectangulo
    sub x2,x2,#4
    add x1,x1,#4
    mov x5,#1
    bl pintar_rectangulo
    sub x2,x2,#4
    sub x1,x1,#2
    bl pintar_rectangulo
    sub x2,x2,#42
    add x1,x1,#2
    mov x4,#5
    bl pintar_rectangulo


    mov x1,x13
    mov x2,x14
    add x1,x1,#38
    add x2,x2,#8
    movz x3, 0xd4, lsl 16
	movk x3, 0x5122, lsl 00
    mov x4,#3
    mov x5,#3
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    sub x2,x2,#4
    add x1,x1,#4
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x1,x1,#54
    add x2,x2,#8
    movz x3, 0xd4, lsl 16
	movk x3, 0x5122, lsl 00
    mov x4,#3
    mov x5,#3
    bl pintar_rectangulo
    movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
    sub x2,x2,#4
    add x1,x1,#4
    mov x4,#2
    mov x5,#1
    bl pintar_rectangulo
    //#d45122
    //#c4e067
//linea horizontal 1
   
//retorno
    mov lr,x25
    br lr 
//termina archivo
