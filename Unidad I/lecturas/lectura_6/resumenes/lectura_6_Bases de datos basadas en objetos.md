@author: aar.velasquez@gmail.com

@date 2020/10/16

Capítulo 9: Bases de datos basadas en objetos
====

Sistemas orientados a objetos y sistemas relacionales orientado a objetos
----
----

Ya se han estudiado las bases de datos relacionales orientadas a objetos, que son bases de datos orien-
tadas a objetos construidas sobre el modelo relacional, así como las bases de datos orientadas a objetos,
que se crean alrededor de los lenguajes de programación persistentes.

Las extensiones persistentes de loslenguajes de programación y los sistemas relacionales orientados
a objetos se dirigen a mercados diferentes. La naturaleza declarativa y la limitada potencia (comparada
con la de los lenguajes de programación) del lenguaje SQL proporcionan una buena protección de los
datos respecto de los errores de programación y hacen que las optimizaciones de alto nivel, como la
reducción de E/S, resulten relativamente sencillas Los sistemas relacionales orientados a objetos se dirigen a simplificar la realización de los modelos de datos y de las consultas mediante el uso de tipos de datos complejos. Entre las aplicaciones habituales están el almacenamiento y la consulta de datos complejos, incluidos los datos
multimedia.

Los lenguajes declarativos como SQL , sin embargo, imponen una reducción significativa del rendimiento a ciertos tipos de aplicaciones que se ejecutan principalmente en la memoria principal y realizan
gran número de accesos a la base de datos. Los lenguajes de programación persistentes se dirigen a las
aplicaciones de este tipo que tienen necesidad de un rendimiento elevado. Proporcionan acceso a los
datos persistentes con poca sobrecarga y eliminan la necesidad de traducir los datos si hay que tratarlos
con un lenguaje de programación. Sin embargo, son más susceptibles de deteriorar los datos debido a
los errores de programación y no suelen disponer de gran capacidad de consulta. Entre las aplicaciones
habituales están las bases de datos de CAD .
Los puntos fuertes de los diversos tipos de sistemas de bases de datos pueden resumirse de la manera
siguiente:

        • Sistemas relacionales: tipos de datos sencillos, lenguajes de consultas potentes, protección ele-
        vada.
        • Bases de datos orientadas a objetos basadas en lenguajes de programación persistentes: tipos
        de datos complejos, integración con los lenguajes de programación, elevado rendimiento.
        • Sistemas relacionales orientados a objetos: tipos de datos complejos, lenguajes de consultas
        potentes, protección elevada.
Estas descripciones son válidas en general, pero hay que tener en cuenta que algunos sistemas de ba-
ses de datos no respetan estas fronteras. Por ejemplo, algunos sistemas de bases de datos orientados a
objetos construidos alrededor de lenguajes de programación persistentes se pueden implementar sobre
sistemas de bases de datos relacionales o sobre sistemas de bases de datos relacionales orientados a
objetos. Puede que estos sistemas proporcionen menor rendimiento que los sistemas de bases de datos
orientados a objetos construidos directamente sobre los sistemas de almacenamiento, pero proporcionan
parte de las garantías de protección más estrictas propias de los sistemas relacionales.

