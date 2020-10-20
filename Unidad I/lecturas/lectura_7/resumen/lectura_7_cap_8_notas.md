@author: aar.velasquez@gmail.com

@date: 2020/10/18


Capítulo 8: El álgebra relacional y Cálculo relacional
====

El conjunto básico de operaciones para el modelo relacional formal es el álgebra relacional.

Estas operaciones permiten a un usuario
para especificar solicitudes de recuperación básicas como expresiones de álgebra relacional. El resultado de un
consulta de recuperación es una nueva relación. Las operaciones de álgebra producen así nuevas relaciones, que se pueden manipular aún más utilizando operaciones del mismo álgebra.

La secuencia de operaciones de álgebra relacional forma una expresión de álgebra relacional ,
cuyo resultado también será una relación que representa el resultado de una consulta de base de datos
(o solicitud de recuperación).

Importancia del álgebra relacional:
----
    - proporciona una base formal para las operaciones del modelo relacional.

    - se utiliza como base para implementar y optimizar consultas en el módulos de optimización y procesamiento de consultas que son parte integral de las relaciones del lenguaje de consulta para RDBMS.

Mientras que el álgebra define un conjunto de operaciones para el modelo relacional, el cálculo relacional proporciona un lenguaje declarativo de alto nivel para especificar relaciones de consultas.


El cálculo relacional es importante porque tiene una base firme en
lógica matemática y porque el lenguaje de consulta estándar (SQL) para RDBMS
tiene algunos de sus fundamentos en una variación del cálculo relacional conocida como tupla
cálculo relacional.

El álgebra relacional a menudo se considera una parte integral de los datos relacionales.
modelo. Sus operaciones se pueden dividir en dos grupos.

    - conjunto de operaciones de la teoría matemática de conjuntos.

    -operaciones desarrolladas específicamente para bases de datos relacionales, que incluyen SELECT , PROJECT , y JOIN , entre otros.

8.1 Operaciones relacionales unarias:
----
**Seleccionar y proyectar**
___
**SELECT:**

    se usa para elegir un subconjunto de las tuplas de una relación que satisface una condición de selección

    En general, la operación SELECT se denota por
    σ < condición de selección > ( R )

**PROJECT:**

    Si pensamos en una relación como una tabla, la operación SELECT elige algunas de las filas
    de la tabla mientras descarta otras filas. La operación PROYECTO , por otro lado, selecciona ciertas columnas de la tabla y descarta las otras columnas. Si nosotros
    están interesados solo en ciertos atributos de una relación, usamos la operación PROYECTO
    para proyectar la relación sobre estos atributos solamente.

    π Lname, Fname, Salario ( EMPLEADO )

    La operación PROYECTO elimina cualquier tupla duplicada, por lo que El resultado de la operación PROYECTO es un conjunto de tuplas distintas y, por lo tanto, una relación.


**Secuencias de operaciones y operación RENAME**
____

**RENAME:**

    El general
    La operación RENAME cuando se aplica a una relación R de grado n se denota por cualquiera de los
    siguientes tres formas:
    ρ S ( B1, B2, ..., Bn ) ( R ) o ρ S ( R ) o ρ ( B1, B2, ..., Bn ) ( R )


8.2 Operaciones de álgebra relacional de la teoría de conjuntos
====

**Las operaciones UNION, INTERSECTION, y MINUS**
____

**UNION:**

    Por ejemplo, para recuperar los números de seguro social de todos.

    empleados que trabajan en el departamento 5 o supervisan directamente a un empleado que
    trabaja en el departamento 5, podemos utilizar la operación UNION

    DEP5_EMPS ← σ Dno = 5 ( EMPLOYEE )
    RESULT1 ← π Ssn ( DEP5_EMPS )
    RESULT2 ( Ssn ) ← π Super_ssn ( DEP5_EMPS )
    RESULT ← RESULT1 ∪ RESULT2

Se utilizan varias operaciones de la teoría de conjuntos para fusionar los elementos de dos conjuntos en
formas, incluyendo UNION , INTERSECTION y SET DIFFERENCE (también llamado
MINUS o EXEPT )


Podemos definir las tres operaciones UNION , INTERSECTION y SET DIFFERENCE
en dos relaciones R y S compatibles con la unión como sigue:


    UNION: 
        El resultado de esta operación, denotado por R ∪ S, es una relación que incluye todas las tuplas que están en R o en S o en R y S. Duplicar se eliminan las tuplas.

    INTERSECTION:

        El resultado de esta operación, denotado por R ∩ S, es una relación que incluye todas las tuplas que están tanto en R como en S.


    SET DIFFERENCE (o MINUS ):

        el resultado de esta operación, denotado por R - S, es una relación que incluye todas las tuplas que están en R pero no en S.


Observe que tanto UNION como INTERSECTION son operaciones conmutativas; es decir,
R ∪ S = S ∪ R y R ∩ S = S ∩ R
Tanto UNION como INTERSECTION pueden tratarse como operaciones n-arias aplicables a
cualquier número de relaciones porque ambas son también operaciones asociativas; es decir,
R ∪ (S ∪ T) = (R ∪ S) ∪ T y (R ∩ S) ∩ T = R ∩ (S ∩ T)


La operación MINUS no es conmutativa; es decir, en general, 

    R - S ≠ S - R

En SQL, hay tres operaciones: UNION , INTERSECT y EXCEPT , que corresponden
responda a las operaciones establecidas aquí descritas. Adems, existen operaciones multiset ( UNION ALL , INTERSECT ALL y EXCEPT ALL ) que no eliminan duplicados.

**El PRODUCTO CARTESIANO (PRODUCTO CRUZADO)**
____


También conocida como CROSS PRODUCTO o UNIÓN CRUZADA, que se indica con ×.

La operación PRODUCTO CARTESIANO aplicada por sí misma
generalmente no tiene sentido. Es sobre todo útil cuando va seguido de una selección que
coincide con los valores de los atributos que provienen de las relaciones de los componentes. Por ejemplo,
supongamos que queremos recuperar una lista de nombres de las dependencias de cada empleada
abolladuras. Podemos hacer esto de la siguiente manera:

    FEMALE_EMPS ← σ Sex = ‘F’ ( EMPLOYEE )
    EMPNAMES ← π Fname, Lname, Ssn ( FEMALE_EMPS )
    EMP_DEPENDENTS ← EMPNAMES × DEPENDENT
    ACTUAL_DEPENDENTS ← σ Ssn = Essn ( EMP_DEPENDENTS )
    RESULT ← π Fname, Lname, Dependent_name ( ACTUAL_DEPENDENTS )

8.3 Operaciones relacionales binarias:
    JOIN y DIVISION
====

**La operación JOIN:**

    se usa para combinar tuplas relacionadas de dos relaciones en tuplas simples "más largas".

**Variaciones de JOIN: EQUIJOIN y NATURAL JOIN**
- El uso más común de JOIN implica condiciones de unión con comparaciones de igualdad solamente, tal JOIN , donde el único operador de comparación utilizado es =, se denomina
EQUIJOIN .

- La definición estándar de NATURAL JOIN requiere que los dos atributos se unan (o cada par de atributos de combinación) tienen el mismo nombre en ambas relaciones. Si este no es el caso, primero se aplica una operación de cambio de nombre.

**Un conjunto completo de operaciones de álgebra relacional**

    Se ha demostrado que el conjunto de operaciones de álgebra relacional {σ, π, ∪, ρ, -, ×} es un
    juego completo ; es decir, cualquiera de las otras operaciones originales de álgebra relacional puede ser
    expresado como una secuencia de operaciones de este conjunto. Por ejemplo, la INTERSECCIÓN
    La operación se puede expresar usando UNION y MINUS de la siguiente manera:
    R ∩ S ≡ (R ∪ S) - ((R - S) ∪ (S - R))

**La operación DIVISION**

    En general, la operación DIVISION se aplica a dos relaciones R (Z) ÷ S (X), donde el
    los atributos de S son un subconjunto de los atributos de R; es decir, X ⊆ Z. Sea Y el conjunto de
    atributos de R que no son atributos de S; es decir, Y = Z - X (y por tanto Z = X ∪ Y).

**Notación para árboles de consultas**
____

Un árbol de consulta es una estructura de datos de árbol que corresponde a una expresión de álgebra relacional.
Representa las relaciones de entrada de la consulta como nodos hoja del árbol, y representa Resiente las operaciones del álgebra relacional como nodos internos.

8.4 Operaciones relacionales adicionales
----

Algunas solicitudes de bases de datos comunes, que se necesitan en aplicaciones comerciales
para RDBMS: no se puede realizar con las operaciones originales de álgebra relacional.

En esta sección definimos operaciones adicionales
ciones para expresar estas solicitudes. Estas operaciones realzan el poder expresivo de
el álgebra relacional original.

**Proyección generalizada**
____

extiende la operación de proyección al permitir
funciones de los atributos que se incluirán en la lista de proyección. La forma generalizada
se puede expresar como:

    π F1, F2, ..., Fn (R)

donde F 1 , F 2 ,..., F n son funciones sobre los atributos en relación R y pueden involucrar
operaciones aritméticas y valores constantes.

**Funciones agregadas y agrupación**
____

Ejemplos de tales funciones incluyen recuperar el salario promedio o total
de todos los empleados o el número total de tuplas de empleados.

Las funciones comunes aplicadas a colecciones de valores numéricos incluyen SUM ,
AVERAGE , MAXIMUN y MINIMUN . La función COUNT se utiliza para contar
tuplas o valores.


**Operaciones de cierre recursivo**
____
    Un ejemplo de una operación recursiva es recuperar todos los supervisados de un
    empleado e en todos los niveles, es decir, todos los empleados e ′ supervisados directamente por e, todos los empleados
    ees e′I supervisados directamente por cada empleado e ′, todos los empleados e ′′ ′ supervisan directamente
    visualizado por cada empleado e ′′, y así sucesivamente.


**Operaciones OUTER JOIN**

Las operaciones de unión que describimos anteriormente en
La sección 8.3 son todas combinaciones internas. Esto equivale a la pérdida de información si el usuario
quiere que el resultado de JOIN incluya todas las tuplas en una o más de las combinaciones
relaciones con los ponentes.


Se desarrolló un conjunto de operaciones, llamadas combinaciones externas , para el caso en el que el usuario
quiere mantener todas las tuplas en R, o todas las de S, o todas las de ambas relaciones en
el resultado de JOIN , independientemente de si tienen o no tuplas coincidentes en
la otra relación. Esto satisface la necesidad de consultas en las que tuplas de dos
Las tablas deben combinarse haciendo coincidir las filas correspondientes, pero sin perder
cualquier tupla por falta de valores coincidentes.


**La operación UNIÓN EXTERIOR**

La operación OUTER UNION fue desarrollada para tomar la unión de tuplas de dos relaciones que tienen algunos atributos comunes, pero no son compatibles con la unión (tipo).

UNIÓN EXTERIOR se puede aplicar a dos relaciones cuyos esquemas son ESTUDIANTE ( Nombre ,
Ssn , Departamento , Asesor ) e INSTRUCTOR ( Nombre , Ssn , Departamento , Rango ). Tuplas
de las dos relaciones se emparejan basándose en tener la misma combinación de
valores de los atributos compartidos: Nombre , Ssn , Departamento .


8.5 Ejemplos de consultas en álgebra relacional
====


8.6 El cálculo relacional de tuplas
====

Una expresión de cálculo especifica qué va a
ser recuperado en lugar de cómo recuperarlo. Por tanto, el cálculo relacional es
considerado un lenguaje no procesal .

Se considera un lenguaje de consulta relacional L
relacionalmente completo si podemos expresar en L cualquier consulta que pueda expresarse en cálculo relacional.

El cálculo relacional es importante por dos razones:

    - Tiene una base firme en lógica matemática.

    - el lenguaje de consulta estándar (SQL) para RDBMS tiene su
    fundamento en el cálculo relacional de tuplas.


**Variables de tupla y relaciones de rango**
___

El cálculo relacional de tuplas se basa en especificar una serie de variables de tuplas .

La consulta de cálculo relacional de tupla tiene la forma:

    {t | COND (t)}

donde t es una variable de tupla y COND (t) es una expresión condicional (booleana)
t que se evalúa como VERDADERO o FALSO para diferentes asignaciones de
tuplas a la variable t.

**Expresiones y fórmulas en cálculo relacional de tuplas**
___
Una expresión general del cálculo relacional de tuplas tiene la forma:

    {t 1 .A j , t 2 .A k , ..., t n .A m | COND (t 1 , t 2 , ..., t n , t n + 1 , t n + 2 , ..., t n + m )}

donde t 1 , t 2 ,..., t n , t n + 1 ,..., t n + m son variables de tupla, cada A i es un atributo del
relación en la que t i varía, y COND es una condición o fórmula 13 de la relación tupla
cálculo cional. Una fórmula se compone de átomos de cálculo de predicados , que pueden ser uno
de los siguientes:

    1. Un átomo de la forma R (t i ), donde R es un nombre de relación y t i es una variable tupla.
    poder. Este átomo identifica el rango de la variable tupla t i como la relación
    cuyo nombre es R. Se evalúa como VERDADERO si t i es una tupla en la relación R, y
    se evalúa como FALSO en caso contrario.

    2. Un átomo de la forma t i .A op t j .B, donde op es una de las operaciones de comparación
    tors en el conjunto {=, <, ≤,>, ≥, ≠}, t i y t j son variables de tupla, A es un atributo
    de la relación en la que t i varía, y B es un atributo de la relación en
    que t j varía.

    3. Un átomo de la forma t i .A op c o c op t j .B, donde op es uno de los
    operadores en el conjunto {=, <, ≤,>, ≥, ≠}, t i y t j son variables de tupla, A es un atributo
    En lugar de la relación en la que t i varía, B es un atributo de la relación en
    que t j varía, y c es un valor constante.

**Los cuantificadores existenciales y universales**

cuantificador universal (∀) y el cuantificador existencial (∃).

El cuantificador (∃) se llama cuantificador existencial porque una fórmula (∃t) (F) es
TRUE si existe alguna tupla que haga F TRUE . Para el cuantificador universal

(∀t) (F) es VERDADERO si todas las tuplas posibles que se pueden asignar a apariciones libres de
t en F se sustituye por t, y F es VERDADERO para cada sustitución de este tipo.

**Consultas de muestra en cálculo relacional de tuplas**
____


**Notación para gráficos de consulta**
____

Estos tipos de consultas se conocen como consultas de selección-proyecto-unión porque solo
involucran estas tres operaciones de álgebra relacional

La representación de una consulta se denomina gráfico de consulta .

Las relaciones en la consulta están representadas por nodos de relación , que se muestran como círculos simples.

Los valores constantes, normalmente de las condiciones de selección de la consulta, son representados por nodos constantes , que se muestran como círculos dobles u óvalos.

Las condiciones de unión y unión están representadas por los bordes del gráfico (las líneas que conectan
los nodos)

**Transformar los cuantificadores universal y existencial**

Es posible transformar un cuantificador universal en un cuantificador existencial, y viceversa, para obtener una expresión equivalente.


Una transformación general puede describirse informalmente como sigue:

    formar un tipo de cuantificador en otro con negación (precedido de NOT ); Y
    y O reemplazarse entre sí; una fórmula negada se vuelve innecesaria; y un la fórmula negada se vuelve negada.

**Uso del cuantificador universal en consultas**
Siempre que utilizamos un cuantificador universal, es bastante sensato seguir algunas reglas para
asegúrese de que nuestra expresión tenga sentido.

**Expresiones seguras**

Una expresión segura en el cálculo relacional es aquella que garantiza
producir un número finito de tuplas como resultado; de lo contrario, la expresión se denomina insegura .
Por ejemplo, la expresión

    {t | NO ( EMPLEADO (t))}

no es seguro porque produce todas las tuplas del universo que no son tuplas EMPLEADOS ,
que son infinitamente numerosos.

Se dice que una expresión es segura si todos los valores en su resultado son del dominio de la expresión.

8.7 El dominio del cálculo relacional
----

Existe otro tipo de cálculo relacional llamado cálculo relacional de dominio, o
simplemente cálculo de dominio .

El cálculo de dominios difiere del cálculo de tuplas en el tipo de variables utilizadas en la fórmula.
las: en lugar de tener un rango de variables en tuplas, las variables varían en un solo
valores de dominios de atributos.

Para formar una relación de grado n para el resultado de una consulta,
debemos tener n de estas variables de dominio, una para cada atributo. Una expresión
del cálculo de dominio es de la forma

    {x 1 , x 2 , ..., x n | COND (x 1 , x 2 , ..., x n , x n + 1 , x n + 2 , ..., x n + m )}
donde x 1 , x 2 ,..., x n , x n + 1 , x n + 2 ,..., x n + m son variables de dominio que van más allá de
dominios (de atributos), y COND es una condición o fórmula del dominio
cálculo relacional.




