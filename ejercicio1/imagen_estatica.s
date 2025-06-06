//--------------------DECLARAMOS RUTINAS COMO GLOBALES-------------------------------------------------------
.global imagen_estatica
//--------------------IMPORTAMOS RUTINAS NECESARIAS----------------------------------------------------------
.extern pintar_fondo_sala
.extern maquina_pinball
.extern adorno_luminoso
.extern arcade_estructura
.extern arcade_fondo_tablero
.extern arcade_fondo_tablero_sup
.extern arcade_controles_palanca
.extern arcade_controles_botones
.extern arcade_fichas_out
.extern arcade_fichas_in
.extern arcade_botones_frontales_bordes
.extern arcade_botones_frontales_relleno
.extern letra_o
.extern letra_d
.extern letra_c
.extern numero_2
.extern numero_0
.extern numero_5
.extern cartel
//-----------------------------------------------------------------------------------------------------------
imagen_estatica:
	sub sp, sp, #8
	stur lr, [sp]
//--------------------RENDERIZAMOS FONDO DE SALA-------------------------------------------------------------
	bl pintar_fondo_sala

//--------------------RENDERIZAMOS MAQUINAS PINBALL----------------------------------------------------------
	movz x3, 0x00, lsl 16
	movk x3, 0x0000, lsl 00

	mov x1, #20               	    // coordenada x del centro
    mov x2, #293                    // coordenada y del centro
	bl maquina_pinball 

	mov x1, #101               	    // coordenada x del centro
    mov x2, #293                    // coordenada y del centro
	bl maquina_pinball 

	mov x1,#32                      // coordenada x del centro 
	mov x2,#140                     // coordenada Y del centro
	bl adorno_luminoso

	mov x1,#32                      // coordenada x del centro
	mov x2,#80                      // coordenada Y del centro
	bl adorno_luminoso

//---------------------------------------------------------------------------------------------------------
//--------------------RENDERIZAMOS MAQUINAS ARCADE---------------------------------------------------------
// ARCADE_1:
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xD8, lsl 16       	// defino color principal
	movk x11, 0xB2FD, lsl 0      	// termino de definir color ppal
	bl arcade_estructura
	//Arcade tablero:
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xF8, lsl 16       	// defino color principal (ROSA)
	movk x11, 0x57F3, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero_sup
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_controles_palanca
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	bl arcade_controles_botones
	//Detealles del frente (in/out Fichas)
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_out
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xF8, lsl 16       	// defino color principal (ROSA)
	movk x11, 0x57F3, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_in
	//Botones frontales:
	//Bordes
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0x41, lsl 16       	// defino color borde
	movk x3, 0x1c8e, lsl 0      	// termino de definir color borde
	bl arcade_botones_frontales_bordes
	//Relleno:
	mov x1, #319					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0xfb, lsl 16       	// defino color principal (AMARILLO)
	movk x3, 0xda4d, lsl 0      	// termino de definir color ppal
	bl arcade_botones_frontales_relleno
//-----------------------------------------------------------------------------------------------------
// ARCADE_2:	
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_estructura
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xb6, lsl 16       	// defino color principal (ROSA)
	movk x11, 0x7dfe, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero_sup
//Arcade tablero:
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xFB, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xDA4D, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x3, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_controles_palanca
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	bl arcade_controles_botones
//Detealles del frente (in/out Fichas)------------------------------------------------------------
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xb6, lsl 16       	// defino color principal (VIOLETA)
	movk x11, 0x7dfe, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_out
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xF8, lsl 16       	// defino color principal (ROSA)
	movk x11, 0x57F3, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_in
//Botones frontales:------------------------------------------------------------------------------
	//Bordes
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0x41, lsl 16       	// defino color borde
	movk x3, 0x1c8e, lsl 0      	// termino de definir color borde
	bl arcade_botones_frontales_bordes
    //Relleno:
	mov x1, #413					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0xb6, lsl 16       	// defino color principal (VIOLETA)
	movk x3, 0x7dfe, lsl 0      	// termino de definir color ppal
	bl arcade_botones_frontales_relleno
//-------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------
//ARCADE_3:
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xFF, lsl 16       	// defino color principal (ROSA)
	movk x11, 0x7CED, lsl 0      	// termino de definir color ppal
	bl arcade_estructura
	//Borro sombras de pared lateral:
		movz x3, 0xb6, lsl 16       	// defino color principal (ROSA)
		movk x3, 0x00d8, lsl 0      	// termino de definir color ppal
		add x1, x13, #90
		sub x2, x14, #149
		mov x5, #43		            // ancho
		mov x4, #44			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl pintar_rectangulo_aux
		mov x11, x7					// Restauro x7

		add x1, x13, #90
		add x2, x14, #2
		mov x5, #43		            // ancho
		mov x4, #92			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl pintar_rectangulo_aux
		mov x11, x7					// Restauro x7

		add x1, x13, #116
		sub x2, x14, #80
		mov x5, #17		            // ancho
		mov x4, #56			        // alto
		mov x7, x11					// Backup de x11 en x7
		bl pintar_rectangulo_aux
		mov x11, x7	
//Arcade tablero:------------------------------------------------------------------------------------
	mov x1, #507				    // coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xB6, lsl 16       	// defino color principal (VIOLETA)
	movk x11, 0x7DFE, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_fondo_tablero_sup
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0xFE, lsl 16       	// defino color principal (AMARILLO)
	movk x3, 0xD94C, lsl 0      	// termino de definir color ppal
	bl arcade_controles_palanca
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	bl arcade_controles_botones	
//Detealles del frente (in/out Fichas)---------------------------------------------------------------
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x11, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_out
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x11, 0xFE, lsl 16       	// defino color principal (AMARILLO)
	movk x11, 0xD94C, lsl 0      	// termino de definir color ppal
	bl arcade_fichas_in
//Botones frontales:----------------------------------------------------------------------------------
	//Bordes
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0x41, lsl 16       	// defino color borde
	movk x3, 0x1c8e, lsl 0      	// termino de definir color borde
	bl arcade_botones_frontales_bordes
	//Relleno:
	mov x1, #507					// coordenada x del vertice inferior izquierdo
	mov x2, #272					// coordenada y del vertice inferior izquierdo del tablero
	movz x3, 0x7B, lsl 16       	// defino color principal (CELESTE)
	movk x3, 0xF8FC, lsl 0      	// termino de definir color ppal
	bl arcade_botones_frontales_relleno
//-----------------------------------------------------------------------------------------------------
//-----------------------RENDERIZAMOS LETRAS EN MAQUINAS ARCADE----------------------------------------
//Letra_O - MAQUINA_1:---------------------------------------------------------------------------------
	movz x3, 0xFF, lsl 16       	// defino color principal (ROSA)
	movk x3, 0x7CED, lsl 0 
    mov x1, #370                    // coordenada x del centro
    mov x2, #204    
	bl letra_o
//Letra_D - MAQUINA_2:----------------------------------------------------------------------------------
	movz x3, 0xFE, lsl 16       	
	movk x3, 0xD94C, lsl 0   
	mov x1, #466                    // coordenada x del centro
    mov x2, #204    
	bl letra_d
//Letra_C - MAQUINA_3:----------------------------------------------------------------------------------
	movz x3, 0x7B, lsl 16       	
	movk x3, 0xF8FC, lsl 0      	
	mov x1, #560                    // coordenada x del centro
    mov x2, #204   
	bl letra_c
//NUMEROS MAQUINA_1:------------------------------------------------------------------------------------
//NUMERO_2:---------------------------------------------------------------------------------------------
	movz x3, 0xFE, lsl 16       	
	movk x3, 0xD94C, lsl 0   
    mov x1, #326                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_0:---------------------------------------------------------------------------------------------
    mov x1, #344                    // coordenada x del centro
    mov x2, #132    
	bl numero_0
//NUMERO_2:---------------------------------------------------------------------------------------------
	mov x1, #362                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_5:---------------------------------------------------------------------------------------------
	mov x1, #380                    // coordenada x del centro
    mov x2, #132    
	bl numero_5
//NUMEROS MAQUINA_2:------------------------------------------------------------------------------------
//NUMERO_2:---------------------------------------------------------------------------------------------	
	movz x3, 0x7B, lsl 16       	
	movk x3, 0xF8FC, lsl 0     
    mov x1, #420                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_0:---------------------------------------------------------------------------------------------
    mov x1, #438                    // coordenada x del centro
    mov x2, #132    
	bl numero_0
//NUMERO_2:---------------------------------------------------------------------------------------------
	mov x1, #456                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_5:---------------------------------------------------------------------------------------------
	mov x1, #474                     // coordenada x del centro
    mov x2, #132    
	bl numero_5
//NUMEROS MAQUINA_3:------------------------------------------------------------------------------------
//NUMERO_2:---------------------------------------------------------------------------------------------
	movz x3, 0x90, lsl 16       	// defino color principal (ROSA)
	movk x3, 0x35ED, lsl 0 
    mov x1, #514                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_0:---------------------------------------------------------------------------------------------
    mov x1, #532                    // coordenada x del centro
    mov x2, #132    
	bl numero_0
//NUMERO_2:---------------------------------------------------------------------------------------------
	mov x1, #550                    // coordenada x del centro
    mov x2, #132    
	bl numero_2
//NUMERO_5:---------------------------------------------------------------------------------------------
	mov x1, #568                    // coordenada x del centro
    mov x2, #132    
	bl numero_5

//------------------------------------------------------------------------------------------------
//----------------------RENDERIZAMOS CARTEL ARRIBA DE MAQUINAS ARCADE-----------------------------
//Pinto cartel
	bl cartel
	ldur lr, [sp]
	add sp, sp, #8
//------------------------------------------------------------------------------------------------
//----------------------RETURN--------------------------------------------------------------------
	br lr
