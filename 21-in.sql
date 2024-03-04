-- 21- Operador IN
-- Funciona como un or
-- in: trae registros que conincidan con los valores que le pasamos
-- not in: hace lo contrario al in

select * from medicamentos;

-- Traer nombres y precios de los medicamentos, cuyo laboratorio sea bayer o bago
select nombre, precio from medicamentos
where laboratorio in('Bayer', 'Bago');


-- Traer nombres y precios de los medicamentos, cuyo laboratorio no sea bayer o bago
select nombre, precio from medicamentos
where laboratorio not in('Bayer', 'Bago');

-- Selecciona todas las cantidades entre 10 y 200
select * from medicamentos
where cantidad in(10, 200);

-- Traer los medicamentos cuyo anio de vencimiento sea 2019 y 2020
select * from medicamentos
where extract(year from fechavencimiento) in(2019, 2020); -- extract(year from fechavencimiento): extraemos el anio del campo fechavencimiento

-- Traer los medicamentos cuyo mes de vencimiento sea diciembre o octubre
select * from medicamentos
where extract(month from fechavencimiento) in(12, 10); -- extract(month from fechavencimiento): extraemos el mes del campo fechavencimiento





