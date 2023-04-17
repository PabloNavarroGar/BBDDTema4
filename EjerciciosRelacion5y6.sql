-- Relacion 5

-- Ejercicio 1

DELIMITER $$

CREATE PROCEDURE obtenerProductoLetra(IN letra VARCHAR(1))
BEGIN
  SELECT *
  FROM productos 
  WHERE descripcion LIKE CONCAT(letter, '%');
END$$
DELIMITER ;

CALL obtenerProductoLetra('A');

-- ---------------

delimiter $$

drop function if exists ejercicio1;
create function ejercicio1(in letra varchar(1))
	returns varchar(1)
	deterministic
		begin
		return (
			SELECT *
			FROM productos 
			WHERE descripcion LIKE CONCAT(letter, '%')
);
 end $$
 
 delimiter ;
-- Ejercicio 2

DELIMITER $$
CREATE PROCEDURE contrasena (IN idPedida INT, OUT password VARCHAR(50))
BEGIN
    SELECT CONCAT(reverse (proveedores.telefono)) INTO password 
    FROM proveedores WHERE id = idPedida ;
END$$
DELIMITER ;


SET @password = '';
CALL contrasena(1, @password);
SELECT @password;


-- Ejercicio 3
drop procedure if exists mesEntrega;
DELIMITER $$
CREATE PROCEDURE mesEntrega
(IN id INT, OUT mesSalida VARCHAR(20))
BEGIN
    SELECT MONTHNAME(fecentrega) into mesSalida
    FROM pedidos JOIN productos  ON pedidos.codproducto = productos.codproducto
    WHERE fecentrega is null and categorias.codcategoria = id;
END$$
DELIMITER ;

call mesEntrega(1,@mesSalida);
-- ejercicio 4

SELECT LEFT(categorias.Nomcategoria, 3) as categoria, productos.descripcion as producto
FROM productos  JOIN categorias ON productos.codcategoria = categorias.codcategoria
ORDER BY c.nombre ASC;


-- ejercicio 5
-- Sacar el cuadrado y el cubo de algo
SELECT nombre, productos.preciounidad, ROUND(POW(preciounidad, 2), 2) as precio_al_cuadrado, ROUND(POW(preciounidad, 3), 2) as precio_al_cubo
FROM productos;
-- ejercicio 6
-- Obtener fecha actual
SELECT DATE_FORMAT(CURDATE(), '%Y-%m-%d');
-- ejercicio 7

SELECT codpedido, fecentrega, DATEDIFF(CURDATE(), fecentrega) AS dias_transcurridos
FROM pedidos
WHERE MONTH(fecentrega) = MONTH(CURDATE()); 
-- AND estado = 'Entregado';

-- ejercicio 8


UPDATE productos
SET descripcion = REPLACE(descripcion, 'tarta', 'pastel')
WHERE descripcion LIKE '%tarta%';

-- ejercicio 9 
SELECT ciudad
FROM proveedores
WHERE SUBSTR(codpostal, 3) = ciudad;
-- ejercicio 10
-- Obtener en mayusculas los productos de una categoria
SELECT UPPER(categorias) AS categoria, COUNT(*) as codcategoria
FROM productos
GROUP BY categoria;

-- ejercicio 11

SELECT categorias, descripcion
FROM productos
ORDER BY categorias, LENGTH(descripcion);
-- ejercicio 12
SELECT TRIM(descripcion) AS nombre_del_producto
FROM productos;
-- ejercicio 13

SELECT ROUND(preciounidad * 0.1, 2) as diez_por_ciento
FROM productos;
-- 14

SELECT CONCAT(codigo_producto, codigo_categoria, codigo_categoria) AS codigo_producto_categoria, nombre_producto
FROM productos;

/*
========================================================
========================================================
*/
-- Relacion 6
-- ejercicio 1
DELIMITER //

CREATE PROCEDURE obtener_contrasena_empleado (IN codigo INT)
BEGIN
    DECLARE nombre VARCHAR(50);
    DECLARE apellido1 VARCHAR(50);
    DECLARE apellido2 VARCHAR(50);
    DECLARE dni CHAR(9);
    DECLARE contrasena VARCHAR(20);
    
    SELECT empleados.noem, empleados.ape1em, empleados.ape2em, empleados.dniem INTO nombre, apellido1, apellido2, dni
    FROM empleados
    WHERE empleados.passem = codigo;
    
    SET contraa = CONCAT(
        LEFT(nombre, 1sen),
        LEFT(apellido1, 3),
        IFNULL(LEFT(apellido2, 3), 'LMN'),
        RIGHT(dni, 1)
    );
    
    SELECT contrasena;
END //

DELIMITER ;

-- ejercicio 2

SELECT 
    CONCAT(nombre_proveedor, ' ', apellido1_proveedor, ' ', IFNULL(apellido2_proveedor,'')) AS nombre_completo,
    nombre_proveedor,
    apellido1_proveedor,
    IFNULL(apellido2_proveedor,'') AS apellido2
FROM proveedores;

-- ejercicio 3

DELIMITER //
CREATE PROCEDURE incrementar_salario()
BEGIN
    UPDATE empleados SET salario = salario * 1.05;
    SELECT ROUND(salario, 2) AS salario_incrementado FROM empleados;
END //
DELIMITER ;

CALL incrementar_salario();

-- ejercicio 4 duda

-- ejercicio 5

DELIMITER //
CREATE PROCEDURE obtener_edad_empleado(IN empleado_id INT, OUT edad INT)
BEGIN
    SELECT fecha_nacimiento INTO @fecha_nacimiento FROM empleados WHERE id = empleado_id;
    SET edad = TIMESTAMPDIFF(YEAR, @fecha_nacimiento, NOW());
END //
DELIMITER ;


/*Explicacion subselects*/
-- siempre se ponen entre parentesis , para usarlos
set @depto = (select numde 
			from empleados
			where numem= 120);
            
            
 insert into empleados
 
 (nuem,numde,noem,ape1em,.....)
 
 value
 (199,@depto,'pepe','del camño',......)
 
 
 -- hacer relacion 4, ejercicios 26 y 27, estan en rojo, uso de CLONES de las tablas
 -- unos en verdes que es para adelantar 
 
 -- busca los empleados que tenga el salario ams alto
 
 select numem, nomem, salarem
 from empleados
 -- Se puede hacer pero hay que usar un operador d elos cuantificadores
 -- SOME | AN |ALL | IN , se despues del = y antes de hacer el subselect
 where salarem =  (select salarem
					from empleados
					where numde = 120);
                    
                    -- empleados uqe ganen diferente a los del depto 110
                    
                    
                    
 -- Ejercicio 26 Relacion 4
 -- Borrar de la tabla EMPLEADOS a los empleados cuyo salario (sin incluir la comisión) supere al salario medio de los empleados de su departamento.
-- Se usa un delete, un abg para el salario medio y de uso para la subconsulta el sombolo mayor
 delete from empleados
 where salarem > (select avg(salarem)
				from empleados as e
                where numde = any (select numde
								from empleados as  e
                                where numem= e.nomem));
/*
La subconsulta más interna selecciona el numde del empleado  en la consulta principal.
La subconsulta del medio selecciona el salario(salarem) promedio de los empleados del mismo departamento.
La consulta principal(delete from empleados) borra los empleados cuyo salario supere al salario medio calculado en la subconsulta del medio.*/

/*

Disminuir en la tabla EMPLEADOS un 5% el salario de los empleados 
que superan el 50% del salario máximo de su departamento.
*/

update empleados e 

set salarem = salarem * 0.95 -- le quito el 5 porcierto

where salarem > (

	select max(salarem)* 0.5
    from empleados 
    where numde = e.numde );
    
    
    -- Hallar cuántos departamentos hay y el presupuesto anual medio de ellos.
select count(*) as cantidadDepartametos, avg (presude) as presupuestoAnual
from departamentos;

-- Hallar el salario medio de los empleados cuyo 
-- salario no supera en más de un 20% al salario mínimo de
--  los empleados que tienen algún hijo y su salario medio por hijo es mayor que 100.000 u.m.

select avg(salarem) 
from empleados
where  numhiem > 1 and avg(salarem) > 100000
group by min(salarem) * 0.2;

-- Hallar el salario medio para cada grupo de empleados con igual
--  comisión y para los que no la tengan.

select ifnull(comisem, '   ') as comision, avg(salarem)
from empleados
group by comisem;

