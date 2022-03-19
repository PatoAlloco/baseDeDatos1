set sql_mode = 'ONLY_FULL_GROUP_BY';

-- 1. Listar las canciones cuya duración sea mayor a 2 minutos.
select * from canciones where milisegundos > (2*60000);

-- 2. Listar las canciones cuyo nombre comience con una vocal.
select * from canciones 
where nombre like 'a%' or nombre like 'e%' or nombre like 'i%' or nombre like'o%' or nombre like'u%';

-- 3. Listar las canciones ordenadas por compositor en forma descendente.
-- Luego, por nombre en forma ascendente. Incluir únicamente aquellas
-- canciones que tengan compositor.
select * from canciones
where compositor is not null
order by compositor desc, nombre asc;

-- 4. a) Listar la cantidad de canciones de cada compositor.
select count(*), compositor from canciones group by compositor;

-- b) Modificar la consulta para incluir únicamente los compositores que
-- tengan más de 10 canciones.
select count(*) as cantidad, compositor from canciones group by compositor having cantidad > 10;

-- 5. a) Listar el total facturado agrupado por ciudad.
select sum(total) as Total, ciudad_de_facturacion from facturas 
group by ciudad_de_facturacion;

-- b) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- de Canadá.
select sum(total) as Total, ciudad_de_facturacion, pais_de_facturacion from facturas 
where pais_de_facturacion = 'canada'
group by ciudad_de_facturacion;

-- c) Modificar el listado del punto (a) mostrando únicamente las ciudades
-- con una facturación mayor a 38.
select sum(total) as Total, ciudad_de_facturacion from facturas 
group by ciudad_de_facturacion
having Total > 38;

-- d) Modificar el listado del punto (a) agrupando la facturación por país, y
-- luego por ciudad.
select sum(total) as Total, ciudad_de_facturacion, pais_de_facturacion from facturas 
group by pais_de_facturacion, ciudad_de_facturacion;

-- 6. a) Listar la duración mínima, máxima y promedio de las canciones.
select min(milisegundos) as Minima, max(milisegundos), avg(milisegundos) from canciones;

-- b) Modificar el punto (a) mostrando la información agrupada por género.
select min(milisegundos) as Minima, max(milisegundos), avg(milisegundos),id_genero from canciones
group by id_genero;


