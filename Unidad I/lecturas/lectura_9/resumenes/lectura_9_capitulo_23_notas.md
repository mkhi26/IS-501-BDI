@author: aar.velasquez@gmail.com

@date 2020/10/19

Capítulo 23: Conceptos de bases de datos distribuidas
====

Un sistema informático distribuido
Consiste en varios sitios de procesamiento o nodos que están interconectados por un
red informática y que cooperan en la realización de determinadas tareas asignadas. Como general
objetivo, los sistemas informáticos distribuidos dividen un gran problema inmanejable en
piezas más pequeñas y resolverlo de manera eficiente y coordinada.

23.1 Conceptos de bases de datos distribuidas
----

    Podemos definir una base de datos distribuida (DDB) como una colección de múltiples
    Bases de datos interrelacionadas distribuidas a través de una red informática, y una distribución
    sistema de gestión de base de datos (DDBMS) como un sistema de software que gestiona una
    base de datos tributada al tiempo que hace que la distribución sea transparente para el usuario.

**¿Qué constituye una DDB?**

Para que una base de datos se llame distribuida, las siguientes condiciones mínimas deben
estar satisfecho:


    Conexión de nodos de bases de datos a través de una red informática. Hay múltiples
    múltiples computadoras, llamadas sitios o nodos . Estos sitios deben estar conectados por un
    red subyacente para transmitir datos y comandos entre sitios.

    Interrelación lógica de las bases de datos conectadas. Es fundamental que el
    la información en los distintos nodos de la base de datos esté relacionada lógicamente.

    Posible ausencia de homogeneidad entre los nodos conectados. No es necesario
    ruego que todos los nodos sean idénticos en términos de datos, hardware y software.

Todos los sitios pueden estar ubicados en proximidad física, por ejemplo, dentro del mismo edificio o
grupo de edificios adyacentes, y conectados a través de una red de área local , o pueden ser
distribuidos geográficamente en grandes distancias y conectados a través de un largo o ancho
red de área . Las redes de área local suelen utilizar concentradores o cables inalámbricos, mientras que
Las redes de larga distancia utilizan líneas telefónicas, cables, infraestructura de comunicación inalámbrica.
tures, o satélites.

**Transparencia**


Un sistema altamente transparente ofrece mucha flexibilidad al
usuario final / desarrollador de aplicaciones, ya que requiere poca o ninguna conciencia de los
detalles de su parte.

En el caso de una base de datos centralizada tradicional, la transparencia
Ency simplemente se refiere a la independencia lógica y física de los datos para la aplicación.

    Sin embargo, en un escenario de DDB, los datos y el software se distribuyen
    sobre varios nodos conectados por una red informática, por lo que los tipos adicionales de
    se introducen transparencias.

**Tipos de transparecia posibles:**

Transparencia de la organización de datos (también conocida como distribución o red
transparencia).
Esto se refiere a la libertad para el usuario de la operación
detalles de la red y la ubicación de los datos en el sistema distribuido
tem.
 Puede dividirse en transparencia de ubicación y transparencia de nomenclatura.
    La transparencia de ubicación se refiere al hecho de que el comando utilizado para realizar
    una tarea es independiente de la ubicación de los datos y la ubicación del nodo
    donde se emitió el comando.
    
    La transparencia de los nombres implica que una vez nombre está asociado con un objeto, se puede acceder a los objetos nombrados una de manera ambigua sin especificación adicional sobre dónde se encuentran los datos.

Transparencia de replicación. Como mostramos en la Figura 23.1, copias del mismo
Los objetos de datos se pueden almacenar en varios sitios para una mejor disponibilidad, rendimiento
mance y fiabilidad. La transparencia de la replicación hace que el usuario no se dé cuenta
la existencia de estas copias.
    Transparencia de fragmentación. Son posibles dos tipos de fragmentación.
    La fragmentación horizontal distribuye una relación (tabla) en subrelaciones
    que son subconjuntos de las tuplas (filas) en la relación original; esto también se conocecomo fragmentación en los nuevos sistemas de big data y cloud computing. Vertical

    La fragmentación distribuye una relación en subrelaciones donde cada subrelación
    está definido por un subconjunto de las columnas de la relación original. Fragmentación
    la transparencia hace que el usuario desconozca la existencia de fragmentos.

Otras transparencias incluyen transparencia y ejecución del diseño
transparencia, que se refieren, respectivamente, a la libertad de saber cómo
La base de datos distribuida está diseñada y donde se ejecuta una transacción.

**Disponibilidad y confiabilidad**

La confiabilidad se define ampliamente como la probabilidad de que un
El sistema está funcionando (no inactivo) en un momento determinado, mientras que la disponibilidad es la
probabilidad de que el sistema esté continuamente disponible durante un intervalo de tiempo.

**Escalabilidad y tolerancia de partición**

La escalabilidad determina hasta qué punto el sistema puede expandir su capacidad mientras
seguir funcionando sin interrupción. Hay dos tipos de escalabilidad:

    1. Escalabilidad horizontal: se refiere a expandir el número de nodos en el
    Sistema distribuido. A medida que se agregan nodos al sistema, debería ser posible
    para distribuir algunos de los datos y cargas de procesamiento de los nodos existentes a
    los nuevos nodos.
    2. Escalabilidad vertical: se refiere a expandir la capacidad del individuo.
    nodos en el sistema, com


. El concepto de partición
La tolerancia establece que el sistema debe tener la capacidad de seguir funcionando.
mientras la red está particionada.

**Autonomía**

    La autonomía determina la medida en que los nodos o bases de datos individuales en un
    DDB puede funcionar de forma independiente. Es deseable un alto grado de autonomía para
    mayor flexibilidad y mantenimiento personalizado de un nodo individual. Autonomía
    se puede aplicar al diseño, la comunicación y la ejecución.

**Ventajas de las bases de datos distribuidas**

- Mejora de la facilidad y flexibilidad del desarrollo de aplicaciones

- Mayor disponibilidad.

- Rendimiento mejorado

- Expansión más sencilla gracias a la escalabilidad

