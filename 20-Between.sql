-- 20 - Operador between
-- between: entre

drop table medicamentos;

 create table medicamentos(
  codigo number(6) not null,
  nombre varchar2(20),
  laboratorio varchar2(20),
  precio number(6,2),
  cantidad number(4),
  fechavencimiento date not null,
  primary key(codigo)
 );

 -- to_date(): para convertir una cadena de texto que representa una fecha en un tipo de dato de fecha
 insert into medicamentos
  values(102,'Sertal','Roche',5.2,10,to_date('01/02/2020','dd/mm/yyyy'));
 insert into medicamentos 
  values(120,'Buscapina','Roche',4.10,200,to_date('01/12/2017','dd/mm/yyyy'));
 insert into medicamentos 
  values(230,'Amoxidal 500','Bayer',15.60,100,to_date('28/12/2017','dd/mm/yyyy'));
 insert into medicamentos
  values(250,'Paracetamol 500','Bago',1.90,20,to_date('01/02/2018','dd/mm/yyyy'));
 insert into medicamentos 
  values(350,'Bayaspirina','Bayer',2.10,150,to_date('01/12/2019','dd/mm/yyyy'));
 insert into medicamentos 
  values(456,'Amoxidal jarabe','Bayer',5.10,250,to_date('01/10/2020','dd/mm/yyyy'));

select * from medicamentos;

-- Traer medicamentos, cuyo precio esta entre 5 y 15
select * from medicamentos where precio between 5 and 15;

-- Traer medicamentos, cuya cantidad esta entre 100 y 200
select * from medicamentos where cantidad between 100 and 200;

-- Cuales medicamentos tienen fecha de vencimiento entre primero de diciembre del 2017 y primero de febrero del 2018
-- Las 3 formas de hacer la consulta:

-- Utilizando formato de fecha ISO (yyyy-mm-dd)
SELECT * FROM medicamentos 
WHERE fechavencimiento BETWEEN to_date('2017-12-01', 'yyyy-mm-dd') AND to_date('2018-02-01', 'yyyy-mm-dd');

-- Utilizando la función DATE literal (la mas recomendada)
SELECT * FROM medicamentos 
WHERE fechavencimiento BETWEEN DATE '2017-12-01' AND DATE '2018-02-01'; -- (No funciona si por ejemplo usas este formato de fecha: BETWEEN DATE '01-12-2017' AND DATE '01-02-2018')

-- Utilizando la función TO_DATE y el formato de fecha predefinido 'dd-mm-yyyy'
SELECT * FROM medicamentos 
WHERE fechavencimiento BETWEEN TO_DATE('01-12-2017', 'dd-mm-yyyy') AND TO_DATE('01-02-2018', 'dd-mm-yyyy');
