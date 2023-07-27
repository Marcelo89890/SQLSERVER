
 -- opcion 1
 SELECT
    FK.name AS ForeignKeyName,
    OBJECT_NAME(FK.parent_object_id) AS TableName,
    COL_NAME(FC.parent_object_id, FC.parent_column_id) AS ColumnName,
    OBJECT_NAME(FK.referenced_object_id) AS ReferencedTableName,
    COL_NAME(FC.referenced_object_id, FC.referenced_column_id) AS ReferencedColumnName
FROM
    sys.foreign_keys AS FK
INNER JOIN
    sys.foreign_key_columns AS FC ON FK.object_id = FC.constraint_object_id
ORDER BY
    TableName, ForeignKeyName;

	-- opcion 2 
	
	sp_help 'Matricula'



	select *
	from Alumno as A
	inner join sexo as B 
	on a.IIDSEXO = b.IIDSEXO

	go

	select *
	from Matricula as A
	inner join alumno as b
	on a.IIDALUMNO = b.IIDALUMNO
	inner join Grado as C
    on c.IIDGRADO = a.IIDGRADO

	go

		select *
	from Matricula as A
	full join alumno as b
	on a.IIDALUMNO = b.IIDALUMNO

	go

		select *
	from Matricula as A
	left join alumno as b
	on a.IIDALUMNO = b.IIDALUMNO
	

	go

		select *
	from Matricula as A
	right join alumno as b
	on a.IIDALUMNO = b.IIDALUMNO
	