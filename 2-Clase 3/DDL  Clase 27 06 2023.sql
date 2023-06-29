--CREATE,DROP , ALTER  

--Comentarios 
USE db_a9adb1_cursosql 
GO 
--Campo  tipodato  

create table Clientes_Marcelo(

ClienteId int primary key identity(1,1),
Nombre varchar(40) not null ,  
Direcccion varchar(200)  not null 

)

GO
create table Pedido_Marcelo (
PedidoId int primary key identity(1,1),
Fecha_Pedido date not null, 
ClienteId int 

FOREIGN KEY(ClienteId) REFERENCES Clientes_Marcelo(ClienteId)
)
GO
--MODIFICAR 
ALTER TABLE  Clientes_Marcelo
ADD EDAD INT NOT NULL 

GO 
--MODIFICA UN TIPO DE DATO 
ALTER TABLE Clientes_Marcelo
alter COLUMN EDAD VARCHAR(10)

go
--drop 

drop table Alumno_Marcelo

go

