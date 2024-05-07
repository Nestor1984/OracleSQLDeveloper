CREATE TABLE productos (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255),
    precio NUMBER,
    cantidad NUMBER,
    fecha_ingreso DATE,
    descuento NUMBER,
    stock_minimo NUMBER,
    stock_actual NUMBER
);

INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (1, 'Producto 1', 'Descripción del Producto 1', 10.5, 100, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (2, 'Producto 2', 'Descripción del Producto 2', 15.75, 150, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (3, 'Producto 3', 'Descripción del Producto 3', 20, 200, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (4, 'Producto 4', 'Descripción del Producto 4', 25.25, 250, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (5, 'Producto 5', 'Descripción del Producto 5', 30.5, 300, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (6, 'Producto 6', 'Descripción del Producto 6', 35.75, 350, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (7, 'Producto 7', 'Descripción del Producto 7', 40, 400, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (8, 'Producto 8', 'Descripción del Producto 8', 45.25, 450, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (9, 'Producto 9', 'Descripción del Producto 9', 50.5, 500, TO_DATE('2024-05-05', 'YYYY-MM-DD'));
INSERT INTO productos (id, nombre, descripcion, precio, cantidad, fecha_ingreso)
VALUES (10, 'Producto 10', 'Descripción del Producto 10', 55.75, 550, TO_DATE('2024-05-05', 'YYYY-MM-DD'));

-- 1. Los productos tienen un descuento del 15%
update productos
set descuento = 0.15 * precio;

-- 2. El stock minimo es la cantidad minima
update productos
set stock_minimo = (select min(cantidad) from productos);

-- 3. El stock actual es la cantidad maxima
update productos
set stock_actual = (select max(cantidad) from productos);

select * from productos;
