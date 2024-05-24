CREATE TABLE PROYECTOS_ORIGEN (
    ID NUMBER,
    NOMBRE_PROYECTO VARCHAR(255),
    PORCENTAJE_EXITO DECIMAL(5,2),
    CONSTRAINT pk_id_po primary key(ID)
);

INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(1, 'Proyecto A', 85.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(2, 'Proyecto B', 92.50);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(3, 'Proyecto C', 78.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(4, 'Proyecto D', 95.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(5, 'Proyecto E', 88.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(6, 'Proyecto F', 90.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(7, 'Proyecto G', 80.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(8, 'Proyecto H', 93.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(9, 'Proyecto I', 87.00);
INSERT INTO PROYECTOS_ORIGEN (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(10, 'Proyecto J', 89.00);

select * from PROYECTOS_ORIGEN
order by ID asc;
/*
ID	NOMBRE_PROYECTO	PORCENTAJE_EXITO
1	Proyecto A	85
2	Proyecto B	92.5
3	Proyecto C	78
4	Proyecto D	95
5	Proyecto E	88
6	Proyecto F	90
7	Proyecto G	80
8	Proyecto H	93
9	Proyecto I	87
10	Proyecto J	89
*/

CREATE TABLE PROYECTOS_DESTINO (
    ID NUMBER,
    NOMBRE_PROYECTO VARCHAR(255),
    PORCENTAJE_EXITO DECIMAL(5,2),
    CONSTRAINT pk_id_pd primary key(ID)
);

INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(1, 'Proyecto A', 86.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(2, 'Proyecto B', 93.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(3, 'Proyecto C', 79.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(4, 'Proyecto D', 96.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(5, 'Proyecto E', 89.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(6, 'Proyecto F', 91.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(7, 'Proyecto G', 81.00);
INSERT INTO PROYECTOS_DESTINO (ID, NOMBRE_PROYECTO, PORCENTAJE_EXITO) VALUES(8, 'Proyecto H', 94.00);

select * from PROYECTOS_DESTINO
order by ID asc;
/*
ID	NOMBRE_PROYECTO	PORCENTAJE_EXITO
1	Proyecto A	86
2	Proyecto B	93
3	Proyecto C	79
4	Proyecto D	96
5	Proyecto E	89
6	Proyecto F	91
7	Proyecto G	81
8	Proyecto H	94
*/

-- Aumentamos un 10% del porcentaje de exito de la tabla origen a la tabla destino
merge into PROYECTOS_DESTINO d using PROYECTOS_ORIGEN o
on (d.ID=o.ID)
when matched then 
  update
  set d.NOMBRE_PROYECTO='Nestor',
      d.PORCENTAJE_EXITO=d.PORCENTAJE_EXITO + (o.PORCENTAJE_EXITO * 0.1)
when not matched then
  insert(d.ID, d.NOMBRE_PROYECTO, d.PORCENTAJE_EXITO)
  values(o.ID, o.NOMBRE_PROYECTO, o.PORCENTAJE_EXITO);

-- Consultamos como quedo la tabla despues de ejecutar el merge
select * from PROYECTOS_DESTINO
order by ID asc;
/*
ID	NOMBRE_PROYECTO	PORCENTAJE_EXITO
1	Nestor		94.5
2	Nestor		102.25
3	Nestor		86.8
4	Nestor		105.5
5	Nestor		97.8
6	Nestor		100
7	Nestor		89
8	Nestor		103.3
9	Proyecto I	87
10	Proyecto J	89
*/

