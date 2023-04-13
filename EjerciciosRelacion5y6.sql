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
===================================================
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
    
    SET contrasena = CONCAT(
        LEFT(nombre, 1),
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