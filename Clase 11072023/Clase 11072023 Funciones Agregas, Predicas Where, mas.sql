
--Funciones de agregado en SQL (Al final del Scrio se encuentran un resumen de las mas utilizadas 
--Las funciones agregadas de SQL son funciones especiales que se utilizan para
--realizar cálculos y operaciones en un conjunto de datos. Para usar estas funciones
--SQL, debe usar la Cláusula GROUP BY y la HAVING de la instrucción SELECT..
--Las siguientes son las funciones SQL agregadas comúnmente utilizadas:
go
--Alias  Comodin en la tabla o Campo en el select 
SELECT AL.NOMBRE ,AL.APMATERNO AS 'apellido 2',AL.IIDSEXO AS 'GENERO'

FROM Alumno AS Al

GO
--Distinct  Quitar Duplicados 
SELECT DISTINCT A.NUMEROHERMANOS
FROM Alumno AS A

-- COUNT  Contar 

SELECT COUNT(*) AS 'Cantidad'
FROM Alumno AS A

-- Count y Distinct 

SELECT COUNT(DISTINCT A.NUMEROHERMANOS) AS 'Cantidad'
FROM Alumno AS A

-- TOP  cantidad de registros en el reporte 

SELECT top 5 *
FROM Alumno AS A
order by NOMBRE  --AUTO asc A/Z   desc Z/A   Ordernar una consulta por un campo

--MIN y MAX  Minimo y Maximo de una columna 
SELECT min(NUMEROHERMANOS)
FROM Alumno AS A

SELECT max(NUMEROHERMANOS) 
FROM Alumno AS A


--AVG promedio
SELECT avg(NUMEROHERMANOS)
FROM Alumno AS A


--SUM Sumar
SELECT SUM(NUMEROHERMANOS)
FROM Alumno AS A




	--CASE 
	SELECT CASE A.NUMEROHERMANOS
				WHEN 1 THEN 'LA CANTIDAD ES 1 '
				WHEN 2 THEN 'LA CANTIDAD ES 2 '
				ELSE 'NO ESTA EVALUADA '
		   END AS 'Nuevo campo '
	   
	FROM Alumno AS A


---WHERE Filtros con Aritmetico/ =, >, < , logicos AND, OR ,NOT / Precicados IN, BETWEEN , NULL

--texto comillas simples 
SELECT *
FROM Docente AS DO 
WHERE DO.NOMBRE = 'ELSA'
ORDER BY IIDDOCENTE
--- Numerico 
SELECT *
FROM Docente AS DO 
WHERE DO.IIDDOCENTE = 5
ORDER BY do.IIDDOCENTE

-- Aritmericas 

SELECT *
FROM Docente AS DO 
WHERE DO.IIDDOCENTE <= 4
ORDER BY do.IIDDOCENTE

SELECT *
FROM Docente AS DO 
WHERE DO.IIDDOCENTE != 4
ORDER BY do.IIDDOCENTE

--IN Solo busca los valores que indique en el parentesis 

SELECT *
FROM Docente AS DO 
WHERE DO.IIDDOCENTE in (1,5)
ORDER BY do.IIDDOCENTE

-- BETWEEN X AND X busca en un rango 
SELECT *
FROM Docente AS DO 
WHERE day(DO.FECHACONTRATO) between '12'  and '25' 
and year(DO.FECHACONTRATO) between '1960'  and '1981' 
ORDER BY do.IIDDOCENTE

-- BETWEEN y IN logicos 

select * 
from Alumno as A 
where a.IIDALUMNO not in (1,2)
AND YEAR(A.FECHANACIMIENTO) BETWEEN '1990' AND '1995'

--LIKE Buscar con coincidencias 


select * 
from Alumno as AL 
where al.NOMBRE like '%luis%' -- Busca coincidencias entre los %%
--''%'+@Nombre+'%''
select * 
from Alumno as AL 
where al.NOMBRE like '_A%'-- Busca la segunda letra 

select * 
from Alumno as AL 
where al.NOMBRE like 'A%'-- Busca la primer letra 

select * 
from Alumno as AL 
where al.NOMBRE like '%A'-- Busca la ultima por la letra 

select * 
from Alumno as AL 
where al.NOMBRE like 'J%R'-- Busca primera y ultima letra 

--- NULOS o NO NULOS 
SELECT *
FROM Alumno AS AL 
WHERE AL.FECHANACIMIENTO IS NULL


SELECT *
FROM Alumno AS AL 
WHERE AL.FECHANACIMIENTO IS NOT  NULL

--EXISTS

SELECT *
FROM Alumno AS AL 
WHERE NOT EXISTS (SELECT DO.NOMBRE FROM Docente DO WHERE DO.IIDDOCENTE= 1)

-- funciones agregadas SQL NULL FUNCTIONS 
-- GROUP BY y HAVING 
-- JOINS y Diagrama .
-- Reportes automaticos 



--Las siguientes son las funciones SQL agregadas comúnmente utilizadas:
--AVG()– devuelve el promedio de un conjunto.
--COUNT()– devuelve el número de elementos en un conjunto.


--MAX()– devuelve el valor más alto (máximo) en un conjunto de
--valores.
--MIN()– devuelve el valor mínimo en un conjunto
--SUM()– devuelve la suma de todos o valores distintos en un conjunto
--Excepto por la función COUNT(), las funciones agregadas de SQL ignoran
--nulo.
--Funciones de cadena SQL
--Las funciones de cadena son funciones predefinidas en SQL que se utilizan para
--manipular cadenas de caracteres. Algunas funciones SQL comunes incluyen:
--CHARINDEX() – Retorna la posición inicial.
--CONCAT() – Devuelve una cadena como resultado de una concatenación.
--LEFT() – Extraiga un número caracteres comenzando desde la izquierda.
--LEN() – Devuelve el número de caracteres, sin incluir los espacios finales.
--LOWER() – Devuelve una expresión de caracteres en minúsculas.
--LTRIM() – Eliminar los espacios iniciales de una cadena de caracteres.
--SUBSGTRING() – devuelve parte de un carácter.
--PATINDEX() – Encuentra la posición de un patrón en una cadena..
--REPLACE() – Reemplaza los valores de una cadena especificada.
--RIGHT() – Extrae caracteres del lado derecho de una cadena de texto.
--RTRIM() – Para truncar los espacios en blanco finales de una cadena.
--UPPER() – Convertir una cadena a mayúsculas
--Funciones de fecha y hora en SQL
--SQL incluye varias funciones de fecha y hora para trabajar con valores de fecha y
--hora en consultas y actualizaciones de datos. Algunas de las funciones SQL más
--comunes incluyen:
--CURRENT_TIMESTAMP() – devuelve la marca de tiempo actual del
--sistema.


--CURRENT_TIMEZONE() – Retorna el nombre de la zona horaria del
--servidor.
--CURRENT_TIMEZONE_ID() – Devuelve el ID de la zona horaria de SQL
--server
--DATEADD() – Modifica una fecha agregando un valor.
--DATEDIFF() –Calcula la diferencia entre dos fechas.
--FECHADIFF_BIG() – Retorna un entero grande para la diferencia de
--fechas.
--DATEFROMPARTS() – Devuelve un valor de fecha para el año, mes o día.
--DATENAME() – Devuelve un nombre que representa la parte de fecha.
--DATEPART() – Encontrar una parte determinada de la fecha especificada.
--DATETIME2FROMPARTS() – Devuelve un valor datetime2.
--DATETIMEFROMPARTS() – Devuelve un valor de fecha y hora.
--DAY() – Devuelve un entero que representa el día de una fecha dada.
--EOMONTH() – Devuelve el el último día del mes.
--GETDATE() – Retorna la fecha y hora actual en el servidor SQL.
--GETUTCDATE() – Devuelve la fecha y hora actual como hora UTC.
--ISDATE() – Verifica si un valor es una FECHA, HORA o FECHA HORA
--válida
--MONTH() – Devuelve un número entero que representa el mes de una
--fecha.
--SMALLDATETIMEFROMPARTS() – Retorna un valor de fecha y hora
--corta.
--SWITCHOFFSET() – cambia el valor de DATETIMEOFFSET a nueva zona.
--SYSDATETIME() – Devuelve un valor datetime2 que contiene la fecha y la
--hora.
--SYSDATETIMEOFFSET() – Devuelve el datetimeoffset para datetime y
--offset.
--SYSUTCDATETIME() – Devuelve el valor UTC datetime2 para la fecha y la
--hora.
--TIMEFROMPARTS() – Devuelve un valor de tiempo para los datos de
--tiempo.
--TODATETIMEOFFSET() –Devuelve un valor datetimeoffset para un
--datetime2.
--YEAR() – Devuelve un número entero que representa el año de una fecha
--dada.
--Funciones de conversión de TSQL
--Estas funciones SQL permiten convertir datos de un tipo de datos a otro, lo que es
--útil cuando se requiere un tipo de datos específico para una operación
--determinada. Por ejemplo, se puede convertir un número en una fecha.
--CAST() – convierte una expresión de un tipo de datos a otro.
--CONVERT() – Similar a CAST, pero con estilo de formato para fecha y la
--hora.
--PARSE() – Para convertir una cadena en tipos de fecha/hora y números.
--TRY_CAST() – Igual a cast, convierte una expresión de un tipo de datos a
--otro.
--TRY_CONVERT() –Similar a CONVERT, pero devuelve NULL y no error.
--TRY_PARSE() –Similar a PARSE, pero devuelve NULL y no error
--Es importante recordar que al convertir de un tipo de datos a otro, se pueden
--perder datos y generar un error. Siempre es recomendable validar la conversión
--antes de realizarla.
--Funciones matemáticas de SQL Server
--Las funciones matemáticas en SQL son herramientas útiles para realizar cálculos y
--transformaciones de datos en una base de datos. Algunas de las funciones SQL
--matemáticas más comunes incluyen:
--ABS() – obtiene el valor absoluto o el valor absoluto positivo.
--ACOS() – Esta función se usa para obtener el ángulo en radianes.
--ASIN() – Obtiene el ángulo en radianes, se conoce como arcoseno.
--ATAN() – Retorna el ángulo en radianes, se conoce como arcotangente.
--CEILING() – obtiene el valor más pequeño, >= que el numérica
--especificada.
--COS() – obtiene el valor del coseno trigonométrico.
--COT() – obtiene el valor de la cotangente trigonométrica.


--DEGREES() – convierte un ángulo radiante en grados.
--EXP() – obtiene un valor exponencial de la expresión flotante dada.
--FLOOR() – obtiene el valor entero más grande, <= que el número dad0.
--LOG() – obtiene el logaritmo natural de la expresión flotante dada.
--LOG10() – obtener el logarítmico en base 10 de la expresión flotante dada.
--PI() – obtiene el valor constante de PI, que es aproximadamente igual a
--3,14.
--POWER() –Retorna el poder de la expresión o el valor especificado.
--RADIANS() – convierte el ángulo dado en un ángulo equivalente en
--radianes.
--RAND() – obtener el positivo, y el valor será mayor o igual a 0.0 y menor a
--1.
--ROUND() – Redondea a la longitud o precisión especificada.
--SIGN() – Obtiene el signo de la expresión, Positivo (+), Negativo (-) o Cero
--(0).
--SIN() – Devuelve el valor trigonométrico SINE en radianes para el ángulo
--dado.
--SQRT() – calcula la raíz cuadrada de un número o valor dado.
--SQUARE() – calcula el cuadrado de un valor específico o un número
--individual.
--TAN() – Obtiene el valor en radianes de la tangente trigonométrica del
--ángulo dado.
--Funciones de Categoría TSQL
--Las funciones SQL de categoría en TSQL (Transact-SQL) son funciones que
--permiten clasificar y categorizar datos en función de criterios específicos. Algunas
--de las funciones de categoría más comunes en TSQL incluyen:
--ROW_NUMBER () – Serializa las filas del conjunto de resultados
--particionado.
--RANK () – Devuelve el rango de un valor en una lista determinada.
--DENSE_RANK () – Devuelve la posición relativa de las filas dentro del
--conjunto.
--NTILE () – divide las filas en grupos.

--Estas funciones de categoría son útiles para manipular y clasificar los datos en una
--tabla, lo que es esencial para realizar análisis y obtener información valiosa sobre
--los datos. Al utilizarlas, es importante tener en cuenta el impacto en el
--rendimiento y elegir la función adecuada para cada situación.
--Funciones analíticas de TSQL
--Las funciones SQL Server Analíticas calculan un valor agregado en función de un
--grupo de filas. Sin embargo, a diferencia de las funciones agregadas, las funciones
--analíticas pueden devolver varias filas para cada grupo.
--CUME_DIST() –calcula valores de distribución acumulativos de filas.
--FIRST_VALUE() – Para devolver el primer valor en un conjunto ordenado
--LAST_VALUE() –Para devolver el ultimo valor en un conjunto ordenado
--LAG() – Accede a los datos de la fila anterior.
--LEAD() – Accede a los datos de la fila siguiente.
--PERCENT_RANK() – Similar a la función CUME_DIST, que esta al
--principio.
--PERCENTILE_CONT() – calcula un percentil en una distribución de la
--columna.
--PERCENTILE_DISC() – calcula un percentil específico para valores
--ordenados en un conjunto de filas.
--Estas funciones SQL son muy útiles para realizar análisis avanzados de datos en
--consultas complejas y para obtener información valiosa sobre la estructura y la
--relación de los datos en una tabla. Al utilizarlas, es importante tener en cuenta el
--impacto en el rendimiento y elegir la función adecuada para cada situación.
--Funciones de configuración de TSQL
--Las funciones de configuración en TSQL (Transact-SQL) son funciones SQL que
--permiten obtener información sobre la configuración del sistema y la instancia de
--SQL Server en la que se está ejecutando la consulta. Estas funciones son útiles
--para realizar tareas como verificar el espacio disponible en disco, la versión de
--SQL Server y la configuración de red.


--Algunas de las funciones de configuración más comunes en TSQL son:
--@@VERSION() – Devuelve información sobre la versión de SQL Server.
--@@SPID() – Devuelve el identificador de proceso (SPID) del proceso
--actual.
--@@SERVERNAME() – esta función devuelve el nombre del servidor de
--SQL.
--@@TOTAL_MEMORY() – Devuelve la cantidad total de memoria en
--megabytes.
--@@CPU_BUSY() – Devuelve el tiempo total de CPU utilizado en
--milisegundos.
--@@MAX_CONNECTIONS() – Devuelve el número máximo de conexiones
--simultáneas permitidas en el servidor.
--Estas funciones de configuración son útiles para obtener información sobre el
--entorno en el que se está ejecutando una consulta, lo que es esencial para tomar
--decisiones informadas y solucionar problemas de rendimiento. Al utilizarlas, es
--importante tener en cuenta el impacto en el rendimiento y elegir la función
--adecuada para cada situación.