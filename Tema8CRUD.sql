-- 2 tablas CRUD en el proyecto, sin
-- 4/5/2022
-- Expresiones regulares



-- Cursores 8/05/2023

-- dado una consulta con el resultado de la busqueda, trabajar con cada linea
-- Solo son de lecturas

-- Como las condiciones de JAva if(condicion)

/*




*/
-- Declarar Cursor
use empresaclase;
select noem,email
from empleados; 

declare nombreCursor cursor for sentenciaSelect;

-- abrir el curso para trabajarlo

open nombreCursor

-- Usamos fect para pasar a la siguiente fila

fetch nombreCursor into variable1,variable2,...;


-- cerramos el cursor
	close nom_cursor
    
    
-- Excepciones
-- Continuo o exit

-- ejempleo

-- declarar variavles

-- Para sacar las cosas ordenadas en los cursores, 
-- poner siempre un order by  
declare numeroem int;
declare fincursor


-- Triggers y eventos

select * from empresaclase.centros;

-- Podemos insertar datos directamente desde el select, 
-- se crea un centro 
-- Tiene 2 valores NEW y OLD, donde en uno guarda lo nuevo y en otro lo anterior
-- Cuando se hace el insert se graba en el new
-- En el cuaderno tengo apuntado como se hace

-- crear la tabla de ventas y detalle ventas
-- 1º.En la bbdd de bdalmacen , en ventas, comprobar si hay stock suficiente
-- Quiero modificar el Stock
-- 2º.Cuando queden 5 unidades de stock quiero hacer pedido automatico de 5 unidades

    