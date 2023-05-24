-- Examen tema 7
/*
DROP PROCEDURE IF EXISTS p1;
delimiter $$
CREATE PROCEDURE p1()
	BEGIN
		SELECT 
		FROM 
        WHERE
       -- order by
        --  group by
	   --  having
	END $$
delimiter ;
--
call p1();
--
*/

/*
DROP FUNCTION IF EXISTS p2;
delimiter $$
CREATE FUNCTION p2(numAlumn char(12))
RETURNS varchar(20)
DETERMINISTIC
	BEGIN
		DECLARE usuario VARCHAR(20);
        SET usuario = 
        (SELECT concat(lower(left(alumnos.nomalum,1)),''
        ,right(alumnos.nomalum,1),''
        ,substring(alumnos.ape1alum,length(alumnos.ape1alum)/2-1,3),''
        ,dayofmonth(alumnos.fecnacim)
        ,'@micentro.es'
        )
        FROM alumnos
        WHERE alumnos.numexped = numAlumn
        );
	RETURN usuario;
	END $$
delimiter ;
--
SELECT p2(1);
--
*/
/*P1.Queremos saber el codigo de test y la materia a la que pertenece (su nombre) de aquellos tests en los que la diferencia entre la fecha de creacion y publicacion es de 3 meses o mas.
Ten en cuenta que puede que haya tests no publicados aún, estos tambien debes ser tenidos en cuenta*/
 use GBDgestionaTests;
DROP PROCEDURE IF EXISTS p1;
delimiter $$
CREATE PROCEDURE p1()
	BEGIN
		SELECT  tests.codtest,materias.nommateria
		FROM  tests  join materias on tests.codmateria = materias.codmateria
        -- uso de datediff para comparar rangos entre 2 fechas
         WHERE datediff(tests.feccreacion,tests.fecpublic) > 3;
       -- where date_add(feccreacion, interval 3 month) < ifnull(fecpublic,curdate());
       -- order by
        --  group by
	   --  having
	END $$
delimiter ;
--
call p1();
--

/*P2.
Queremos asignar al alumnado una cuenta de email del dominio del centro("micentro.es").El nombre de usuario estara formado por : la primera y la ultima letra de su nombre
, las 3 letras centrales de su primer apellido y su mes de nacimiento.Prepara una funcion que dado el numero de expediente de un alumno nos devuelva su nombre de usuario

*/

drop function if exists p2;
delimiter $$
create function p2
	(numeroExpediente int) 
    -- como se pide en el enuncuado declaramos el num expediente
returns varchar(100) 
-- devuelve un varchar que es el nombre
deterministic
begin
	declare cuenta varchar(100); 
    -- declaramos variable
	select concat(left(nomalum,1), -- primera letra
	              right(nomalum,1), -- ultima letra
	              substring(ape1em,(length(ape1em) div 2),3),
	              month(fecnacim))
	    into cuenta
    from alumnos 
    where numexped = numeroExpediente;
    return concat(cuenta,'@micentro.es');
end $$
delimiter ;

-- 
select p2(1,1);
-- 




/*
P3.
Dado el numero de expediente de un alumno o alumna, obtener el numero de respuestas acertadas en cada test y cada repeticion. Queremos descartar aquellos tests y o repeteciones en los
que el alumno haya contestado menos de 4 preguntas acertadamente
*/

DROP PROCEDURE IF EXISTS p3;
delimiter $$
CREATE PROCEDURE p3(in codigoExpediente int) -- numexpediente dle alumno
	BEGIN
		SELECT respuestas.codtest,numrepeticion, count(*)
		FROM respuestas join preguntas on respuestas.codtest = preguntas.codtest
        WHERE respuestas.numexped = codigoExpediente
				and respuestas.respuesta = preguntas.resvalida
			
       -- order by
         group by respuestas.codtest,respuestas.numrepeticion
	    having count(*) >= 4; -- el alumno haya contestado menos de 4 preguntas acertadamente
	END $$
delimiter ;
--
call p3(1);
--

/*
P4- Obten un listado en el que se muestre para cada materia (su nombre y curso) el numero de tests que han realizado mas de 2 alumnos o alumnas
*/
select materias.nommateria, materias.cursomateria, respuestas.codtest, respuestas.numexped -- , count(distinct respuestas.codtest)
from materias join tests on materias.codmateria = tests.codmateria
	join respuestas on tests. codtest = respuestas.codtest
group by materias.nommateria
-- distict para que no se repita
having count(distinct respuestas.numexped) > 2;

/*
P5- Hemos detectado erroes en el sistema de seleccion de tests a alumnos y se han dado cassos de alumnos que han resuelto tests de materias de las que no estan matriculados. Prepara un procedimiento
que nos de un listado con estos alumnos. Queremos que se muestre su numero de expediente y su nombre completo(en una sola columna)
*/
select numexped, codtest, codmateria
from respuestas join tests on respuestas.codtest = tests.codtest
    join materias on tests.codmateria = materias.codmateria;
-- por tanto

select alumnos.numexped, concat_ws(nomalum,ape1alum, ape2alum)
from alumnos join respuestas on alumnos.numexped = respuestas.numexped
    join tests on respuestas.codtest = tests.codtest
    join materias on tests.codmateria = materias.codmateria
where materias.codmateria not in
    (select codmateria
     from matriculas
     where matriculas.numexped = alumnos.numexped);
/*
P6- Prepara una vista que nos sirva de catalogo de tests y preguntas y en el que no se muestren los nombres reales de las columnas.Los datos que queremos que se muestren son: el codigo y nombre
de la materia, el codigo y la descripcion del test, la respuesta valida(el texto de la respuesta valida), el numero de preguntas que tiene dicho test y si se puede repetir (debe mostrarse el texto
'repetible' o 'no repetible'). (Pista: Flow control function)
*/
drop view if exists catalogoTests;
create view catalogoTests
	(codMateria, NombreMateria, codTest, descripTest, respuestaValida, repetible, numPreguntas)
AS
	select materias.codmateria, materias.nommateria,
		tests.codtest, tests.descrip, 
        if(resvalida='a',resa, if(resvalida ='b',resb,resc)),
        if(repetible > 0,'repetible','no repetible'), count(*)
    from materias join tests on materias.codmateria = tests.codmateria
		join preguntas on tests.codtest = preguntas.codtest
	
	group by materias.codmateria, tests.codtest;

select * from catalogoTests;

/*
P7- Prepara una funcion que dado un alumno y una materia nos devuelva la nota de dicho alumno en dicha materia.La nota se calculara obteniendo la media entre el numero de respuestas correctas
y el numero de pregujntas de cada test de la materia. Solo se utilizaran los tests no repetibles (estos tendran en el campo repetible de la tabla tests el valor 1,indicando asi que solo se puede
hacer una vez) Los alumnos que no hayan hecho alguno de los test no repetibles de la materia, obtendran una puntuacion de cero en dicho text y esta nota entrara en la media


*/
drop function if exists obtenNota;
delimiter $$
create function obtenNota
	(numeroExpediente int, codMateria int)
returns decimal(4,2)
deterministic
begin
	declare nota decimal(4,2);
	select count(*)/count(distinct respuestas.codtest) into nota
    from respuestas join preguntas on respuestas.codtest = preguntas.codtest and respuestas.numpreg = preguntas.numpreg
		join tests on tests.codtest = preguntas.codtest
    where numexped = numeroExpediente and tests.codmateria = codMateria
		and tests.repetible = 0 and respuestas.respuesta = preguntas.resvalida;
 
    return nota;
end $$
delimiter ;
select obtenNota(1,1);