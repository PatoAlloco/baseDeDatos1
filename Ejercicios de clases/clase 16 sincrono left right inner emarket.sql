-- Realizar una consulta de la facturación de e-market. Incluir la siguiente información:
-- ● Id de la factura
-- ● fecha de la factura
-- ● nombre de la empresa de correo
-- ● nombre del cliente
-- ● categoría del producto vendido
-- ● nombre del producto
-- ● precio unitario
-- ● cantidad

select f.FacturaID, f.FechaFactura, c.Compania, cl.Compania, cat.CategoriaNombre,
 p.ProductoNombre, fd.PrecioUnitario, fd.Cantidad  from facturas f
join correos c on c.CorreoID = f.EnvioVia
join facturadetalle fd on f.FacturaID = fd.FacturaID
join productos p on p.ProductoID = fd.ProductoID
join clientes cl on f.ClienteID = cl.ClienteID
join categorias cat on p.ProductoID = cat.CategoriaID;

-- Listar todas las categorías junto con información de sus productos. Incluir todas
-- las categorías aunque no tengan productos.
select * from categorias
left join productos on categorias.CategoriaID = productos.CategoriaID;

-- 2. Listar la información de contacto de los clientes que no hayan comprado nunca
-- en emarket.
select * from clientes
left join facturas on clientes.ClienteID = facturas.ClienteID
where facturas.ClienteID is null;

-- 3. Realizar un listado de productos. Para cada uno indicar su nombre, categoría, y
-- la información de contacto de su proveedor. Tener en cuenta que puede haber
-- productos para los cuales no se indicó quién es el proveedor.
select p.ProductoNombre, cat.CategoriaNombre, pr.Contacto from productos p
join categorias cat on p.CategoriaID = cat.CategoriaID
left join proveedores pr on p.ProveedorID = pr.ProveedorID;

-- 4. Para cada categoría listar el promedio del precio unitario de sus productos.
select avg(p.PrecioUnitario) as Promedio, c.CategoriaNombre from productos p
join categorias c on p.CategoriaID = c.CategoriaID
group by p.CategoriaID;

-- 5. Para cada cliente, indicar la última factura de compra. Incluir a los clientes que
-- nunca hayan comprado en e-market.
select * from clientes c 
left join facturas f on c.ClienteID = f.ClienteID 
group by c.ClienteID
order by f.FechaFactura desc;

-- 6. Todas las facturas tienen una empresa de correo asociada (enviovia). Generar un
-- listado con todas las empresas de correo, y la cantidad de facturas
-- correspondientes. Realizar la consulta utilizando RIGHT JOIN.
select count(*), c.Compania from facturas f
right join correos c on f.EnvioVia = c.CorreoID
group by f.EnvioVia;




