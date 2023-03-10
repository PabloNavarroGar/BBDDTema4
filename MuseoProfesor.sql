drop database if exists BDMUSEO;
CREATE DATABASE if not exists BDMUSEO;
USE BDMUSEO;
/* CREAMOS LAS TABLAS ==> EL ORDEN ES IMPORTANTE (INTEGRIDAD REFERENCIAL) */
/************************************/

create table if not exists artistas
    (codartista int unsigned, -- int(4)
     nomartista varchar(60),
     biografia text,
	 edad tinyint unsigned, -- int(1)
	 fecnacim date,
    constraint pk_artistas primary key (codartista)
    );
create table if not exists tipobras
    (codtipobra int unsigned,
     destipobra varchar(20),
    constraint pk_tipobras primary key (codtipobra)
    );
create table if not exists estilos
    (codestilo int unsigned,
     nomestilo varchar(20),
     desestilo varchar(250),
    constraint pk_estilos primary key (codestilo)
    );

create table if not exists salas
    (codsala int unsigned,
     nomsala varchar(20),
    constraint pk_salas primary key (codsala)
    );

create table if not exists obras
    (codobra int unsigned,
     nomobra varchar(20),
     desobra varchar(100),
     feccreacion date null,
     fecadquisicion date null,
     valoracion decimal (12,2) unsigned,
     codestilo int unsigned,
     codtipobra int unsigned,
     codubicacion int unsigned, -- sala en la que está
    constraint pk_obras primary key (codobra),
    constraint fk_obras_tipobras foreign key (codtipobra)
        references tipobras(codtipobra) 
        on delete no action on update cascade,
    constraint fk_obras_estilos  foreign key (codestilo)
        references estilos(codestilo) 
        on delete no action on update cascade,
    constraint fk_obras_salas foreign key (codubicacion)
        references salas(codsala) 
        on delete no action on update cascade
    );
alter table obras add column codartista int unsigned,
	add constraint fk_obras_artistas foreign key (codartista)
		references artistas(codartista) 
        on delete no action on update cascade;
create table if not exists empleados
    (codemple int unsigned,
     nomemle varchar(20),
     ape1emple varchar(20),
     ape2emple varchar(20) null,
     fecincorp date,
	 tlfempleado char(12),
     numsegsoc char(15),
    constraint pk_empleados primary key (codemple)
    );
create table if not exists seguridad
    (codsegur int unsigned,
     codemple int unsigned,
	 codsala int unsigned,
     observaciones varchar(200),
    constraint pk_seguridad primary key (codsegur),
    constraint fk_seguridad_empleados foreign key (codemple)
        references empleados (codemple) on delete no action on update cascade,
	constraint fk_seguridad_salas foreign key (codsala)
        references salas (codsala) on delete no action on update cascade
    );
    
create table if not exists restauradores
    (codrestaurador int unsigned,
     codemple int unsigned,
     especialidad varchar(60),
    constraint pk_restauradores primary key (codrestaurador),
    constraint fk_restauradores_empleados foreign key (codemple)
        references empleados (codemple) on delete no action on update cascade
    );
    -- EJERCICIO de PRUEBA ALTER
    -- le dropeo a la columna de seguridad la columna de cod sala y su relacion foranea con sala
    
    -- ######################################################################################################
    alter table seguridad
    drop column codsala,
    drop foreign key fk_seguridad_salas;
    -- ######################################################################################################
    create table if not exists turnos(
		codturno int unsigned,
		nomturno varchar(30),
        indicencias text,
        constraint pk_turnos primary key (codturno)
    );
    
    CREATE TABLE IF NOT EXISTS vigilan (
    codsala INT UNSIGNED,
    codsegur INT UNSIGNED,
    codturno INT UNSIGNED,
    fecInicioturno date,
    fecFinturno date,
    CONSTRAINT pk_vigilan PRIMARY KEY (codsala , codsegur , codturno),
    CONSTRAINT fk_vigilan_sala FOREIGN KEY (codsala)
        REFERENCES salas (codsala)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_vigilan_seguridad FOREIGN KEY (codsegur)
        REFERENCES seguridad (codsegur)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_vigilan_turnos FOREIGN KEY (codturno)
        REFERENCES turnos (codturno)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
    
    
drop table if exists restauraciones;
create table if not exists restauraciones
    (codrestaurador int unsigned,
     codobra int unsigned,
     fecinirestauracion date,
     fecfinrestauracion date null,
	 observaciones text,
    constraint pk_restauraciones primary key 
		(codrestaurador,codobra, fecinirestauracion),
    constraint fk_restestilosestilosauraciones_restauradores foreign key (codrestaurador)
        references restauradores (codrestaurador) on delete no action on update cascade,
    constraint fk_restauraciones_obras foreign key (codobra)
        references obras (codobra) on delete no action on update cascade
    
    );
    
    
create table deptos(
numerodepto int,
nomdepto varchar(30),
constraint pk_deptos primary key (numdepto)

);

/*** CAMBIOS EN FOREIGN KEY  ****/

/* A. Queremos que si se elimina un empleado,
      se elimine el
      restaurador/vigilante relacionado
*/

alter table restauradores
drop foreign key fk_restaurador_emple,
add constraint fk_restauradores_empleados
foreign key (codemple) references empleados(codemple)
on delete cascade on update cascade;
-- se usa el cascade on update cascade, de ahi viene que se elimina en cascada...



/* B. No vamos a permitir que se modifique
    el código de estilo
      de una obra, en todo caso se le asignará el valor nulo
*/

alter table obras
-- hay que dropear las clave foranea y volverlas a añadir
 drop foreign key fk_obras_estilos,
 add constraint fk_obras_estilos foreign key (codestilo)
 -- la añadimos de NUEVO
 references estilos(codestilo)
 on delete no action on update SET NULL;
 -- se le incorpora al final de update el set null para que
 -- se le asigne en null
/* C. Vamos a permitir que se eliminen artistas, en este caso
      las obras se quedarán sin autor
*/
alter table obras
drop foreign key fk_obras_artistas,
-- eliminar clave foranea y volvemos añadir la clave foranea 
-- porque no existe un alter constraint
add constraint fk_obras_artistas foreign key (codartista)
references artistas(codartista)
on delete set null on update cascade;
-- en el delete le ponemos set null

/* D. Vamos a permitir que se eliminen artistas, en este caso
      las obras se quedarán sin autor, pero, una vez que demos
    de alta una obra, el código de artista no podrá cambiar
*/

alter table obras
drop foreign key fk_obras_artistas,
add constraint fk_obras_artistas foreign key (codartista)
references artistas (codartista)
on delete set null on update no action;

/********************************/

/*Cambios en las jerarquia de la bbdd */
/*Hacer Jerarquia de la A a la B*/

-- tema 5 inserccion de datos


insert into estilos -- llamos  a la tabla
(codestilo,nomestilo) -- le metio los atributos en el orden
values
(1,'Barroco'),-- por cada value, lo introducion de 1 en 1
(2,'Romanico'),
(3,'Egipcio');



-- Ejercicio 11

start transaction;
insert into empleados
(codemple,nomemle,ape1emple,ape2emple.fecincorp,numsegsoc)
values
(581,'Carnen','Gomez','Perez',curdate(),'0000000001');
insert into seguridad
(codsegur,codemple,codsala)
values
(36,581,1);
commit;

-- Ejercicio 12


update empleados

set jubilacion = curdate()

where codemple =570;


