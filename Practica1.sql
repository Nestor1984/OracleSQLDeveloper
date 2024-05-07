create table departamento(
	codigo number,
	nombre_depto varchar2(70) not null,
	constraint pk_codigo primary key(codigo)
);

create table empleado(
	codigo number,
	nombres varchar2(30) not null,
	apellidos varchar2(30) not null,
	departamento number,
	salario number,
	descuento_afp number,
	total_ganado number,
	constraint PK_codigoempleado primary key(codigo),
	constraint FK_empleado_departamento foreign key(departamento) references departamento(codigo)
);

insert into departamento(codigo, nombre_depto) values(1, 'Gerencia');
insert into departamento(codigo, nombre_depto) values(2, 'Contabilidad');
insert into departamento(codigo, nombre_depto) values(3, 'Sistemas');
insert into departamento(codigo, nombre_depto) values(4, 'Legal');

insert into empleado(codigo, nombres, apellidos, departamento) values(1, 'Juan', 'Perez', 1);
insert into empleado(codigo, nombres, apellidos, departamento) values(2, 'Rocio', 'Vazquez', 1);
insert into empleado(codigo, nombres, apellidos, departamento) values(3, 'Karen', 'Choque', 2);
insert into empleado(codigo, nombres, apellidos, departamento) values(4, 'Antonio', 'Vargas', 2);
insert into empleado(codigo, nombres, apellidos, departamento) values(5, 'Maria', 'Delgado', 2);
insert into empleado(codigo, nombres, apellidos, departamento) values(6, 'Rudy', 'Choque', 2);
insert into empleado(codigo, nombres, apellidos, departamento) values(7, 'Julio', 'Perez', 3);
insert into empleado(codigo, nombres, apellidos, departamento) values(8, 'Juan', 'Choque', 3);
insert into empleado(codigo, nombres, apellidos, departamento) values(9, 'Gabriel', 'Gomez', 3);
insert into empleado(codigo, nombres, apellidos, departamento) values(10, 'Maria', 'Canaviri', 3);
insert into empleado(codigo, nombres, apellidos, departamento) values(11, 'Marcia', 'Zapata', 4);

select codigo, nombre_depto from departamento
order by codigo asc;

select codigo, nombres, apellidos, departamento, salario, descuento_afp, total_ganado from empleado
order by codigo asc;

-- 1. Los empleados de Gerencia tendran un salario de 10000, los de Contabilidad tendran un salario de 7000, los de Sistemas tendran un salario de 5000 y los de Legal tendran un salario de 3800.
-- 2. El descuento para Gerencia sera del 15%, para Contabilidad sera del 10%, para Sistemas sera del 8% y para Legal sera del 5%.
-- 3. Calcular el total ganado
-- 4. Mostrar como quedo la tabla empleado finalmente.
-- 5. Crear una vista mostrando que empleados son de Contabilidad y Sistemas
-- 6. Crear una vista mostrando los empleados que ganan entre 4000 y 6000
-- 7. Crear una vista mostrando a los empleados cuyo nombre termina con la letra o
-- 8. Crear una vista mostrando a los empleados que tienen una letra a en su nombre y no son de contabilidad ni de sistemas
-- 9. Crear una vista mostrando a los empleados que ganan menos de 6000 y tienen una letra l en su nombre
-- 10. Crear una vista mostrando a los empleados cuyo descuento sea de 700 y no tengan una letra r en el apellido

---------------------------------------------------------------------------------------
-- 1
update empleado
set salario = 10000
where departamento = 1;

update empleado
set salario = 7000
where departamento = 2;

update empleado
set salario = 5000
where departamento = 3;

update empleado
set salario = 3800
where departamento = 4;

select * from empleado;

-- 2
update empleado
set descuento_afp = 0.15 * salario
where departamento = 1;

update empleado
set descuento_afp = 0.1 * salario
where departamento = 2;

update empleado
set descuento_afp = 0.08 * salario
where departamento = 3;

update empleado
set descuento_afp = 0.05 * salario
where departamento = 4;

-- 3
update empleado
set total_ganado = salario - descuento_afp;

select * from empleado;

-- 4
select codigo, nombres, apellidos, departamento, salario, descuento_afp, total_ganado from empleado
order by codigo asc;

-- 5
create or replace view vista1
as
select e.nombres as nombres_emp, e.apellidos as apellidos_emp, e.salario as salario_emp, descuento_afp as descuento_emp, total_ganado as totalganado_emp, d.nombre_depto as nombre_dep
from empleado e, departamento d
where e.departamento = d.codigo and d.nombre_depto in('Contabilidad', 'Sistemas')
order by e.codigo asc;

select nombres_emp, apellidos_emp, salario_emp, descuento_emp, totalganado_emp, nombre_dep from vista1;

-- 6
create or replace view vista2
as
select e.nombres as nombres_emp, e.apellidos as apellidos_emp, e.total_ganado as totalganado_emp, d.nombre_depto as nombre_dep
from empleado e, departamento d
where e.departamento = d.codigo and (e.total_ganado between 4000 and 6000);

select nombres_emp, apellidos_emp, totalganado_emp, nombre_dep from vista2;

-- 7
create or replace view vista3
as
select e.nombres as nombres_emp, e.apellidos as apellidos_emp, e.total_ganado as totalganado_emp, d.nombre_depto as nombre_dep
from empleado e, departamento d
where e.departamento = d.codigo and e.nombres like '%o';

select nombres_emp, apellidos_emp, totalganado_emp, nombre_dep from vista3;

-- 8
-- NOTA: ES IMPORTANTE COLOCAR ESOS PARENTESIS, CASO CONTRARIO ORACLE NOS MOSTRARA UN RESULTADO QUE NOS DESEAMOS
create or replace view vista4
as
select e.codigo, e.nombres as nombres_emp, e.apellidos as apellidos_emp, d.nombre_depto as nombre_dep
from empleado e, departamento d
where e.departamento = d.codigo and (e.nombres like '%a%' or e.nombres like 'A%' or e.nombres like '%a') and d.nombre_depto not in('Contabilidad', 'Sistemas')
order by e.codigo asc;

select * from vista4;

-- 9
create or replace view vista5
as
select e.nombres, e.apellidos, e.total_ganado, d.nombre_depto
from empleado e, departamento d
where e.departamento = d.codigo and total_ganado < 6000 and (e.nombres like '%l%' or e.nombres like '%l');

select * from vista5;

-- 10
create or replace view vista6
as
select e.nombres, e.apellidos, d.nombre_depto
from empleado e, departamento d
where e.departamento = d.codigo and e.descuento_afp = 700 and e.apellidos not like '%r%';

select * from vista6;