set sql_mode = 'ONLY_FULL_GROUP_BY';
-- 1. Obtener los artistas que han actuado en una o más películas.
select * from artista a
join artista_x_pelicula axp on a.id = axp.artista_id
join pelicula p on p.id = axp.pelicula_id;

-- 2. Obtener las películas donde han participado más de un artista según nuestra
-- base de datos.
select count(a.id) as cant_artistas, p.titulo from pelicula p
join artista_x_pelicula axp on p.id = axp.pelicula_id
join artista a on a.id = axp.artista_id
group by p.id
having cant_artistas > 1;

-- 3. Obtener aquellos artistas que han actuado en alguna película, incluso
-- aquellos que aún no lo han hecho, según nuestra base de datos.
select * from artista a
left join artista_x_pelicula axp on a.id = axp.artista_id
left join pelicula p on p.id = axp.pelicula_id;
select * from artista;

-- 4. Obtener las películas que no se le han asignado artistas en nuestra base de
-- datos.
select * from pelicula p
left join artista_x_pelicula axp on p.id = axp.pelicula_id
left join artista a on a.id = axp.artista_id
where a.id is null;

-- 5. Obtener aquellos artistas que no han actuado en alguna película, según
-- nuestra base de datos.
select * from artista a
left join artista_x_pelicula axp on a.id = axp.artista_id
left join pelicula p on p.id = axp.pelicula_id
where p.id is null;

-- 6. Obtener aquellos artistas que han actuado en dos o más películas según
-- nuestra base de datos.
select  a.apellido from artista a
join artista_x_pelicula axp on a.id = axp.artista_id
join pelicula p on p.id = axp.pelicula_id
group by a.apellido
having count(a.id) > 1;

-- 7. Obtener aquellas películas que tengan asignado uno o más artistas, incluso
-- aquellas que aún no le han asignado un artista en nuestra base de datos.
select * from pelicula p
left join artista_x_pelicula axp on p.id = axp.pelicula_id
left join artista a on a.id = axp.artista_id;



