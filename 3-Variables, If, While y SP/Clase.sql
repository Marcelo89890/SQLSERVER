--Variables
DECLARE 
@Felipe varchar(30),
@Neme varchar(30),
@Jessi int

 


set @Felipe = 'Pedro'
set @Neme = 'San jose '

 


Print @Felipe 
Print @Neme

--Condicionales 
[Ayer 19:16] MARCELO MORA PICADO

--Zona de variable 

DECLARE 

@edad int

 

set @edad = 40

-- Control k control S

 



IF( @edad = 18 )

BEGIN

 

print 'Si tiene 18 '

 

END

ELSE 

BEGIN

print 'no cumple con la condicion '

 

END
--Ciclos
declare 
@contador int

 

set @contador = 1

 

WHILE( @contador <= 5 )
BEGIN

 
--Repite 5 veces hola
print 'hola '

 
--Incrementa el contador 
set @contador = @contador + 1

 

END

--Crear Procedimiento almacenado sin parametros(Variables)

CREATE PROCEDURE ListadoAlumno_Marcelo 
AS

 

BEGIN

 

--Aqui podemos colocar cualquier comando DML 
--C   Insert
--R   select 
--U   Update
--D   Delete

--Realizaremos un ejemplo de SELECT
select *
from Alumno
END

 

 --Ejecutar procedimiento almacenado 

EXEC ListadoAlumno_Marcelo

--Crear Procedimiento almacenado con parametros(Variables)

CREATE PROCEDURE ListadoAlumno_Marcelo 
AS

 --Aca se colocan las variables
 --Sintaxis 
 --@nombre variable1 tipo(El mismo tipo del campo de la tabla ) ,
 --@nombre variable2 tipo(El mismo tipo del campo de la tabla ) ,

 @nombre varchar(50)
BEGIN

 

--Aqui podemos colocar cualquier comando DML 
--C   Insert
--R   select 
--U   Update
--D   Delete

--Realizaremos un ejemplo de SELECT
select *
from Alumno
where nombre = @nombre --Buscara por el nombre que coloquemos en la variable 
END

 

 --Ejecutar procedimiento almacenado 

EXEC ListadoAlumno_Marcelo 'Emily' --Buscaremos por el nombre Emily que seria igual a where nombre = 'Emily'