-- Empezamos la 2 parte del tema 6, having,union....


-- buscar el numempleados de cada depto,
-- solo interesa los deptos unipersonales
-- buscar el numempleados de cada depto, con un salario mayor de 1500 euros
select numde, count(*) -- (5)
from empleados -- (1)
where salarem > 1500 -- (2)
group by numde -- (3)
having count(*) >=3 -- (4)
order by count(*) desc; -- (6)
-- order by 2 desc; --(6), el 2 es el where
-- funciona el having porque se ha hecho el group by antes,
-- from pillo los datos, where quito las filas individuales que no me interesan
-- hago los grupos por el campo que me interesa (numde,extenTef...)
-- Luego having que es un filtro de grupos 



-- ===========================000

﻿/** ejer 1 */

/*
Hallar el salario medio para cada grupo de empleados con igual comisión y para los que no
la tengan, pero solo nos interesan aquellos grupos de comisión en los que haya más de un
empleado.
*/

select ifnull(comisem,0), avg(salarem)
from empleados
group by ifnull(comisem,0)
having count(*) >1;


/* ejer 2 **/
/*
Para cada extensión telefónica, hallar cuantos empleados la usan y el salario medio de éstos.
Solo nos interesan aquellos grupos en los que hay entre 1 y 3 empleados.
*/
select extelem, count(*), avg(salarem)
from empleados
group by extelem
having count(*) between 1 and 3;
/* ejerc 3 al 6 */

select nomcat
from categorias join articulos 
		on categorias.codcat = articulos.codcat
		join catalogospromos 
			on articulos.refart = catalogospromos.refart
where catalogospromos.codpromo = 1
group by nomcat
having count(*) > 1;


/*
Prepara un procedimiento que, dado un precio, 
obtenga un listado con el nombre de las
categorías en las que el precio medio de sus 
productos supera a dicho precio
*/

select nomcat, avg(precioventa)
from categorias join articulos 
		on categorias.codcat = articulos.codcat
group by nomcat
having avg(precioventa) > 3;

/*
Prepara un procedimiento que muestre el importe 
total de las ventas por meses de un año
dado
*/

select sum(precioventa)
from ventas join detalleVenta 
	on ventas.codventa = detalleVenta.codventa
where year(fecventa) = parametro -- year(curdate)
group by month(fecventa)


/* ejer 6 añadimos: */
having sum(precioventa) > (select avg(precioventa)
							from ventas join detalleVenta 
								on ventas.codventa = detalleVenta.codventa
									where year(fecventa) = parametro -- year(curdate)
                                    
	-- Para añadir dias intervalos
      date_add(fecha, interval numeroIntinstancias day)                              