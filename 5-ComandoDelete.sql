-- 5.- Comando delete
-- Permite eliminar una fila de la tabla, la cual vamos a especificar por un campo en especifico
-- delete: borrar
-- from: de
-- where: donde

/*Sintaxis:
delete from nombreDeLaTabla
where condicion;*/

 create table agenda(
  apellido varchar2(30),
  nombre varchar2(20),
  domicilio varchar2(30),
  telefono varchar2(11)
 );

 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Alvarez','Alberto','Colon 123','4234567');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Juarez','Juan','Avellaneda 135','4458787');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Lopez','Maria','Urquiza 333','4545454');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Lopez','Jose','Urquiza 333','4545454');
 insert into agenda(apellido,nombre,domicilio,telefono) values 
   ('Salas','Susana','Gral. Paz 1234','4123456');

select * from agenda;

-- Consulta 1: borrar una fila
delete from agenda
where nombre = 'Juan';

-- Consulta 2: eliminar todos los registros
delete from agenda;

