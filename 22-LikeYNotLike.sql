-- 22 - Like y not like
-- like: como
-- %: comodin 
-- _: caracter

drop table empleados;
 
 create table empleados(
  nombre varchar2(30),
  documento char(8) not null,
  domicilio varchar2(30),
  fechaingreso date,
  seccion varchar2(20),
  sueldo number(6,2),
  primary key(documento)
 );

  insert into empleados
  values('Juan Perez','22333444','Colon 123',to_date('08/10/1990','dd/mm/yyyy'),'Gerencia',900.50);
 insert into empleados
  values('Ana Acosta','23444555','Caseros 987',to_date('18/12/1995','dd/mm/yyyy'),'Secretaria',590.30);
 insert into empleados
  values('Lucas Duarte','25666777','Sucre 235',to_date('15/05/2005','dd/mm/yyyy'),'Sistemas',790);
 insert into empleados
  values('Pamela Gonzalez','26777888','Sarmiento 873',to_date('12/02/1999','dd/mm/yyyy'),'Secretaria',550);
 insert into empleados
  values('Marcos Juarez','30000111','Rivadavia 801',to_date('22/09/2002','dd/mm/yyyy'),'Contaduria',630.70);
 insert into empleados
  values('Yolanda perez','35111222','Colon 180',to_date('08/10/1990','dd/mm/yyyy'),'Administracion',400);
 insert into empleados
  values('Rodolfo perez','35555888','Coronel Olmedo 588',to_date('28/05/1990','dd/mm/yyyy'),'Sistemas',800);

select * from empleados;

-- Traer todos los apellidos perez
select * from empleados
where nombre like '%perez%' or nombre like '%Perez%';

-- Traer todos los apellidos que no sean perez
select * from empleados
where nombre not like '%perez%' and nombre not like '%Perez%';

-- Traer todos los documentos que finalicen en 888
select * from empleados
where documento like '%888';

-- Traer todos los documentos que no finalicen en 888
select * from empleados
where documento not like '%888';

-- Traer los registros que en el campos seccion contenga la palabra 'Gerencia'
select * from empleados
where seccion like 'G_______';