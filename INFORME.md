Nombre y apellido 
Integrante 1: Corbalán Máximo Octavio, DNI:
Integrante 2: Corbalán Augusto Nicolas, DNI:40521354
Integrante 3: Lucas Zabala, DNI:
Integrante 4: Facundo Fernandez Galvez, DNI:42212593


Descripción ejercicio 1: 
Renderizamos una imagen de una sala arcade, principalmente a partir de figuras modularizadas de formas geometricas basicas (archivo subrutinas.s)
Se crearon modulos reutilizables para las maquinas arcade, las maquinas pinball, los adornos luminosos, y demas patrones
Descripción ejercicio 2:
Desplazamos un caracol Gary a traves del piso (discontinuo). Para esto, guardamos solo la porcion del fondo que ocupa el caracol en un frame, y la reestablecemos luego de un delay posterior al renderizado del caracol en su posicion. Luego incrementamos la posicion y repetimos. En cada iteracion, alteramos tambien el color de las luces del cartel, y de las letras en el arcade.
Justificación instrucciones ARMv8:
str/ldr: los utilizamos ya que nos permiten usar registros como offset, lo cual fue util para desplazar el offset de forma automatizada

 