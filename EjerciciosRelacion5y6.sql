-- Relacion 5

-- Ejercicio 1

DELIMITER $$
CREATE PROCEDURE obtenerProductoLetra(IN letra VARCHAR(1))
BEGIN
  SELECT *
  FROM productos WHERE nompro LIKE CONCAT(letter, '%');
END$$
DELIMITER ;

CALL obtenerProductoLetra('A');

-- Ejercicio 2

DELIMITER $$
CREATE PROCEDURE contrasena (IN idPedida INT, OUT password VARCHAR(50))
BEGIN
    SELECT CONCAT(REVERSE(telefono_empresa)) INTO password FROM proveedores WHERE id = idPedida ;
END$$
DELIMITER ;


SET @password = '';
CALL contrasena(1, @password);
SELECT @password;


-- Ejercicio 3

DELIMITER $$
CREATE PROCEDURE mesEntrega
(IN id INT, OUT mesSalida VARCHAR(20))
BEGIN
    SELECT MONTHNAME(fecha_de_entrega) INTO mesSalida
    FROM pedidos p
    INNER JOIN productos  ON producto_id = id
    WHERE fecha_entrega IS NULL
    AND categoria_id = id;
END$$
DELIMITER ;

-- ejercicio 4

SELECT LEFT(categoria.nombre, 3) AS categoria, productos.nombre AS producto
FROM productos 
INNER JOIN categorias ON categoria_id = id
ORDER BY c.nombre ASC;


-- ejercicio 5

SELECT nombre, precio, ROUND(POW(precio, 2), 2) AS precio_cuadrado, ROUND(POW(precio, 3), 2) AS precio_cubo
FROM productos;
-- ejercicio 6

SELECT DATE_FORMAT(CURDATE(), '%Y-%m-%d');
-- ejercicio 7

SELECT numero_pedido, fecha_entrega, DATEDIFF(CURDATE(), fecha_entrega) AS dias_transcurridos
FROM pedidos
WHERE MONTH(fecha_entrega) = MONTH(CURDATE()) AND estado = 'Entregado';

-- ejercicio 8


UPDATE productos
SET nombre = REPLACE(nombre, 'tarta', 'pastel')
WHERE nombre LIKE '%tarta%';

-- ejercicio 9 
SELECT poblacion
FROM direcciones
WHERE SUBSTR(codigo_postal, 3) = poblacion;
-- ejercicio 10

SELECT UPPER(categoria) AS categoria, COUNT(*) AS num_productos
FROM productos
GROUP BY categoria;

-- ejercicio 11

SELECT categoria, nombre_producto
FROM productos
ORDER BY categoria, LENGTH(nombre_producto);
-- ejercicio 12
SELECT TRIM(nombre_producto) AS nombre_producto
FROM productos;
-- ejercicio 13

SELECT ROUND(precio * 0.1, 2) AS diez_por_ciento
FROM productos;
-- 14

SELECT CONCAT(codigo_producto, codigo_categoria, codigo_categoria) AS codigo_producto_categoria, nombre_producto
FROM productos;


-- Relacion 6
-- ejercicio 1
DELIMITER //

CREATE PROCEDURE obtener_contrasena_empleado (IN codigo INT)
BEGIN
    DECLARE nombre VARCHAR(50);
    DECLARE apellido1 VARCHAR(50);
    DECLARE apellido2 VARCHAR(50);
    DECLARE dni CHAR(8);
    DECLARE contrasena VARCHAR(20);
    
    SELECT nombre_empleado, apellido1_empleado, apellido2_empleado, dni_empleado INTO nombre, apellido1, apellido2, dni
    FROM empleados
    WHERE codigo_empleado = codigo;
    
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