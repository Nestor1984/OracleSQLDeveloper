-- 13.- Concat + columnas calculadas

-- Traemos el calculo del precio de cada libro por la cantidad total en una columna extra
select titulo, precio, cantidad, precio * cantidad 
from libros;

-- Calcular el 10% de descuento en el costo de cada libro, en una columna extra
select titulo, precio, precio - (precio * 0.1) from libros;

-- Almacenamos el descuento como un registro en la tabla
update libros
set precio = precio - (precio * 0.1);

select * from libros;

-- concat
/* una concatenacion es la union de un registro de un campo con otro registro de un campo de la misma tabla,
pero todo se reflejara en un campo de la misma tabla*/
-- ||'-'||: se usa para unir y dentro de las comillas va el caracter que se va poner al medio de las 2 cadenas de texto
select titulo ||'-'|| autor from libros;

