use GBDgestionaTests;
select*
from matriculas

delimiter $$
drop procedure if exists ejercicio1;
create procedure ejercicio()

begin

select
from
where

-- group by
-- having
-- orderby

end $$

delimiter ;

-- Ejercicio1

delimiter $$
drop procedure if exists ejercicio1;
create procedure ejercicio1()

begin

	select codtest as codigoTest,nommateria as nombreMateria
	from test join materias on test.codmateria = materia.codmateria
	where feccreacion between tests.feccreacion

	and date_add(tests.fecpublic,interval 3 month)
)

-- group by
-- having
-- orderby

end $$

delimiter ;


-- Ejercicio 2


-- ------------------
delimiter $$

drop function if exists ejercicio2;
create function ejercicio2(in numeroExpediente char(12), out Email varchar(60))
	returns varchar(60)
	deterministic
		begin
		return (
			SELECT  concat_ws(nomalum,ape1alum,ape2alum), email
			FROM alumnos
			WHERE numexped = numeroExpediente
);
 end $$
 
 delimiter ;



-- -----------------


-- Ejercicio 3

delimiter $$
drop procedure if exists ejercicio3;
create procedure ejercicio3( in numeroExpediente char(12), out numeroRespuestas int)

begin

select nomalum as nombreAlumno, respuesta,numrepeticion
from respuestas join preguntas on respuestas.codtest = preguntas.codtest
		
where numexped = numeroExpediente
distinct
-- group by
 having (numrepeticion) < 4
-- orderby

end $$

delimiter ;

-- Ejercicio 4

select  nommateria as nombreMateria, cursomateria  as curso, count(codtest)

from tests join materias on tests.codmateria = materia.codmateria
		join matriculas on materias.codmateria = matriculas.codmateria

having (numexped) > 2


-- Ejercicio 5


delimiter $$
drop procedure if exists ejercicio5;
create procedure ejercicio5()

begin

select concat_ws(numexped,nomalum,ape1alum,ape2alum)
from alumnos 
union distinct
select numxped,codmateria
from matriculas




-- group by
-- having
-- orderby

end $$

delimiter ;


-- Ejercicio 6 
-- flow control end if


drop view if exists ejercicio6;
create view  ejercicio6(CodigoMateria,NombreMateria,CodigoTest,DescripcionTest,RespuestaValida,NumeroDePreguntas,Repetible) 
as
select codmateria,nommateria,codtest,descrip,resvalida,textopreg
from materias join tests on materias.codmateria = tests.codmateria 
		join preguntas on tests.codtest  = preguntas.codtest
        
		



