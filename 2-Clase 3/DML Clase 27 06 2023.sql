-- DML INSERT , SELECT , DELETE , UPDATE 

-- INSERT INTO XXX VALUES ( 'varchar o fecha' ,  )

INSERT INTO Clientes_Marcelo VALUES ('PEDRO','SAN JOSE DESAMPADOS ','33')
GO

INSERT INTO Pedido_Marcelo values (GETDATE(),3)
-- LISTAR 
SELECT *
FROM Clientes_Marcelo

GO

select *
from pedido_Marcelo

--ACTUALIZAR 
UPDATE Clientes_Marcelo

SET Nombre = 'Chela'

WHERE Clienteid = 1

go
--Delete 

delete from Clientes_Marcelo 
WHERE Clienteid = 1


select GETDATE()