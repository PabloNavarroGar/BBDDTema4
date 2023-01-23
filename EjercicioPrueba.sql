drop database if exists ejercicio1; -- poner esto por si hay algo creado igual
 create database ejercicio1;
 use ejercicio1;-- SIEMPRE PONER ESTO A CONTINUACION
 
create table if not exists deptos--  todo contenido de tabla va entre los parentesis
(
  coddepto int unsigned not null, -- poner siempre , en al final,unsigned para que no sean numeros negativos
  nomdepto varchar (20), -- char= numero de caracteres,varchar= caracteres que no sabemos cuanto tendra, 
  constraint pk_deptos primary key(coddepto)
);


CREATE TABLE IF NOT EXISTS profesorado (
    coddepto INT UNSIGNED NOT NULL,
    codprof INT UNSIGNED NOT NULL,
    nomprof VARCHAR(30) NOT NULL,
    apel1prof VARCHAR(39) NOT NULL,
    apel2prof VARCHAR(30) NULL,
    fecincorporacion DATE NULL,
    codpostal CHAR(5) NULL,
    telefono CHAR(9) NULL,
    CONSTRAINT pk_profesorado PRIMARY KEY (codprof , coddepto),
    CONSTRAINT fk_profesorado_deptos FOREIGN KEY (coddepto)
        REFERENCES deptos (coddepto)
        ON DELETE NO ACTION ON UPDATE CASCADE
        -- Con esto hago el ciclo del Jefe, hay que declarar una clave foranea, con  la misma clave primaria que la del profesorado
        -- y vuelvo a referencias la misma tabla con la clave primaria
       -- constraint fk_profesorado_jefe foreign key(coddepto,codprof) references profesorado (coddepto,codprof)
       -- ON DELETE NO ACTION ON UPDATE CASCADE
        
);

CREATE TABLE IF NOT EXISTS asignaturas (
    codasig INT UNSIGNED NOT NULL,
    nomasig VARCHAR(30) NOT NULL,
    curso VARCHAR(30) NOT NULL,
    CONSTRAINT pk_asignaturas PRIMARY KEY (codasig)
);


create table if not exists impartir
(
 coddepto int unsigned not null,
 codprof INT UNSIGNED NOT NULL,
 codasig INT UNSIGNED NOT NULL,
 constraint fk_impartir foreign key (codasig) references asignaturas (codasig)
 ON DELETE NO ACTION ON UPDATE CASCADE,
 constraint fk_impartir_profesorado foreign key (coddepto,codprof) references profesorado (coddepto,codprof)
 ON DELETE NO ACTION ON UPDATE CASCADE
);