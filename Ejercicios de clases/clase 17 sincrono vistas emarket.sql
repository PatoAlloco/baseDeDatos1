set sql_mode = 'ONLY_FULL_GROUP_BY';
-- Crear una vista con los siguientes datos de los clientes: ID, contacto, y el
-- Fax. En caso de que no tenga Fax, colocar el teléfono, pero aclarándolo. Por
-- ejemplo: “TEL: (01) 123-4567”.

CREATE VIEW v_ClienteContactoTelefono AS
SELECT c.ClienteID AS ID, c.Contacto,   
CASE	
	WHEN c.Fax = '' OR c.Fax IS NULL THEN concat('TEL:' , c.Telefono )
    WHEN c.Fax IS NOT NULL THEN c.Fax  
    END AS Fax    
FROM clientes c;

-- 2. Se necesita listar los números de teléfono de los clientes que no tengan
-- fax. Hacerlo de dos formas distintas:
-- a. Consultando la tabla de clientes.
-- b. Consultando la vista de clientes.
select Compania, Telefono, Fax from clientes
where Fax is null or Fax like '';

select * from v_cliente v
where Fax like 'TEL%';


-- Proveedores

-- 1. Crear una vista con los siguientes datos de los proveedores: ID,
-- contacto, compañía y dirección. Para la dirección tomar la dirección,
-- ciudad, código postal y país.
CREATE VIEW v_proveedores AS
SELECT p.ProveedorID AS ID, p.Contacto, p.Compania, 
concat('Calle: ', p.Direccion,' - Ciudad: ', p.Ciudad, ' - CP: ', p.CodigoPostal, ' - Pais: ', p.Pais) AS Direccion
FROM proveedores p;

-- 2. Listar los proveedores que vivan en la calle Americanas en Brasil. Hacerlo
-- de dos formas distintas:
-- a. Consultando la tabla de proveedores.
-- b. Consultando la vista de proveedores.
select * from proveedores
order by pais;
select * from proveedores where Direccion like '%Americanas%' and Pais like 'Brazil';
select * from v_proveedores v
where Direccion like '%Americanas%' and Direccion like '%Brazil%';


-- Crear una vista de productos que se usará para control de stock. Incluir el ID
-- y nombre del producto, el precio unitario redondeado sin decimales, las
-- unidades en stock y las unidades pedidas. Incluir además una nueva
-- columna PRIORIDAD con los siguientes valores:
-- ■ BAJA: si las unidades pedidas son cero.
-- ■ MEDIA: si las unidades pedidas son menores que las unidades
-- en stock.
-- ■ URGENTE: si las unidades pedidas no duplican el número de
-- unidades.
-- ■ SUPER URGENTE: si las unidades pedidas duplican el número
-- de unidades en caso contrario.
select * from productos;
CREATE VIEW v_productos AS
SELECT p.ProductoID AS ID, p.ProductoNombre AS Nombre, round(p.PrecioUnitario) AS Precio,
p.UnidadesStock, p.UnidadesPedidas,
CASE 
	WHEN p.UnidadesPedidas = 0 THEN 'BAJA' 
	WHEN p.UnidadesPedidas < p.UnidadesStock THEN 'MEDIA' 
	WHEN p.UnidadesPedidas < (p.UnidadesStock * 2) THEN 'URGENTE' 
    WHEN p.UnidadesPedidas > (p.UnidadesStock * 2) THEN 'SUPER URGENTE'
	END AS Prioridad
FROM productos p;

-- Se necesita un reporte de productos para identificar problemas de stock.
-- Para cada prioridad indicar cuántos productos hay y su precio promedio.
-- No incluir las prioridades para las que haya menos de 5 productos.




