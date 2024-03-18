-- 25- Group by
-- Group by (Agrupar por): Devuelve una lista que esta agrupada por una o mas columnas
-- NOTA: esta sentencia se usa en conjunto de funciones de agrupamiento, sino no tendria sentido
-- NOTA IMPORTANTE: CUANDO SE UTILIZA EL GROUP BY SE DEBE AGRUPAR POR TANTOS CAMPOS SE COLOQUE AL PRINCIPIO DEL SELECT
-- RECUERDA: La funcion count() cuenta los valores que no sean nulos del campo que le mandamos como argumento, los valores nulos no serán contabilizados.

  create table visitantes(
  nombre varchar2(30),
  edad number(2),
  sexo char(1) default 'f',
  domicilio varchar2(30),
  ciudad varchar2(20) default 'Cordoba',
  telefono varchar2(11),
  mail varchar2(30) default 'no tiene',
  montocompra number(6,2)
 );

 insert into visitantes
  values ('Susana Molina',35,default,'Colon 123',default,null,null,59.80);
 insert into visitantes
  values ('Marcos Torres',29,'m',default,'Carlos Paz',default,'marcostorres@hotmail.com',150.50);
 insert into visitantes
  values ('Mariana Juarez',45,default,default,'Carlos Paz',null,default,23.90);
 insert into visitantes (nombre, edad,sexo,telefono, mail)
  values ('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com');
 insert into visitantes (nombre, ciudad, montocompra)
  values ('Alejandra Gonzalez','La Falda',280.50);
 insert into visitantes (nombre, edad,sexo, ciudad, mail,montocompra)
  values ('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40);
 insert into visitantes
  values ('Liliana Torres',40,default,'Sarmiento 876',default,default,default,85);
 insert into visitantes
  values ('Gabriela Duarte',21,null,null,'Rio Tercero',default,'gabrielaltorres@hotmail.com',321.50);

select * from visitantes;

-- Se requiere saber cuantos visitantes estan registrados en la tabla y agrupar por ciudad
select ciudad, count(*) from visitantes
group by ciudad; -- Es decir que cuente por ciudad

/*
 Salida:
CIUDAD	     COUNT(*)
La Falda	1
Rio Tercero	1
Cordoba	        3
Carlos Paz	3
*/

-- Cuantos de los visitantes tienen numero telefonico y que lo agrupe por ciudad
select ciudad, count(telefono) from visitantes
group by ciudad; -- Es decir que cuente por ciudad
/*
Salida:
CIUDAD	    COUNT(TELEFONO)
La Falda	0
Rio Tercero	0
Cordoba	        1
Carlos Paz	0
*/

-- Traer el total de compra de los visitantes y agrupa por genero
select sexo, sum(montocompra) from visitantes
group by sexo; -- Es decir que haga la suma por genero
/*
Salida:
SEXO	SUM(MONTOCOMPRA)
-	321.5
f	449.2
m	245.9
*/

-- Traer el total de compra de los visitantes, donde el genero no sea nulo y agrupa por genero
select sexo, sum(montocompra) from visitantes
where sexo is not null
group by sexo; -- Es decir que haga la suma por genero
/*
Salida:
SEXO	SUM(MONTOCOMPRA)
f	449.2
m	245.9
*/

/* Traer el maximo del monto de compras en un campo que se llame mayor y traer el minimo del monto de compras en un campo que se llame menor
agrupado por sexo y ciudad */
select sexo, ciudad, max(montocompra) as mayor, min(montocompra) as menor from visitantes
group by sexo, ciudad;
/*
Salida:
SEXO	CIUDAD	MAYOR	MENOR
m	Carlos Paz	150.5	95.4
f	Carlos Paz	23.9	23.9
-	Rio Tercero	321.5	321.5
f	Cordoba	        85      59.8
f	La Falda	280.5	280.5
m	Cordoba    	-	-
*/


