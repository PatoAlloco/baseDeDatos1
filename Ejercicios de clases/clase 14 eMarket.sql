set sql_mode = 'ONLY_FULL_GROUP_BY';
-- Clientes
-- 1) ¿Cuántos clientes existen?
SELECT count(ClienteID)
FROM clientes;

-- 2) ¿Cuántos clientes hay por ciudad?
SELECT count(ClienteID), Ciudad
FROM clientes
GROUP BY Ciudad;

-- Facturas
-- 1) ¿Cuál es el total de transporte?
SELECT sum(Transporte)
FROM facturas;

-- 2) ¿Cuál es el total de transporte por EnvioVia (empresa de envío)?
SELECT sum(Transporte)
FROM facturas
GROUP BY EnvioVia;

-- 3) Calcular la cantidad de facturas por cliente. Ordenar descendentemente por
-- cantidad de facturas.
select count(f.ClienteID), f.ClienteID from facturas f
join clientes c on f.ClienteID = c.ClienteID
group by f.ClienteID
order by count(f.ClienteID) desc;

-- 4) Obtener el Top 5 de clientes de acuerdo a su cantidad de facturas.
select count(f.ClienteID) as cant_facturas, c.Compania from facturas f
join clientes c on f.ClienteID = c.ClienteID
group by f.ClienteID
order by count(f.ClienteID) desc
limit 5;

-- 5) ¿Cuál es el país de envío menos frecuente de acuerdo a la cantidad de facturas?
select count(f.ClienteID) as cant_facturas, f.PaisEnvio from facturas f
join clientes c on f.ClienteID = c.ClienteID
group by f.PaisEnvio
order by count(f.PaisEnvio) asc
limit 1;

-- 6) Se quiere otorgar un bono al empleado con más ventas. ¿Qué ID de empleado
-- realizó más operaciones de ventas?
select count(f.EmpleadoID) as cant_ventas, f.EmpleadoID from facturas f
group by f.EmpleadoID
order by count(f.EmpleadoID) desc
limit 1;

-- Factura detalle
-- 1) ¿Cuál es el producto que aparece en más líneas de la tabla Factura Detalle?
select fd.ProductoID, count(fd.ProductoID), p.ProductoNombre from facturadetalle fd
join productos p on p.ProductoID = fd.ProductoID
group by fd.ProductoID
order by count(fd.ProductoID) desc
limit 1;

-- 2) ¿Cuál es el total facturado? Considerar que el total facturado es la suma de
-- cantidad por precio unitario.
select sum(PrecioUnitario * Cantidad) as total_facturado from facturadetalle; 

-- 3) ¿Cuál es el total facturado para los productos ID entre 30 y 50?
select sum(PrecioUnitario * Cantidad) as total_facturado from facturadetalle 
where ProductoID between 30 and 50;

-- 4) ¿Cuál es el precio unitario promedio de cada producto?
select avg(fd.PrecioUnitario), p.ProductoNombre from facturadetalle fd
join productos p on p.ProductoID = fd.ProductoID
group by fd.ProductoID;
-- 5) ¿Cuál es el precio unitario máximo?
select   PrecioUnitario  from facturadetalle
order by PrecioUnitario desc
limit 1;

-- JOIN
-- 1) Generar un listado de todas las facturas del empleado 'Buchanan'.
select * from facturas f
join empleados e on e.EmpleadoID = f.EmpleadoID
where e.Apellido = 'Buchanan';

-- 2) Generar un listado con todos los campos de las facturas del correo 'Speedy
-- Express'.
select * from facturas f
join correos c on f.EnvioVia = c.CorreoID
where c.Compania = 'Speedy Express';

-- 3) Generar un listado de todas las facturas con el nombre y apellido de los
-- empleados.
select f.FacturaID, e.Nombre, e.Apellido from facturas f
join empleados e on e.EmpleadoID = f.EmpleadoID;

-- 4) Mostrar un listado de las facturas de todos los clientes “Owner” y país de envío
-- “USA”.
select * from facturas f 
join clientes c on c.ClienteID = f.ClienteID
where c.Titulo = 'Owner' and f.PaisEnvio = 'USA' ;

-- 5) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” o que incluyan el producto id = “42”.
select * from facturas f 
join empleados e on e.EmpleadoID = f.EmpleadoID
join facturadetalle fd on f.FacturaID = fd.FacturaID
where e.Apellido = 'Leverling' or fd.ProductoID = 42;

-- 6) Mostrar todos los campos de las facturas del empleado cuyo apellido sea
-- “Leverling” y que incluya los producto id = “80” o ”42”.
select * from facturas f 
join empleados e on e.EmpleadoID = f.EmpleadoID
join facturadetalle fd on f.FacturaID = fd.FacturaID
where e.Apellido = 'Leverling' and (fd.ProductoID = 80 or fd.ProductoID = 42);

-- 7) Generar un listado con los cinco mejores clientes, según sus importes de
-- compras total (PrecioUnitario * Cantidad).
select sum(fd.Cantidad * fd.PrecioUnitario) as Importe, c.Compania from clientes c
join facturas f on c.ClienteID = f.ClienteID
join facturadetalle fd on fd.FacturaID = f.FacturaID
group by c.ClienteID
order by Importe desc
limit 5;

-- 8) Generar un listado de facturas, con los campos id, nombre y apellido del cliente,
-- fecha de factura, país de envío, Total, ordenado de manera descendente por
-- fecha de factura y limitado a 10 filas.
select f.FacturaID, c.Compania, f.FechaFactura, f.PaisEnvio from facturas f
join clientes c on c.ClienteID = f.ClienteID
join facturadetalle fd on fd.FacturaID = f.FacturaID
group by f.FacturaID
order by f.FechaFactura desc
limit 10;




