-- 6.- Comando update
-- Permite actualizar registros, utilizando la clausula where
-- update: actualizar
-- set: esablecer
-- where: donde

/*Sintaxis:
update nombreDeLaTabla
set campo = valorNuevo
where condicion;*/

select * from articulos;

-- Consulta 1
update articulos
set nombre = 'computadora'
where codigo = 2;

-- Consulta 2
update articulos
set precio = 600
where codigo = 2;

-- Consulta 3
update articulos
set nombre = 'impresora'
where codigo = 8;

-- Consulta 4: actualizar varios campos de una tabla
update articulos
set nombre = 'impresora', precio = 500
where codigo = 2;

-- Consulta 5: actualizar todos los campos de una tabla
update articulos
set precio = 1000;

