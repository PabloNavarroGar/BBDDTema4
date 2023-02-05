drop database if exists almacenrepaso;
create database almacenrepaso;
use almacenrepaso;


/*
Esquema Relacional
centros(pk_codcentro,nomcentro,dircentro)

Deptos([pk_codcentro*,coddepto],nomdepto)
relacion especial esa de depende(mirar ejercicio ya hecho)
trabajador(n)pertenece depto(1)
trabajadores(pk_trabajado,[fk_codcentro*,coddepto],nomtrab,apell1,apell2,tef,dni,salario)
venderoes[pk_codvendedor, codtrabajado*)
Admin[pk_admin, codtrabajado*)
ventas(pk:codventas,codvendedor*)
productos(codproducto,nomproducto)
detalleVenta(codventa*,codprocuto*,cantidad)

*/

create table if not exists centros(
codcentro int,
nomcentro varchar(20),
dircentro varchar(20),
constraint pk_centros primary key (codcentro)

);
 -- Deptos([pk_codcentro*,coddepto],nomdepto)
CREATE TABLE IF NOT EXISTS departamentos (
    codcentro INT,
    coddepto INT,
    nomdepto VARCHAR(20),
    departamentodep INT,
    CONSTRAINT pk_departamentos PRIMARY KEY (codcentro , coddepto),
    CONSTRAINT fk_departamentos_centros FOREIGN KEY (codcentro)
        REFERENCES centros (codcentro)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        -- Relacion de retrospectiva
    CONSTRAINT fk_departamentos_depende FOREIGN KEY (departamentodep)
        REFERENCES departamentos (codcentro)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- trabajador(n)pertenece depto(1)
-- trabajadores(pk_trabajado,
-- [fk_codcentro*,coddepto],nomtrab,apell1,apell2,tef,dni,salario)
create table if not exists trabajadores(
codtrabajador int,
codcentro int,
coddepto int,
nomtrabaj varchar(20),
apell1 varchar(20),
apell2 varchar(20),
tef char(12),
dni char(9) unique,
salario decimal(7,2),
constraint pk_trabajadores primary key (codtrabajador),
constraint fk_trabajadores_deptos foreign key (codcentro,coddepto)
references departamentos(codcentro,coddepto)
on delete no action on update cascade


);


/*venderoes[pk_codvendedor, codtrabajado*)
Admin[pk_admin, codtrabajador*)*/

CREATE TABLE IF NOT EXISTS administrador (
    codadmin INT,
    codtrabajador INT,
    CONSTRAINT pk_admin PRIMARY KEY (codadmin),
    CONSTRAINT fk_admin_trabajador FOREIGN KEY (codtrabajador)
        REFERENCES trabajadores (codtrabajador)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS vendedores (
    codvendedor INT,
    codtrabajador INT,
    CONSTRAINT pk_vendedor PRIMARY KEY (codvendedor),
    CONSTRAINT fk_vendedor_trabajador FOREIGN KEY (codtrabajador)
        REFERENCES trabajadores (codtrabajador)
        ON DELETE NO ACTION ON UPDATE CASCADE
);


/*ventas(pk:codventas,codvendedor*)
productos(codproducto,nomproducto)
detalleVenta(codventa*,codprocuto*,cantidad)*/

create table if not exists ventas(
codventas int,
codvendedor int,
 CONSTRAINT pk_ventas PRIMARY KEY (codventas),
    CONSTRAINT fk_ventas_vendedor FOREIGN KEY (codvendedor)
        REFERENCES vendedores (codvendedor)
        ON DELETE NO ACTION ON UPDATE CASCADE

);

create table if not exists productos(
codproducto int,
nomproducto varchar(20),

constraint pk_productos primary key (codproducto)

);

create table if not exists detalleVentas(
codventas int,
codproducto int,
cantidad tinyint unsigned,
constraint pk_detalleVentas primary key (codventas,codproducto),
constraint fk_detalleVentas_ventas foreign key(codventas) references
ventas(codventas) on delete no action on update cascade,
constraint fk_detalleVentas_productos foreign key(codproducto) references
productos(codproducto) on delete no action on update cascade


);


