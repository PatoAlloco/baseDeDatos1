/*1) Queremos tener un listado de todas las categorías.*/
select * from categorias;

/*2) Cómo las categorías no tienen imágenes, Solamente interesa obtener un
listado de CategoriaNombre y Descripcion.*/
select CategoriaNombre, Descripcion from categorias;

/*3) Obtener un listado de los productos.*/
select * from productos;

/*4) ¿Existen productos discontinuados? (Discontinuado = 1).*/
select * from productos where Discontinuado = 1;

/*5) Para el viernes hay que reunirse con el Proveedor 8. ¿Qué productos son
los que nos provee?*/
select * from productos where ProveedorID = 8;

/*6) Queremos conocer todos los productos cuyo precio unitario se encuentre
entre 10 y 22.*/
select * from productos where PrecioUnitario between 10 and 22;

/*7) Se define que un producto hay que solicitarlo al proveedor si sus
Unidades en stock son menores al Nivel de Reorden. ¿Hay productos por
solicitar?*/
select * from productos where UnidadesStock < NivelReorden;

/*8) Se quiere conocer todos los productos del listado anterior pero que
Unidades pedidas sea igual a cero.*/
select * from productos where UnidadesStock < NivelReorden and UnidadesPedidas = 0;

/*CLIENTES*/

/*1) Obtener un listado de todos los clientes con Contacto, Compania, Título,
País. Ordenar el listado por País.*/
select * from clientes order by Pais;

/*2) Queremos conocer a todos los clientes que tengan un título “Owner”.*/
select * from clientes where Titulo = "owner";

/*3) El operador telefónico que atendió a un cliente, no recuerda su nombre.
Solo sabe que comienza con “C”. ¿Lo ayudamos a obtener un listado con
todos los contactos que inician con C?*/
select * from clientes where Compania like "c%"; 

/*FACTURAS*/
/*1) Obtener un listado de todas las facturas, ordenado por fecha de factura
ascendente.*/
select * from facturas order by FechaFactura asc;

/*2) Ahora se requiere un listado de las facturas con el país de envío “USA” y
que su correo (EnvioVia) sea distinto de 3.*/
select * from facturas where PaisEnvio = 'usa' and EnvioVia <> 3;

/*3) ¿El cliente 'GOURL' realizó algún pedido?*/
select * from facturas where ClienteID = "gourl";

/*4) Se quiere visualizar todas las facturas de los empleados 2, 3, 5, 8 y 9.*/
select * from facturas where EmpleadoID in (2, 3, 5, 8 , 9);

/*SEGUNDA PARTE*/
/*1) Obtener el listado de todos los productos ordenados descendentemente
por Precio Unitario.*/
select * from productos order by PrecioUnitario desc;

/*2) Obtener el listado de TOP 5 de Productos cuyo Precio Unitario es el más
“Caro”.*/
select * from productos order by PrecioUnitario desc limit 5;

/*3) Obtener un top 10 de los productos con más unidades en Stock.*/	
select * from productos order by UnidadesStock desc limit 10;

/*1) Obtener un listado de FacturaID, Producto, Cantidad.*/
select FacturaID, ProductoID, Cantidad from facturadetalle;

/*2) Ordenar el listado anterior por Cantidad descendentemente.*/
select FacturaID, ProductoID, Cantidad from facturadetalle order by Cantidad desc;

/*3) Filtrar el listado solo para aquellos productos donde la cantidad se
encuentre entre 50 y 100.*/
select FacturaID, ProductoID, Cantidad from facturadetalle where Cantidad between 50 and 100 order by Cantidad desc;

/*4) En otro listado nuevo, obtener un listado con los siguientes nombres de
columnas: NroFactura (FacturaID), Producto (ProductoID), Total
(PrecioUnitario*Cantidad)*/
select FacturaID as NroFactura, ProductoID as Producto, PrecioUnitario * Cantidad as Total from facturadetalle;




