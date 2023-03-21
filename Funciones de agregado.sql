-- Funciones de agregado
use empresaclase;
-- apuntes pagina 11 GROUP BY
-- Cuantos empleado(celdoas
-- count cuenta celdas
select count(*), count(numem), count(distinct numde)
from empleados;

-- contar los salarios, SUMAR

select sum(salarem)
from empleados;

-- cual es el salario maximo
select max(salarem)
from empleados;

-- cual es el salario minimo
select min(salarem)
from empleados;

-- salario medio

SELECT 
    AVG(salarem)
FROM
    empleados;

-- todo en uno

select count(*) as numEmpleados, sum(salarem) as TotalSalar
 , max(salarem) as salaMax ,min(salarem) as salaMin , avg(salarem) as salaMedio
from empleados;

-- rutina que devuelva el numero de extensiones telefonicas de un departamento

delimiter $$
drop procedure if exists rutina1 $$
create procedure rutina1()
begin
	select count(empleados.extelem)
    from empleados join departamentos on empleados.numde = departamentos.numde;
  
    

end $$

delimiter ;

call rutina1();


delimiter $$
 drop function if exists numExtensiones;
create function numExtensiones
(numDepto int)
returns int
deterministic
begin
	return (select count(distinct extelem) 
			from empleados
            where numde= numdepto);

end $$

delimiter ;

call numExtensiones();