CREATE TABLE ORIGEN (
    ID NUMBER,
    NOMBRE VARCHAR(255),
    EDAD NUMBER,
    CIUDAD VARCHAR(255),
    CONSTRAINT pk_id_origen primary key(ID)
);

CREATE TABLE DESTINO (
    ID NUMBER,
    NOMBRE VARCHAR(255),
    EDAD INT,
    CIUDAD VARCHAR(255),
    CONSTRAINT pk_id_destino primary key(ID)
);

INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (1, 'Juan', 30, 'Madrid');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (2, 'Ana', 25, 'Barcelona');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (3, 'Carlos', 35, 'Valencia');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (4, 'Laura', 28, 'Sevilla');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (5, 'Pedro', 32, 'Bilbao');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (6, 'Maria', 27, 'Zaragoza');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (7, 'Luis', 33, 'Malaga');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (8, 'Carmen', 29, 'Murcia');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (9, 'Ricardo', 31, 'Las Palmas');
INSERT INTO ORIGEN (ID, NOMBRE, EDAD, CIUDAD) VALUES (10, 'Sofia', 26, 'Palma');

INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (1, 'Juan', 30, 'Madrid');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (2, 'Ana', 25, 'Barcelona');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (3, 'Carlos', 35, 'Valencia');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (4, 'Laura', 28, 'Sevilla');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (5, 'Pedro', 32, 'Bilbao');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (6, 'Maria', 27, 'Zaragoza');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (7, 'Luis', 33, 'Malaga');
INSERT INTO DESTINO (ID, NOMBRE, EDAD, CIUDAD) VALUES (8, 'Carmen', 29, 'Murcia');

select * from ORIGEN
order by ID asc;
/*
ID	NOMBRE	EDAD	CIUDAD
1	Juan	30	Madrid
2	Ana	25	Barcelona
3	Carlos	35	Valencia
4	Laura	28	Sevilla
5	Pedro	32	Bilbao
6	Maria	27	Zaragoza
7	Luis	33	Malaga
8	Carmen	29	Murcia
9	Ricardo	31	Las Palmas
10	Sofia	26	Palma
*/

select * from DESTINO
order by ID asc;
/*
ID	NOMBRE	EDAD	CIUDAD
1	Juan	30	Madrid
2	Ana	25	Barcelona
3	Carlos	35	Valencia
4	Laura	28	Sevilla
5	Pedro	32	Bilbao
6	Maria	27	Zaragoza
7	Luis	33	Malaga
8	Carmen	29	Murcia
*/

merge into DESTINO d using ORIGEN o
on (d.ID=o.ID)
when matched then 
  update
  set d.NOMBRE='Nestor',
      d.EDAD=20,
      d.CIUDAD='Bolivia'
when not matched then
  insert
  values(o.ID, o.NOMBRE, o.EDAD, o.CIUDAD);

-- CONSULTAMOS A VER COMO QUEDO LA TABLA DESTINO DESPUES DEL MERGE
select * from DESTINO
order by ID asc;
/*
ID	NOMBRE	EDAD	CIUDAD
1	Nestor	20	Bolivia
2	Nestor	20	Bolivia
3	Nestor	20	Bolivia
4	Nestor	20	Bolivia
5	Nestor	20	Bolivia
6	Nestor	20	Bolivia
7	Nestor	20	Bolivia
8	Nestor	20	Bolivia
9	Ricardo	31	Las Palmas
10	Sofia	26	Palma
*/

TRUNCATE TABLE ORIGEN;
TRUNCATE TABLE DESTINO;
