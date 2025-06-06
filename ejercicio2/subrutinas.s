//---------------------INCLUIMOS CONSTANTES DEFINIDAS------------------------------------
.include "constantes.s"
//---------------------DECLARAMOS RUTINAS COMO GLOBALES----------------------------------
.global calcular_direccion
.global pintar_fondo
.global pintar_pixel_minimo
.global pintar_rectangulo
.global pintar_punto
.global pintar_rectangulo_aux
.global pintar_circunferencia
.global pintar_circulo
.global pintar_escaleritas
.global delay
.global backup_rectangulo
.global restore_rectangulo
//------------------------------------SUB-RUTINAS----------------------------------------

// ------------CALCULAR DIRECCION DE MEMORIA DEL PIXEL EN FUNCIÓN DE (x, y)--------------
calcular_direccion: 
	mul x0, x2, x19                 // (y * 640)
	add x0,	x0, x1                  // [x + (y * 640)]
	lsl x0, x0, #2                  // 4 * [x + (y * 640)]
	add x0, x0, x20                 // Dirección de inicio + 4 * [x + (y * 640)]
	br lr							

// ------------------------ PINTAR FONDO PLANO (color) ----------------------------------
pintar_fondo:
		mov x2, SCREEN_HEIGHT       // contador Y
	loop_1_fondo:
		mov x1, SCREEN_WIDTH        // contador X
	loop_0_fondo:
		stur w3, [x0]  		        // colorear el pixel N
		add x0, x0, 4	   	        // siguiente pixel
		sub x1, x1, 1	   	        // decrementar contador X
		cbnz x1, loop_0_fondo       // si no terminó la fila, salto
		sub x2, x2, 1	  	        // decrementar contador Y
		cbnz x2, loop_1_fondo       // si no es la última fila, salto
	br lr		   					// retorno

// ----------------------PINTAR UN PIXEL DEL TAMAÑO TAM_PIXEL----------------------------
pintar_pixel_minimo:
		mov x27, lr 				// guardamos direccion de retorno a main
		bl calcular_direccion		// DirIniPintar = DirInicioFramBuf + 4 * [x + (y * 640)]
		mov lr, x27 				// restablecemos la direccion del main para poder volver
		mov x12, x10 				// resguardo valores temp de contador
		mov x11, x9					// resguardo valores temp de contador
		mov x10, TAM_PIXEL          // establecemos X10 como contador Y Size --> Alto
	loop_1_pixel:
		mov x9, TAM_PIXEL			// establecemos X9 como contador X Size --> Ancho
	loop_0_pixel:
		stur w3, [x0]   			// colorear el pixel N
		add x0, x0, 4	    		// siguiente pixel
		sub x9, x9, 1	    		// decrementar contador X
		cbnz x9, loop_0_pixel   	// si no terminó la fila, salto
		sub x10, x10, 1				// decrementar contador Y
		add x2, x2, 1 				// (y + 1) Pasamos a la fila siguiente 
		mov x27, lr 				// resguardamos direccion del main para poder regresar
		bl calcular_direccion		// calcular_direccion(x, y+1, color)
		mov lr, x27 				// restablecemos la direccion del main para volver
		cbnz x10,loop_1_pixel 	    // si no es la última fila, salto
		mov x10, x12 				// restablezco valores temp de contador
		mov x9, x11					// restablezco valores temp de contador
		sub x2, x2, TAM_PIXEL       // restauro el valor de x2
br lr 

// ------------------PINTAR UN RECTANGULO DE PIXELES DE TAMAÑO TAM_PIXEL--------------------
pintar_rectangulo:
		mov x27, lr 				// Guardamos direccion del main para saltar de nuevo
		bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
		mov lr, x27 				// Restablecemos la direccion del main para poder volver
		mov x15, x1 				// Resguardo dir de x en x15 para recup referencia inicio para pintar 
		mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
	loop_1_rectangulo:
		mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
	loop_0_rectangulo:		
		mov x26, lr 				// Guardamos direccion del main para saltar de nuevo
		bl pintar_pixel_minimo		// Pintamos pixel con el pincel
		mov lr, x26 				// Restablecemos la direccion del main para poder volver
		add x1, x1, TAM_PIXEL 		// Siguiente pixel coordenada x avanzamos de a tam_pixel
		mov x27, lr 				// Guardamos direccion del main para saltar de nuevo
		bl calcular_direccion		// Restablezco la direccion de referencia x0 para ese "pixel"
		mov lr, x27 				// Restablecemos la direccion del main para poder volver
		sub x9, x9, 1	    		// Decrementar contador X
		cbnz x9, loop_0_rectangulo  // Si no terminó la fila, salto
		sub x10, x10, 1				// Decrementar contador Y
		mov x1, x15					// Restablezco referencia para pintar
		add x2, x2, TAM_PIXEL 		// Pasamos a la fila siguiente 
		mov x27, lr 				// Resguardamos direccion del main para poder regresar
		bl calcular_direccion		// cal_dir(x, y+1, color)
		mov lr, x27 				// Restablecemos la direccion del main para volver
		cbnz x10,loop_1_rectangulo 	// Si no es la última fila, salto
br lr 
// -----------------------------------PINTAR UN PIXEL 1X1-----------------------------------
pintar_punto:
	mov x21,lr
	bl calcular_direccion
	mov lr, x21
	stur w3,[x0]
	br lr

// --------------------PINTAR UN RECTANGULO DE PIXELES DE TAMAÑO 1X1------------------------
pintar_rectangulo_aux:
		mov x24,lr
		bl calcular_direccion
		mov lr, x24
		mov x9,x4 //contador con altura ingresada
	loop_2_rectangulo_aux:
		mov x10,x5 //contador con ancho ingresado
	loop_1_rectangulo_aux:
		stur w3,[x0]
		add x0,x0,4
		sub x10,x10,1
		cbnz x10,loop_1_rectangulo_aux
		add x2,x2,1
		sub x9,x9,1
		mov x24,lr
		bl calcular_direccion
		mov lr, x24
		cbnz x9,loop_2_rectangulo_aux
		br lr

// ------------------------------PINTAR UNA CIRCUNFERENCIA---------------------------------
pintar_circunferencia:
		mov x7, #0                      // x = 0
		mov x8, x6                      // y = r
		mov x11, #3                     // x11 = 3
		lsl x12, x6, #1                 // x12 = 2 * r (shift lógico a la izquierda por 1 bit)
		sub x11, x11, x12               // x11 = 3 - 2*r = d
		mov x27, lr                     // Guardo punto de retorno a main
//algoritmo de bresenham
	//ciclo while bresenham
	ciclo_bresenham:
		bl dibujar_octantes
		cmp x7, x8
		b.ge fin_circunferencia
		cmp x11, #0
		b.le continuar_misma_y
		sub x12,x7,x8 
		lsl x12,x12,#2 
		add x11,x11,x12
		add x11, x11, #10
		add x7,x7,#1
		sub x8,x8,#1
		b ciclo_bresenham
	continuar_misma_y:
		lsl x12,x7,#2
		add x11,x11,x12
		add x11,x11,#6
		add x7,x7,#1
		b ciclo_bresenham
	//retorno
	fin_circunferencia:
		mov lr, x27
		br lr
	//dibujo de puntos de la circunferencia
	dibujar_octantes:
	// centro x1 = cx, x2 = cy, x3 = color
		mov x26,lr                      //guardo direccion de retorno a bl dibujar_octantes
		mov x10, x1                     // cx
		mov x12, x2                     // cy	
		// punto 1: (cx + x, cy + y)
		add x13, x10, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14			
		bl pintar_punto
		// punto 2: (cx - x, cy + y)
		sub x13, x10, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 3: (cx + x, cy - y)
		add x13, x10, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 4: (cx - x, cy - y)
		sub x13, x10, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 5: (cx + y, cy + x)
		add x13, x10, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 6: (cx - y, cy + x)
		sub x13, x10, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 7: (cx + y, cy - x)
		add x13, x10, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		// punto 8: (cx - y, cy - x)
		sub x13, x10, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
		mov x1,x10                          //reestablzco xc original
		mov x2,x12                          //reestablezco yc original
		mov lr, x26                         //reestablezco posicion de retorno
		br lr                               //retorno

// -----------------------------------PINTAR UN CIRCULO -----------------------------------
pintar_circulo:
		mov x7, #0                          // x = 0
		mov x8, x6                          // y = r
		mov x11, #3                         // x11 = 3
		lsl x12, x6, #1                     // x12 = 2 * r (shift lógico a la izquierda por 1 bit)
		sub x11, x11, x12                   // x11 = 3 - 2*r = d
		mov x27, lr                         // Guardo punto de retorno a main
//algoritmo de bresenham
	//ciclo while bresenham
	ciclo_bresenham_circulo:
		bl dibujar_octantes_circulo
		cmp x7, x8
		b.ge fin_circulo
		cmp x11, #0
		b.le continuar_misma_y_circulo
		sub x12,x7,x8 
		lsl x12,x12,#2 
		add x11,x11,x12
		add x11, x11, #10
		add x7,x7,#1
		sub x8,x8,#1
		b ciclo_bresenham_circulo
	continuar_misma_y_circulo:
		lsl x12,x7,#2
		add x11,x11,x12
		add x11,x11,#6
		add x7,x7,#1
		b ciclo_bresenham_circulo
	//retorno
	fin_circulo:
		mov lr, x27
		br lr
	//dibujo de puntos de la circunferencia
	dibujar_octantes_circulo:
	// centro x1 = cx, x2 = cy, x3 = color
		mov x26,lr                          // Guardo direccion de retorno a bl dibujar_octantes
		mov x23, x1                         // cx
		mov x12, x2                         // cy
	// punto 1: (cx + x, cy + y)
		add x13, x23, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto
	// punto 2: (cx - x, cy + y)
		sub x13, x23, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14
		sub x15,x23,x1
		mov x4,#1
		add x15,x15,1
		lsl x15, x15,#1
		mov x5,x15
		bl pintar_rectangulo_aux
	// punto 3: (cx + x, cy - y)
		add x13, x23, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto
	// punto 4: (cx - x, cy - y)
		sub x13, x23, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_rectangulo_aux
	// punto 5: (cx + y, cy + x)
		add x13, x23, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
	// punto 6: (cx - y, cy + x)
		sub x13, x23, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		sub x15,x23,x1
		mov x4,#1
		add x15,x15,1
		lsl x15, x15,#1
		mov x5,x15
		bl pintar_rectangulo_aux
	// punto 7: (cx + y, cy - x)
		add x13, x23, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto
	// punto 8: (cx - y, cy - x)
		sub x13, x23, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_rectangulo_aux
		mov x1,x23                              //reestablzco xc original
		mov x2,x12                              //reestablezco yc original
		mov lr, x26                             //reestablezco posicion de retorno
		br lr                                   //retorno

// ----------------------------------DIBUJAR UNA DIAGONAL----------------------------------
pintar_escaleritas:
		mov x26, lr
		mov x4, x21	//ancho escaleritas
		mov x5, x15	//altura escaleritas
	loop_escaleritas: 
		mov x11, x1
		mov x12, x2
		bl pintar_rectangulo_aux
		mov x1,x11
		mov x2,x12
		add x1,x1,#10
		sub x2,x2,#2
		sub x7,x7,#1
		cbnz x7,loop_escaleritas
//retorno
	mov lr,x26
	br lr

//-------------------------------------FUNCIÓN DELAY---------------------------------------
delay:
	sub x10, x10, #1
	cbnz x10, delay
	br lr

//---------------------------------------BACKUP--------------------------------------------
backup_rectangulo:
	mov x24,lr
//calculo memoria a reservar para el backup
	mul x7, x4, x5
	mov x8, #8
	mul x7, x7, x8
//reservo memoria para el backup de pixels
	sub sp, sp, x7
//reservo memoria para el backup de registros
	mov x6, sp
	sub sp, sp, #72       
	stur x1, [sp, #0]
	stur x2, [sp, #8]
	stur x4, [sp, #16]
	stur x5, [sp, #24]
	stur x6, [sp, #32]
	stur x7, [sp, #40]
	stur x9, [sp, #48]
	stur x10, [sp, #56]
	stur x3, [sp, #64]
	mov x9, x4 					         	//Contador con altura ingresada
	mov x7, #0					         	//Contador de offset
    loop_2_backup_rectangulo:
        bl calcular_direccion
        mov x10,x5 					        //Contador con ancho ingresado
    loop_1_backup_rectangulo:
        ldr x3, [x0]
        str x3,[x6, x7]
        add x7, x7, #8				        //Incremento el offset en 4 posiciones (Lo ocupado por un color)
        add x0,x0,4
        sub x10,x10,1
        cbnz x10,loop_1_backup_rectangulo
        add x2,x2,1
        sub x9,x9,1
        cbnz x9,loop_2_backup_rectangulo
//libero memoria para el backup de registros
	ldur x1, [sp, #0]
	ldur x2, [sp, #8]
	ldur x7, [sp, #40]
	ldur x9, [sp, #48]
	ldur x10, [sp, #56]
	ldur x3, [sp, #64]
//retorno
	mov lr, x24
	br lr

// ---------------------------------------RESTORE------------------------------------------
restore_rectangulo:
	mov x24,lr
//reservamos memoria para el backup de registros
	ldur x1, [sp, #0]
	ldur x2, [sp, #8]
	ldur x4, [sp, #16]
	ldur x5, [sp, #24]
	ldur x6, [sp, #32]
	mov x9,x4 					              //Contador con altura ingresada
	mov x7, #0					              //Contador de offset   
	loop_2_restore_rectangulo:
		bl calcular_direccion
		mov x10,x5 					          //Contador con ancho ingresado
	loop_1_restore_rectangulo:
		ldr x3,[x6, x7]
		stur x3, [x0]
		add x7, x7, #8				          //Incremento el offset en 4 posiciones (Lo ocupado por un color)
		add x0,x0,4
		sub x10,x10,1
		cbnz x10,loop_1_restore_rectangulo
		add x2,x2,1
		sub x9,x9,1
		cbnz x9,loop_2_restore_rectangulo
//restauro todos los registros usados:
	ldur x1, [sp, #0]
	ldur x2, [sp, #8]
	ldur x4, [sp, #16]
	ldur x5, [sp, #24]
	ldur x6, [sp, #32]
	ldur x9, [sp, #48]
	ldur x10, [sp, #56]
	ldur x3, [sp, #64]
//calculo memoria reservada para el backup:
	mul x7, x4, x5
	mov x8, #8
	mul x7, x7, x8
//libero memoria
	add x7, x7, 64
	add sp, sp, x7
//retorno
	mov lr, x24
	br lr
// --------------------------------------------------------------------------------------
