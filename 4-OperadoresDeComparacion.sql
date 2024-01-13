-- 4.- Operadores de comparacion

select * from articulos;

-- 1) Traer los monitores que tenga almacenado como registro la tabla articulos
-- Igualdad
select * from articulos
where nombre = 'monitor';
 
-- 2) Traer los articulos de la tabla articulos excepto el monitor
-- Distinto
select * from articulos
where nombre != 'monitor';

-- 3) Traer los articulos de la tabla articulos cuyo precio sea mayor a 100
-- Mayor
select * from articulos
where precio > 100;

-- 4) Traer los articulos de la tabla articulos cuyo precio sea menor a 100
-- Menor
select * from articulos
where precio < 100;

-- 5) Traer los articulos de la tabla articulos cuyo precio sea mayor o igual a 100
-- Mayor o igual
select * from articulos
where precio >= 100;
 
-- 6) Traer los articulos de la tabla articulos cuyo precio sea menor o igual a 100
-- Menor o igual
select * from articulos
where precio <= 100;

