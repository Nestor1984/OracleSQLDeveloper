-- 10.- Primary key (clave primaria)
-- Clave primaria, es una clave unica

describe empleado;
select * from empleado;

create table usuarios(
    nombre varchar(20) not null,
    clave varchar2(10) not null,
    primary key(nombre)
);

describe usuarios;

insert into usuarios values('ma', '123456');
insert into usuarios values('manuel', '456899'); 
insert into usuarios values('manuel', '212256'); -- aqui saldria error por que queremos ingresar un valor repetido

select * from usuarios;
