CREATE TABLE productos (
    id NUMBER PRIMARY KEY,
    nombre VARCHAR2(100),
    descripcion VARCHAR2(255),
    fecha_fabricacion DATE,
    fecha_vencimiento DATE
);

select * from productos
order by id asc;

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (1, 'Arroz', 'Arroz blanco de grano largo', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (2, 'Leche', 'Leche desnatada en envase de cartón', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2024-03-31', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (3, 'Huevos', 'Docena de huevos frescos de gallina', TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2024-04-30', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (4, 'Manzanas', 'Manzanas rojas de la región', TO_DATE('2023-04-20', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (5, 'Pan', 'Pan integral recién horneado', TO_DATE('2023-05-15', 'YYYY-MM-DD'), TO_DATE('2024-06-15', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (6, 'Pasta', 'Paquete de pasta de trigo', TO_DATE('2023-06-05', 'YYYY-MM-DD'), TO_DATE('2024-07-20', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (7, 'Yogur', 'Yogur natural sin azúcar', TO_DATE('2023-07-10', 'YYYY-MM-DD'), TO_DATE('2024-08-10', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (8, 'Carne', 'Filetes de ternera de alta calidad', TO_DATE('2023-08-25', 'YYYY-MM-DD'), TO_DATE('2024-09-30', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (9, 'Queso', 'Queso cheddar en lonchas', TO_DATE('2023-09-10', 'YYYY-MM-DD'), TO_DATE('2024-10-31', 'YYYY-MM-DD'));

INSERT INTO productos (id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento) 
VALUES (10, 'Aceite de oliva', 'Botella de aceite de oliva virgen extra', TO_DATE('2023-10-20', 'YYYY-MM-DD'), TO_DATE('2024-11-20', 'YYYY-MM-DD'));

-- Aumentar 5 meses a la fecha de vencimiento de todos los productos
select id, nombre, descripcion, fecha_fabricacion, fecha_vencimiento as f_v_original, add_months(fecha_vencimiento, 5) as f_v_modificada
from productos;

-- En cuantos meses vencen los huevos y el queso
select nombre, fecha_fabricacion, fecha_vencimiento, round(months_between(fecha_vencimiento, fecha_fabricacion)) as numero_de_meses from productos;

-- Cual es el ultimo dia tanto de la fecha_fabricacion y fecha_vencimiento de los productos que son pasta y aceite de oliva
select nombre, fecha_fabricacion, fecha_vencimiento, last_day(fecha_fabricacion) as ultimo_dia_f_f, last_day(fecha_vencimiento) as ultimo_dia_f_v
from productos
where nombre in('Pasta', 'Aceite de oliva');

-- Traer el siguiente miercoles (pasando la fecha de vencimiento) de los productos manzanas y carne
select nombre, fecha_vencimiento, next_day(fecha_vencimiento, 'Wednesday') as siguiente_miercoles
from productos
where nombre like 'Manzanas' or nombre like 'Carne';

-- Cuantos meses pasaron desde la fecha de fabricacion hasta hoy, de todos los productos
select nombre, fecha_fabricacion, round(months_between(sysdate, fecha_fabricacion)) as meses_que_pasaron from productos;

-- Cuantos meses pasaron desde la fecha de fabricacion hasta hoy, de los productos pan y arroz
select nombre, fecha_fabricacion, round(months_between(sysdate, fecha_fabricacion)) as meses_que_pasaron from productos
where nombre in('Arroz', 'Pan');