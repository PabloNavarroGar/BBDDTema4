drop database if exists Ejercicio1Deptos;
create database  Ejercicio1Deptos;

use Ejercicio1Deptos;

create table if not exists Centros
 -- tabla de los centros
(
codcentro int,
numcentro varchar(30) not null,
nomcentro varchar(30) not null,
direccion varchar(30) not null,
constraint pk_Centros  primary key (codcentro)

);

CREATE TABLE IF NOT EXISTS Departamentos (
    codcentro INT,
    coddepto INT,
    numcentro VARCHAR(30),
    presupuesto VARCHAR(30),
    nomdepto VARCHAR(30),
    departamentoDep int,
    CONSTRAINT pk_Departamentos PRIMARY KEY (codcentro , coddepto),
    CONSTRAINT fk_Departametos FOREIGN KEY (codcentro)
        REFERENCES Centros (codcentro)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        -- relaciones retrospectiva depende, se tiene que crear en este caso otra clave fk
	constraint fk_Departamentos_Depende foreign key(departamentoDep ) references Departamentos (codcentro)
         ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Empleados (
    codempleado INT,
    coddepto INT,
    codcentro int,
    numempleado VARCHAR(30),
    extelefon VARCHAR(13),
    fecnacimiento DATE,
    fecingreso DATE,
    salario DECIMAL(7 , 2 ) unsigned,
    comision VARCHAR(5),
    numhijos VARCHAR(10),
    nomempleado VARCHAR(30),
    CONSTRAINT pk_Empleados PRIMARY KEY (codempleado),
    CONSTRAINT fk_Empleados FOREIGN KEY (codcentro,coddepto)
        REFERENCES Departamentos (codcentro,coddepto)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS Dirigir (
    codempleado INT,
    codcentro int,
   
    fecindir DATE,
    fecfindir DATE,
    CONSTRAINT pk_Dirigir PRIMARY KEY (codempleado),
    CONSTRAINT fk_Dirigir_Empleados FOREIGN KEY (codempleado )
        REFERENCES Empleados (codempleado)
        ON DELETE NO ACTION ON UPDATE CASCADE,
         CONSTRAINT fk_Dirigir_Deptos FOREIGN KEY (codcentro)
        REFERENCES Departamentos (codcentro)
        ON DELETE NO ACTION ON UPDATE CASCADE
);