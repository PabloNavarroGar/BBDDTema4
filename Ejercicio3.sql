drop database if exists Ejercicio3;
create database  Ejercicio3;

use Ejercicio3;
/*
Categorias (codcateg,numcat,nomcateg,proveedor)
Productos(codcateg*,Irefprod,precio)
Ventas(Codventa,fecventa,cliente)
Lin_ventas(pk_codventa*,[codcateg,codprod]*,cantidad



*/
CREATE TABLE IF NOT EXISTS Categorias (
    codcateg INT,
    numcat INT,
    nomcat VARCHAR(20),
    proveedor VARCHAR(60),
    CONSTRAINT pk_Categorias PRIMARY KEY (codcateg)
);


CREATE TABLE IF NOT EXISTS Productos (
    
    codproducto INT,
    codcateg int,
    refprod VARCHAR(30),
    descipcion VARCHAR(60),
    precio DECIMAL(10 , 2 ),
    -- poner ambas claves en la clave primaria, muy importante el orden
    CONSTRAINT pk_Productos PRIMARY KEY (codproducto,codcateg),
    CONSTRAINT fk_Productos_Categorias FOREIGN KEY (codcateg)
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
    codproducto INT,
    codcateg int,
    cantidad int,
    CONSTRAINT pk_Lin_ventas PRIMARY KEY (codventa , codproducto,codcateg),
    CONSTRAINT fk_Lin_ventas_ventas FOREIGN KEY (codventa)
        REFERENCES Ventas (codventa)
     ON DELETE NO ACTION ON UPDATE CASCADE,
     -- Imporante ponerlo en el orden que viene, tenia ese fallo, no lo olvides
    CONSTRAINT fk_Lin_ventas_productos FOREIGN KEY (codproducto,codcateg)
        REFERENCES Productos (codproducto,codcateg)
        ON DELETE NO ACTION ON UPDATE CASCADE
);