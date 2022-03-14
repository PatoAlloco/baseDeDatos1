/*Listar las canciones que poseen la letra “z” en su título*/
select * from cancion where titulo like "%z%";

/*Listar las canciones que poseen como segundo carácter la letra “a” y como
último, la letra “s”.*/
select * from cancion where titulo like "_a%" and titulo like "%s";

/*Mostrar la playlist que tiene más canciones, renombrando las columnas
poniendo mayúsculas en la primera letra, los tildes correspondientes y agregar
los espacios entre palabras*/
select idPlaylist as "Id Playlist", idusuario as "Id Usuario", titulo as "Título", 
cantcanciones as "Cantidad de Canciones", idestado as "Id Estado", Fechacreacion as "Fecha Creación",
Fechaeliminada as "Fecha Eliminada" from playlist order by cantcanciones desc limit 1;

/*En otro momento se obtuvo un listado con los 5 usuarios más jóvenes, obtener
un listado de los 10 siguientes.*/
select * from usuario order by fecha_nac desc limit 10 offset 5;

/*Listar las 5 canciones con más reproducciones, ordenadas descendentemente*/
select * from cancion order by cantreproduccion desc limit 5;

/*Generar un reporte de todos los álbumes ordenados alfabéticamente*/
select * from album order by titulo asc;

/*Listar todos los álbumes que no tengan imagen, ordenados alfabéticamente*/
select * from album  where imagenportada is null order by titulo asc ;


















