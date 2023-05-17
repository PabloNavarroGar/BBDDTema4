-- Apuntes con los ejercicios resueltos sobre como hacer Expresiones regulares
/*EXPRESIONES REGULARES*/


/*Buscar todas las filas que contengan una cadena específica:
Supongamos que tienes una tabla llamada empleados con una 
columna llamada nombre. Para buscar todas las filas que contengan la
 cadena "Juan", puedes usar la siguiente consulta:*/

SELECT * FROM empleados WHERE nombre REGEXP 'Juan';
-- uso regexp, las comillas forman lo que se quiere buscan 


SELECT * FROM empleados WHERE nombre REGEXP '^J';
-- El sombrero es que me dara todos los nombres que empiezen por J

SELECT * FROM empleados WHERE nombre REGEXP 'n$';
-- EL dolar es para que busque lso nombres que termian por la letra n

SELECT * FROM empleados WHERE nombre REGEXP '[ae]';
-- Los corchetes sirven para que busque todo los nombres que contengan a o e


SELECT * FROM empleados WHERE nombre REGEXP '[^ae]';

-- Con el sombrero adentro, es para que NO busque los nombres que tienen una a o e

/*Ahora con el LIKE */
SELECT * FROM tabla WHERE columna LIKE 'patrón';

SELECT * FROM empleados WHERE nombre LIKE '__o%';

/*En esta consulta, __o% es el patrón que estás buscando. 
Las dos rayas bajas representan los dos primeros caracteres,
 la "o" representa el tercer carácter y el signo porcentaje (%) 
 representa cualquier carácter adicional.*/
 
 SELECT * FROM empleados WHERE nombre LIKE 'J%';
 /*En esta consulta, J% es el patrón que estás buscando. 
 La letra "J" representa el primer carácter y el signo porcentaje (%) representa 
 cualquier cantidad de caracteres adicionales.*/

/*LIKE es insensible a mayúsculas y minúsculas por defecto, lo que significa que 
no distingue entre mayúsculas y minúsculas al buscar valores. Por ejemplo, la siguiente
 consulta buscará todas las filas en la tabla empleados donde la columna nombre contenga 
 "juan" o "Juan" o "JUAN":*/
 
 SELECT * FROM empleados WHERE nombre LIKE '%juan%';
 
 
-- 1.Crea un procedimiento que devuelva el año actual

delimiter $$
create procedure ejercicio1(out anio int)
-- sale el año, por lo cual creamos una variable
no sql
begin
-- Sin hacer un select solo ponemos la variable en la fecha actual
    set anio = year(current_date);

end
$$
delimiter ;

call ejercicio1(@n);
select @n;
-- 2.Crea una función que devuelva el año actual.

delimiter $$
create function ejercicio2()

returns int
begin
    return year(current_date);

end
$$
delimiter ;


select ejercicio2();
-- 3.Crea un procedimiento que muestre las tres primeras letras de una cadena pasada como parámetro en mayúsculas.
delimiter $$
create procedure ejercicio3(in cadena varchar(50))
no sql
begin
    select upper(left(cadena,3));
    -- se usa upper, con el in que le introducimos le ponemos el numer que uqeramos en este caso 3

end
$$
delimiter ;


call GBD_2012_2013_U6_EJER1_3('En un lugar de la Mancha');


-- 4.Crea un procedimiento que devuelva una cadena formada por dos cadenas, pasadas como parámetros, concatenadas y en mayúsculas.
delimiter $$
create procedure ejercicio4(in cad1 varchar(50), 
    in cad2 varchar(50), out cad3 varchar(100) )

begin
    set cad3 =  upper(concat(cad1,cad2));

end
$$
delimiter ;


call ejercicio4('cadena1 +', ' cadena2 ', @result);

select @result;
-- 5.Crea una función que devuelva el valor de la hipotenusa de un triángulo a partir de los valores de sus lados.

-- 6.Crea una función que devuelva 1 ó 0 en función de si un número es o no divisible por otro.
