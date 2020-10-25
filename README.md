# Proyecto final modelos de ingeniería

# Final Project engineering models

 * Keiner Arrieta1, Wilson Padilla2, Jesus Saravia3
   * Estudiante de pregrado, universidad de la costa, ingeniería de sistemas, karrieta9@cuc.edu.co
   * Estudiante de pregrado, universidad de la costa, ingeniería de sistemas, wpadilla4@cuc.edu.co
   * Estudiante de pregrado, universidad de la costa, ingeniería de sistemas, jsaravia1@cuc.edu.co

## Resumen

En el siguiente trabajo plasmamos el proceso para llevar a cabo un programa realizado con la herramienta
GUIDE de Matlab, que dado un modelo matemático representado por una ecuación entrada-salida,
determine su función de transferencia, ganancia, polos y ceros, mapa de polos, ceros, estabilidad del sistema,
gráficas con respecto a una entrada escalón y rampa, tipo de amortiguamiento y errores de posición
velocidad y aceleración.
Palabras claves: Matlab, GUIDE, Graficas, Sistema, Modelo Matemático, Entrada, Salida.
Abstract: In the following work we set up the process to carry out an out a program made with the Matlab
tool GUIDE, a mathematical model for an input-output equation, determine its transfer function, gain, poles
and zeros, map of poles , zeros, system stability, graphics with respect to a step and ramp input, damping
type and speed and acceleration position errors.
**Key words: Matlab, GUIDE, Graphics, System, Mathematical Model, Input, Output.**

## Introducción

A nivel industrial y empresaria la simulación de sistemas es primordial para llevar a cabo proyectos, pero
antes de esto, hay que pasar por el proceso de modelación que consiste en una construcción matemática
abstracta y simplificada relacionada con una parte de la realidad, es por esto que hemos desarrollado este
proyecto, cuya finalidad es generar un programa en Matlab que modele un sistema.
En este informe encontrara todo lo que se necesita para lleva a cabo el proyecto, como una parte teórica en
la que se define brevemente conceptos como: ceros, polos, ganancia, estabilidad, errores, diagrama de
bloque y entre otros, todo esto obtenido de libros como Ingeniería de control moderna de Katsuhiko Ogata,
y bases de datos especializadas como IEEE, también podremos encontrar una parte de desarrollo donde se
plasma todos los cálculos y procesos necesarios para representar una solución al problema base del proyecto,
continuo a esto se pueden observar los resultados que brinda el programa y por ultimo se encuentra las
conclusiones a las que llegamos después de culminar el proyecto.

## Teoría

***Modelo matemático***

Es una construcción matemática abstracta y simplificada relacionada con una parte de la realidad y creada
para un propósito particular.

***Sistemas***

Un sistema es una combinación de componentes que actúan juntos y realizan un objetivo determinado. Un
sistema no está necesariamente limitado a los sistemas físicos. El concepto de sistema se puede aplicar a
fenómenos abstractos y dinámicos, como los que se encuentran en la economía. Por tanto, la palabra sistema 
debe interpretarse en un sentido amplio que comprenda sistemas físicos, biológicos, económicos y similares.[1]

***Ceros***

Aquellos valores de la variable compleja r, para los cuales l F(s) l (el valor absoluto de F(s)) es cero, se
denominan ceros de F(s). [2]

***Polos***

Aquellos valores de la variable compleja s, para los cuales lF(s) es infinito, se denominan polos de F(s). [2]

***Ganancia***

Es una magnitud que expresa la relación entre la amplitud de una señal de salida respecto a la señal
de entrada. [3]

***Entrada función Escalón***

La entrada función escalón representa un cambio instantáneo en la entrada de referencia. Por ejemplo, si la
entrada es una posición angular de un eje mecánico, una entrada escalón representa una rotación súbita del
eje. [4]

***Entrada función Rampa***

La función rampa es una señal que cambia constantemente en el tiempo. [4]

***Entrada función parabólica***

La función parabólica representa una señal que tiene un orden más rápido que la función rampa [4]

***Función de transferencia***

La función de transferencia de un sistema descrito mediante una ecuación diferencial lineal e invariante en
el tiempo se define como el cociente entre la transformada de Laplace de la salida (función de respuesta) y
la transformada de Laplace de la entrada (función de excitación) bajo la suposición de que todas las
condiciones iniciales son cero. [1]

***Estabilidad***

Un sistema es estable, si al estar en equilibrio y verse sometido a una excitación, responde sin oscilaciones
violentas y sin que su salida diverge sin límite de su entrada. Si se ve sometido a una perturbación, regresaría
a su estado de equilibrio al desaparecer esta y si la entrada se mantiene, trataría de seguir los cambios que
esta experimenta. La estabilidad absoluta, indica si un sistema es Estable o Inestable. [4]

***Criterio de estabilidad de Routh***

El criterio de estabilidad de Routh dice si existen o no raíces inestables en una ecuación polinomio, sin tener
que obtenerlas en realidad. [1]

***Error de posición***

Esta es una medida del error en estado estacionario entre la entrada y la salida cuando la entrada es una
función paso unitario, esto es, la diferencia entre la entrada y la salida cuando el sistema se encuentra en
estado estacionario y la entrada es un paso.[2]

***Error de velocidad***

Esta es una medida del error en estado estacionario entre la entrada y la salida del sistema cuando la entrada
es una función rampa unitaria. [2]

***Error de aceleración***

Esta es una medida del error en estado estacionario del sistema, cuando la entrada es una funci6n parabólica
unitaria. [2]

***Diagrama de bloque***

Es un diagrama que representa gráficamente los sistemas de control dinámico, este es utilizado ampliamente
en el diseño y análisis de sistemas de control. [1]

***Sistema de lazo cerrado***

Sistema de lazo cerrado es un sistema con una entrada (la señal de referencia) y dos salidas (la señal de
control y la salida del proceso). [5]

***Amortiguamiento***

La amortiguación no es más que la disipación de energía, que hace que el movimiento se reduzca con el
tiempo y finalmente se detenga. La cantidad de amortiguación depende del material, la velocidad de la
dirección y, principalmente, la frecuencia de vibración. [6]

***Matlab***

Es un software matemático comercial, que puede realizar operaciones matriciales, funciones de dibujo y
datos, implementar algoritmos, crear interfaces de usuario, conectarse a otros procedimientos para lenguajes
de programación, etc. MATLAB también tiene una amplia gama de aplicaciones, que incluyen
principalmente el procesamiento de señales e imágenes, comunicaciones, diseño de sistemas de control,
pruebas y mediciones, modelado y análisis financiero, biología computacional y muchas otras aplicaciones.
[7]

***GUI***

(GUI) La interfaz gráfica de usuario de MATLAB, es un entorno que utiliza iconos gráficos, menús
desplegables, botones y técnicas de desplazamiento para reducir el tiempo y la cantidad de escritura, tiene
como propósito desarrollar simulaciones de proyectos y laboratorios. [8]

### Conclusiones

Después de haber Culminado el proyecto con éxito llegamos a la conclusión que todos los
conocimientos adquiridos al largo del semestre fueron de utilidad para el desarrollo del programa
que cumple con los requisitos exigidos. También podemos decir que Matlab es una increíble
herramienta con gran potencial matemático, pero en la parte de desarrollo de interfaz le falta
mejorar.

### Desarrollo

Este lo puedes encontrar muy bien explicado en el documento pdf.

### Referencias

    [1]Ogata, K., Ingeniería de control moderna, Pearson Educación, 2003.
    [2]Di Stefano, J. J., Stubberud, A. R., & Williams, I. J. retroalimentación y sistemas de control, MCGrawHill, 1992.
    [3]Tomasi, W., Sistemas de comunicaciones electrónicas, Pearson educación.2003
    [4]Kuo, B. C.. Sistemas de control automático. Pearson Educación.1996
    [5]Díaz, E. H. V., & Presentación, M. A. C. (2016, October). Closed loop identification in a four coupled tanks system. In Automatica (ICA-ACCA), IEEE International Conference on (pp. 1-4). IEEE.
    [6]Saeed, M. A. (2017, November). Analysis of proportional damping or Rayleigh damping on damped
    and undamped systems. In 2017 Fifth International Conference on Aerospace Science & Engineering
    (ICASE) (pp. 1-13). IEEE.
    [7]Hong, L., & Cai, J. (2010, February). The application guide of mixed programming between MATLAB
    and other programming languages. In Computer and Automation Engineering (ICCAE), 2010 The 2nd
    International Conference on (Vol. 3, pp. 185-189). IEEE. (Articulo)
    [8] Mathumisaranon, T., & Chayratsami, P. (2013, August). MATLAB GUI for digital communication
    system with tone jamming. In Teaching, Assessment and Learning for Engineering (TALE), 2013 IEEE
    International Conference on (pp. 589-592). IEEE.