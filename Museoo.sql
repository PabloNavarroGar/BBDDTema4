drop database if exists EjercicioMuseo;
create database  EjercicioMuseo;

use EjercicioMuseo;
/*artistas(pk[codastrista],nomartista,apel1,apel2)
estilo(pk[codestilo],nomestilo)*/

CREATE TABLE IF NOT EXISTS artistas (
    codartista INT unsigned,
    nomartista VARCHAR(20),
    apel1 VARCHAR(20),
    apel2 VARCHAR(20),
    CONSTRAINT pk_artista PRIMARY KEY (codartista)
);

CREATE TABLE IF NOT EXISTS estilos (
    codestilo INT unsigned,
    nomestilo VARCHAR(20),
    CONSTRAINT pk_estilos PRIMARY KEY (codestilo)

);
CREATE TABLE IF NOT EXISTS tipoObras (
    codtipo_obra INT unsigned,
    nomtipoObra VARCHAR(20),
    duracion date,
    CONSTRAINT pk_tipo_obras PRIMARY KEY (codtipo_obra)

);

create table if not exists salas(
codsala int unsigned,
nomsala varchar(20),
 CONSTRAINT pk_sala PRIMARY KEY (codsala)
);


create table if not exists empleados(
codempleado int unsigned,
nomem varchar(20),
apel1em varchar(20),
apel2em varchar(20),
constraint pk_empleados primary key (codempleado)
 
);

CREATE TABLE IF NOT EXISTS seguridad (
    codsegur INT unsigned,
    codempleado INT unsigned,
    codsala INT unsigned,
    numsegur INT unsigned,
    CONSTRAINT pk_seguridad PRIMARY KEY (codsegur),
    CONSTRAINT fk_seguridad_empleado FOREIGN KEY (codempleado)
        REFERENCES empleados (codempleado)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_seguridad_salas FOREIGN KEY (codsala)
        REFERENCES salas (codsala)
        ON DELETE NO ACTION ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS restauradores (
    codrestau INT unsigned,
    codempleado INT unsigned,
    numsrestau INT unsigned,
    CONSTRAINT pk_restauradores PRIMARY KEY (codrestau),
    CONSTRAINT fk_restauradores_empleado FOREIGN KEY (codempleado)
        REFERENCES empleados (codempleado)
        ON DELETE NO ACTION ON UPDATE CASCADE
   
);

CREATE TABLE IF NOT EXISTS Obras (
    codobra INT unsigned,
    codartista INT unsigned,
    codestilo INT unsigned,
    codtipo_obra INT unsigned,
    codsala INT unsigned,
    numobra INT unsigned,
    CONSTRAINT pk_obras PRIMARY KEY (codobra),
    CONSTRAINT fk_obras_artistas FOREIGN KEY (codartista)
        REFERENCES artistas (codartista)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_obras_estilos FOREIGN KEY (codestilo)
        REFERENCES estilos (codestilo)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_obras_tipo_obras FOREIGN KEY (codtipo_obra)
        REFERENCES tipoObras (codtipo_obra)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        CONSTRAINT fk_obras_salas FOREIGN KEY (codsala)
        REFERENCES salas (codsala)
        ON DELETE NO ACTION ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS restauraciones (
    codobra INT unsigned,
    codrestau INT unsigned,
    feciniresta DATE,
    fecfinresta DATE,
    observaciones VARCHAR(60),
    CONSTRAINT pk_restauraciones PRIMARY KEY (codobra , codrestau),
    CONSTRAINT fk_restauraciones_obras FOREIGN KEY (codobra)
        REFERENCES Obras (codobra)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        CONSTRAINT fk_restauraciones_restauradores FOREIGN KEY (codrestau)
        REFERENCES restauradores (codrestau)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

