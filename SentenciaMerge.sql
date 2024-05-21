/*
SENTENCIA MERGE

SIGNIFICADOS:
ON: EN
WHEN: CUANDO
MATCHED: EMPAREJADO (COINCIDENCIA)
THEN: ENTONCES

Sintaxis del merge:
MERGE INTO destino USING origen
ON (condicion)
WHEN MATCHED THEN
UPDATE SET
campo=valor{,
{campo=valor}
WHEN NOT MATCHED THEN
INSERT (campos destino)
VALUES(valores)
*/

create table sucursal(
 codigo_sucursal number primary key,
 nombre_sucursal varchar2(80),
 fecha_inauguracion date,
 comuna_id number
);

create table sucursal_2(
 codigo_sucursal number primary key,
 nombre_sucursal varchar2(80),
 fecha_inauguracion date,
 comuna_id number
);

-- SUCURSAL 1 (TABLA ORIGEN)
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(1, 'Norte', DATE '12-09-23', 2);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(2, 'Sur 1', DATE '05-10-05', 3);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(3, 'Apoquindo 2', DATE '99-12-03', 2);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(4, 'Oriental', DATE '05-03-18', 1);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(5, 'Altavalsol', DATE '11-03-21', 1);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(6, 'Lo Prado', DATE '01-07-11', 3);
insert into sucursal(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(7, 'Puente', DATE '03-09-17', 2);

select * from sucursal
order by codigo_sucursal asc;
/*
CODIGO_SUCURSAL	NOMBRE_SUCURSAL	FECHA_INAUGURACION	COMUNA_ID
 1	         Norte	         09/23/0012	         2
 2	         Sur 1	         10/05/0005	         3
 3	         Apoquindo 2	 12/03/0099	         2
 4	         Oriental	 03/18/0005	         1
 5	         Altavalsol	 03/21/0011	         1
 6	         Lo Prado	 07/11/0001	         3
 7	         Puente	         09/17/0003	         2
*/

-- SUCURSAL 2 (TABLA DESTINO)
insert into sucursal_2(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(1, 'Norte', DATE '12-09-23', 2);
insert into sucursal_2(codigo_sucursal, nombre_sucursal, fecha_inauguracion, comuna_id)
values(2, 'Sur 1', DATE '05-10-05', 3);

select * from sucursal_2
order by codigo_sucursal asc;
/*
CODIGO_SUCURSAL	NOMBRE_SUCURSAL	FECHA_INAUGURACION	COMUNA_ID
 1	         Norte	         09/23/0012	         2
 2	         Sur 1	         10/05/0005	         3
*/

/* PROBLEMA: Se debe ingresar a la tabla sucursal 2 todas aquellas sucursales que aun faltan por ingresar (es decir de la 3 a la 7) 
y para sucursales 1 y 2 se debe hacer una actualizacion de datos */

merge into sucursal_2 a using sucursal b
on (a.codigo_sucursal=b.codigo_sucursal)
when matched then 
  update
  set nombre_sucursal='Update'
when not matched then
  insert
  values(b.codigo_sucursal, 'insert', b.fecha_inauguracion, b.comuna_id);

-- Consultamos la tabla destino (PARA VERIFICAR SI LOS CAMBIOS SE HICIERON CORRECTAMENTE)
select * from sucursal_2;
/*
NOTA: FILAS NUEVAS DEL 3 AL 7, FILAS ACTUALIZADAS DEL 1 AL 2
CODIGO_SUCURSAL	NOMBRE_SUCURSAL	FECHA_INAUGURACION	COMUNA_ID
 1		 Update		 09/23/0012		 2
 2		 Update		 10/05/0005		 3
 3		 insert		 12/03/0099		 2
 4		 insert		 03/18/0005		 1
 5		 insert		 03/21/0011		 1
 6		 insert		 07/11/0001		 3
 7		 insert		 09/17/0003		 2
*/
