drop database if exists Ejercicio3;
create database  Ejercicio3;

use Ejercicio3;

CREATE TABLE IF NOT EXISTS Categorias (
    codcateg INT,
    numcat INT,
    nomcat VARCHAR(60),
    proveedor VARCHAR(60),
    CONSTRAINT pk_Categorias PRIMARY KEY (codcateg)
);


CREATE TABLE IF NOT EXISTS Productos (
    codcateg INT,
    codproducto INT,
    refprod VARCHAR(30),
    descipcion VARCHAR(60),
    precio DECIMAL(5 , 2 ) UNSIGNED,
    CONSTRAINT pk_Productos PRIMARY KEY (codcateg , codproducto),
    CONSTRAINT fk_Productos FOREIGN KEY (codcateg)
        REFERENCES Categorias (codcateg)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

create table if not exists Ventas (
codventa int,
fecventa date,
cliente varchar(60),
constraint pk_Ventas primary key(codventa)

);

CREATE TABLE IF NOT EXISTS Lin_ventas (
    codventa INT,
    codcateg INT,
    codproducto INT,
    cantidad VARCHAR(30),
    CONSTRAINT pk_Lin_ventas PRIMARY KEY (codventa , codcateg , codproducto),
    CONSTRAINT fk_Lin_ventas FOREIGN KEY (codventa)
        REFERENCES Ventas (codventa)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_Lin_ventas_Productos FOREIGN KEY (codcateg , codproducto)
        REFERENCES Productos (codcateg , producto)
        ON DELETE NO ACTION ON UPDATE CASCADE
);