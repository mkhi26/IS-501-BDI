@author: aar.velasquez@gmail.com

@date: 2020/10/08

Operadores
====

Los operadores =, <>, <=, <,> = , >, <<, >>,  <=>, AND, OR o LIKE se pueden usar en expresiones en la lista de columnas de salida  (a la izquierda de FROM) en la instrucción SELECT. Tmbién puede aplicarse en los condicionales WHERE. Por ejemplo:

    SELECT col1 = 1 AND col2 = 2 FROM my_table

LIKE
---
Se usa en la cláusula WHERE para buscar un patrón específico sobre un atributo.

Hay dos comodines que se utilizan comúnmente junto con el operador **LIKE**. Los comdiden siguientes pueden variar segun el SGBD.
- % El signo porcentaje representa cero, uno o varios caracteres (.*).

- _ El guión bajo representa un solo caracter.

Algunos de los ejemplos tradicionales para el uso del LIKE  se muestran a continuación.

- atributo LIKE  'z__%': Buscar cualquier valor que comience con "z" que tenga al menos tres caracteres de longitud.

- Atributo LIKE '_z% ': Busca cualquier valor que tenga "z" en la segunda posición 

- Atributo LIKE '%z' : Buscar cualquier valor que termine con una "z".

- Atributo LIKE '%hn%' : Buscar cualquier valor que tenga "hn" en cualquier posición del campo.


IN
---

Es una abreviatura de múltiples condiciones OR. El operador IN permite especificar varios valores en una cláusula WHERE .

    WHERE atributo IN  (value1, value2, ...);
    WHERE atributo IN (SELECT STATEMENT);

GROUP BY, max, min, avg, sum
---

La función COUNT() devuelve el número de filas que coinciden con un criterio en específico y es la que hemos usado antes para verificar la "existencia de cantidad" de " tareas para un usuario, gerencia, etc".

-La función  MIN() devuelve el valor más pequeño de la columna seleccionada.

- La función MAX() devuelve el valor más grande de la columna seleccionada 

- La función AVG() devuelve el valor promedio de una columna númerica.

- La función SUM() devuelve la suma total de una columna númerica.

Order By
----

La palabra clave ORDER BY se utiliza para ordenar el conjunto de resultados en orden ascendente o descendente.

Having
---

La cláusula HAVING se usa en SQL para cuando existen condicionales que no pueden aplicarse en el WHERE.

    GROUP BY atributo(s) HAVING condicional 

@date 2020/10/12

Álgebra Relacional
====

- JOIN: Retrna los registros que tienen un **match** en ambas tablas.

- LEFT JOIN: Devuelve todos los registros de la tabla izquierda  (tabla 1) y los registros coincidentes de la tabla de la derecha (tabla 2). El resultado es NULL desde el lado derecho, si no hay coincidencia.

- RIGTH JOIN: Devuelve todos los registros de la tabla derecha  (tabla 2) y los registros coincidentes de la tabla de la izquierda (tabla 1). El resultado es NULL desde el lado izquierdo, si no hay coincidencia.

