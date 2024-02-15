-- 14 - Alias en una consulta
-- as: alias

 create table articulos(
  codigo number(5),
  nombre varchar2(20),
  descripcion varchar2(30),
  precio number(7,2),
  cantidad number(2)
 );

insert into articulos(codigo, nombre, descripcion, precio, cantidad) values (101,'impresora','Epson Stylus C45', 400.80, 20);
insert into articulos(codigo, nombre, descripcion, precio, cantidad) values (203,'impresora','Epson Stylus C85', 500, 50);
insert into articulos(codigo, nombre, descripcion, precio, cantidad) values (205,'monitor','Samsung 14', 800, 10);
insert into articulos(codigo, nombre, descripcion, precio, cantidad) values (300,'teclado','ingles Biswal', 100, 50);

-- Realizamos una consulta
select * from articulos;

-- Realizamos una consulta, con alias en el campo cantidad
-- NOTA: Cuando el alias tenga espacios debemos colocarlo entre parentesis
select nombre, descripcion, precio, cantidad as existente from articulos;

-- Hacemos una consulta agregando un campo con el 15% de descuento del precio
select nombre, descripcion, precio-(precio*0.15) as descuento from articulos;

-- Mostrar el costo de las impresoras con un 20% aumentado
select nombre, descripcion, precio+(precio*0.2) as recargo from articulos
where nombre = 'impresora';