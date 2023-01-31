/*Esquema Relacional Abogados 2023

tipoCasos(pk[idTipoCaso],desTipoCaso)
sujetos(pk[codsujeto,nomsuj,apell1,apell2,,dni,direccionpostal,correo,tef])
clientela[codcliente],codsujeto*,estado_civil('S','C','D','V')]
abogados(pk_codabogado,codsujeto*,numcolegiado)
casos([pk_idTipoCaso*+idcaso],codcliente*,descaso)
AbogadosEnCasos(pk_[idTipoCaso*+idcaso*+codabogado*],fecinicio,numdias)
*/
drop database if exists bbddabogados;
create database if not exists bbddabogados;
use bbddabogados;


create table if not exists tipocasos(
idTipoCaso int,
desTipoCaso text,
constraint pk_tipocasos primary key (idTipoCaso)

);
 -- sujetos(pk[codsujeto,nomsuj,apell1,apell2,,dni,direccionpostal,correo,tef])
CREATE TABLE IF NOT EXISTS sujetos (
    codsujeto INT,
    nomsuj VARCHAR(20),
    apell1 VARCHAR(20),
    apell2 VARCHAR(20),
    dni CHAR(9) UNIQUE,
    dirpostal VARCHAR(40),
    correoElectronico VARCHAR(20),
    tef CHAR(12),
    CONSTRAINT pk_sujetos PRIMARY KEY (codsujeto)
);
-- abogados(pk_codabogado,codsujeto*,numcolegiado)
create table if not exists abogados(
codabogado int,
codsujeto int,
numcolegiado int unique null,
constraint pk_abogados primary key(codabogado),
constraint pk_abogados_sujetos foreign key (codsujeto) references sujetos (codsujeto)
on delete no action on update cascade
);
-- clientela[codcliente],codsujeto*,estado_civil('S','C','D','V')]
create table if not exists clientela(
codcliente int,
codsujeto int,
estado_civil enum('S','C','D','V'),
constraint pk_clientela primary key (codcliente),
constraint fk_clientela_sujetos foreign key(codcliente) references sujetos (codsujeto)
on delete no action on update cascade

);
-- casos([pk_idTipoCaso*+idcaso],codcliente*,descaso)
CREATE TABLE IF NOT EXISTS casos (
    idTipoCaso INT,
    idcaso INT,
    codcliente INT,
    descaso TEXT,
    CONSTRAINT pk_casos PRIMARY KEY (idTipoCaso , idCaso),
    CONSTRAINT fk_casos_tipo FOREIGN KEY (idTipoCaso)
        REFERENCES tipocasos (idTipoCaso)
        ON DELETE NO ACTION ON UPDATE CASCADE,
        CONSTRAINT fk_casos_clientela FOREIGN KEY (codcliente)
        REFERENCES clientela (codcliente)
        ON DELETE NO ACTION ON UPDATE CASCADE
);

-- AbogadosEnCasos(pk_[idTipoCaso*+idcaso*+codabogado*],fecinicio,numdias)
create table if not exists abogadoscasos(
idTipoCaso int,
idcaso int,
codabogado int,
fecinicio date null,
numdias tinyint unsigned,
constraint pk_abogadoscasos primary key (idTipoCaso,idcaso,codabogado)



);


