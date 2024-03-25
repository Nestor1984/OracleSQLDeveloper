-- funciones cadena 2

-- Escribe una consulta que convierta la frase "hola mundo" a mayusculas.
select upper('hola mundo') as mayusculas from dual;
-- SALIDA: HOLA MUNDO

-- Escribe una consulta que convierta la frase "BUENOS DIAS" a minusculas.
select lower('BUENOS DIAS') as minusculas from dual;
-- SALIDA: buenos dias

-- Escribe una consulta que capitalice la primera letra de cada palabra en la frase "bienvenidos al mundo"
select initcap('bienvenidos al mundo') as oracion from dual;
-- SALIDA: Bienvenidos Al Mundo

-- Escribe una consulta que capitalice la palabra "base de datos" en la tabla DUAL.
select initcap('base de datos') as oracion from dual;
-- SALIDA: Base De Datos

-- Escribe una consulta que convierta la expresion "abc123" a mayusculas.
select upper('abc123') as oracion from dual;
-- SALIDA: xyz456

-- Escribe una consulta que convierta la expresion "XYZ456" a minusculas.
select lower('XYZ456') as oracion from dual;
-- SALIDA:

-- Escribe una consulta que capitalice la expresion "ejemplo de texto" en la tabla DUAL.
select initcap('ejemplo de texto') as ejemplo from dual;
-- SALIDA: Ejemplo De Texto

-- Escribe una consulta que elimine los espacios en blanco a la izquierda de la cadena ' texto'
select ltrim(' texto') as oracion from dual;
-- SALIDA: 'texto'

-- Escribe una consulta que elimine los espacios en blanco a la derecha de la cadena 'texto '
select rtrim('texto ') as oracion from dual;
-- SALIDA: 'texto'

-- Escribe una consulta que extraiga los primeros 3 caracteres de la cadena 'Oracle Database' utilizando la funcion SUBSTR.
select substr('Oracle Database', 1, 3) from dual;
-- SALIDA: Ora

-- Escribe una consulta que extraiga los caracteres desde la posición 5 hasta el final de la cadena 'Ejemplo de texto'
select substr('Ejemplo de texto', 5) from dual;
-- SALIDA: plo de texto

-- Escribe una consulta que extraiga una subcadena de 4 caracteres comenzando desde la posición 8 de la cadena 'ABCDEFGHIJKLM' utilizando SUBSTR
select substr('ABCDEFGHIJKLM', 8, 4) as cadena_extraida from dual;
-- SALIDA: HIJK

-- Escribe una consulta que extraiga el ultimo carácter de la cadena 'ABCDEF' utilizando SUBSTR
select substr('ABCDEF', 6) as caracter from dual;
-- SALIDA: F

-- Escribe una consulta que extraiga los primeros 4 caracteres del anio de la fecha '2024-03-24' utilizando SUBSTR.
select substr('2024-03-24', 1, 4) as anio from dual;
-- SALIDA: 2024

--  Escribe una consulta que extraiga los ultimos 3 caracteres de la cadena 'ABCDEF'
select substr('ABCDEF', 4) as cadena_extraida from dual;
-- SALIDA: DEF

-- Escribe una consulta que utilice la función INSTR para encontrar la posición de la subcadena 'or' dentro de la cadena 'Oracle'
select instr('Oracle', initcap('or')) as posicion from dual;
-- SALIDA: 1

-- Escribe una consulta que utilice INSTR para encontrar la posicion del caracter 'a' dentro de la cadena 'computadora'.
select instr('computadora', 'a') as posicion_de_a from dual;
-- SALIDA: 7

-- Escribe una consulta que utilice INSTR para encontrar la posicion de la subcadena 'de' dentro de la cadena 'Ejemplo de texto'
select instr('Ejemplo de texto', 'de') as posicion_de_de from dual;
-- SALIDA: 9

-- Escribe una consulta que utilice INSTR para encontrar la posicion de la ultima aparicion de la subcadena 'el' dentro de la cadena 'Este es el ultimo ejemplo de la lista'.
select instr('Este es el ultimo ejemplo de la lista', 'el') as posicion_de_el from dual;
-- SALIDA: 9

-- Escribe una consulta que utilice la funcion REPLACE para reemplazar todos los guiones (-) en la cadena '123-456-789' por espacios en blanco.
select replace('123-456-789', '-', ' ') as cadena_nueva from dual;
-- SALIDA: 123 456 789

-- Escribe una consulta que utilice la funcion TRANSLATE para reemplazar todos los caracteres 'aeiou' por asteriscos (*) en la cadena 'Hola mundo'.
select translate('Hola mundo', 'aeiou', '*****') as cadena_nueva from dual;
-- SALIDA: H*l* m*nd*

-- Escribe una consulta que utilice la funcion TRANSLATE para cambiar todos los caracteres 'abcd' por 'WXYZ' en la cadena 'abcdef'.
select translate('abcdef', 'abcd', 'WXYZ') as cadena_nueva from dual;
-- SALIDA: WXYZef

-- Escribe una consulta que convierta la fecha '2024-03-24' al formato 'DD-Mon-YYYY'
select to_char(to_date('2024-03-24', 'YYYY-MM-DD'), 'DD-MON-YYYY') as fecha from dual;
-- SALIDA: 24-MAR-2024
