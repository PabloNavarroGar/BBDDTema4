drop database if exists ejemplosmnp;
create database ejemplosmnp;
use ejemplosmnp;

/*deptos(pk_deptos)
  prof (pk_deptos*+codprof,codciudadano*)
  asignatura(pk_codasig)
  grupos(codgrupo)
  alumno(pk_codalumno,codgrupo*,codciudadano)
  ciudadano(pk_codciudadano)
  impartir(pk_[codprof*,coddepto*,codasig*,codgrupo*])
  */
  
  create table if not  exists ciudadanos(
  
  codciudad int,
  constraint pk_ciudadanos primary key (codciudad)
  
  
  );
  create table if not  exists deptos(
  
  coddepto int,
  constraint pk_deptos primary key (coddepto)
  
  
  );
  
  create table if not exists profesor(
  
   coddepto int,
   codprof int,
   codciudad int,
  constraint pk_profesor primary key (coddepto,codprof),
  constraint fk_profesor_deptos foreign key(coddepto) references deptos(coddepto)
  on delete no action on update cascade, 
  constraint fk_profesor_ciudadanos foreign key(codciudad) references ciudadanos (codciudad)
  on delete no action on update cascade
  );
  
  create table if not  exists grupos(
  
  codgrupo int,
  constraint pk_grupo primary key (codgrupo)
  
  
  );
   CREATE TABLE IF NOT EXISTS asignatura (
    codasig INT,
    CONSTRAINT pk_asignatura PRIMARY KEY (codasig)
);
  
   CREATE TABLE IF NOT EXISTS impartir (
    coddepto INT,
    codprof INT,
    codgrupo INT,
    codasig INT,
    CONSTRAINT pk_impartir PRIMARY KEY (coddepto , codprof , codgrupo , codasig),
    CONSTRAINT fk_impartir_profesore FOREIGN KEY (coddepto , codprof)
        REFERENCES profesor (coddepto , codprof)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_impartir_asigna FOREIGN KEY (codasig)
        REFERENCES asignatura (codasig)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_impartir_grupo FOREIGN KEY (codgrupo)
        REFERENCES grupos (codgrupo)
        ON DELETE NO ACTION ON UPDATE CASCADE
);


create table if not  exists alumno(
  
  codalumno int,
  codgrupo int,
  codciudad int,
  constraint pk_alumno primary key (codalumno),
  constraint fk_alumno_grupo foreign key(codgrupo) references grupos(codgrupo)
  on delete no action on update cascade,
  constraint fk_alumno_ciudadano foreign key(codciudad) references ciudadanos(codciudad)
  on delete no action on update cascade
  
  
  );
  