-- 2.- Insert into

-- not null: no acepta valores vacios
create table empleado(
    id_empleado int not null,
    nombre varchar2(20), -- varchar2(20): vamos a ingresar caracteres variados, si colocamos  menos de 20 caracteres el sistema se encarga de acortar el espacio sobrante
    direccion varchar2(50),
    id_documento varchar2(10),
    sueldo number(6, 2),
    fecha_nacimiento date
);

-- insertamos
insert into empleado values(1, 'jose', 'calle 1ra no 54' , '1254589963', 3000, '01/09/85');
insert into empleado values(2, 'manuel', 'calle tercera 154' , '5458966233', 2000, '03/03/90');
insert into empleado values(3, 'Ana', 'Avenida principal 350' , '2145878855', 4000, to_date('10/03/1988', 'dd/mm/yyyy'));
select * from empleado;
