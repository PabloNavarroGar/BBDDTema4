-- 11Prepara un procedimiento almacenado que ejecute la consulta del apartado 1 y otro que ejecute la del apartado 5.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio11;
create procedure if exists ejercicio11
begin 
 select *
	from empleados;
end $$

delimiter ;

call ejercicio11;

delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio11b;
create procedure if exists ejercicio11b
begin 
 select concat(nomem,'  ',ape1em,'   '  ,ifnull(ape2em, '') as sinComision
from empleados
-- ifnull y entre parentesis para poner si algun empleado o cosa no tiene un apellido2
where comisem is null;
-- where comisem = 0;
end $$

delimiter ;

call ejercicio11b;

-- 12Prepara un procedimiento almacenado que ejecute la consulta del apartado 2 de forma que nos sirva para averiguar la extensión del empleado que deseemos en cada caso.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio12;
create procedure if exists ejercicio12
(nombre varchar (60),
 ape1 varchar(60),
 ape2 varchar(60)
 )
begin 
 select empleados.extelem as telefono

from empleados
	where nomem = nombre and ape1em = ape1 and ape2em = ape2 ;
end $$

delimiter ;

call ejercicio12 ('Juan','Lopez',null);
-- 13Prepara un procedimiento almacenado que ejecute la consulta del apartado 3 y otro para la del apartado 4 de forma que nos sirva para averiguar el nombre de aquellos que tengan el número de hijos que deseemos en cada caso.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio13;
create procedure if exists ejercicio13
(int numhijosmin)
begin 
		select nomem,ape1em,ape2em
		from empleados

		where numhiem > 1;
end $$

delimiter ;

call ejercicio13;

select nomem,ape1em,ape2em
from empleados

where numhiem > 1;
-- 14Prepara un procedimiento almacenado que, dado el nombre de un centro de trabajo, nos devuelva su dirección.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio14;
create procedure if exists ejercicio14
( in centro varchar(60),
in direccion varchar(60))
begin 
 select dirce into direccion
	from centros
    where lower(trim(nomce)) = lower(trim(centro));
end $$

delimiter ;

call ejercicio14;
-- 15Prepara un procedimiento almacenado que ejecute la consulta del apartado 7 de forma que nos sirva para averiguar, dada una cantidad, el nombre de los departamentos que tienen un presupuesto superior a dicha cantidad.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio15;
create procedure if exists ejercicio15
( in cantidad decimal(10,2))
begin 
 select nomde as 'Nombre departamentos', presude as 'Presupuesto'  
from departamentos
where presude > cantidad;
end $$

delimiter ;

call ejercicio15;
-- 16Prepara un procedimiento almacenado que ejecute la consulta del apartado 8 de forma que nos sirva para averiguar, dada una cantidad, el nombre de los departamentos que tienen un presupuesto igual o superior a dicha cantidad.
delimiter $$
use EmpresaClase;
drop procedure if exists ejercicio16;
create procedure if exists ejercicio16
( in cantidad decimal(10,2))
begin 
 select nomde as 'Nombre departamentos', presude as 'Presupuesto'  
from departamentos
where presude > 6000;
end $$

delimiter ;

call ejercicio16;
-- 17Prepara un procedimiento almacenado que ejecute la consulta del apartado 9 de forma que nos sirva para averiguar, dada una fecha, el nombre completo y en una sola columna de los empleados que llevan trabajando con nosotros desde esa fecha.
drop procedure if exists ejercicio17;
delimiter $$
create procedure ejercicio17(fecha1 date, fecha2 date)
begin

-- siempre el concat entre los parentesis es como queremos que salgan las columnas
-- la coma con comillas son espacios blancos como el java " "
select CONCAT(nomem, ' ',
			  ape1em, ' ',
			 ifnull(ape2em,'')
		) as nombre, fecinem
from empleados

 where fecinem between fecha1 and fecha2
order by fecinem ;
end $$
delimiter ;
call ejercicio17('2023-03-13', '2019-01-01');
-- 18Prepara un procedimiento almacenado que ejecute la consulta del apartado 10 de forma que nos sirva para averiguar, dadas dos fechas, el nombre completo y en una sola columna de los empleados que comenzaron a trabajar con nosotros en el periodo de tiempo comprendido entre esas dos fechas.

-- 19Prepara un procedimiento almacenado que ejecute la consulta del apartado 10 de forma que nos sirva para averiguar, dadas dos fechas, el nombre completo y en una sola columna de los empleados que comenzaron a trabajar con nosotros fuera del periodo de tiempo comprendido entre esas dos fechas.
drop procedure if exists ejercicio19;
delimiter $$
create procedure ejercicio19(fecha1 date, fecha2 date)
begin

-- siempre el concat entre los parentesis es como queremos que salgan las columnas
-- la coma con comillas son espacios blancos como el java " "
select CONCAT(nomem, ' ',
			  ape1em, ' ',
			 ifnull(ape2em,'')
		) as nombre, fecinem
from empleados
-- not between = con nosotros fuera= not between del periodo de tiempo(fecha1 y fecha 2)
 where fecinem not between fecha1 and fecha2
order by fecinem ;
end $$
delimiter ;
call ejercicio19('2023-03-13', '2019-01-01');


drop procedure if exists llamarEmpleado;
delimiter $$
create procedure llamarEmpleado(in nombre varchar(20),
							 in apellido1 varchar(20))
begin
	
   
	select empleados.extelem 
	from empleados
	where nomem = nombre and ape1em = apellido1;
end $$
delimiter ;
call llamarEmpleado('Dorinda', 'Lara');