-- SUBCONSULTAS 2

-- Crear tabla de estudiantes
CREATE TABLE estudiantes (
    id NUMBER,
    nombre VARCHAR2(50),
    edad NUMBER,
    carrera VARCHAR2(50),
    constraint pk_idestudiantes primary key(id)
);

-- Crear tabla de notas
CREATE TABLE notas (
    id NUMBER,
    estudiante_id NUMBER,
    nota NUMBER
);

alter table notas
add constraint fk_notas_estu foreign key(estudiante_id) references estudiantes(id);

-- Insertar datos en la tabla de estudiantes
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (1, 'Juan', 20, 'Ingenieria');
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (2, 'María', 22, 'Medicina');
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (3, 'Carlos', 21, 'Derecho');
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (4, 'Laura', 19, 'Arquitectura');
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (5, 'Ana', 20, 'Ingenieria');
INSERT INTO estudiantes (id, nombre, edad, carrera) VALUES (6, 'Pedro', 23, 'Medicina');

-- Insertar datos en la tabla de notas
INSERT INTO notas (id, estudiante_id, nota) VALUES (1, 1, 85);
INSERT INTO notas (id, estudiante_id, nota) VALUES (2, 2, 90);
INSERT INTO notas (id, estudiante_id, nota) VALUES (3, 3, 75);
INSERT INTO notas (id, estudiante_id, nota) VALUES (4, 4, 80);
INSERT INTO notas (id, estudiante_id, nota) VALUES (5, 5, 88);
INSERT INTO notas (id, estudiante_id, nota) VALUES (6, 6, 92);

select * from estudiantes
order by id asc;

select * from notas
order by id asc;

-- Obtener el nombre y la carrera de los estudiantes que tienen una nota mayor que a la nota mas baja de Ingenieria.
select e.nombre, e.edad, e.carrera, n.nota
from estudiantes e, notas n
where n.estudiante_id = e.id 
and n.nota > (select min(nota) from notas
              where estudiante_id in(1, 5)); 
/*
NOMBRE	EDAD	CARRERA	       NOTA
María	22	Medicina 	90
Ana	20	Ingenieria	88
Pedro	23	Medicina	92
*/

-- Mostrar los estudiantes que tienen una nota mayor que el promedio de todas las notas.
select n.nota, e.nombre, e.edad, e.carrera
from notas n, estudiantes e
where n.estudiante_id = e.id 
and n.nota > (select avg(nota) from notas);
/*
NOTA	NOMBRE	EDAD	CARRERA
90	María	22	Medicina
88	Ana	20	Ingenieria
92	Pedro	23	Medicina
*/

-- Mostrar los estudiantes que tienen una edad mayor que el promedio de todas las edades.
select n.nota, e.nombre, e.edad, e.carrera
from notas n, estudiantes e
where n.estudiante_id = e.id
and e.edad > (select avg(edad) from estudiantes);
/*
NOTA	NOMBRE	EDAD	CARRERA
90	María	22	Medicina
75	Carlos	21	Derecho
92	Pedro	23	Medicina
*/