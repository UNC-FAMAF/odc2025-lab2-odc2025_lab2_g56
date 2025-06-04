//Incluimos las constantes definidas en modulo constantes.s
.include "constantes.s"

// Declaramos rutinas como globales
.global cartel

// Importamos rutinas externas
.extern pintar_rectangulo
.extern pintar_circunferencia
.extern pintar_circulo

//-------------------------------------------------------------------

// CARTEL
    cartel:
        //Rectangulo base
            mov x25, lr
            mov x1, #416                // variable x
	        mov x2, #24                 // variable y
            movz x3, 0x4f, lsl 16       // defino el color
            movk x3, 0x1cd4, lsl 0      // termino de definir un color
		    mov x4, #26			        // alto (en pixeles de TAM PIXEL)
		    mov x5, #112		        // ancho
            bl pintar_rectangulo		// llamada a la subrutina
        //Rectangulo central
            mov x1, #432                // variable x
	        mov x2, #36                // variable y
            movz x3, 0x91, lsl 16       // defino el color
            movk x3, 0x33f0, lsl 0      // termino de definir un color
		    mov x4, #13			        // alto (en pixeles de TAM PIXEL)
		    mov x5, #104		        // ancho
		    bl pintar_rectangulo		// llamada a la subrutina
        //Circulos
            //Rosados
                //1ro
                mov x1, #425            // variable x
                mov x2, #31             // variable y
                movz x3, 0xff, lsl 16   // defino el color
                movk x3, 0x53ef, lsl 0  // termino de definir un color
                mov x6, #5              //radio del circulo
                bl pintar_circulo       // llamada a la subrutina
                //2do
                mov x1, #468            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //3ro
                mov x1, #511            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //4to
                mov x1, #555            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //5to
                mov x1, #600            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //7mo
                mov x1, #425            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                 //8vo
                mov x1, #468            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //9no
                mov x1, #511            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //10mo
                mov x1, #555            // variable x
                mov x2, #68             // variable y       
                bl pintar_circulo       // llamada a la subrutina
                //11ro
                mov x1, #600            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
            
            //Celestes
                //1ro
                mov x1, #439            // variable x
                mov x2, #31             // variable y   
                movz x3, 0x7c, lsl 16   // defino el color
                movk x3, 0xf6ff, lsl 0  // termino de definir un color
                bl pintar_circulo       // llamada a la subrutina
                //2do
                mov x1, #482            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //3ro
                mov x1, #525            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //4to
                mov x1, #570            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //5to
                mov x1, #615            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //6to
                mov x1, #425            // variable x
                mov x2, #43             // variable y
                bl pintar_circulo       // llamada a la subrutina
                 //7mo
                mov x1, #439            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //8vo
                mov x1, #482            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //9no
                mov x1, #525            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //10mo
                mov x1, #570            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //11ro
                mov x1, #615            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                
             //Amarillos
                //1ro
                mov x1, #454            // variable x
                mov x2, #31             // variable y
                movz x3, 0xfa, lsl 16   // defino el color
                movk x3, 0xda60, lsl 0  // termino de definir un color
                bl pintar_circulo       // llamada a la subrutina
                //2do
                mov x1, #496            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //3ro
                mov x1, #540            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //4to
                mov x1, #585            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //5to
                mov x1, #630            // variable x
                mov x2, #31             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //6to
                mov x1, #425            // variable x
                mov x2, #56             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //7mo
                mov x1, #454            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //8vo
                mov x1, #496            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //9no
                mov x1, #540            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                 //10mo
                mov x1, #585            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                //11ro
                mov x1, #630            // variable x
                mov x2, #68             // variable y
                bl pintar_circulo       // llamada a la subrutina
                
        //Letras
            //R
                //1er rectangulo
                mov x1, #442            // variable x
                mov x2, #41             // variable y
                mov x4, #10              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #445            // variable x
                mov x2, #41             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #445            // variable x
                mov x2, #50             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #454            // variable x
                mov x2, #45             // variable y
                mov x4, #3              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //5to rectangulo
                mov x1, #454            // variable x
                mov x2, #54             // variable y
                mov x4, #4              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //E
                //1er rectangulo
                mov x1, #462            // variable x
                mov x2, #41             // variable y
                mov x4, #10              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #465            // variable x
                mov x2, #41             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #465            // variable x
                mov x2, #49             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #465            // variable x
                mov x2, #57             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //A
                //1er rectangulo
                mov x1, #483            // variable x
                mov x2, #41             // variable y
                mov x4, #5              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #479            // variable x
                mov x2, #50             // variable y
                mov x4, #6              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #483            // variable x
                mov x2, #54             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #493            // variable x
                mov x2, #50             // variable y
                mov x4, #6              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //D
                //1er rectangulo
                mov x1, #501            // variable x
                mov x2, #41             // variable y
                mov x4, #10             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #504            // variable x
                mov x2, #41             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #504            // variable x
                mov x2, #57             // variable y
                mov x4, #2              // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #514            // variable x
                mov x2, #44             // variable y
                mov x4, #7              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //Y
                //1er rectangulo
                mov x1, #522            // variable x
                mov x2, #41             // variable y
                mov x4, #5             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #525            // variable x
                mov x2, #49             // variable y
                mov x4, #6              // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #530            // variable x
                mov x2, #41             // variable y
                mov x4, #5             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //?
                //1er rectangulo
                mov x1, #539            // variable x
                mov x2, #40             // variable y
                mov x4, #3             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #543            // variable x
                mov x2, #45             // variable y
                mov x4, #3             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #539            // variable x
                mov x2, #49             // variable y
                mov x4, #2             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #539            // variable x
                mov x2, #56             // variable y
                mov x4, #2             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //O
                //1er rectangulo
                mov x1, #565            // variable x
                mov x2, #45             // variable y
                mov x4, #6             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #569            // variable x
                mov x2, #41             // variable y
                mov x4, #2             // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #569            // variable x
                mov x2, #57             // variable y
                mov x4, #2             // alto 
                mov x5, #5              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #579            // variable x
                mov x2, #45             // variable y
                mov x4, #6             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //K
                //1er rectangulo
                mov x1, #587            // variable x
                mov x2, #41             // variable y
                mov x4, #10             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #590            // variable x
                mov x2, #49             // variable y
                mov x4, #3             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //3er rectangulo
                mov x1, #596            // variable x
                mov x2, #46             // variable y
                mov x4, #2             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //4to rectangulo
                mov x1, #600            // variable x
                mov x2, #42             // variable y
                mov x4, #3             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //5to rectangulo
                mov x1, #596            // variable x
                mov x2, #53             // variable y
                mov x4, #2             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //6to rectangulo
                mov x1, #600            // variable x
                mov x2, #55             // variable y
                mov x4, #3             // alto 
                mov x5, #3              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
            //!
                //1er rectangulo
                mov x1, #610            // variable x
                mov x2, #41             // variable y
                mov x4, #6             // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                //2do rectangulo
                mov x1, #610            // variable x
                mov x2, #57             // variable y
                mov x4, #2              // alto 
                mov x5, #2              // ancho
                bl pintar_rectangulo    // llamada a la subrutina
                
               
            mov lr, x25
     br lr
