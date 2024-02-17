-- 15- Funciones string en Oracle SQL

-- Funcion chr(): busca cual es el valor del argumento en el codigo ASCII
-- Ejemplo: Di nos cual es caracter 100 del codigo ASCII
select chr(100) from dual;

-- Funcion ascii()
-- Ejemplo: Di nos que numero tiene la letra 'd'
select ascii('d') from dual;

-- Funcion concat(): Une varias cadenas de string
select concat('buenas', 'tardes') from dual;

-- Funcion initcap(): trae la primera letra en mayuscula de cada palabra separada por un espacio
select initcap('buenas tardes') from dual;

-- Funcion lower(): trae todo el string del argumento en minusculas
select lower('BUENAS TARDES') from dual;

-- Funcion upper(): trae todo el string del argumento en mayusculas
select upper('buenas tardes') from dual;

-- Funcion trim(): sirve para eliminar espacios en blanco
select trim('  oracle  ') from dual;

-- Funcion replace(): sustituye caracteres dentro de una cadena de string con los que le especifiquemos en una segunda cadena
-- select replace('cadena', 'caracterAReemplazar', 'caracterPorElQueSeVaAReemplazar') from tabla;
select replace('www.oracle.com', 'w', 'p') from dual;

-- Funcion substr
-- Muestra que caracteres estan entre el rango de 1 y 10, en la cadena de texto puesta como primer argumento
select substr('www.oracle.com', 1, 10) from dual;

-- Funcion length: Devuelve la cantidad de caracteres
select length('www.oracle.com') from dual;