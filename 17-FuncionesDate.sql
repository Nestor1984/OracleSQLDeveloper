-- 17 - Funciones DATE en oracle sql
-- funcion add_months: agregamos o retrocedemos meses en un segundo argumento 
-- ejm: agregamos 5 meses
select add_months(to_date('10/10/2020', 'dd/mm/yyyy'), 5) from articulos;
-- salida: 03/10/2021

-- ejm: retrocedemos 5 meses
select add_months(to_date('10/10/2020', 'dd/mm/yyyy'), -5) from articulos;
-- salida: 05/10/2020

-- funcion last_day: devuelve el ultimo dia del mes
select last_day(to_date('09/02/2020', 'dd/mm/yyyy')) from articulos;
-- salida: 02/29/2020

-- funcion months_between(,): trae la cantidad de meses entre 2 fechas
select months_between(to_date('19/05/2020', 'dd/mm/yyyy'), to_date('19/06/2020', 'dd/mm/yyyy')) as meses from articulos;
-- salida: -1

-- funcion current_date: trae la fecha actual
select current_date from articulos;
-- salida: 02/16/2024