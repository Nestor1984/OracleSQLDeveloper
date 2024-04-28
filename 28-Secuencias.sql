/* 28- Secuencias: una secuencia es una funcionalidad que se emplea para generar
valores enteros secuenciales y que sean unicos, estos valores seran asignados a campos
numericos y se utilizan generalmente para claves primarias
*/

-- Las secuencias contienen:
-- NOMBRE DE SECUENCIA
-- VALOR ENTERO: define el valor maximo y el valor minimo de la secuencia
-- CICLO 

create table libros(
 idlibro int not null primary key,
 titulo varchar(40) not null,
 autor varchar(40) null,
 precio number(5, 2)
);

select * from libros;

-- Creamos la secuencia
create sequence secuencialibros
start with 1
increment by 1
maxvalue 9999
minvalue 1
cycle;

-- Iniciamos la secuencia
select secuencialibros.nextval from dual;

-- Insertamos los registros usando la secuencia
insert into libros values(secuencialibros.currval, 'El quijote', 'Miguel de Cervantes', 500.00);
insert into libros values(secuencialibros.nextval, 'Cien anios de soledad', 'Gabriel G. Marquez', 600.00);

-- Vemos los registros
select * from libros;
/*
IDLIBRO	TITULO	               AUTOR	               PRECIO
1	El quijote	       Miguel de Cervantes	500
2	Cien anios de soledad  Gabriel G. Marquez	600
*/

-- Vemos todas las secuencias
select * from all_sequences;

-- Vemos nuestra secuencia
select * from all_sequences where sequence_name = 'SECUENCIALIBROS';
/*
SEQUENCE_OWNER	SEQUENCE_NAME	MIN_VALUE	MAX_VALUE	INCREMENT_BY	CYCLE_FLAG	ORDER_FLAG	CACHE_SIZE	LAST_NUMBER
ANONIMO	        SECUENCIALIBROS	 1	        9999	         1	         Y		 N		 20		 21
*/
