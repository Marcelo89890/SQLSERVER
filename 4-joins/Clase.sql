--Recuerda visualizar el diagrama entre las tablas la relacion tendra dos iconos:

--De un lado tendra el icono  amarillo con una llave. Representa que esa tabla sera la que posee la llave primaria PK
--Por ende el otro lado tendra un simbolo 00 esta tabla contendra la llave foranea FK
--Esta truco facilitara el join en el query cuando utilicen en la clausula ON para especificar la union entre PK y FK 


--En SQL Server, los "joins" se utilizan para combinar filas de dos o más tablas basándose en una condición común

--Supongamos que tenemos dos tablas: "Clientes" y "Pedidos", y ambas tienen una columna común llamada "ClienteID".

--1. INNER JOIN:
--Este tipo de join devuelve solo las filas que tienen una coincidencia en ambas tablas.


SELECT C.ClienteID, C.Nombre, P.NumeroPedido
FROM Clientes C
INNER JOIN Pedidos P ON C.ClienteID = P.ClienteID;
GO

--2. LEFT JOIN (o LEFT OUTER JOIN):
--Este join devuelve todas las filas de la tabla izquierda (Clientes) y las filas coincidentes de la tabla derecha (Pedidos). Si no hay coincidencias en la tabla derecha, se mostrarán NULL en las columnas correspondientes.


SELECT C.ClienteID, C.Nombre, P.NumeroPedido
FROM Clientes C
LEFT JOIN Pedidos P ON C.ClienteID = P.ClienteID;
GO

--3. RIGHT JOIN (o RIGHT OUTER JOIN):
--Este join devuelve todas las filas de la tabla derecha (Pedidos) y las filas coincidentes de la tabla izquierda (Clientes). Si no hay coincidencias en la tabla izquierda, se mostrarán NULL en las columnas correspondientes.


SELECT C.ClienteID, C.Nombre, P.NumeroPedido
FROM Clientes C
RIGHT JOIN Pedidos P ON C.ClienteID = P.ClienteID;

GO
--4. FULL JOIN (o FULL OUTER JOIN):
--Este join devuelve todas las filas de ambas tablas, mostrando las coincidencias cuando existan y llenando con NULL cuando no haya una coincidencia en alguna de las tablas.


SELECT C.ClienteID, C.Nombre, P.NumeroPedido
FROM Clientes C
FULL JOIN Pedidos P ON C.ClienteID = P.ClienteID;

GO
 --La elección del join adecuado dependerá de la relación entre las tablas y el resultado que deseas obtener.