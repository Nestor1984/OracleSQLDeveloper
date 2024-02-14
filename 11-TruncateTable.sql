/*
11.- Truncate table, eleminar y recuperar registros
NOTA: Con truncate table no podemos recuperar registros, en cambio con delete from si.
*/

select * from articulos;

-- Borramos todo con delete
delete from articulos;

-- Recupeamos los registros (solo sirve para delete, no para truncate table)
rollback;

-- Borramos los registros con truncate
truncate table articulos;
