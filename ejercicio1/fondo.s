//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global pintar_fondo_sala
.global patron_cuadriculado

// Importamos rutinas externas
.extern pintar_pixel_minimo
.extern pintar_rectangulo
.extern escaleritas

// --------------------- pintar_fondo ------------------------------------------
// Pinta las paredes con los patrones y los mosaicos del piso
    pintar_fondo_sala:
        sub sp, sp, #8
        stur lr, [sp]
        //  PINTAMOS LINEA DIVISORIA -------------------------------- 
            mov x1, #404                // variable x
            mov x2, #0                  // variable y
            movz x3, 0x8D, lsl 16    
            movk x3, 0x31DD, lsl 00 
            mov x4, #240	            // alto (en pixeles de TAM PIXEL)
            mov x5, #2			        // ancho
            bl pintar_rectangulo

        //  PINTAMOS PARED DER --------------------------------------
            mov x1, #406                // variable x
            mov x2, #0                  // variable y
            movz x3, 0xBE, lsl 16    
            movk x3, 0x7DFF, lsl 00 
            mov x4, #240	            // alto (en pixeles de TAM PIXEL)
            mov x5, #117		        // ancho
            bl pintar_rectangulo

        //  PINTAMOS CARTEL -----------------------------------------
            mov x1, #418                // variable x
            mov x2, #24                  // variable y
            movz x3, 0x1D, lsl 16    
            movk x3, 0x01AD, lsl 00 
            mov x4, #26	            // alto (en pixeles de TAM PIXEL)
            mov x5, #111		        // ancho
            bl pintar_rectangulo
            // ---------------------------------------------
            mov x1, #420                // variable x
            mov x2, #26                 // variable y
            movz x3, 0x7B, lsl 16    
            movk x3, 0x41F7, lsl 00 
            mov x4, #24	                // alto (en pixeles de TAM PIXEL)
            mov x5, #111		        // ancho
            bl patron_cuadriculado
        

        //  PINTAMOS PARED IZQ --------------------------------------
            // ---------------------------------------------
                mov x1, #0                  // variable x
                mov x2, #0                  // variable y
                movz x3, 0xFE, lsl 16    
                movk x3, 0x89F2, lsl 00 
                mov x4, #240                // alto (en pixeles de TAM PIXEL)
                mov x5, #202			    // ancho
                bl pintar_rectangulo
                // ---------------------------------------------
                mov x1, #350                // variable x
                mov x2, #0                 // variable y
                movz x3, 0xCC, lsl 16    
                movk x3, 0x77ED, lsl 00 
                mov x4, #61	                // alto (en pixeles de TAM PIXEL)
                mov x5, #28		            // ancho
                bl patron_cuadriculado
                // ---------------------------------------------
                mov x1, #308                // variable x
                mov x2, #0                 // variable y
                mov x4, #217 	            // alto (en pixeles de TAM PIXEL)
                mov x5, #24		            // ancho
                bl patron_romboidal

                mov x1, #350                  // variable x
                mov x2, #122                  // variable y
                movz x3, 0xFE, lsl 16    
                movk x3, 0x89F2, lsl 00 
                mov x4, #120              // alto (en pixeles de TAM PIXEL)
                mov x5, #26			    // ancho
                bl pintar_rectangulo
                // ---------------------------------------------
                mov x1, #258                // variable x
                mov x2, #0                 // variable y
                movz x3, 0xCC, lsl 16    
                movk x3, 0x77ED, lsl 00 
                mov x4, #188	                // alto (en pixeles de TAM PIXEL)
                mov x5, #26		            // ancho
                bl patron_punteado

            // -------------- PATRONES INVERTIDOS -------------
                mov x1, #219                // variable x
                mov x2, #0                 // variable y
                mov x4, #31	                // alto (en pixeles de TAM PIXEL)
                mov x5, #24		            // ancho
                bl patron_punt_sep
                // ---------------------------------------------
                mov x1, #141                // variable x
                mov x2, #0                 // variable y
                movz x3, 0xBA, lsl 16    
                movk x3, 0xD3FF, lsl 00 
                mov x4, #31	                // alto (en pixeles de TAM PIXEL)
                mov x5, #24		            // ancho
                bl patron_punt_sep_inv
                // ---------------------------------------------
                mov x1, #69                // variable x
                mov x2, #0                 // variable y
                mov x4, #31 	            // alto (en pixeles de TAM PIXEL)
                mov x5, #35		            // ancho
                bl patron_punteado
                // ---------------------------------------------
                mov x1, #1                // variable x
                mov x2, #0                 // variable y
                mov x4, #217 	            // alto (en pixeles de TAM PIXEL)
                mov x5, #35		            // ancho
                bl patron_romboidal
    
        // PINTAMOS HABITACION 2 -------------------------------------------------
        // FONDO ----------------------------------------------------
            mov x1, #16                // variable x
            mov x2, #62                  // variable y
            movz x3, 0x1D, lsl 16    
            movk x3, 0x01AD, lsl 00 
            mov x4, #134	            // alto (en pixeles de TAM PIXEL)
            mov x5, #112		        // ancho
            bl pintar_rectangulo
            // ---------------------------------------------
            mov x1, #16                // variable x
            mov x2, #64                 // variable y
            movz x3, 0x83, lsl 16    
            movk x3, 0x3FF4, lsl 00 
            mov x4, #132                // alto (en pixeles de TAM PIXEL)
            mov x5, #112	            // ancho
            bl patron_cuadriculado
            // ---------------------------------------------
            mov x1, #16                // variable x
            mov x2, #330               // variable y
            movz x3, 0x90, lsl 16    
            movk x3, 0x37e1, lsl 00 
            mov x4, #47	            // alto (en pixeles de TAM PIXEL)
            mov x5, #112		        // ancho
            bl pintar_rectangulo

        // MARCO DER PUERTA
            mov x1, #240                // variable x
            mov x2, #62                 // variable y
            mov x4, #1	            // alto (en pixeles de TAM PIXEL)
            mov x5, #7  		        // ancho
            bl pintar_rectangulo
            
            mov x1, #254                // variable x
            mov x2, #62                 // variable y
            mov x4, #159	            // alto (en pixeles de TAM PIXEL)
            mov x5, #1  		        // ancho
            bl pintar_rectangulo

            mov x1, #240                // variable x
            mov x2, #64                 // variable y
            movz x3, 0xFE, lsl 16    
            movk x3, 0x57EC, lsl 00  
            mov x4, #158	            // alto (en pixeles de TAM PIXEL)
            mov x5, #7  		        // ancho
            bl pintar_rectangulo

            mov x1, #238                // variable x
            mov x2, #330               // variable y
            movz x3, 0x1D, lsl 16    
            movk x3, 0x01AD, lsl 00
            mov x4, #24	                // alto (en pixeles de TAM PIXEL)
            mov x5, #1		        // ancho
            bl pintar_rectangulo

        // PINTAMOS PISO 1----------------------------------------------------------
            // FILAS 1-3
                mov x1, #0                // variable x
                mov x2, #432                 // variable y
                movz x3, 0xBF, lsl 16    
                movk x3, 0x7CFF, lsl 00 
                mov x4, #24	                // alto (en pixeles de TAM PIXEL)
                mov x5, #25  		        // ancho
                bl pintar_rectangulo

                mov x1, #0                // variable x
                mov x2, #432              // variable y

                mov x13, #3
                filas_1_3:
                    sub sp, sp, #8
                    stur x13,[sp]

                    movz x3, 0x90, lsl 16    
                    movk x3, 0x37E1, lsl 00
                    mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                    mov x5, #320  		        // ancho
                    bl pintar_rectangulo
                    mov x1, #0                   // variable x
                    add x2, x2, #10              // variable y 
                    bl pintar_bloque1

                    mov x1, #0                   // variable x
                    add x2, x2, #2               // variable y 

                    ldur x13,[sp]
                    add sp, sp, #8
                    sub x13, x13, #1
                cbnz x13, filas_1_3

            // FILA 4
                mov x1, #18                // variable x
                mov x2, #424              // variable y
                sub sp, sp, #16
                stur x1, [sp]
                stur x2, [sp, #8]
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00   
                mov x7, #4      	        // largo diagonal (cantidad escalones)            
                bl pintar_bloque2
                ldur x1, [sp]
                ldur x2, [sp, #8]
                //DETALLES DE ESQUINA IZQ
                    add x1, x1, #2
                    add x2, x2, #2
                    movz x3, 0xBF, lsl 16    
                    movk x3, 0x7CFF, lsl 00
                    mov x4, #2	                // alto (en pixeles de TAM PIXEL)
                    mov x5, #37  		        // ancho
                    bl pintar_rectangulo
                    
                    ldur x1, [sp]
                    ldur x2, [sp, #8]
                    add x1, x1, #2
                    add x2, x2, #4
                    movz x3, 0xBF, lsl 16    
                    movk x3, 0x7CFF, lsl 00
                    mov x4, #2	                // alto (en pixeles de TAM PIXEL)
                    mov x5, #32  		        // ancho
                    bl pintar_rectangulo
                    
                    ldur x1, [sp]
                    ldur x2, [sp, #8]
                    add x1, x1, #2

                    movz x3, 0x90, lsl 16    
                    movk x3, 0x37E1, lsl 00
                    sub x1, x1, #4
                    mov x4, #4	                // alto (en pixeles de TAM PIXEL)
                    mov x5, #2  		        // ancho
                    bl pintar_rectangulo

                    add x1, x1, #4
                    sub x2, x2, #2
                    mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                    mov x5, #2                  // ancho
                    bl pintar_rectangulo
                    
                ldur x1, [sp]
                ldur x2, [sp, #8]
                add sp, sp, #16
                
            // FILAS 5-6            
                bl pintar_bloque3
            // FILAS 7            
                bl pintar_bloque4
        // PINTAMOS PISO 2----------------------------------------------------------   
            // FILA 1
                mov x1, #16                // variable x
                mov x2, #416               // variable y
                movz x3, 0x1D, lsl 16    
                movk x3, 0x01AD, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #20		        // ancho
                bl pintar_rectangulo
                
                mov x1, #16                // variable x
                mov x2, #408               // variable y
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #2		        // ancho
                bl pintar_rectangulo

                mov x1, #20                // variable x
                mov x2, #406               // variable y
                mov x7, #4      	        // largo diagonal (cantidad escalones)
                bl diagonal
            // FILA 2
                mov x1, #15                // variable x
                mov x2, #398               // variable y
                movz x3, 0x1D, lsl 16    
                movk x3, 0x01AD, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #64		        // ancho
                bl pintar_rectangulo

                mov x1, #14                // variable x
                mov x2, #386               // variable y
                mov x7, #2      	        // largo diagonal (cantidad escalones)
                bl diagonal

                mov x1, #63                // variable x
                mov x2, #396               // variable y
                mov x7, #7      	        // largo diagonal (cantidad escalones)
                bl diagonal
            // FILA 3
                mov x1, #16                // variable x
                mov x2, #382               // variable y
                movz x3, 0x1D, lsl 16    
                movk x3, 0x01AD, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #101		        // ancho
                bl pintar_rectangulo

                mov x1, #40                // variable x
                mov x2, #380               // variable y
                mov x7, #9      	        // largo diagonal (cantidad escalones)
                bl diagonal

                mov x1, #140                // variable x
                mov x2, #380               // variable y
                mov x7, #9      	        // largo diagonal (cantidad escalones)
                bl diagonal
            // FILA 4
                mov x1, #16                // variable x
                mov x2, #362               // variable y
                movz x3, 0x1D, lsl 16    
                movk x3, 0x01AD, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #111		        // ancho
                bl pintar_rectangulo

                mov x1, #18                // variable x
                mov x2, #360               // variable y
                mov x7, #9      	        // largo diagonal (cantidad escalones)
                bl diagonal

                mov x1, #138                // variable x
                mov x2, #360               // variable y
                mov x7, #9      	        // largo diagonal (cantidad escalones)
                bl diagonal

                mov x1, #234                // variable x
                mov x2, #360               // variable y
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #2		        // ancho
                bl pintar_rectangulo

            // FILA 5
                mov x1, #16                // variable x
                mov x2, #342               // variable y
                movz x3, 0x1D, lsl 16    
                movk x3, 0x01AD, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #111		        // ancho
                bl pintar_rectangulo

                mov x1, #18                // variable x
                mov x2, #340               // variable y
                mov x7, #6      	        // largo diagonal (cantidad escalones)
                bl diagonal

                mov x1, #112                // variable x
                mov x2, #340               // variable y
                mov x7, #6      	        // largo diagonal (cantidad escalones)
                bl diagonal

        // MARCO IZQ PUERTA ---------------------------------------------
            mov x1, #14                // variable x
            mov x2, #62                 // variable y
            movz x3, 0x96, lsl 16    
            movk x3, 0x20EC, lsl 00
            mov x4, #186	            // alto (en pixeles de TAM PIXEL)
            mov x5, #1  		        // ancho
            bl pintar_rectangulo

            mov x1, #0                // variable x
            mov x2, #432                 // variable y
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #320  		        // ancho
            bl pintar_rectangulo            
    
        ldur lr, [sp]
        add sp, sp, #8
    br lr




//------------------------SUB-RUTINAS/FUNCIONES-----------------------------------
// -----------------pintar_paralelogramo(x, y, color, alto, ancho): -----------------------------------
//Genera paralelogramo. Recibe: x1, x2, x3, x7, x5
    pintar_paralelogramo:
        sub sp, sp, #48
        stur lr,[sp, #0]
        stur x1,[sp, #8]
        stur x2,[sp, #16]
        stur x7,[sp, #24]
        
        mov x4, #1	                // alto (en pixeles de TAM PIXEL)
        fondo_paralel:
            stur x1,[sp, #32]
            stur x2,[sp, #40]
            bl pintar_rectangulo
            ldur x1,[sp, #32]
            ldur x2,[sp, #40]
            add x1, x1, #10
            sub x2, x2, #2
            sub x7, x7, #1
        cbnz x7, fondo_paralel
        
        ldur lr,[sp, #0]
        ldur x1,[sp, #8]
        ldur x2,[sp, #16]
        ldur x7,[sp, #24]
        add sp, sp, #48

    br lr
//-----------------------------------------------------------------------------------

// -----------------diagonal(x, y, color, largo): -----------------------------------
//Genera diagonal. Recibe: x1, x2, x3, x7
    diagonal:
        sub sp, sp, #32
        stur lr,[sp, #0]
        stur x1,[sp, #8]
        stur x2,[sp, #16]
        stur x7,[sp, #24]

        mov x21, #2	                // ancho linea escalon
        mov x15, #10                // largo escalón
        bl pintar_escaleritas
        
        ldur lr,[sp, #0]
        ldur x1,[sp, #8]
        ldur x2,[sp, #16]
        ldur x7,[sp, #24]
        add sp, sp, #32
    br lr
//-----------------------------------------------------------------------------------

// -----------------pintar_bloque1(x, y, color, alto): -------------------
//Pinta todas las diagonales del bloque 1 empezando desde abajo primeras 3 filas 
	pintar_bloque1:
        sub sp, sp, #8
        stur lr, [sp]
        // DIAGONAL 1
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00   
            mov x7, #6      	        // largo diagonal (cantidad escalones)
            
            bl diagonal
            add x2, x2, #2
            add x7, x7, #1              // largo diagonal (cantidad escalones)
            movz x3, 0xBF, lsl 16    
            movk x3, 0x7CFF, lsl 00 
            mov x5, #42
            bl pintar_paralelogramo
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00

        // DIAGONAL 2 -- 4
            add x1, x1, #84
            mov x13, #3
            b1_2_4:
                bl diagonal
                add x1, x1, #10
                movz x3, 0xBF, lsl 16    
                movk x3, 0x7CFF, lsl 00 
                mov x5, #42
                cmp x13, #1
                b.ne b1_2_4_notsum
                add x5, x5, #13
            b1_2_4_notsum:
                bl pintar_paralelogramo
                sub x1, x1, #10
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00
                sub x13, x13, #1
                add x1, x1, #94
            cbnz x13, b1_2_4

        // DIAGONAL 5 -- 6
            add x1, x1, #26
            mov x13, #2
            b1_5_6:
                bl diagonal
                add x1, x1, #10
                movz x3, 0xBF, lsl 16    
                movk x3, 0x7CFF, lsl 00 
                mov x5, #42
                bl pintar_paralelogramo
                sub x1, x1, #10
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00 
                sub x13, x13, #1
                add x1, x1, #94
            cbnz x13, b1_5_6

        // DIAGONAL 7
            mov x7, #6  	            // largo diagonal (cantidad escalones)
            bl diagonal
        ldur lr, [sp]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------pintar_bloque2(x, y, color, alto): -------------------
//Pinta el bloque de suelo contiguo al bloque 1, fila 4 
	pintar_bloque2:
        sub sp, sp, #24
        stur lr, [sp]
        
        // DIAGONAL 1
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00   
            mov x7, #4      	        // largo diagonal (cantidad escalones)
            bl diagonal
            add x2, x2, #2
            add x7, x7, #1              // largo diagonal (cantidad escalones)
            movz x3, 0xBF, lsl 16    
            movk x3, 0x7CFF, lsl 00 
            mov x5, #44                 //largo paralelogramo
            bl pintar_paralelogramo
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00
        
        // DIAGONAL 2 -- 4
            add x1, x1, #66
            add x2, x2, #4
            mov x7, #7  	            // largo diagonal (cantidad escalones)
            mov x13, #3
            b2_2_4:
                bl diagonal
                add x1, x1, #10             //separacion de la diagonal
                movz x3, 0xBF, lsl 16    
                movk x3, 0x7CFF, lsl 00 
                mov x5, #42                 //largo paralelogramo 
                cmp x13, #1
                b.ne b2_2_4_notsum
                add x5, x5, #13             //largo extra de diagonal 4-5
            b2_2_4_notsum:
                bl pintar_paralelogramo
                sub x1, x1, #10
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00 
                
                sub x13, x13, #1
                add x1, x1, #94             //separacion de diagonales
            cbnz x13, b2_2_4

        // DIAGONAL 5 -- 6
            add x1, x1, #26
            mov x13, #2
            b2_5_6:
                bl diagonal
                add x1, x1, #10             //separacion de la diagonal
                movz x3, 0xBF, lsl 16    
                movk x3, 0x7CFF, lsl 00 
                mov x5, #42                 //largo paralelogramo
                bl pintar_paralelogramo
                sub x1, x1, #10             //Restauracion de x1 para proxima diagonal
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00 
                
                sub x13, x13, #1
                add x1, x1, #94             //separacion de diagonal 5-6
            cbnz x13, b2_5_6

        // DIAGONAL 7
            mov x7, #6  	            // largo diagonal (cantidad escalones)
            bl diagonal

        ldur lr, [sp]
        add sp, sp, #24
	br lr
//-----------------------------------------------------------------------------------

// -----------------pintar_bloque3(x, y, color, alto): -------------------
//Pinta el bloque de suelo contiguo al bloque 2, filas 5 y 6 
	pintar_bloque3:
        sub sp, sp, #8
        stur lr, [sp]
        //FILAS 5 - 6
            mov x1, #58 
            mov x2, #416
            mov x14, #2
            b3_1:
                sub sp, sp, #24
                stur x14,[sp]
                stur x1,[sp, #8]
                stur x2,[sp, #16]
                movz x3, 0x90, lsl 16    
                movk x3, 0x37E1, lsl 00
                mov x4, #1	                // alto (en pixeles de TAM PIXEL)
                mov x5, #291  		        // ancho
                cmp x14, #1                 
                b.ne b3_1_notsum1
                sub x5, x5, #47            //restamos largo a linea para la proxima fila de mosaicos
            b3_1_notsum1:
                bl pintar_rectangulo        //pintamos linea de division de cada fila
                ldur x1,[sp, #8]
                ldur x2,[sp, #16]
                add x1, x1, #8              //acomodo referencias para comenzar a dibujar diagonales
                sub x2, x2, #2
                // DIAGONAL 1
                    mov x13, #3                 //establezco contador para segmentos de diagonal
                    diag_ensambl:         //pintamos 3 segmentos de diagonal para lograr menos pendiente
                        sub sp, sp, #24
                        stur x13,[sp]
                        stur x1,[sp, #8]
                        stur x2,[sp, #16]
                        movz x3, 0x90, lsl 16    
                        movk x3, 0x37E1, lsl 00   
                        mov x7, #3      	        // largo diagonal (cantidad escalones)
                        bl diagonal

                        ldur x1,[sp, #8]
                        ldur x2,[sp, #16]
                        add x1, x1, #10             //separo paralelogramo de la diagonal
                        movz x3, 0xBF, lsl 16    
                        movk x3, 0x7CFF, lsl 00 
                        mov x5, #44                 //largo paralelogramo
                        bl pintar_paralelogramo
                        movz x3, 0x90, lsl 16    
                        movk x3, 0x37E1, lsl 00 

                        ldur x1,[sp, #8]            //restauro referencias para pintar
                        ldur x2,[sp, #16]
                        add x1, x1, #28             //ubico el siguiente segmento
                        sub x2, x2, #6
                        ldur x13,[sp]
                        cmp x13, #2
                        b.ne b3_1_notsum2
                        add x1, x1, #1              //desplazamiento extra para ultimo segmen.
                    b3_1_notsum2:
                        add sp, sp, #24
                        sub x13, x13, #1            //decremento contador de segmentos
                    cbnz x13, diag_ensambl

                ldur x1,[sp, #8]                //restaura referencias
                ldur x2,[sp, #16]

                // DIAGONAL 2 -- 5
                    add x1, x1, #102              //acomodo referencias para comenzar a dibujar diagonales
                    sub x2, x2, #2

                    mov x7, #9  	            // largo diagonal (cantidad escalones)
                    ldur x14,[sp]
                    cmp x14, #2
                    b.ne b3_6_saltear         // si es la segunda fila esta diagonal no se pinta 
                    mov x14, #4
                    mov x13, xzr
                    b b3_2_5
                    b3_6_saltear:
                        mov x14, #3                 //establezco contador de mosaicos
                        mov x13, xzr
                    b3_2_5:
                        sub sp, sp, #40
                        stur x14,[sp]
                        stur x1,[sp, #8]
                        stur x2,[sp, #16]
                        stur x7,[sp, #24]
                        stur x13,[sp, #32]
                        
                        mov x13, #3             //establezco contador de segmentos de diag
                        b3_2_5_diag_ensambl:
                            sub sp, sp, #24
                            stur x13,[sp]
                            stur x1,[sp, #8]
                            stur x2,[sp, #16]
                            movz x3, 0x90, lsl 16    
                            movk x3, 0x37E1, lsl 00   
                            mov x7, #3      	        // largo diagonal (cantidad escalones)
                            bl diagonal

                            ldur x1,[sp, #8]
                            ldur x2,[sp, #16]

                            add x1, x1, #10             //comienza impresion de paralelogramo
                            movz x3, 0xBF, lsl 16    
                            movk x3, 0x7CFF, lsl 00 
                            mov x5, #43                 //largo del paralelogramo seccion 2 - 3 y 5 - 6
                            ldur x13,[sp, #56]
                            cmp x13, #2
                            b.ne b3_2_5_notsum1         // si es el segundo mosaico
                            add x5, x5, #12             //largo extra del paralelogramo seccion 4 y 5
                        b3_2_5_notsum1:
                            bl pintar_paralelogramo
                            movz x3, 0x90, lsl 16    
                            movk x3, 0x37E1, lsl 00 
                        
                            ldur x1,[sp, #8]
                            ldur x2,[sp, #16]
                            add x1, x1, #29     //ubicacion de inicio de segmento de diagonal
                            sub x2, x2, #6      
                            ldur x13,[sp]
                            add sp, sp, #24
                            sub x13, x13, #1        //aumento contador de segmento
                        cbnz x13, b3_2_5_diag_ensambl
                        
                        ldur x14,[sp]
                        ldur x1,[sp, #8]
                        ldur x2,[sp, #16]
                        ldur x7,[sp, #24]
                        ldur x13,[sp, #32]
                        add sp, sp, #40
                        cmp x13, #2
                        b.ne b3_2_5_notsum3
                        add x1, x1, #24         //separacion extra de diagonal 4 y 5
                    b3_2_5_notsum3:
                        add x1, x1, #94         //separacion de diagonal 2 - 3 y 5 - 6
                        add x13, x13, #1
                        sub x14, x14, #1
                    cbnz x14, b3_2_5
                
                // DIAGONAL 6
                    mov x7, #8  	            // largo diagonal (cantidad escalones)
                    bl diagonal
                
                ldur x1,[sp, #8]
                ldur x2,[sp, #16]
                add x1, x1, #94                 //establece referencias para comenzar segunda fila
                sub x2, x2, #20                 
                ldur x14,[sp]
                add sp, sp, #24
                sub x14, x14, #1                //decremento contador de fila
            cbnz x14, b3_1

        ldur lr, [sp]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------pintar_bloque4(x, y, color, alto): -------------------
//Pinta el bloque de suelo contiguo al bloque 3, fila 7
	pintar_bloque4:
        sub sp, sp, #24
        stur lr, [sp]
        // FILA 7
            mov x1, #246
            mov x2, #376
            stur x1,[sp, #8]
            stur x2,[sp, #16]
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00
            mov x4, #1	                // alto (en pixeles de TAM PIXEL)
            mov x5, #197    	        // ancho
            bl pintar_rectangulo        //pintamos linea de division de cada fila
            ldur x1,[sp, #8]
            ldur x2,[sp, #16]
            // DIAGONAL 2 -- 4
                add x1, x1, #8              //acomodo referencias para comenzar a dibujar diagonales
                sub x2, x2, #2
                mov x7, #6  	            // largo diagonal (cantidad escalones)
                mov x13, #4
                b4_2_4:
                    bl diagonal
                    cmp x13, #1
                    b.eq b4_2_4_notparalel
                    add x1, x1, #10             //separacion de la diagonal
                    
                    movz x3, 0xBF, lsl 16    
                    movk x3, 0x7CFF, lsl 00 
                    mov x5, #42                 //largo paralelogramo 
                    bl pintar_paralelogramo
                    sub x1, x1, #10

                    movz x3, 0x90, lsl 16    
                    movk x3, 0x37E1, lsl 00 
                    add x1, x1, #94             //separacion de diagonales
                b4_2_4_notparalel:
                sub x13, x13, #1
                cbnz x13, b4_2_4
            ldur x1,[sp, #8]
            ldur x2,[sp, #16]
            add x1, x1, #68            //ubico linea superior del piso
            sub x2, x2, #14
            movz x3, 0x90, lsl 16    
            movk x3, 0x37E1, lsl 00
            mov x4, #1                // alto (en pixeles de TAM PIXEL)
            mov x5, #163  		        // ancho
            bl pintar_rectangulo        //pintamos linea de division de cada fila
            
        ldur lr, [sp]
        add sp, sp, #24
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_cuadriculado (x, y, color, alto, ancho): -----------------
//Genera el patron cuadriculado basico
	patron_cuadriculado:
        sub sp, sp, #8 
        stur lr,[sp, #0]                // Guardamos direccion lr
        bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
        mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
        mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
        mov x21, TAM_PIXEL          // Guardo tam_pixel para poder multiplicarlo por 2
        lsl x21, x21, #1			// Mult. x 2 para saltear un pixel
        mov x22, #0                 // X22 flag para correr_pixeles 1 pixel a la der            
        and x23, x5, #1             // Separo bit menos signif. para ver si es par
        lsr x5, x5, #1              // Divido en 2 el ancho
        loop_1_patron_cuadr:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_patron_cuadr:		
			bl pintar_pixel_minimo
            add x1, x1, x21 		    // Siguiente pixel coordenada x avanzamos salteando de a 1
			bl calcular_direccion
            sub x9, x9, 1	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_patron_cuadr      	// Si no terminó la fila, salto (osea si x9 > 0)

            sub x10, x10, 1				// Decrementar contador Y
			mov x1, x15					// Restablezco referencia de x

            cbnz x22, no_correr_pixeles // pregunto si se corrieron pixeles en la vuelta previa
        //correr_pixeles    
            add x1, x1, TAM_PIXEL       // Corro 'x' 1 pixel a la der
            mov x22, #1                 // Seteo flag correr_pixel en false para la prox ciclo (!= 0)
            cbnz x23, end_if_correr_pixeles
            sub x5, x5, #1              // Resto 1 al ancho
            b end_if_correr_pixeles
        
        no_correr_pixeles:
            mov x22, xzr
            cbnz x23, end_if_correr_pixeles
            add x5, x5, #1              // Restauro el ancho
    
        end_if_correr_pixeles:
            add x2, x2, TAM_PIXEL 	    // Pasamos a la fila siguiente 
			bl calcular_direccion
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_patron_cuadr 	    // Si no es la última fila, salto (osea si x10 > 0)
        ldur lr,[sp, #0]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_punteado (x, y, color, alto, ancho): -----------------
//Genera el patron punteado
	patron_punteado:
		sub sp, sp, #8 
        stur lr,[sp, #0]                // Guardamos direccion lr
        bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
        mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
        mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
        mov x16, TAM_PIXEL          // Guardo tam_pixel para poder multiplicarlo por 2
        lsl x16, x16, #1			// Mult. x 2 para saltear un pixel
		
        loop_1_patron_punt:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_patron_punt:		
			bl pintar_pixel_minimo
            add x1, x1, x16 		    // Siguiente pixel coordenada x avanzamos salteando de a 1
			bl calcular_direccion
            sub x9, x9, 2	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_patron_punt    	// Si no terminó la fila, salto (osea si x9 > 0)
            sub x10, x10, 2				// Decrementar contador Y
			mov x1, x15					// Restablezco referencia de x            
            add x2, x2, x16 	        // Pasamos a la fila siguiente 
			bl calcular_direccion
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_patron_punt     // Si no es la última fila, salto (osea si x10 > 0)
        ldur lr,[sp, #0]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_punt_sep (x, y, color, alto, ancho): -----------------
//Genera el patron de puntos separados
	patron_punt_sep:
        sub sp, sp, #8 
        stur lr,[sp, #0]                // Guardamos direccion lr
        bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
        mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
        mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
        mov x16, xzr                // Inicializo bandera para saber si es fila 1 o 2
		add x1, x1, #7
        loop_1_p_punt_sep:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_p_punt_sep:		
			bl pintar_pixel_minimo
            add x1, x1, #14 		    // Siguiente pixel coordenada x avanzamos salteando de a 1
			bl calcular_direccion
            sub x9, x9, 8	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_p_punt_sep    	// Si no terminó la fila, salto (osea si x9 > 0)
            sub x10, x10, 2				// Decrementar contador Y
			mov x1, x15					// Restablezco referencia de x
            cbz x16, p_punt_sep_not_sum
                add x1, x1, #7
                mov x16, xzr
                b p_punt_fin
        p_punt_sep_not_sum:
            mov x16, #1
        p_punt_fin:
            add x2, x2, #4 	            // Pasamos a la fila siguiente 
			bl calcular_direccion
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_p_punt_sep     // Si no es la última fila, salto (osea si x10 > 0)
        ldur lr,[sp, #0]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_punt_sep_inv (x, y, color, alto, ancho): -----------------
//Genera el patron de puntos separados espejado
	patron_punt_sep_inv:
        sub sp, sp, #8 
        stur lr,[sp, #0]                // Guardamos direccion lr
        bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
        mov x15, x1 				// Resguardo dir de x en x15 para recup ref inicio para pintar 
        mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
        mov x16, xzr                // Inicializo bandera para saber si es fila 1 o 2
        loop_1_p_punt_sep_inv:
			mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_p_punt_sep_inv:		
			bl pintar_pixel_minimo
            add x1, x1, #14 		       // Siguiente pixel coordenada x avanzamos salteando de a 1
			bl calcular_direccion
            sub x9, x9, 8	    		   // Decrementar contador X
            cmp x9, xzr                    // Comparo x9 con 0
			b.gt loop_0_p_punt_sep_inv     // Si no terminó la fila, salto (osea si x9 > 0)
            sub x10, x10, 2				        // Decrementar contador Y
			mov x1, x15					        // Restablezco referencia de x
            cbnz x16, p_punt_sep_inv_not_sum
                add x1, x1, #7
                mov x16, xzr
                b p_punt_fin
        p_punt_sep_inv_not_sum:
            mov x16, #1
        p_punt_inv_fin:
            add x2, x2, #4 	               // Pasamos a la fila siguiente 
			bl calcular_direccion
            cmp x10, xzr                   // Comparo x10 con 0
			b.gt loop_1_p_punt_sep_inv     // Si no es la última fila, salto (osea si x10 > 0)
        ldur lr,[sp, #0]
        add sp, sp, #8
	br lr
//-----------------------------------------------------------------------------------

// -----------------patron_romboidal (x, y, color, alto, ancho): -----------------
//Genera el patron romboidal
	patron_romboidal:
        sub sp, sp, #16 
        stur lr,[sp, #0]            // Guardamos direccion lr
        bl calcular_direccion		// Calculo direccion donde iniciar a pintar primer pixel
        mov x10, x4         		// Establecemos X10 como contador Y Size --> Alto
        mov x21, TAM_PIXEL          // Guardo tam_pixel para poder multiplicarlo por 2
        lsl x21, x21, #1			// Mult. x 2 para saltear un pixel
        mov x22, #1                 // X22 flag para correr_pixeles 1 pixel a la der 
        mov x15, xzr                //contador de corrimientos a izq
        mov x25, xzr                //contador de corrimientos a der
        loop_1_patron_romb:
            cmp x15, #2
            b.eq correr_izq
            add x1, x1, TAM_PIXEL
            stur x1,[sp, #8] 			// Resguardo dir de x
            lsr x5, x5, #1              // Divido en 2 el ancho
            and x23, x5, #1             // Separo bit menos signif. para ver si es par
            cbz x23, fin_impar1          // pregunto si es par o impar el ancho de entrada
                sub x5, x5, #1              // vuelvo par el ancho
            fin_impar1:
            
            add x15, x15, #1       // aumento contador en 1
            b fin_correr_izq
            correr_izq:
                cmp x25, #2
                b.eq reiniciar_contadores
                sub x1, x1, TAM_PIXEL            //muevo a la izq
                stur x1,[sp, #8] 			// Resguardo dir de x
                cmp x25, #1
                b.eq no_mult
                    lsl x5, x5, #1              //multiplico el ancho por 2 (restsuro)
                    b fin_no_mult
                no_mult:
                    lsr x5, x5, #1              //divido el ancho por 2
                    add x5, x5, #1
                fin_no_mult:
                    add x25, x25, #1            // aumento contador en 1
                    b fin_correr_izq
           reiniciar_contadores:
                add x1, x1, TAM_PIXEL
                stur x1,[sp, #8] 			// Resguardo dir de x
                sub x5, x5, #1
                lsl x5, x5, #1              // Divido en 2 el ancho
                mov x15, #1
                mov x25, xzr
           fin_correr_izq:
			    mov x9, x5     				// Establecemos X9 como contador X Size --> Ancho 
		loop_0_patron_romb:		
			bl pintar_pixel_minimo
            cmp x15, #2
            b.ne no_aum_sep
                cmp x25, #1
                b.eq no_aum_sep
                mov x21, #8
                b fin_aum_sep
            no_aum_sep: 
                mov x21, #4
        fin_aum_sep:
            add x1, x1, x21 		// Siguiente pixel coordenada x (avanzamos salteando pixeles)
			bl calcular_direccion
            sub x9, x9, 1	    		// Decrementar contador X
            cmp x9, xzr                 // Comparo x9 con 0
			b.gt loop_0_patron_romb     // Si no terminó la fila, salto (osea si x9 > 0)

            sub x10, x10, 1				// Decrementar contador Y
			ldur x1,[sp, #8]			// Restablezco referencia de x

            add x2, x2, TAM_PIXEL 	    // Pasamos a la fila siguiente 
			bl calcular_direccion
            cmp x10, xzr                // Comparo x10 con 0
			b.gt loop_1_patron_romb 	    // Si no es la última fila, salto (osea si x10 > 0)
        ldur lr,[sp, #0]
        add sp, sp, #16
	br lr
//-----------------------------------------------------------------------------------
