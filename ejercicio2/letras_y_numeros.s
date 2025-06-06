.global letra_o
.global letra_d
.global letra_c
.global numero_0
.global numero_2
.global numero_5
.extern pintar_rectangulo
.extern pintar_pixel_minimo

//_______________________________________________________________________________________________

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
//retorno
    mov lr,x25
    br lr 
//_______________________________________________________________________________________________
//_______________________________________________________________________________________________
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
//retorno
    mov lr,x25
    br lr 
//_______________________________________________________________________________________________
//_______________________________________________________________________________________________
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
//retorno
    mov lr,x25
    br lr 
//_______________________________________________________________________________________________
//_______________________________________________________________________________________________
numero_0:
    mov x25,lr
    mov x13,x1
    mov x14,x2
//primera mitad del 0, como si fuera una C
    add x1,x1,#2
    mov x4,#1
    mov x5,#4
    //linea horizontal de arriba
    bl pintar_rectangulo
    add x1,x1,#8
    sub x2,x2,#2
    bl pintar_pixel_minimo
    //rectangulito 1x2 arriba
    mov x1,x13
    mov x2,x14
    add x2,x2,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    //linea vertical larga 
    mov x4,#8
    mov x5,#1
    bl pintar_rectangulo
    //rectangulito 1x2 abajo
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    //linea horizontal de abajo
    add x1,x1,#2
    mov x4,#1
    mov x5,#5
    bl pintar_rectangulo
//termina primera mitad del 0

//completo la parte derecha del 0
    mov x1,x13
    mov x2,x14
    add x2,x2,#2
    add x1,x1,#10
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    add x1,x1,#2
    mov x4,#8
    mov x5,#1
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//retorno
    mov lr,x25
    br lr 
//_______________________________________________________________________________________________
//_______________________________________________________________________________________________
numero_2:
    mov x25,lr
    mov x13,x1
    mov x14,x2
// linea horizontal 1
    add x1,x1,#2
    mov x4,#1
    mov x5,#4
    bl pintar_rectangulo
    add x1,x1,#8
    sub x2,x2,#2
    bl pintar_pixel_minimo
//rectangulitos para dar forma arriba
    mov x1,x13
    mov x2,x14
    add x2,x2,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x2,x2,#2
    add x1,x1,#10
    bl pintar_rectangulo
//puntito
    mov x1,x13
    mov x2,x14
    add x2,x2,#4
    bl pintar_pixel_minimo
//palito vertical del 2
    mov x1,x13
    mov x2,x14
    add x1,x1,#12
    add x2,x2,#4
    mov x4,#3
    mov x5,#1
    bl pintar_rectangulo
//escalerita hacia abajo a la izquierda
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//base del 2
    mov x4,#1
    mov x5,#7
    bl pintar_rectangulo
//retorno
    mov lr,x25
    br lr 
//_______________________________________________________________________________________________
//_______________________________________________________________________________________________
numero_5:
    mov x25,lr
    mov x13,x1
    mov x14,x2
//linea horizontal 1
    mov x4,#1
    mov x5,#7
    bl pintar_rectangulo
//linea vertical 1
    mov x4,#4
    mov x5,#1
    bl pintar_rectangulo
//linea horizontal 2
    mov x4,#1
    mov x5,#6
    bl pintar_rectangulo
//rectangulito 1
    add x1,x1,#10
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//linea vertical 2
    add x1,x1,#2
    mov x4,#3
    mov x5,#1
    bl pintar_rectangulo
//rectangulito 2
    sub x1,x1,#2
    mov x4,#1
    mov x5,#2
    bl pintar_rectangulo
//linea horizontal 2
    mov x1,x13
    mov x2,x14
    add x2,x2,#22
    mov x4,#1
    mov x5,#6
    bl pintar_rectangulo
//retorno
    mov lr,x25
    br lr 
//termina archivo
