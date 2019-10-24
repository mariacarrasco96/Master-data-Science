
# Ejercicios 4

#### 1 Ejercicio

* Crear un array de tamaño 20 donde todos los elementos estén inicializados a cero. Por favor llámalo __a__.


```
In [2]:# Sol:

```

* Escribe una expresión Python para cambiar el valor de  los primeros 5 elementos; el nuevo valor es 10.


```
In [3]:# Sol:

```

* Modifica los siguientes 10 valores. Los nuevos valores serán el resultado de la secuencia de números pares comenzando por el 12. Utiliza la función __arange__.


```
In [4]:# Sol:

```

* Modifica el valor de los últimos 5 elementos. Su nuevo valor es 30.


```
In [5]:# Sol:

```

#### 2 Ejercicio

El archivo de texto [holland_temperature.dat](./datos/holland_temperature.dat) recoge datos de las diferentes temperaturas registradas en Holanda en los últimos 12 meses.

---
a) Calcula la media de las temperaturas.
   * Descarga el fichero [holland_temperature.dat](./datos/holland_temperature.dat) en tu directorio de trabajo.
   * Carga los datos en una array llamado __temperatura__ mediante la función __loadtxt__.
   * Utiliza la función __mean__ para calcular la media.
    
__Nota__: La media es 10.125.


```
In [6]:# Sol

```

------
b) Nos interesa conocer los meses del año donde la temperatura ha sido superior a la media.
   * Crear un array de meses [1,...,12]. Usa la función __arange__. 
   * Escribir la expresión que devuelve los meses donde la temperatura ha sido superior a la media usando como máscara un array de booleanos.
    
__Nota__: La solución es: [5,  6,  7,  8,  9, 10]


```
In [7]:# Sol:

```

-------
c) Queremos saber qué mes ha estado más cerca de la media. 
* Para ello calcula el array de diferencias con respecto a la media (operación diferencia). 
* Luego utiliza la función __argmin__ de Numpy para calcular el índice del array que contiene el mínimo valor.

__Nota__: la solución es: 'El mes más cercano a los 10.12 grados es el mes 9'


```
In [8]:# Sol:

```

---------------------
