--Tipos de Trigger DDL global para evitar que se elimine la base de datos, usuarios o tablas   y DML(Escucha los eventos Insert delete update de una tabla especifica y posterior realiza alguna accion CRUD   ) 

--Ver relaciones con la tabla :SP_HELP 'CURSO'


--TABLAS TEMPORALES 
--ON indica la tabla a monitorear 
--DELETED se utiliza cuando el AFTER indica DELETE se utiliza para obtener los datos eliminados temporalmente cuando se borra o se quiten debido a un actualizacion 
--Inserted se utiliza cuando el after indica insert o update se utliza para obtener los nuevos temporalmente mientras se van insertanto o cambiando mediante una actualizacion .  

--Ejercicio :

--Cree una  tabla HistorialCurso 
--nota:
--Use la tabla Curso 
--iidcurso no lleva PK ni identity , colocar los mismos campos de la tabla con los campos adicionales Fechaactualizacion, usuario ,evento 
--Ejemplo 
--iidcurso, nombre , descripcion , bhabilitado , Fechaactualizacion, usuario ,evento 


--Consulta, actualizar y eliminar para comprobar el trigger 

select * from HistorialCurso
go
select * from curso
go
delete from curso where IIDCURSO = 6
go
update curso
set NOMBRE = 'Lenguaje R ', DESCRIPCION = 'Curso de analisis de datos con R Y SQL '
where IIDCURSO = 1


--Codigo para hacer una bitacora que monitoree los datos eliminados 

USE [db_a9adb1_cursosql]
GO
/****** Object:  Trigger [dbo].[TR_DELBITACORA_marcelo]    Script Date: 1/8/2023 20:44:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		aaa
-- Create date: 11
-- Description:	Bitacora para el evento de eliminar
-- =============================================
ALTER TRIGGER [dbo].[TR_DELBITACORA_marcelo]
   ON  [dbo].[Curso] 
   AFTER DELETE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	insert into historialcurso 
	select d.IIDCURSO,d.NOMBRE,d.DESCRIPCION,d.BHABILITADO,GETDATE(),SYSTEM_USER,'DELETE'
	from deleted as D


END

--Codigo para hacer una bitacora que monitoree los datos actualizados 

USE [db_a9adb1_cursosql]
GO
/****** Object:  Trigger [dbo].[TR_UPDBITACORA_marcelo]    Script Date: 1/8/2023 20:45:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		aaa
-- Create date: 11
-- Description:	Bitacora para el evento de eliminar
-- =============================================
ALTER TRIGGER [dbo].[TR_UPDBITACORA_marcelo]
   ON  [dbo].[Curso] 
   AFTER update
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	insert into historialcurso 
	select d.IIDCURSO,d.NOMBRE,d.DESCRIPCION,d.BHABILITADO,GETDATE(),SYSTEM_USER,'UPDATE'
	from inserted as D


END
--Codigo de trigger que realiza un reporte select * from curso automatico cuando se ejecuta un SP de inserccion 

USE [db_a9adb1_cursosql]
GO
/****** Object:  Trigger [dbo].[TR_ListarInsertCurso_Jessi]    Script Date: 1/8/2023 20:46:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jessica
-- Create date: 2023/08/01
-- Description:	Disparador para hacer un select automatico cuando se inserta un nuevo curso
-- =============================================
ALTER TRIGGER [dbo].[TR_ListarInsertCurso_Jessi]
   ON  [dbo].[Curso] --especifica la tabla
   AFTER INSERT --el evento I/D/U
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	SELECT * FROM Curso 

END

---SP para insertar datos tabla curso 

USE [db_a9adb1_cursosql]
GO
/****** Object:  StoredProcedure [dbo].[SP_INSCURSO]    Script Date: 1/8/2023 20:45:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcelo
-- Create date: 2023/01/08
-- Description:	SP para insertar un curso
-- =============================================
ALTER PROCEDURE [dbo].[SP_INSCURSO] 
	-- Add the parameters for the stored procedure here
	@Nombrecurso varchar(100), 
	@Descripcion varchar(200),
	@Bhabilitado int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here 
	-- Insert into table curso the statements 

	insert into Curso 
	values (@Nombrecurso,@Descripcion,@Bhabilitado)


END