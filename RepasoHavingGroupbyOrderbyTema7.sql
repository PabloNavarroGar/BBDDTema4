/*Repaso Having*/

/*Hallar el salario medio para cada grupo de empleados con igual comisión y para los que no la tengan, 
pero solo nos interesan aquellos grupos de comisión en los que haya más de un empleado.*/

use empresaclase;

select *
from empleados;

-- ifnull si tiene comision saldra, si no pilla el 0
SELECT 
    AVG(empleados.salarem) as SalarioMedio, IFNULL(comisem, 0) as Comision
FROM
    empleados
GROUP BY IFNULL(comisem, 0)
HAVING COUNT(*) > 1;

/*Para cada extensión telefónica, hallar cuantos empleados la usan y el salario medio de éstos
. Solo nos interesan aquellos grupos en los que hay entre 1 y 3 empleados.*/

select  empleados.extelem, count(*), avg(empleados.salarem)
from empleados
group by extelem -- agrupados por su extenseion telefonica
having count(*) between 1 and 3;

use ventapromoscompleta;

/*Prepara un procedimiento que, dado un código de promoción obtenga un listado con el 
nombre de las categorías que tienen al menos dos productos incluidos en dicha promoción.*/

DROP PROCEDURE IF EXISTS p1;
delimiter $$
CREATE PROCEDURE p1
	(in codigoPromo int)
	BEGIN
		SELECT categorias.nomcat 
		FROM categorias join articulos on categorias.codcat = articulos.codcat
			join catalogospromos on articulos.refart = catalogospromos.refart
		
        where catalogospromos.codpromo= codigoPromo
   
          group by  nomcat
	     having count(*)> 1;
	END $$
delimiter ;
--
call p1(1);
--

/*Prepara un procedimiento que, dado un precio, obtenga un listado con el
 nombre de las categorías en las que el precio  medio de sus productos supera a
 dicho precio.
*/

DROP PROCEDURE IF EXISTS p1;
delimiter $$
CREATE PROCEDURE p1
	(in precio decimal(4,2))
	BEGIN
		SELECT categorias.nomcat , avg(precioventa)
		FROM categorias join articulos on categorias.codcat = articulos.codcat
			
		
        where catalogospromos.codpromo= precio
   
          group by  nomcat
	     having avg(precioventa) > 3;
	END $$
delimiter ;
--
call p1(1);
--


/*Prepara un procedimiento que muestre el importe total de las ventas por meses de un año dado.*/

DROP PROCEDURE IF EXISTS p5;
delimiter $$
CREATE PROCEDURE p5
	(in parametro date)
	BEGIN
    
		SELECT sum(precioventa)
		FROM  ventas join detalleventa on ventas.codventa = detalleVenta.codventa			
		
        where year(fecventa) = parametro -- year(curdate)
   
          group by  month(fecventa);
	   
	END $$
delimiter ;
--
call p5();
--

/*
Como el ejercicio anterior, pero ahora solo nos interesa mostrar aquellos meses en los que se ha s
uperado a la media del año.*/

having sum(precio venta) >select avg(precio venta)

from ventas join detalleVenta on ventas.codventa = detalleVenta.codventa
where year(fecventa) = parametro -- year (curdate)




/*Expresiones regulares 6-8*/
use empresaclase;

/* Sabiendo que en la extensión de teléfono que utilizan los empleados, 
el primer dígito corresponde con el edificio, el segundo con la planta y el tercero con la puerta. 
Busca aquellos empleados que trabajan en la misma planta 
(aunque sea en edificios diferentes) que el empleado 120.*/


select *
from empleados
where empleados.extelem rlike concat('^.',(select substring(extelem,2,1)	

from empleados
where numem = 120));


/*
Sabiendo que los dos primeros dígitos del código postal se corresponden con la provincia y 
los 3 siguientes a la población dentro de esa provincia. 
Busca los clientes (todos sus datos) de las 9 primeras poblaciones de la provincia de 
Málaga (29001 a 29009).
*/
use gbdturrural2015;
select *
from clientes
where codpostalcli rlike '^2900[1-9]';
-- where codpostalcli rlike '^290{2}[1-9]$';
-- where codpostalcli rlike '^290{2}[^0]';

/*Sabiendo que los dos primeros dígitos del código postal se corresponden 
con la provincia y los 3 siguientes a la población dentro de esa provincia. 
Busca los clientes (todos sus datos) de las 20 primeras poblaciones de la provincia 
de Málaga (29001 a 29020).*/
select *
from clientes
-- where codpostalcli rlike '^290(10|[[01]1-9]|20)';
where codpostalcli rlike '^290([12]0|[01][1-9])';
-- where codpostalcli rlike '^290[012][01]'; OJO ==> esta expresión daría por válida la cadena 29021


/*Queremos encontrar clientes con direcciones de correo válidas, 
para ello queremos buscar aquellos clientes cuya dirección de email 
contiene una “@”, y termina en un símbolo punto (.) seguido de “com”, “es”, “eu” o “net”.
*/
-- OJO ==> USAMOS EL CARÁCTER DE ESCAPE PARA QUE NO INTERPRETE EL PUNTO COMO CUALQUIER CARÁCTER SINO COMO UN PUNTO
-- CARACTER DE ESCAPE ==> \\

select *
from clientes

where correoelectronico rlike '@[a-z]*\\.(com|net|es|eu|it)$';

/*
Queremos encontrar ahora aquellos clientes que no cumplan con la expresión regular anterior.
*/
-- OJO ==> USAMOS EL CARÁCTER DE ESCAPE PARA QUE NO INTERPRETE EL PUNTO COMO CUALQUIER CARÁCTER SINO COMO UN PUNTO
-- CARACTER DE ESCAPE ==> \\
select *
from clientes
where not correoelectronico rlike '@[a-z]*\\.(com|net|es|eu)$';
