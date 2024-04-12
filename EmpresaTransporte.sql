create table pasajero(
 idpasajero number,
 nombre varchar2(60),
 apellido varchar2(60),
 telefono varchar2(15),
 ci varchar2(15),
 constraint pk_idpasa primary key(idpasajero)
);

create table compania(
 idcompania number,
 nombre varchar2(70),
 direccion varchar2(50),
 telefono varchar2(15),
 correo varchar2(35),
 constraint pk_idcompa primary key(idcompania)
);

create table equipaje(
 idequipaje number,
 descripcion varchar2(80),
 peso number,
 constraint pk_codequipaje primary key(idequipaje)
);

create table personal(
 idpersonal number,
 nombres varchar2(40),
 apellidos varchar2(40),
 ci varchar2(15),
 sueldo number,
 direccion varchar2(40),
 turno varchar2(40),
 cargo varchar2(30),
 constraint pk_idper primary key(idpersonal)
);

create table bus(
 idbus number,
 idcompania number,
 capacidad number,
 placa varchar2(30),
 modelo varchar2(65),
 estado varchar2(20),
 constraint pk_codbus primary key(idbus)
);

create table bus_pasajero(
 idbus number,
 idpasajero number
);

create table ticket(
 idticket number,
 nroasiento number,
 idpasajero number,
 idbus number,
 constraint pk_codticket primary key(idticket)
);

create table pasajero_equipaje(
 idpasajero number,
 idequipaje number
);

create table pagos(
 idpago number,
 tipopago varchar2(40),
 monto number,
 fechapago date,
 idticket number,
 idpasajero number,
 constraint pk_codpago primary key(idpago)
);

create table compania_bus(
 idcompania number,
 idbus number
);

create table bus_personal(
 idbus number,
 idpersonal number
);

create table viaje(
 idviaje number,
 origen varchar2(60),
 destino varchar2(60),
 fechayhoradesalida timestamp,
 fechayhoradellegada timestamp,
 distancia number,
 idbus number,
 constraint pk_codviaje primary key(idviaje)
);

create table transbordo(
 idtransbordo number,
 origentransbordo varchar2(80),
 destinotransbordo varchar2(80),
 fechatransbordo date,
 idviaje number,
 idbus number,
 constraint pk_codtrans primary key(idtransbordo)
);

create table pasajero_transbordo(
 idpajero number,
 idtransbordo number
);

create table reserva(
 idreserva number,
 idticket number
);

-- LLAVES FORANEAS
alter table bus
add constraint fk_bus_compania foreign key(idcompania) references compania(idcompania);

alter table bus_pasajero
add constraint fk_bus_pasajero foreign key(idpasajero) references pasajero(idpasajero);

alter table ticket
add constraint fk_ticket_pasajero foreign key(idpasajero) references pasajero(idpasajero);

alter table ticket
add constraint fk_ticket_bus foreign key(idbus) references bus(idbus); 

alter table pasajero_equipaje
add constraint fk_pe_e foreign key(idequipaje) references equipaje(idequipaje);

alter table pagos
add constraint fk_pagos_ticket foreign key(idticket) references ticket(idticket);

alter table pagos
add constraint fk_pagos_pasajero foreign key(idpasajero) references pasajero(idpasajero);

alter table compania_bus
add constraint fk_cb_bus foreign key(idbus) references bus(idbus);

alter table bus_personal
add constraint fk_bp_p foreign key(idpersonal) references personal(idpersonal);

alter table viaje
add constraint fk_viaje_bus foreign key(idbus) references bus(idbus);

alter table transbordo
add constraint fk_trans_viaje foreign key(idviaje) references viaje(idviaje);

alter table transbordo
add constraint fk_trans_bus foreign key(idbus) references bus(idbus);

alter table pasajero_transbordo
add constraint fk_pt_trans foreign key(idtransbordo) references transbordo(idtransbordo);

alter table reserva
add constraint fk_reserva_ticket foreign key(idticket) references ticket(idticket);

-- INSERCCIONES
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (1, 'Juan', 'Perez', '62233441', '12345678');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (2, 'Maria', 'Rodriguez', '72255662', '17890123');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (3, 'Pedro', 'Gutierrez', '62277883', '14567890');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (4, 'Ana', 'Flores', '72065804', '13456789');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (5, 'Luis', 'Sanchez', '62311225', '12345678');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (6, 'Claudia', 'Fernandez', '72333446', '11234560');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (7, 'Marco', 'Ramirez', '62355667', '10987654');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (8, 'Sandra', 'Martinez', '77893939', '19876543');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (9, 'David', 'Lopez', '62399008', '18765432');
INSERT INTO pasajero (idpasajero, nombre, apellido, telefono, ci)
VALUES (10, 'Jessica', 'Gonzalez', '72411229', '17654321');

INSERT INTO compania (idcompania, nombre, direccion, telefono, correo)
VALUES (1, 'Flota Yunguenia', 'Av Montes 1234', '62233441', 'info@flota.com');
INSERT INTO compania (idcompania, nombre, direccion, telefono, correo)
VALUES (2, 'Transporte 16 de Julio', 'Av Periferica 5678', '72255662', 'aten@trans.bo');
INSERT INTO compania (idcompania, nombre, direccion, telefono, correo)
VALUES (3, 'Bolivar SA', 'Terminal de Buses La Paz', '62277883', 'boli@boli.bo');
INSERT INTO compania (idcompania, nombre, direccion, telefono, correo)
VALUES (4, 'Naser', 'Calle Potosi 2345', '72065804', 'at@naser.bo');
INSERT INTO compania (idcompania, nombre, direccion, telefono, correo)
VALUES (5, 'Trans Copacabana', 'Av Saavedra 6789', '62311225', 'aten@cop.com');

INSERT INTO equipaje (idequipaje, descripcion, peso)
VALUES (1, 'Mochila negra', 10);
INSERT INTO equipaje (idequipaje, descripcion, peso)
VALUES (2, 'Maleta azul grande', 25);
INSERT INTO equipaje (idequipaje, descripcion, peso)
VALUES (3, 'Bolso deportivo rojo', 5);
INSERT INTO equipaje (idequipaje, descripcion, peso)
VALUES (4, 'Maleta mediana', 18);
INSERT INTO equipaje (idequipaje, descripcion, peso)
VALUES (5, 'Sudadera amarilla', 7);

INSERT INTO personal (idpersonal, nombres, apellidos, ci, sueldo, direccion, turno, cargo)
VALUES (1, 'Juan', 'Perez', '12345678', 3500, 'Calle Potosi 100', 'Manana', 'Asistente');
INSERT INTO personal (idpersonal, nombres, apellidos, ci, sueldo, direccion, turno, cargo)
VALUES (2, 'Maria', 'Rodriguez', '18765432', 4200, 'Av. America 200', 'Tarde', 'Secretaria');
INSERT INTO personal (idpersonal, nombres, apellidos, ci, sueldo, direccion, turno, cargo)
VALUES (3, 'Pedro', 'Gutierrez', '19876543', 2800, 'Calle Ingavi 300', 'Noche', 'Vigilante');
INSERT INTO personal (idpersonal, nombres, apellidos, ci, sueldo, direccion, turno, cargo)
VALUES (4, 'Ana', 'Flores', '17654321', 5000, 'Av. Camacho 400', 'Manana', 'Contador');
INSERT INTO personal (idpersonal, nombres, apellidos, ci, sueldo, direccion, turno, cargo)
VALUES (5, 'Luis', 'Sanchez', '11234560', 3200, 'Calle Sucre 500', 'Tarde', 'Contador');

INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (1, 1, 50, '1234ABC', 'Marcopolo Paradiso G7 1800 DD', 'Activo');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (2, 2, 40, '2345DEF', 'Neobus New Road N10 360', 'En Mantenimiento');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (3, 3, 30, '3456GHI', 'Volvo B12R 4x2', 'Activo');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (4, 4, 25, '4567JKL', 'Scania K360IB 4x2', 'Fuera de Servicio');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (5, 5, 60, '5678MNO', 'Mercedes-Benz O500RSD 2546', 'Activo');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (6, 1, 55, '6789PQR', 'Volkswagen 17-230EOT', 'En Mantenimiento');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (7, 2, 45, '7890STU', 'Agrale MT 17.0 LE', 'Activo');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (8, 3, 35, '8901VWX', 'Iveco Daily 70C17', 'Fuera de Servicio');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (9, 4, 20, '9012YZA', 'Toyota Coaster', 'Activo');
INSERT INTO bus (idbus, idcompania, capacidad, placa, modelo, estado)
VALUES (10, 5, 65, '0123BCD', 'Hyundai Universe Space Luxury', 'En Mantenimiento');

INSERT INTO bus_pasajero (idbus, idpasajero)
VALUES (1, 1);
INSERT INTO bus_pasajero (idbus, idpasajero)
VALUES (2, 2);
INSERT INTO bus_pasajero (idbus, idpasajero)
VALUES (3, 3);
INSERT INTO bus_pasajero (idbus, idpasajero)
VALUES (4, 4);
INSERT INTO bus_pasajero (idbus, idpasajero)
VALUES (5, 5);

INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (1, 10, 1, 1);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (2, 12, 2, 2);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (3, 5, 3, 3);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (4, 8, 4, 4);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (5, 15, 5, 5);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (6, 2, 1, 2);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (7, 7, 2, 3);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (8, 11, 3, 1);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (9, 14, 4, 4);
INSERT INTO ticket (idticket, nroasiento, idpasajero, idbus)
VALUES (10, 1, 5, 5);

INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (1, 1);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (2, 2);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (3, 3);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (4, 4);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (5, 5);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (6, 1);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (7, 2);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (8, 3);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (9, 4);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (10, 5);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (1, 1);
INSERT INTO pasajero_equipaje (idpasajero, idequipaje)
VALUES (2, 2);

INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (1, 'Efectivo', 150, DATE '2024-04-10', 1, 1);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (2, 'Tarjeta de crédito', 220, DATE '2024-04-09', 2, 2);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (3, 'Debito bancario', 180, DATE '2024-04-08', 3, 3);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (4, 'Efectivo', 190, DATE '2024-04-05', 4, 4);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (5, 'Tarjeta de debito', 270, DATE '2024-04-04', 5, 5);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (6, 'Efectivo', 160, DATE '2024-04-03', 2, 1);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (7, 'Tarjeta de crédito', 200, DATE '2024-04-02', 3, 2);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (8, 'Debito bancario', 170, DATE '2024-04-01', 1, 3);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (9, 'Efectivo', 210, DATE '2024-03-31', 4, 4);
INSERT INTO pagos (idpago, tipopago, monto, fechapago, idticket, idpasajero)
VALUES (10, 'Tarjeta de debito', 290, DATE '2024-03-30', 5, 5);

INSERT INTO compania_bus (idcompania, idbus)
VALUES (1, 1);
INSERT INTO compania_bus (idcompania, idbus)
VALUES (2, 2);
INSERT INTO compania_bus (idcompania, idbus)
VALUES (3, 3);
INSERT INTO compania_bus (idcompania, idbus)
VALUES (4, 4);
INSERT INTO compania_bus (idcompania, idbus)
VALUES (5, 5);

INSERT INTO bus_personal (idbus, idpersonal)
VALUES (1, 1);
INSERT INTO bus_personal (idbus, idpersonal)
VALUES (2, 2);
INSERT INTO bus_personal (idbus, idpersonal)
VALUES (3, 3);
INSERT INTO bus_personal (idbus, idpersonal)
VALUES (4, 4);
INSERT INTO bus_personal (idbus, idpersonal)
VALUES (5, 5);

INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (1, 'La Paz', 'Cochabamba', TIMESTAMP '2024-04-10 10:00:00', TIMESTAMP '2024-04-10 18:00:00', 416, 1);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (2, 'Santa Cruz', 'Sucre', TIMESTAMP '2024-04-11 08:00:00', TIMESTAMP '2024-04-11 14:00:00', 600, 2);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (3, 'Oruro', 'Potosí', TIMESTAMP '2024-04-12 12:00:00', TIMESTAMP '2024-04-12 18:00:00', 212, 3);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (4, 'Tarija', 'Trinidad', TIMESTAMP '2024-04-13 15:00:00', TIMESTAMP '2024-04-14 12:00:00', 1456, 4);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (5, 'Cobija', 'Riberalta', TIMESTAMP '2024-04-14 09:00:00', TIMESTAMP '2024-04-14 16:00:00', 598, 5);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (6, 'La Paz', 'Cochabamba', TIMESTAMP '2024-04-15 10:00:00', TIMESTAMP '2024-04-15 18:00:00', 416, 6);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (7, 'Santa Cruz', 'Sucre', TIMESTAMP '2024-04-15 10:00:00', TIMESTAMP '2024-04-15 18:00:00', 416, 6);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (8, 'Oruro', 'Potosí', TIMESTAMP '2024-04-17 12:00:00', TIMESTAMP '2024-04-17 18:00:00', 212, 7);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (9, 'Tarija', 'Trinidad', TIMESTAMP '2024-04-18 15:00:00', TIMESTAMP '2024-04-19 12:00:00', 1456, 8);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (10, 'Cobija', 'Riberalta', TIMESTAMP '2024-04-19 09:00:00', TIMESTAMP '2024-04-19 16:00:00', 598, 9);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (11, 'La Paz', 'Cochabamba', TIMESTAMP '2024-04-20 10:00:00', TIMESTAMP '2024-04-20 18:00:00', 416, 10);
INSERT INTO viaje (idviaje, origen, destino, fechayhoradesalida, fechayhoradellegada, distancia, idbus)
VALUES (12, 'Santa Cruz', 'Sucre', TIMESTAMP '2024-04-21 08:00:00', TIMESTAMP '2024-04-21 14:00:00', 600, 1);

INSERT INTO transbordo (idtransbordo, origentransbordo, destinotransbordo, fechatransbordo, idviaje, idbus)
VALUES (1, 'Oruro', 'Cochabamba', TO_DATE('2024-04-15', 'YYYY-MM-DD'), 2, 7);
INSERT INTO transbordo (idtransbordo, origentransbordo, destinotransbordo, fechatransbordo, idviaje, idbus)
VALUES (2, 'Tarija', 'Potosí', TO_DATE('2024-04-16', 'YYYY-MM-DD'), 5, 8);
INSERT INTO transbordo (idtransbordo, origentransbordo, destinotransbordo, fechatransbordo, idviaje, idbus)
VALUES (3, 'Sucre', 'Oruro', TO_DATE('2024-04-17', 'YYYY-MM-DD'), 3, 9);

INSERT INTO pasajero_transbordo (idpajero, idtransbordo)
VALUES (1, 1);
INSERT INTO pasajero_transbordo (idpajero, idtransbordo)
VALUES (2, 2);
INSERT INTO pasajero_transbordo (idpajero, idtransbordo)
VALUES (3, 3);

INSERT INTO reserva (idreserva, idticket)
VALUES (1, 1);
INSERT INTO reserva (idreserva, idticket)
VALUES (2, 2);
INSERT INTO reserva (idreserva, idticket)
VALUES (3, 3);

-- CONSULTAS
select * from pasajero
order by idpasajero asc;

select * from compania
order by idcompania asc;

select * from equipaje 
order by idequipaje asc;

select * from personal
order by idpersonal asc;

select * from bus
order by idbus asc;

select * from bus_pasajero;

select * from ticket
order by idticket asc;

select * from pasajero_equipaje;

select * from pagos
order by idpago asc;

select * from compania_bus;

select * from bus_personal;

select * from viaje
order by idviaje asc;

select * from transbordo
order by idtransbordo asc;

select * from pasajero_transbordo;

select * from reserva
order by idreserva asc;


-- CONSULTAS CON INNER JOIN
-- QUE BUSES CORRESPONDEN A LA COMPANIA Flota Yunguenia
select b.modelo, b.estado, c.nombre, c.direccion, c.telefono
from bus b, compania c
where b.idcompania = c.idcompania and c.nombre like 'Flota Yunguenia';

-- QUE PASAJEROS TIENEN UN EQUIPAJE MAYOR A 18 KG
select pe.idpasajero, pe.idequipaje, p.nombre, p.apellido, e.descripcion, e.peso
from pasajero_equipaje pe, pasajero p, equipaje e
where pe.idpasajero = p.idpasajero and pe.idequipaje = e.idequipaje and e.peso > 18;

-- QUE PAGOS SE HICIERON CON TARJETA DE CREDITO
select p.tipopago, p.monto, p.fechapago, t.nroasiento, pa.nombre, pa.apellido
from pagos p, ticket t, pasajero pa
where p.idticket = t.idticket and p.idpasajero = pa.idpasajero and p.tipopago like 'Tarjeta de crédito';

-- ANADIR UN MES A LA FECHA DE PAGO DE LOS PASAJEROS CUYO NOMBRE EMPIECE CON 'M'
select p.fechapago, add_months(p.fechapago, 1) AS mes_anadido, t.nroasiento, pa.nombre, pa.apellido
from pagos p, ticket t, pasajero pa
where p.idticket = t.idticket and p.idpasajero = pa.idpasajero and pa.nombre like 'M%';

-- QUIENES TOMARON UN VIAJE CON DESTINO A TRINIDAD
select v.destino, v.distancia, b.modelo, c.nombre, c.direccion 
from viaje v, bus b, compania c
where v.idbus = b.idbus and b.idcompania = c.idcompania and v.destino like 'Trinidad';

/* Selecciona todas las filas de la tabla viaje donde:
fechayhoradesalida esté dentro del rango de fechas del 10 al 20 de abril de 2024 (inclusive), o
fechayhoradellegada esté dentro del mismo rango de fechas. */
SELECT v.origen, v.destino, v.fechayhoradesalida, v.fechayhoradellegada, b.modelo, b.estado
FROM viaje v, bus b
WHERE v.idbus = b.idbus and (fechayhoradesalida BETWEEN TIMESTAMP '2024-04-10 00:00:00' AND TIMESTAMP '2024-04-20 23:59:59')
   OR (fechayhoradellegada BETWEEN TIMESTAMP '2024-04-10 00:00:00' AND TIMESTAMP '2024-04-20 23:59:59');

-- QUE EQUIPAJES PERTENECEN A PASAJEROS CUYO NOMBRE NO TERMINA CON LA LETRA A Y QUE CUYO APELLIDO NO EMPIEZA CON LA LETRA M
select pe.idpasajero, pe.idequipaje, p.nombre, p.apellido, p.telefono, e.descripcion
from pasajero_equipaje pe, pasajero p, equipaje e
where pe.idpasajero = p.idpasajero and pe.idequipaje = e.idequipaje and p.nombre not like '%a' and p.apellido not like 'M%'; 

-- MOSTRAR EN MAYUSCULA EL NOMBRE Y APELLIDO DE CADA PERSONAL, QUE ESTA EN BUSES DE ESTADO ACTIVO
select bp.idbus, bp.idpersonal, b.modelo, b.estado, p.nombres, p.apellidos, upper(p.nombres) as nom_mayus, upper(p.apellidos) as ape_mayus
from bus_personal bp, bus b, personal p
where bp.idbus = b.idbus and bp.idpersonal = p.idpersonal and b.estado like 'Activo';

-- QUE TRANSBORDOS SE HICIERON CON BUSES DE LA COMPANIA Bolivar SA
select t.origentransbordo, t.destinotransbordo, t.fechatransbordo, v.distancia, b.modelo, c.nombre
from transbordo t, viaje v, bus b, compania c
where t.idviaje = v.idviaje and t.idbus = b.idbus and b.idcompania = c.idcompania and c.nombre like 'Bolivar SA';