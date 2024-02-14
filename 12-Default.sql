-- 12.- Default, valores por defecto
/* default: la clausula default nos permite colocar valores que se van a visualizar
al momento de hacer una consulta, mostrando el valor que le coloquemos por defecto*/

-- Borramos la tabla libros
drop table libros;

-- Creamos nuevamente
create table libros(
    titulo varchar2(40) not null, -- varchar2: es para que admita caracteres alfanumericos y el 2 nos indica que si no colocamos 40 caracteres el sistema se encagara de borralos 
    autor varchar2(30) default 'Desconocido', -- default: si no se va colocar ningun valor en el campo autor, aparecera entonces 'Desconocido'
    editorial varchar2(40) not null,
    precio number(5, 2), -- number(5, 2): aca decimos que el campo va poder tener cinco valores numericos y dos deciamles (los cinco valores numericos tambiem incluye los decimales)
    cantidad number(3) default 0
);

-- Llenamos libros
insert into libros values('El quijote', 'Miguel de Cervantes', 'La casa del libro', 650.00, 10);
insert into libros values('Guerra y Paz' , default, 'Mensajero ruso', 500.00, 5); -- pedimos que nos traiga el valor por defecto
insert into libros values('Cien anos de soledad' , 'Gabriel G Marquez', 'Sudamericana', 480.00, default); -- pedimos que nos traiga el valor por defecto

select * from libros;


