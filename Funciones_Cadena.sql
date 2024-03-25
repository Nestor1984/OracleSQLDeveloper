-- Funciones cadena
-- Fecha de hoy: 23/03/2024

-- length(): para obtener la longitud de una cadena especifica
select LENGTH('Hola') as longitud_de_cadena from dual;
-- salida: 4

-- lower(): convierte una cadena de caracteres a minusculas
select LOWER('HOLA MUNDO') as en_minuscula from dual;
-- salida: hola mundo

-- upper(): convierte una cadena de caracteres a mayusculas
select UPPER('hola mundo') as en_mayuscula FROM DUAL;
-- salida: HOLA MUNDO

-- initcap(cadena): convierte la primera letra de cada palabra en una cadena a mayuscula y el resto de las letras a minuscula.
select initcap('buenas tardes alumno') from dual;
-- salida: Buenas Tardes Alumno

-- ltrim(): elimina los espacios en blanco de la parte izquierda de una cadena de texto.
select ltrim('   Hola Mundo   ') AS texto_recortado from dual;
-- salida: 'Hola Mundo   '

-- rtrim(): elimina los espacios en blanco de la parte derecha de una cadena de texto
select rtrim('   Hola Mundo   ') AS texto_recortado from dual;
-- salida: '   Hola Mundo'

-- substr(cadena, posición_inicio, [longitud]): Toma tres argumentos: la cadena, la posicion desde donde empezara a extraer y opcionalmente la cantidad de caracteres que va a extraer
select substr('Hello, world!', 8) AS subcadena FROM DUAL;
-- salida: world!

select substr('Hello, world!', 1, 5) AS subcadena FROM DUAL;
-- salida: Hello

-- instr(cadena, subcadena): se utiliza para encontrar la posicion de una subcadena dentro de una cadena más grande
select instr('Hola Mundo', 'Mundo') AS posicion_subcadena FROM DUAL;
-- salida: 6

-- translate(cadena, caracteres_a_reemplazar, caracteres_por_los_cuales_reemplazar): supongamos que tenemos una cadena de texto y queremos reemplazar todas las letras "a" con "x" y todas las letras "e" con "y".
select translate('Hello, world!', 'ae', 'xy') AS texto_nuevo FROM DUAL;
-- salida: Hyllo, world!

-- replace(cadena, cadenaAReemplazar, cadenaPorLaCualReemplazar): sirve para reemplazar la cadena o palabra del 2do argumento, por la cadena o palabra del 3er argumento
select replace('Hello World', 'World', 'Universe') AS Resultado from dual;
-- salida: Hello Universe

-- to_char(): para convertir un valor de fecha a un formato especifico
-- Mostrar la fecha en formato DD-MON-YYYY (por ejemplo, 23-MAR-2024):
select to_char(SYSDATE, 'DD-MON-YYYY') AS Fecha_Formateada from dual;
-- salida: 23-MAR-2024

-- Mostrar solo el anio de una fecha en formato YYYY (por ejemplo, 2024):
select to_char(SYSDATE, 'YYYY') AS Año from dual;
-- salida: 2024