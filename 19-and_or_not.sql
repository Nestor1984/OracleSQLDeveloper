-- 19 - AND, OR Y NOT
create table peliculas(
  codigo number(4) primary key,
  titulo varchar2(40) not null,
  actor varchar2(20),
  duracion number(3)
  );

 --Ingreso de registros

 insert into peliculas values(1020,'Mision imposible','Tom Cruise',120);
 insert into peliculas values(1021,'Harry Potter y la piedra filosofal','Daniel R.',180);
 insert into peliculas values(1022,'Harry Potter y la camara secreta','Daniel R.',190);
 insert into peliculas values(1200,'Mision imposible 2','Tom Cruise',120);
 insert into peliculas values(1234,'Mujer bonita','Richard Gere',120);
 insert into peliculas values(900,'Tootsie','D. Hoffman',90);
 insert into peliculas values(1300,'Un oso rojo','Julio Chavez',100);
 insert into peliculas values(1301,'Elsa y Fred','China Zorrilla',110);

select * from peliculas;

-- and(y): deben cumplirse ambas sentencias
-- or(y/o): pueden cumplirse ambas sentencias o solo una
-- not: negador

-- Traer peliculas de tom cruise o richard gere
select * from peliculas
where actor = 'Tom Cruise' or actor = 'Richard Gere';

-- Traer las peliculas de tom cruise y que la duracion sea igual a 100 minutos
select * from peliculas
where actor = 'Tom Cruise' and duracion = 100;

-- Traer las peliculas que no sean de Daniel R
select * from peliculas
where not actor = 'Daniel R.';