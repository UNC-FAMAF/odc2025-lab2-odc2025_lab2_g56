.global letra_o
.global letra_d
.global letra_c
.global numero_2
.global numero_0
.global numero_5

.extern pintar_rectangulo
.extern pintar_pixel_minimo
    /*movz x3, 0xFF, lsl 16
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
*/

letra_o:
    mov x25,lr
    mov x13,x1
    mov x14,x2
// linea horizonal 1
    add x1,x1,#4
    mov x4,#1
    mov x5,#9
    bl pintar_rectangulo
// mini rectangulitos 1
    mov x1,x13
    mov x2,x14
    add x1,x1,#2
    add x2,x2,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x2,x2,#2
    add x1,x1,#18
    bl pintar_rectangulo
//  lineas verticales
    mov x1,x13
    mov x2,x14
    add x2,x2,#4
    mov x4,#13
    mov x5,#2
    bl pintar_rectangulo

    mov x1,x13
    mov x2,x14
    add x2,x2,#4
    add x1,x1,#22
    bl pintar_rectangulo
// mini rectangulitos 2
    mov x1,x13
    mov x2,x14
    add x1,x1,#2
    add x2,x2,#30
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x2,x2,#2
    add x1,x1,#18
    bl pintar_rectangulo
// linea horizontal 2
    mov x1,x13
    mov x2,x14
    add x1,x1,#4
    add x2,x2,#32
    mov x4,#1
    mov x5,#9
    bl pintar_rectangulo

    mov lr,x25
    br lr 

letra_d:
    mov x25,lr
    mov x13,x1
    mov x14,x2
//linea horizontal 1
    mov x4,#1
    mov x5,#8
    bl pintar_rectangulo
    mov x1,x13
    mov x2,x14
    add x1,x1,#16
    bl pintar_pixel_minimo
//linea horizontal 2
    mov x1,x13
    mov x2,x14
    add x2,x2,#32
    mov x4,#1
    mov x5,#8
    bl pintar_rectangulo
    mov x1,x13
    mov x2,x14
    add x2,x2,#32
    add x1,x1,#16
    bl pintar_pixel_minimo
//linea vertical 1
    mov x1,x13
    mov x2,x14
    mov x4,#17
    mov x5,#2
    bl pintar_rectangulo
 //diagonal de arriba hacia abajo
    mov x1,x13
    mov x2,x14
    add x1,x1,#16
    add x2,x2,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    
    mov x1,x13
    mov x2,x14
    add x1,x1,#18
    add x2,x2,#4
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
     
    mov x1,x13
    mov x2,x14
    add x1,x1,#20
    add x2,x2,#6
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//diagonal de abajo hacia arriba
    mov x1,x13
    mov x2,x14
    add x1,x1,#16
    add x2,x2,#30
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    
    mov x1,x13
    mov x2,x14
    add x1,x1,#18
    add x2,x2,#28
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    
    mov x1,x13
    mov x2,x14
    add x1,x1,#20
    add x2,x2,#26
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//linea vertical 2
    mov x1,x13
    mov x2,x14
    add x1,x1,#22
    add x2,x2,#8
    mov x4,#9
    mov x5,#2
    bl pintar_rectangulo

    mov lr,x25
    br lr 

letra_c:
    mov x25,lr
    mov x13,x1
    mov x14,x2
// linea horizonal 1 y "escalerita" hacia atras
    add x1,x1,#4
    mov x4,#1
    mov x5,#11
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#3
    bl pintar_rectangulo
    sub x1,x1,#2
    bl pintar_rectangulo
//linea vertical
    mov x1,x13
    mov x2,x14
    add x2,x2,#6
    mov x4,#11
    mov x5,#2
    bl pintar_rectangulo
//escalerita hacia adelante
    mov x4,#1
    mov x5,#3
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#1
    mov x5,#3
    bl pintar_rectangulo
//linea horizontal
    add x1,x1,#2
    mov x4,#1
    mov x5,#11
    bl pintar_rectangulo

    
//
    



































    mov lr,x25
    br lr 

numero_2:
    mov x25,lr

    mov lr,x25
    br lr 
numero_0:
    mov x25,lr

    mov lr,x25
    br lr 
numero_5:
    mov x25,lr

    mov lr,x25
    br lr 
























//mov color
//pintas circulo

//mov color
//
