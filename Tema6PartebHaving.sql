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
