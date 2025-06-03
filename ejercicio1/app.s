//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

//----------------------------------------------------------------------------------

// Declaramos rutinas como globales
.globl main
.global pintar_pixel_minimo
.global calcular_direccion
.global pintar_rectangulo
.global pintar_punto
.global pintar_circunferencia
.global pintar_circulo
.global pintar_rectangulo_aux
.global pintar_escaleritas
.extern maquina_pinball
// Importamos rutinas externas
.extern arcade
.extern cartel

//----------------------------------------------------------------------------------
	// CONVENCIONES:
	// x0 lo utilizamos para pintar el framebuffer
	// (x1, x2) = coordenadas (x, y) de un pixel para rutinas 
	// x3 = color a pintar
	// x4, x5, x6 = parametros alto, ancho, radio para rutinas
	//x7 = cantidad
	// x9 - x15  temporales de uso general
	// x19 Guarda el ancho de la pantalla
	// x20 Guarda la dirección base del framebuffer
	// x26,...,x21 Guarda temporalmente direcciones de memoria para hacer branch
	// x27 Guarda direccion de memoria para hacer salto a main
//----------------------------------------------------------------------------------


main:
 	mov x20, x0				    // Guarda la direccion base del framebuffer en x20
	mov x19, SCREEN_WIDTH 	    		// Guarda el ancho de la pantalla en x19
//---------------------------------------- CODIGO ------------------------------------
//  PINTAMOS FONDO
	movz x3, 0xCA, lsl 16
	movk x3, 0xAACC, lsl 00
	bl pintar_fondo

//-------------------------------------------------------------------------------
	//pinto maquina pinball
	movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00
	mov x1,#10
	mov x2,#10
	bl adorno_luminoso

    mov x1, #130                // coordenada x del centro
    mov x2, #200                // coordenada y del centro
	bl maquina_pinball //lr = x30

	mov x1,#10
	mov x2,#300
	bl adorno_luminoso





	
//-------------------------------------------------------------------------------
	//Pinto cartel
	bl cartel
//-------------------------------------------------------------------------------


InfLoop:
	b InfLoop
//--------------------------------------------------------------------------------


//------------------------SUB-RUTINAS/FUNCIONES-----------------------------------

// --------------------- calcular_direccion (x, y) ---------------------------------------------------------
// Calcula la direccion de memoria del pixel, indicado por el par ordenado (x, y).

calcular_direccion: 
	mul x0, x2, x19         // (y * 640)
	add x0,	x0, x1          // [x + (y * 640)]
	lsl x0, x0, #2          // 4 * [x + (y * 640)]
	add x0, x0, x20         // Dirección de inicio + 4 * [x + (y * 640)]
	br lr

// ------------------------ pintar_fondo (color) ---------------------------------------
// Pinta todo el fondo del color indicado iniciando por la esquina superior izquierda

pintar_fondo:
		mov x2, SCREEN_HEIGHT   // Contador Y
	loop_1_fondo:
		mov x1, SCREEN_WIDTH    // Contador X
	loop_0_fondo:
		stur w3, [x0]  		    // Colorear el pixel N
		add x0, x0, 4	   	    // Siguiente pixel
		sub x1, x1, 1	   	    // Decrementar contador X
		cbnz x1, loop_0_fondo   // Si no terminó la fila, salto
		sub x2, x2, 1	  	    // Decrementar contador Y
		cbnz x2, loop_1_fondo   // Si no es la última fila, salto

br lr		   					// Retorna al punto del codigo en el que estaba

// ---------------------pintar_pixel_minimo(x, y, color): -----------------------------------
//Pinta un pixel cuadrado de lado TAM_PIXEL
pintar_pixel_minimo:
		mov x27, lr 				// Guardamos direccion de retorno a main
		bl calcular_direccion		// DirIniPintar = DirInicioFramBuf + 4 * [x + (y * 640)]
		mov lr, x27 				// Restablecemos la direccion del main para poder volver
		mov x12, x10 				// Resguardo valores temp de contador
		mov x11, x9					// Resguardo valores temp de contador
		mov x10, TAM_PIXEL          // Establecemos X10 como contador Y Size --> Alto
	loop_1_pixel:
		mov x9, TAM_PIXEL			// Establecemos X9 como contador X Size --> Ancho
	loop_0_pixel:
		stur w3, [x0]   			// Colorear el pixel N
		add x0, x0, 4	    		// Siguiente pixel
		sub x9, x9, 1	    		// Decrementar contador X
		cbnz x9, loop_0_pixel   	// Si no terminó la fila, salto
		sub x10, x10, 1				// Decrementar contador Y
		add x2, x2, 1 				// (y + 1) Pasamos a la fila siguiente 
		mov x27, lr 				// Resguardamos direccion del main para poder regresar
		bl calcular_direccion		// calcular_direccion(x, y+1, color)
		mov lr, x27 				// Restablecemos la direccion del main para volver
		cbnz x10,loop_1_pixel 	    // Si no es la última fila, salto
		mov x10, x12 				// Restablezco valores temp de contador
		mov x9, x11					// Restablezco valores temp de contador
		sub x2, x2, TAM_PIXEL       // Restauro el valor de x2
br lr 

// ----------------- pintar_rectangulo(x, y, color, alto, ancho) -----------------
//pinta un rectangulo a partir de pixeles cuadrados de tamaño TAM_PIXEL
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
// -----------------pintar_punto(x, y, color): -----------------
//Pinta un pixel 1x1 en determinada posicion
pintar_punto:
	mov x21,lr
	bl calcular_direccion
	mov lr, x21
	stur w3,[x0]
	br lr


pintar_rectangulo_aux:
		mov x24,lr
		bl calcular_direccion
		mov lr, x24
		mov x9,x4 //Contador con altura ingresada
	loop_2_rectangulo_aux:
		mov x10,x5 //Contador con ancho ingresado
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

// -----------------pintar_circunferencia (xc, yc, radio, color): -----------------
//Pinta una circunferencia de radio r y centro (xc,yx)
pintar_circunferencia:
		mov x7, #0         // x7 = 0, x = 0
		mov x8, x6        // x = y = r
		mov x11, #3        // x11 = 3
		lsl x12, x6, #1    // x12 = 2 * r (shift lógico a la izquierda por 1 bit)
		sub x11, x11, x12  // x11 = 3 - 2*r → p o d
		mov x27, lr //guardo punto de retorno a main
	ciclo_bresenham:
    	bl dibujar_octantes
    	cmp x7, x8
    	b.ge fin_circunferencia
    	cmp x11, #0
    	b.le continuar_misma_y
		sub x12,x7,x8 //x-y
		lsl x12,x12,#2 // *4 
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
	fin_circunferencia:
		mov lr, x27
    	br lr
	dibujar_octantes:
    // Centro x1 = cx, x2 = cy, x3 = color
		mov x26,lr //guardo direccion de retorno a bl dibujar_octantes
		mov x10, x1  // cx
		mov x12, x2  // cy
		
		// Punto 1: (cx + x, cy + y)
		add x13, x10, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14
		
		bl pintar_punto

		// Punto 2: (cx - x, cy + y)
		sub x13, x10, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 3: (cx + x, cy - y)
		add x13, x10, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 4: (cx - x, cy - y)
		sub x13, x10, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 5: (cx + y, cy + x)
		add x13, x10, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 6: (cx - y, cy + x)
		sub x13, x10, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 7: (cx + y, cy - x)
		add x13, x10, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 8: (cx - y, cy - x)
		sub x13, x10, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		mov x1,x10  //reestablzco xc original
		mov x2,x12  //reestablezco yc original
		mov lr, x26 //reestablezco posicion de retorno
		br lr //retorno
//_-----------------------------------------------------------------------------------

pintar_circulo:
		mov x7, #0         // x7 = 0, x = 0
		mov x8, x6        // x = y = r
		mov x11, #3        // x11 = 3
		lsl x12, x6, #1    // x12 = 2 * r (shift lógico a la izquierda por 1 bit)
		sub x11, x11, x12  // x11 = 3 - 2*r → p o d
		mov x27, lr //guardo punto de retorno a main
	ciclo_bresenham_circulo:
    	bl dibujar_octantes_circulo
    	cmp x7, x8
    	b.ge fin_circulo
    	cmp x11, #0
    	b.le continuar_misma_y_circulo
		sub x12,x7,x8 //x-y
		lsl x12,x12,#2 // *4 
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
	fin_circulo:
		mov lr, x27
    	br lr
	dibujar_octantes_circulo:
    // Centro x1 = cx, x2 = cy, x3 = color
		mov x26,lr //guardo direccion de retorno a bl dibujar_octantes
		mov x23, x1  // cx
		mov x12, x2  // cy
		
		// Punto 1: (cx + x, cy + y)
		add x13, x23, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14

		bl pintar_punto

		// Punto 2: (cx - x, cy + y)
		sub x13, x23, x7
		add x14, x12, x8
		mov x1, x13
		mov x2, x14

		sub x15,x23,x1
		//mov x15,x10
		mov x4,#1
		add x15,x15,1
		lsl x15, x15,#1
		mov x5,x15

		bl pintar_rectangulo_aux

		//mov x10,x15

		// Punto 3: (cx + x, cy - y)
		add x13, x23, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 4: (cx - x, cy - y)
		sub x13, x23, x7
		sub x14, x12, x8
		mov x1, x13
		mov x2, x14
		bl pintar_rectangulo_aux

		// Punto 5: (cx + y, cy + x)
		add x13, x23, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 6: (cx - y, cy + x)
		sub x13, x23, x8
		add x14, x12, x7
		mov x1, x13
		mov x2, x14

		sub x15,x23,x1
		//mov x15,x10
		mov x4,#1
		add x15,x15,1
		lsl x15, x15,#1
		mov x5,x15

		bl pintar_rectangulo_aux


		// Punto 7: (cx + y, cy - x)
		add x13, x23, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_punto

		// Punto 8: (cx - y, cy - x)
		sub x13, x23, x8
		sub x14, x12, x7
		mov x1, x13
		mov x2, x14
		bl pintar_rectangulo_aux

		mov x1,x23  //reestablzco xc original
		mov x2,x12  //reestablezco yc original
		mov lr, x26 //reestablezco posicion de retorno
		br lr //retorno

//--------
//recibe (x,y,cantidad de escaleritas,color, ancho y alto de "escalon")
pintar_escaleritas:
		mov x26, lr
		mov x4, x21
		mov x5, x15
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
		
		mov lr,x26
		br lr

