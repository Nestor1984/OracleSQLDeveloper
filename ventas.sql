create table fabricante(
 codigo number,
 nombre varchar2(70),
 pais varchar2(60),
 constraint pk_codfabricante primary key(codigo),
 constraint ck_nombre check(nombre in('Totto', 'Nike', 'Adidas', 'Puma'))
);

create table empleado(
 codigo number,
 nombre varchar2(70),
 paterno varchar2(70),
 materno varchar2(70),
 cargo varchar2(70),
 constraint pk_codempleado primary key(codigo)
);

create table categoria(
 codigo number,
 nombre varchar2(65),
 constraint pk_codcategoria primary key(codigo),
 constraint ck_nombre_cat check(nombre in('Poleras', 'Zapatillas', 'Chamarras', 'Gorras'))
);

create table cliente(
 codigo number,
 nombres varchar2(60),
 paterno varchar2(60),
 materno varchar2(60),
 nit varchar2(40),
 constraint pk_codcliente primary key(codigo)
);

create table producto(
 codigo number,
 modelo varchar2(80),
 precio number,
 fabricante number,
 categoria number,
 talla varchar2(2),
 color varchar2(30),
 constraint pk_codproducto primary key(codigo)
);

create table stock(
 codprod number,
 cantidad number,
 constraint ck_cantidad check(cantidad >= 5 and cantidad <= 50)
);

create table venta(
 numventa number,
 fecha date,
 total number,
 cliente number,
 empleado number,
 constraint pk_codventa primary key(numventa)
);

create table detalleventa(
 numventa number,
 codproducto number,
 precioventa number,
 descuento number,
 cantidad number,
 subtotal number
);

alter table producto
add constraint fk_producto_fabricante foreign key(fabricante) references fabricante(codigo);

alter table producto
add constraint fk_producto_categoria foreign key(categoria) references categoria(codigo);

alter table stock
add constraint fk_stock_producto foreign key(codprod) references producto(codigo);

alter table venta
add constraint fk_venta_empleado foreign key(empleado) references empleado(codigo);

alter table venta
add constraint fk_venta_cliente foreign key(cliente) references cliente(codigo);

alter table detalleventa
add constraint fk_dv_venta foreign key(numventa) references venta(numventa);

alter table detalleventa
add constraint fk_dv_producto foreign key(codproducto) references producto(codigo);

-- Insercciones

INSERT INTO fabricante (codigo, nombre, pais) VALUES (1, 'Totto', 'Colombia');
INSERT INTO fabricante (codigo, nombre, pais) VALUES (2, 'Nike', 'Estados Unidos');
INSERT INTO fabricante (codigo, nombre, pais) VALUES (3, 'Adidas', 'Alemania');
INSERT INTO fabricante (codigo, nombre, pais) VALUES (4, 'Puma', 'Alemania');

INSERT INTO empleado (codigo, nombre, paterno, materno, cargo) 
VALUES (1, 'Juan', 'Perez', 'Garcia', 'Gerente');
INSERT INTO empleado (codigo, nombre, paterno, materno, cargo) 
VALUES (2, 'Maria', 'Rodriguez', 'Lopez', 'Contadora');
INSERT INTO empleado (codigo, nombre, paterno, materno, cargo) 
VALUES (3, 'Carlos', 'Fernandez', 'Martinez', 'Analista');
INSERT INTO empleado (codigo, nombre, paterno, materno, cargo) 
VALUES (4, 'Ana', 'Gonzales', 'Quispe', 'Secretaria');

INSERT INTO categoria (codigo, nombre) VALUES (1, 'Poleras');
INSERT INTO categoria (codigo, nombre) VALUES (2, 'Zapatillas');
INSERT INTO categoria (codigo, nombre) VALUES (3, 'Chamarras');
INSERT INTO categoria (codigo, nombre) VALUES (4, 'Gorras');

INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (1, 'Carlos', 'Gonzalez', 'Perez', '100001');
INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (2, 'Ana', 'Rodriguez', 'Lopez', '100002');
INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (3, 'Juan', 'Fernandez', 'Martinez', '100003');
INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (4, 'Maria', 'Sanchez', 'Garcia', '100004');
INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (5, 'Luis', 'Rivera', 'Quispe', '100005');
INSERT INTO cliente (codigo, nombres, paterno, materno, nit) 
VALUES (6, 'Isabel', 'Torres', 'Salinas', '100006');

-- Productos de categoría 'Poleras'
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (1, 'Polera Casual', 15, 1, 1, 'M', 'Rojo');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (2, 'Polera Deportiva', 18, 2, 1, 'L', 'Azul');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (3, 'Polera Basica', 10, 3, 1, 'S', 'Blanco');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (4, 'Polera Estampada', 20, 4, 1, 'M', 'Negro');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (5, 'Polera Manga Larga', 22, 2, 1, 'L', 'Gris');

-- Productos de categoría 'Zapatillas'
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (6, 'Zapatilla Running', 50, 2, 2, '9', 'Negro');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (7, 'Zapatilla Casual', 45, 1, 2, '8', 'Blanco');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (8, 'Zapatilla Deportiva', 60, 4, 2, '10', 'Rojo');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (9, 'Zapatilla Trekking', 70, 3, 2, '11', 'Verde');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (10, 'Zapatilla Basketball', 65, 1, 2, '12', 'Azul');

-- Productos de categoría 'Chamarras'
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (11, 'Chamarra Impermeable', 55, 4, 3, 'M', 'Verde');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (12, 'Chamarra Deportiva', 65, 2, 3, 'L', 'Negro');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (13, 'Chamarra Puffer', 75, 3, 3, 'S', 'Azul');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (14, 'Chamarra Casual', 50, 1, 3, 'XL', 'Gris');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (15, 'Chamarra Ligera', 45, 4, 3, 'M', 'Rojo');

-- Productos de categoría 'Gorras'
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (16, 'Gorra Baseball', 19, 1, 4, 'U', 'Azul');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (17, 'Gorra Deportiva', 22, 3, 4, 'U', 'Negro');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (18, 'Gorra Casual', 15, 2, 4, 'U', 'Gris');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (19, 'Gorra Trucker', 17, 4, 4, 'U', 'Rojo');
INSERT INTO producto (codigo, modelo, precio, fabricante, categoria, talla, color) 
VALUES (20, 'Gorra Snapback', 18, 1, 4, 'U', 'Blanco');

INSERT INTO stock (codprod, cantidad) VALUES (1, 10);
INSERT INTO stock (codprod, cantidad) VALUES (2, 15);
INSERT INTO stock (codprod, cantidad) VALUES (3, 20);
INSERT INTO stock (codprod, cantidad) VALUES (4, 25);
INSERT INTO stock (codprod, cantidad) VALUES (5, 30);
INSERT INTO stock (codprod, cantidad) VALUES (6, 35);
INSERT INTO stock (codprod, cantidad) VALUES (7, 40);
INSERT INTO stock (codprod, cantidad) VALUES (8, 45);
INSERT INTO stock (codprod, cantidad) VALUES (9, 50);
INSERT INTO stock (codprod, cantidad) VALUES (10, 5);
INSERT INTO stock (codprod, cantidad) VALUES (11, 12);
INSERT INTO stock (codprod, cantidad) VALUES (12, 18);
INSERT INTO stock (codprod, cantidad) VALUES (13, 24);
INSERT INTO stock (codprod, cantidad) VALUES (14, 27);
INSERT INTO stock (codprod, cantidad) VALUES (15, 31);
INSERT INTO stock (codprod, cantidad) VALUES (16, 37);
INSERT INTO stock (codprod, cantidad) VALUES (17, 44);
INSERT INTO stock (codprod, cantidad) VALUES (18, 49);
INSERT INTO stock (codprod, cantidad) VALUES (19, 8);
INSERT INTO stock (codprod, cantidad) VALUES (20, 13);

INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (1, TO_DATE('2023-04-10', 'YYYY-MM-DD'), 150, 1, 1);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (2, TO_DATE('2023-04-11', 'YYYY-MM-DD'), 75, 2, 2);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (3, TO_DATE('2023-04-12', 'YYYY-MM-DD'), 200, 3, 3);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (4, TO_DATE('2023-04-13', 'YYYY-MM-DD'), 99, 4, 4);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (5, TO_DATE('2023-04-14', 'YYYY-MM-DD'), 180, 5, 1);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (6, TO_DATE('2023-04-15', 'YYYY-MM-DD'), 120, 6, 2);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (7, TO_DATE('2023-04-16', 'YYYY-MM-DD'), 89, 2, 3);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (8, TO_DATE('2023-04-17', 'YYYY-MM-DD'), 215, 4, 4);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (9, TO_DATE('2023-04-18', 'YYYY-MM-DD'), 175, 3, 1);
INSERT INTO venta (numventa, fecha, total, cliente, empleado) 
VALUES (10, TO_DATE('2023-04-19', 'YYYY-MM-DD'), 135, 1, 2);

-- Detalles de la venta 1 (2 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (1, 1, 15, 5, 2, 30); 
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (1, 3, 10, 3, 1, 10);  

-- Detalles de la venta 2 (3 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (2, 2, 18, 2, 1, 18);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (2, 4, 20, 5, 1, 19);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (2, 6, 50, 0, 2, 101); 

-- Detalles de la venta 3 (1 producto)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (3, 9, 50, 10, 1, 45);

-- Detalles de la venta 4 (3 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (4, 11, 55, 0, 1, 55);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (4, 12, 65, 3, 1, 63); 
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (4, 14, 50, 7, 1, 47);

-- Detalles de la venta 5 (2 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (5, 16, 19, 5, 1, 18);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (5, 17, 22, 0, 1, 22);

-- Detalles de la venta 6 (3 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (6, 18, 15, 0, 2, 31);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (6, 19, 17, 5, 1, 17);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (6, 20, 18, 3, 1, 18); 

-- Detalles de la venta 7 (2 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (7, 7, 40, 5, 1, 38);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (7, 10, 65, 0, 1, 65); 

-- Detalles de la venta 8 (1 producto)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (8, 13, 75, 3, 1, 73); 

-- Detalles de la venta 9 (2 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (9, 8, 60, 0, 1, 60);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (9, 5, 30, 7, 1, 28); 

-- Detalles de la venta 10 (3 productos)
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (10, 15, 45, 2, 1, 45);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (10, 2, 18, 3, 1, 18);
INSERT INTO detalleventa (numventa, codproducto, precioventa, descuento, cantidad, subtotal)
VALUES (10, 4, 20, 5, 1, 19);

select * from fabricante
order by codigo asc;
select * from empleado
order by codigo asc;
select * from categoria
order by codigo asc;
select * from cliente
order by codigo asc;
select * from producto
order by codigo asc;
select * from stock;
select * from venta
order by numventa asc;
select * from detalleventa;

-- consultas
-- Cuales productos de puma ha vendido el empleado Perez Garcia
select f.nombre, p.modelo, dv.precioventa, v.numventa, v.fecha, e.nombre, e.paterno, e.materno
from fabricante f, producto p, detalleventa dv, venta v, empleado e
where p.fabricante = f.codigo and dv.codproducto = p.codigo and dv.numventa = v.numventa and v.empleado = e.codigo and e.paterno like 'Perez' and e.materno like 'Garcia'
order by v.numventa asc;

-- Que articulos se han vendido a los clientes 1 3 5 que haya realizado la venta el empleado 3
select p.modelo, p.precio, p.talla, p.color, dv.precioventa, v.numventa, v.fecha, c.codigo, c.nombres, e.nombre
from producto p, detalleventa dv, venta v, cliente c, empleado e
where dv.codproducto = p.codigo and dv.numventa = v.numventa and v.cliente = c.codigo and v.empleado = e.codigo and v.cliente in(1, 3, 5) and v.empleado = 3;

-- Cuales empleados vendieron zapatillas de nike, adidas o puma
select f.nombre as marca, f.pais, p.modelo, p.precio, dv.cantidad, v.fecha, e.nombre, e.paterno, e.materno
from fabricante f, producto p, detalleventa dv, venta v, empleado e
where p.fabricante = f.codigo and dv.codproducto = p.codigo and dv.numventa = v.numventa and v.empleado = e.codigo and f.nombre in('Nike', 'Adidas', 'Puma');

-- Que productos se han vendido a que clientes y cuales empleados
select p.modelo, dv.precioventa, v.fecha, v.total, e.nombre as nombre_empleado, e.paterno as ap_empleado, e.materno as am_empleado, c.nombres as nombre_cliente, c.paterno as ap_cliente, c.materno as am_cliente
from producto p, detalleventa dv, venta v, empleado e, cliente c
where dv.codproducto = p.codigo and dv.numventa = v.numventa and v.empleado = e.codigo and v.cliente = c.codigo;

-- Traer los productos con stock entre 20 y 50 y que esten en la categoria de poleras, zapatillas o gorras
select p.modelo, p.precio, s.cantidad, c.nombre
from producto p, stock s, categoria c
where s.codprod = p.codigo and p.categoria = c.codigo and (s.cantidad between 20 and 50) and c.nombre in('Poleras', 'Zapatillas', 'Gorras');

-- Traer productos cuyo precio sea menor a 70 y cuyo fabricante no sea Adidas ni Nike
select p.modelo as prod_modelo, p.precio, p.talla, p.color, f.nombre as fabricante, f.pais
from producto p, fabricante f
where p.fabricante = f.codigo and p.precio < 70 and f.nombre not in('Adidas', 'Nike');

-- Anadir un mes a las ventas, hechas entre febrero y octubre
select e.nombre, e.cargo, v.fecha, v.total, add_months(v.fecha, 1) as f_modi, c.nombres
from empleado e, venta v, cliente c
where v.empleado = e.codigo and v.cliente = c.codigo and v.fecha between DATE '2023-02-01' AND DATE '2023-10-31';



