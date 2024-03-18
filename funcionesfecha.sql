-- FUNCIONES FECHA

-- FECHA DE HOY: 2023-03-14

-- Crear tabla
CREATE TABLE Articulos (
    id NUMBER,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255),
    precio NUMBER(10, 2),
    fecha_publicacion DATE
);

-- Insertar datos de ejemplo
INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (1, 'Camiseta', 'Camiseta de algodón', 19.99, TO_DATE('2023-10-26', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (2, 'Pantalón', 'Pantalón vaquero', 29.99, TO_DATE('2024-03-13', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (3, 'Zapatos', 'Zapatos de cuero', 49.99, TO_DATE('2024-03-12', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (4, 'Gorra', 'Gorra deportiva', 9.99, TO_DATE('2024-03-11', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (5, 'Bufanda', 'Bufanda de lana', 14.99, TO_DATE('2024-03-10', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (6, 'Gafas de sol', 'Gafas de sol polarizadas', 34.99, TO_DATE('2024-03-09', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (7, 'Reloj', 'Reloj de pulsera', 99.99, TO_DATE('2024-03-08', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (8, 'Chaqueta', 'Chaqueta impermeable', 79.99, TO_DATE('2024-03-07', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (9, 'Pulsera', 'Pulsera de plata', 39.99, TO_DATE('2024-03-06', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (10, 'Anillo', 'Anillo de oro', 59.99, TO_DATE('2024-03-05', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (11, 'Calcetines', 'Calcetines de algodón', 7.99, TO_DATE('2024-03-04', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (12, 'Pantalón corto', 'Pantalón corto deportivo', 24.99, TO_DATE('2024-03-03', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (13, 'Blusa', 'Blusa de seda', 39.99, TO_DATE('2024-03-02', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (14, 'Falda', 'Falda estampada', 29.99, TO_DATE('2024-03-01', 'YYYY-MM-DD'));

INSERT INTO Articulos (id, nombre, descripcion, precio, fecha_publicacion) 
VALUES (15, 'Bolso', 'Bolso de cuero', 69.99, TO_DATE('2024-02-29', 'YYYY-MM-DD'));


select * from Articulos
order by id asc;
-- Salida de la fecha en consola: mes/dia/anio

-- add_months(fecha, numeroDeMesesQueQuieresAumentar): sirve para aumentar meses, retorna un mes aumentado
select add_months(fecha_publicacion, 3) from Articulos
where id = 3; 
-- salida: 06/12/2024

-- months_between(fecha1, fecha2): numero de meses entre fechas en decimal
select ROUND(months_between(sysdate, fecha_publicacion)) from Articulos 
where id = 1;
-- salida: 5

-- last_day(fecha): retorna el ultimo dia del mes de una fecha pasada como argumento
select last_day(fecha_publicacion) from Articulos
where id = 1;
-- salida: 10/31/2023

-- next_day(): En el siguiente ejemplo se busca el lunes siguiente a la fecha especificada:
 select next_day(fecha_publicacion,'Monday') from Articulos
where id = 1;
-- salida: 10/30/2023