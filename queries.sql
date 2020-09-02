--1
/*SELECT	* 
FROM 	public.empleado 
ORDER 	BY numreg ASC*/

--2
/*select	nombre 
from 	public.empleado 
join 	servicio on servicio.numreg = empleado.numreg 
		and descripcion = 'restaurante'*/

--3
/*with	t1 as(
	select	descripcion 
	from 	empleado 
	join	servicio as s1 on s1.cods = empleado.cods and nombre = 'Jorge Alonso Alonso'
)
select	nombre 
from	public.empleado 
join 	servicio on servicio.numreg = empleado.numreg
		and sueldo is not null
join	t1 on t1.descripcion = servicio.descripcion*/

--4
/*select	empleado.* 
from	public.empleado
join 	servicio on servicio.cods = empleado.cods*/

--5
/*SELECT	habitacion.numero, habitacion.tipo, precio
FROM 	habitacion
join	factura on factura.numero = habitacion.numero
join	precio on precio.tipo = habitacion.tipo
where	salida is null*/

--6
/*with ms as(
	select	max(cc) as cc from(
		select	count(*) as cc
		from	cliente
		join	factura on factura.dni = cliente.dni
		group	by nombre, apellidos
		order	by count(*) desc
	) as t1
)
select	nombre, apellidos
from	cliente
join	factura on factura.dni = cliente.dni
group	by nombre, apellidos
having	count(*) = (select cc from ms)
order	by count(*) desc
*/

--7
/*select	t1.numreg, t1.nombre, t1.incorporacion, t1.sueldo, t1.cods, count(*)
from(
	select	distinct empleado.*, habitacion.numero
	from	empleado
	join	limpieza on empleado.numreg = limpieza.numreg
	join	habitacion	on habitacion.numero = limpieza.numero
	group	by empleado.numreg, habitacion.numero
	order	by nombre
) as 	t1
group	by t1.numreg, t1.nombre, t1.incorporacion, t1.sueldo, t1.cods
having	count(*) = (select count(*) as cc from habitacion)*/

--8
/*select	dni, nombre, apellidos, domicilio, telefono
from	(
	SELECT	cliente.*, tipo, count(*)
	FROM 	habitacion
	join	factura on factura.numero = habitacion.numero
	join	cliente on factura.dni = cliente.dni
	group	by cliente.dni, tipo
	order	by nombre
) 	as t1
group	by dni, nombre, apellidos, domicilio, telefono
having	count(*) = 2*/

--9
/*select	factura_prov.*
from	proveedor
join	factura_prov on	factura_prov.nif = proveedor.nif
left	join servicio on factura_prov.numreg = servicio.numreg
where	servicio.cods is null*/

--10 revisar porque los otros tienen datos null
/*with mmm as(
	select	min(sueldo) as mi, max(sueldo) as ma, s1.cods
	from 	empleado 
	join	servicio as s1 on s1.cods = empleado.cods and descripcion = 'restaurante'
	group	by s1.cods
)
update	 empleado emp1
set		sueldo = (select ma from mmm)
where	emp1.sueldo = (select mi from mmm)
		and cods = (select cods from mmm)*/

--11
/*
with cleaner as (
	select	empleado.numreg, count(*) 
	from 	public.empleado 
	join 	limpieza on limpieza.numreg = empleado.numreg
	group	by empleado.numreg
	order	by count(*) desc
	limit	1
)
update 	empleado
set		sueldo = sueldo + (sueldo * 0.10)
where	numreg = (select numreg from cleaner)
*/
