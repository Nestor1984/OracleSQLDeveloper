-- 9.- Consultas null / is not null
 create table medicamentos(
  codigo number(5) not null,
  nombre varchar2(20) not null,
  laboratorio varchar2(20),
  precio number(5,2),
  cantidad number(3,0) not null
 );

 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(1,'Sertal gotas',null,null,100); 
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(2,'Sertal compuesto',null,8.90,150);
 insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(3,'Buscapina','Roche',null,200);
  insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(4,'Bayaspirina','',0,150);
   insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(5,'Advil capsulas','Delta',30.25,200);
   insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(6,'Panadol 500','Chevalier',null,160);
   insert into medicamentos (codigo,nombre,laboratorio,precio,cantidad)
  values(7,'Geniol',' ',0.5,200);
  
select * from medicamentos;

-- 1.- Cuantos laboratorios tienen el valor null
select * from medicamentos
where laboratorio is null;

-- 2.- Cuales medicamentos no tienen precio
select * from medicamentos
where precio is null;

-- 3.- Excluir los valores null
select * from medicamentos
where laboratorio is not null;

-- 4.- Excluir los precios null
select * from medicamentos
where precio is not null;

-- 5.- Valores vacios
select * from medicamentos
where laboratorio = ' ';

select * from medicamentos
where precio = '';
