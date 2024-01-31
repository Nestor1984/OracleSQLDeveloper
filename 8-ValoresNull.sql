-- 8.- Valores null
-- Son campos que no tienen registros

create table libros(
    titulo varchar(30) not null, -- not null: obligatorio ingresar registros
    autor varchar(20) not null,
    editorial varchar(15) null, -- null: permite valores vacios
    precio number(5, 2) -- Permitimos datos de 5 cifras en total, con 2 decimales
);

insert into libros values('El aleph', 'Borges', 'Emece', null);
insert into libros values('Alicia en el pais', 'Lewis carrol', 'Campos', 300.00);
insert into libros values('El quijote', 'Miguel de Cervantes', 'Casa del libro', 0);

select * from libros;


