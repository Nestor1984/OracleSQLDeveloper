-- SUBCONSULTAS 1

-- Crear la tabla
CREATE TABLE empleados (
    id NUMBER,
    nombre VARCHAR2(50),
    departamento VARCHAR2(50),
    salario NUMBER
);

-- Insertar datos en la tabla
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (1, 'Juan', 'Ventas', 3000);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (2, 'Maria', 'Marketing', 3500);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (3, 'Carlos', 'Ventas', 3200);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (4, 'Laura', 'RRHH', 4000);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (5, 'Ana', 'Ventas', 3100);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (6, 'Pedro', 'Marketing', 3800);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (7, 'Luis', 'RRHH', 4200);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (8, 'Sara', 'Ventas', 3300);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (9, 'Pablo', 'Marketing', 3600);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (10, 'Eva', 'RRHH', 3900);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (11, 'Alberto', 'Marketing', 3700);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (12, 'Isabel', 'Ventas', 3400);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (13, 'Diego', 'RRHH', 4100);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (14, 'Carmen', 'Marketing', 3800);
INSERT INTO empleados (id, nombre, departamento, salario) VALUES (15, 'Marcos', 'Ventas', 3200);

select * from empleados
order by id asc;

-- Mostrar aquellos registros cuyo salario sea menor a la suma de los salarios de ventas
select id, nombre, departamento, salario from empleados
where salario < (select sum(salario) from empleados
                 where departamento = 'Ventas')
order by id asc;
/*
ID	NOMBRE	DEPARTAMENTO	SALARIO
1	Juan	Ventas	        3000
2	Maria	Marketing	3500
3	Carlos	Ventas	        3200
4	Laura	RRHH	        4000
5	Ana	Ventas	        3100
6	Pedro	Marketing	3800
7	Luis	RRHH	        4200
8	Sara	Ventas	        3300
9	Pablo	Marketing	3600
10	Eva	RRHH	        3900
11	Alberto	Marketing	3700
12	Isabel	Ventas	        3400
13	Diego	RRHH	        4100
14	Carmen	Marketing	3800
15	Marcos	Ventas	        3200
*/

-- Encontrar el nombre del departamento que tiene el salario máximo.
select id, nombre, departamento, salario from empleados
where salario = (select max(salario) from empleados);
/*
ID	NOMBRE	DEPARTAMENTO	SALARIO
7	Luis	RRHH	        4200
*/

-- Listar los empleados cuyo salario sea menor que el salario promedio de todos los empleados.
select id, nombre, departamento, salario from empleados
where salario < (select avg(salario) from empleados);
/*
ID	NOMBRE	DEPARTAMENTO	SALARIO
1	Juan	Ventas	        3000
2	Maria	Marketing	3500
12	Isabel	Ventas	        3400
15	Marcos	Ventas	        3200
3	Carlos	Ventas	        3200
5	Ana	Ventas	        3100
8	Sara	Ventas	        3300
*/

-- Mostrar los empleados que ganen más que cualquier empleado del departamento de Ventas.
select nombre, departamento, salario from empleados
where salario > (select max(salario) from empleados
                 where departamento = 'Ventas');
/*
NOMBRE	DEPARTAMENTO	SALARIO
Eva	RRHH	        3900
Maria	Marketing	3500
Alberto	Marketing	3700
Diego	RRHH	        4100
Carmen	Marketing	3800
Laura	RRHH	        4000
Pedro	Marketing	3800
Luis	RRHH	        4200
Pablo	Marketing	3600
*/

-- Mostrar los empleados cuyo salario sea mayor que el promedio del departamento en el que trabajan.
select id, nombre, departamento, salario from empleados
where salario > (select avg(salario) from empleados)
order by id asc;
/*
ID	NOMBRE	DEPARTAMENTO	SALARIO
4	Laura	RRHH	        4000
6	Pedro	Marketing	3800
7	Luis	RRHH	        4200
9	Pablo	Marketing	3600
10	Eva	RRHH	        3900
11	Alberto	Marketing	3700
13	Diego	RRHH	        4100
14	Carmen	Marketing	3800
*/

-- Listar los empleados cuyo salario sea menor que el salario promedio de todos los empleados.
select nombre, salario from empleados
where salario < (select avg(salario) from empleados);
/*
NOMBRE	SALARIO
Juan	3000
Maria	3500
Isabel	3400
Marcos	3200
Carlos	3200
Ana	3100
Sara	3300
*/