
--Funciones de agregado en SQL (Al final del Scrio se encuentran un resumen de las mas utilizadas 
--Las funciones agregadas de SQL son funciones especiales que se utilizan para
--realizar c�lculos y operaciones en un conjunto de datos. Para usar estas funciones
--SQL, debe usar la Cl�usula GROUP BY y la HAVING de la instrucci�n SELECT..
--Las siguientes son las funciones SQL agregadas com�nmente utilizadas:
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



--Las siguientes son las funciones SQL agregadas com�nmente utilizadas:
--AVG()� devuelve el promedio de un conjunto.
--COUNT()� devuelve el n�mero de elementos en un conjunto.


--MAX()� devuelve el valor m�s alto (m�ximo) en un conjunto de
--valores.
--MIN()� devuelve el valor m�nimo en un conjunto
--SUM()� devuelve la suma de todos o valores distintos en un conjunto
--Excepto por la funci�n COUNT(), las funciones agregadas de SQL ignoran
--nulo.
--Funciones de cadena SQL
--Las funciones de cadena son funciones predefinidas en SQL que se utilizan para
--manipular cadenas de caracteres. Algunas funciones SQL comunes incluyen:
--CHARINDEX() � Retorna la posici�n inicial.
--CONCAT() � Devuelve una cadena como resultado de una concatenaci�n.
--LEFT() � Extraiga un n�mero caracteres comenzando desde la izquierda.
--LEN() � Devuelve el n�mero de caracteres, sin incluir los espacios finales.
--LOWER() � Devuelve una expresi�n de caracteres en min�sculas.
--LTRIM() � Eliminar los espacios iniciales de una cadena de caracteres.
--SUBSGTRING() � devuelve parte de un car�cter.
--PATINDEX() � Encuentra la posici�n de un patr�n en una cadena..
--REPLACE() � Reemplaza los valores de una cadena especificada.
--RIGHT() � Extrae caracteres del lado derecho de una cadena de texto.
--RTRIM() � Para truncar los espacios en blanco finales de una cadena.
--UPPER() � Convertir una cadena a may�sculas
--Funciones de fecha y hora en SQL
--SQL incluye varias funciones de fecha y hora para trabajar con valores de fecha y
--hora en consultas y actualizaciones de datos. Algunas de las funciones SQL m�s
--comunes incluyen:
--CURRENT_TIMESTAMP() � devuelve la marca de tiempo actual del
--sistema.


--CURRENT_TIMEZONE() � Retorna el nombre de la zona horaria del
--servidor.
--CURRENT_TIMEZONE_ID() � Devuelve el ID de la zona horaria de SQL
--server
--DATEADD() � Modifica una fecha agregando un valor.
--DATEDIFF() �Calcula la diferencia entre dos fechas.
--FECHADIFF_BIG() � Retorna un entero grande para la diferencia de
--fechas.
--DATEFROMPARTS() � Devuelve un valor de fecha para el a�o, mes o d�a.
--DATENAME() � Devuelve un nombre que representa la parte de fecha.
--DATEPART() � Encontrar una parte determinada de la fecha especificada.
--DATETIME2FROMPARTS() � Devuelve un valor datetime2.
--DATETIMEFROMPARTS() � Devuelve un valor de fecha y hora.
--DAY() � Devuelve un entero que representa el d�a de una fecha dada.
--EOMONTH() � Devuelve el el �ltimo d�a del mes.
--GETDATE() � Retorna la fecha y hora actual en el servidor SQL.
--GETUTCDATE() � Devuelve la fecha y hora actual como hora UTC.
--ISDATE() � Verifica si un valor es una FECHA, HORA o FECHA HORA
--v�lida
--MONTH() � Devuelve un n�mero entero que representa el mes de una
--fecha.
--SMALLDATETIMEFROMPARTS() � Retorna un valor de fecha y hora
--corta.
--SWITCHOFFSET() � cambia el valor de DATETIMEOFFSET a nueva zona.
--SYSDATETIME() � Devuelve un valor datetime2 que contiene la fecha y la
--hora.
--SYSDATETIMEOFFSET() � Devuelve el datetimeoffset para datetime y
--offset.
--SYSUTCDATETIME() � Devuelve el valor UTC datetime2 para la fecha y la
--hora.
--TIMEFROMPARTS() � Devuelve un valor de tiempo para los datos de
--tiempo.
--TODATETIMEOFFSET() �Devuelve un valor datetimeoffset para un
--datetime2.
--YEAR() � Devuelve un n�mero entero que representa el a�o de una fecha
--dada.
--Funciones de conversi�n de TSQL
--Estas funciones SQL permiten convertir datos de un tipo de datos a otro, lo que es
--�til cuando se requiere un tipo de datos espec�fico para una operaci�n
--determinada. Por ejemplo, se puede convertir un n�mero en una fecha.
--CAST() � convierte una expresi�n de un tipo de datos a otro.
--CONVERT() � Similar a CAST, pero con estilo de formato para fecha y la
--hora.
--PARSE() � Para convertir una cadena en tipos de fecha/hora y n�meros.
--TRY_CAST() � Igual a cast, convierte una expresi�n de un tipo de datos a
--otro.
--TRY_CONVERT() �Similar a CONVERT, pero devuelve NULL y no error.
--TRY_PARSE() �Similar a PARSE, pero devuelve NULL y no error
--Es importante recordar que al convertir de un tipo de datos a otro, se pueden
--perder datos y generar un error. Siempre es recomendable validar la conversi�n
--antes de realizarla.
--Funciones matem�ticas de SQL Server
--Las funciones matem�ticas en SQL son herramientas �tiles para realizar c�lculos y
--transformaciones de datos en una base de datos. Algunas de las funciones SQL
--matem�ticas m�s comunes incluyen:
--ABS() � obtiene el valor absoluto o el valor absoluto positivo.
--ACOS() � Esta funci�n se usa para obtener el �ngulo en radianes.
--ASIN() � Obtiene el �ngulo en radianes, se conoce como arcoseno.
--ATAN() � Retorna el �ngulo en radianes, se conoce como arcotangente.
--CEILING() � obtiene el valor m�s peque�o, >= que el num�rica
--especificada.
--COS() � obtiene el valor del coseno trigonom�trico.
--COT() � obtiene el valor de la cotangente trigonom�trica.


--DEGREES() � convierte un �ngulo radiante en grados.
--EXP() � obtiene un valor exponencial de la expresi�n flotante dada.
--FLOOR() � obtiene el valor entero m�s grande, <= que el n�mero dad0.
--LOG() � obtiene el logaritmo natural de la expresi�n flotante dada.
--LOG10() � obtener el logar�tmico en base 10 de la expresi�n flotante dada.
--PI() � obtiene el valor constante de PI, que es aproximadamente igual a
--3,14.
--POWER() �Retorna el poder de la expresi�n o el valor especificado.
--RADIANS() � convierte el �ngulo dado en un �ngulo equivalente en
--radianes.
--RAND() � obtener el positivo, y el valor ser� mayor o igual a 0.0 y menor a
--1.
--ROUND() � Redondea a la longitud o precisi�n especificada.
--SIGN() � Obtiene el signo de la expresi�n, Positivo (+), Negativo (-) o Cero
--(0).
--SIN() � Devuelve el valor trigonom�trico SINE en radianes para el �ngulo
--dado.
--SQRT() � calcula la ra�z cuadrada de un n�mero o valor dado.
--SQUARE() � calcula el cuadrado de un valor espec�fico o un n�mero
--individual.
--TAN() � Obtiene el valor en radianes de la tangente trigonom�trica del
--�ngulo dado.
--Funciones de Categor�a TSQL
--Las funciones SQL de categor�a en TSQL (Transact-SQL) son funciones que
--permiten clasificar y categorizar datos en funci�n de criterios espec�ficos. Algunas
--de las funciones de categor�a m�s comunes en TSQL incluyen:
--ROW_NUMBER () � Serializa las filas del conjunto de resultados
--particionado.
--RANK () � Devuelve el rango de un valor en una lista determinada.
--DENSE_RANK () � Devuelve la posici�n relativa de las filas dentro del
--conjunto.
--NTILE () � divide las filas en grupos.

--Estas funciones de categor�a son �tiles para manipular y clasificar los datos en una
--tabla, lo que es esencial para realizar an�lisis y obtener informaci�n valiosa sobre
--los datos. Al utilizarlas, es importante tener en cuenta el impacto en el
--rendimiento y elegir la funci�n adecuada para cada situaci�n.
--Funciones anal�ticas de TSQL
--Las funciones SQL Server Anal�ticas calculan un valor agregado en funci�n de un
--grupo de filas. Sin embargo, a diferencia de las funciones agregadas, las funciones
--anal�ticas pueden devolver varias filas para cada grupo.
--CUME_DIST() �calcula valores de distribuci�n acumulativos de filas.
--FIRST_VALUE() � Para devolver el primer valor en un conjunto ordenado
--LAST_VALUE() �Para devolver el ultimo valor en un conjunto ordenado
--LAG() � Accede a los datos de la fila anterior.
--LEAD() � Accede a los datos de la fila siguiente.
--PERCENT_RANK() � Similar a la funci�n CUME_DIST, que esta al
--principio.
--PERCENTILE_CONT() � calcula un percentil en una distribuci�n de la
--columna.
--PERCENTILE_DISC() � calcula un percentil espec�fico para valores
--ordenados en un conjunto de filas.
--Estas funciones SQL son muy �tiles para realizar an�lisis avanzados de datos en
--consultas complejas y para obtener informaci�n valiosa sobre la estructura y la
--relaci�n de los datos en una tabla. Al utilizarlas, es importante tener en cuenta el
--impacto en el rendimiento y elegir la funci�n adecuada para cada situaci�n.
--Funciones de configuraci�n de TSQL
--Las funciones de configuraci�n en TSQL (Transact-SQL) son funciones SQL que
--permiten obtener informaci�n sobre la configuraci�n del sistema y la instancia de
--SQL Server en la que se est� ejecutando la consulta. Estas funciones son �tiles
--para realizar tareas como verificar el espacio disponible en disco, la versi�n de
--SQL Server y la configuraci�n de red.


--Algunas de las funciones de configuraci�n m�s comunes en TSQL son:
--@@VERSION() � Devuelve informaci�n sobre la versi�n de SQL Server.
--@@SPID() � Devuelve el identificador de proceso (SPID) del proceso
--actual.
--@@SERVERNAME() � esta funci�n devuelve el nombre del servidor de
--SQL.
--@@TOTAL_MEMORY() � Devuelve la cantidad total de memoria en
--megabytes.
--@@CPU_BUSY() � Devuelve el tiempo total de CPU utilizado en
--milisegundos.
--@@MAX_CONNECTIONS() � Devuelve el n�mero m�ximo de conexiones
--simult�neas permitidas en el servidor.
--Estas funciones de configuraci�n son �tiles para obtener informaci�n sobre el
--entorno en el que se est� ejecutando una consulta, lo que es esencial para tomar
--decisiones informadas y solucionar problemas de rendimiento. Al utilizarlas, es
--importante tener en cuenta el impacto en el rendimiento y elegir la funci�n
--adecuada para cada situaci�n.
