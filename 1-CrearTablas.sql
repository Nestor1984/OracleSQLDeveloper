-- 1.- Como crear tablas

-- Sintaxis: campo tipoDeDato
create table usuario(
    idUsuario int, 
    nombre char(10),
    fecha_nacimiento date,
    telefono char(10),
    salario number(6, 2) -- number(cifraTotal, cantidadDeDecimalesQueVaLlevar)
);

-- Consulta
SELECT * FROM usuario;

-- DESCRIBE: nos muestra como queda configurado nuestra tabla
DESCRIBE usuario;