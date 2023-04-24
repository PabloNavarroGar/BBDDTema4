use empresaclase;

-- 1.*Obtener por orden alfabético el nombre y los sueldos de los empleados con más de tres hijos.
drop procedure if exists ejercicio1;
delimiter $$

create procedure ejercicio1()
begin
	
	select  concat_ws(' ', ape1em, ape2em, nomem) as nombre, empleados.salarem

	from empleados
	where numhiem >3
	order by nombre;--  se ordena por el nombre
	
end $$
delimiter ;

call ejercicio1();

-- 2-*Obtener la comisión, el departamento y el nombre de los empleados cuyo salario es inferior a 190.000 u.m., clasificados por departamentos en orden creciente y por comisión en orden decreciente dentro de cada departamento.
drop procedure if exists ejercicio2;
delimiter $$

create procedure ejercicio2()
begin
	
	select   departamentos.nomde, empleados.comisem,
		empleados.salarem

	from empleados join departamentos on departamentos.numde = empleados.numde
	where empleados.salarem < 190000
	order by  empleados.nomde asc, empleados.comisem desc;--  se ordena por el nombre
	
end $$
delimiter ;

call ejercicio2();






-- *Hallar por orden alfabético los nombres de los deptos cuyo director lo es en funciones y no en propiedad.*/
drop procedure if exists ejercicio3;
delimiter $$

create procedure ejercicio3()
begin
	
	select  departamentos.nomde

	from departamentos join dirigir on departamentos.numde = dirigir.numdepto
	where ifnull(dirigir.fecfindir,curdate()) >=curdate() and dirigir.tipodir ='F'
	order by  departamentos.nomde asc;
	
end $$
delimiter ;

call ejercicio3();























-- =============================
-- SIMULACRO TEMA /
-- ===============================
use ventapromoscompleta;
-- 1.(1,25 ptos.) Queremos saber el importe de las ventas de artículos a cada uno de nuestros clientes (muestra el nombre).
-- Queremos que cada cliente se muestre una sola vez y que aquellos a los que hayamos vendido más se muestren primero.

select clientes.codcli, nomcli, sum(precioventa)
from clientes join ventas
		on clientes.codcli = ventas.codcli
    join detalleVenta
		on ventas.codventa = detalleVenta.codventa
group by clientes.codcli
order by sum(precioventa) desc;


-- 2.(1,25 ptos.) Muestra un listado de todos los artículos vendidos, queremos mostrar la descripción del artículo y entre paréntesis
--  la descripción de la categoría a la que pertenecen y la fecha de la venta con el formato “march - 2016, 1 (tuesday)”. Haz que se muestren todos los artículos de la misma categoría juntos.
	select desart, concat(nomart,' (',descat,')'), date_format(fecventa, '%M - %Y, %d (%W)')
    -- para darle un formate a una fecha usamos date format y llamo a la fecha y con los porcentajes poenmos los dias
from articulos join categorias
		on articulos.codcat = categorias.codcat
    join detalleVenta
		on articulos.refart = detalleVenta.refart
	join ventas
		on ventas.codventa = detalleVenta.codventa
order by categorias.descat;


 -- 3.(1 pto.) Obtener el precio medio de los artículos de cada promoción (muestra la descripción de la promoción) del año 2012. (Se usará en el ejercicio 7).
	
    SELECT 
    despromo, AVG(precioartpromo)
FROM
    articulos
        JOIN
    catalogospromos ON articulos.refart = catalogospromos.refart
        JOIN
    promociones ON catalogospromos.codpromo = promociones.codpromo
WHERE
    YEAR(fecinipromo) = 2012
GROUP BY promociones.codpromo;
 
 -- 4.(1,25 ptos.) Prepara una rutina que muestre un listado de artículos, su referencia, su nombre y la categoría que no hayan estado en ninguna promoción que haya empezado en este año.
 delimiter $$

/** EJERCICIO 4 **/
drop procedure if exists exam_2019_5_2_4 $$
create procedure exam_2019_5_2_4()
begin
	-- call exam_2019_5_2_4()
    -- NOTA: para probar, da de alta una promoción de este año con dos artículos, por ejemplo el 'C1_01' y el 'C2_01'
	select refart, nomart, codcat
    from articulos
    where refart not in (select refart
						 from catalogospromos join promociones
							on catalogospromos.codpromo = promociones.codpromo
						 where year(fecinipromo) = year(curdate())
                         );
end $$
 
-- 5.(1,25 ptos.) Queremos asignar una contraseña a nuestros clientes para la APP de la cadena, prepara una rutuina que dado un dni y un teléfono,
--  nos devueltva la contraseña inicial que estará formada por: la inicial del nombre, los números
 -- correspondientes a las posiciones 3ª, 4ª Y 5ª del dni y el número de caracteres de su nombre completo. Asegúrate que el nombre no lleva espacios a izquierda ni derecha.
 delimiter $$
drop function if exists exam_2019_5_2_5 $$
create function exam_2019_5_2_5
	(correo varchar(30),
	telefono char(9))
returns char(7)
begin
	-- select exam_2019_5_2_5('EliseaPabonAngulo@dodgit.com', '984 208 4')
	return (
			select concat(left(trim(nomcli),1), 
						  substring(email, 3,1),
						  substring(email, 4,1),
						  substring(email, 5,1), 
						  length(concat(trim(nomcli), trim(ape1cli), ifnull(trim(ape2cli),'')))
						)
			from clientes
			where email = correo and tlfcli = telefono
        );
        
end $$
delimiter ;
 
 
 
 -- 6.(1,25 ptos.) Sabemos que de nuestros vendedores almacenamos en nomvende su nombre y su primer apellido y su segundo apellido, no hay 
SELECT 
    nomvende,
    CONCAT(SUBSTRING(nomvende, 1, 1),
            SUBSTRING(nomvende,
                LOCATE(' ', nomvende) + 1,
                3),
            SUBSTRING(nomvende,
                LOCATE(' ', nomvende, LOCATE(' ', nomvende) + 1) + 1,
                3))
FROM
    vendedores;

 
 
 
-- 7(1,25 pto). Queremos saber las promociones que comiencen en el mes actual y para las que la media de los precios de los artículos de dichas promociones 
-- coincidan con alguna de las de un año determinado (utiliza el ejercicio P3. Tendrás que hacer alguna modificación).


delimiter $$
drop procedure if exists exam_2019_5_2_7 $$
create procedure exam_2019_5_2_7
	(in anyo int)
begin    
	-- call exam_2019_5_2_7(2012);
	select despromo, avg(precioartpromo)
	from catalogospromos join promociones
		on catalogospromos.codpromo = promociones.codpromo
	-- NOTA: quitar where para probar, ya que no hay datos de este año
	where year(fecinipromo)=year(curdate()) and month(fecinipromo)=month(curdate())
	group by promociones.codpromo
	having avg(precioartpromo) in (select avg(precioartpromo)
								   from catalogospromos join promociones
										on catalogospromos.codpromo = promociones.codpromo
								   where year(fecinipromo)=anyo
								   group by promociones.codpromo
								   );
end $$
delimiter ;



-- 8(1,5 ptos.) Obtén un listado de artículos (referencia y nombre) cuyo precio venta sin promocionar sea el mismo que el que han tenido en alguna promoción.


SELECT 
    refart, nomart
FROM
    articulos
WHERE
    precioventa = ANY (SELECT 
            precioartpromo
        FROM
            catalogospromos
        WHERE
            catalogospromos.refart = articulos.refart);





-- ------------------


-- PARA PROBAR, VAMOS A USAR DOS USUARIOS: EL HABITUAL Y OTRO AL QUE LLAMAREMOS PRUEBA.
-- EN LA BD, TENDREMOS A UN EMPLEADO CON userem = usuario con el que accedmos habitualmente a mysql
-- (en mi caso 'eva', lo voy a asignar a la empleada 890, que está en el depto 121
-- EN LA BD, TENDREMOS A OTRO EMPLEADO CON userem = prueba
-- (lo voy a asignar a la empleada 180, que está en el depto 110
-- El usuario eva ya existe, solo tenemos que crear el usuario prueba y grabar en userem de los empleados mencionados el usuario adecuado
drop user 'prueba'@'192.168.56.1';
create user 'prueba'@'192.168.56.1' identified by '1234';

grant all on *.* to 'prueba'@'192.168.56.1'; 
-- vemaos la función user() que devuelve el usuario conectado:
select user(),
	locate('@', user()),
	left(user(),locate('@', user())),
    locate('@', user())-1;
select left(user(),locate('@', user())-1);
select version();
-- POR TANTO:
CREATE 
	SQL SECURITY INVOKER -- SOLO NECESARIO EN VERSIONES ANTERIORES A MYSQL 8.0.19
	VIEW LISTIN
	(Nombre, extension)
AS
	select concat (ape1em, ifnull(concat(' ', ape2em),''), ', ', nomem), extelem
    from empleados
    where numde = (select numde
				   from empleados
                   where userem = left(user(),locate('@',user())-1 )
				  );

-- cuando ejecutemos la siguiente sentencia conectados con el usuario 'eva', veremos los empleados del depto. 121
-- cuando ejecutemos la siguiente sentencia conectados con el usuario 'prueba', veremos los empleados del depto. 110
select *
from LISTIN;
                  
                  
-- ----------------------------------------

-- EJERCICIO PROPUESTO:

-- PARA LA BD DE PROMOCIONES:
/*
QUEREMOS TENER PREPARADO SIEMPRE (VISTA) UN LISTADO CON LOS PRECIOS A DÍA DE HOY (CUANDO SE CONSULTE) DE LOS ARTÍCULOS
NECESITO: refart, nomarticulo preciobase, pecioHoy, codcat

*/
create view catalogoprecios

(referencia, descripcion, preciobase, precioHoy, categoria)

as


select refart, nomart, preciobase, precioventa, codcaat

from articulos

where refarticulo not in
		
	(select catalogospromos.refarticulo
		 
	from catalogospromos join promociones on catalogospromos.codpromo = promociones.codpromo	
	where curdate() between promociones.fecinipromo
	
				and date_add (promociones.fecinipromo,
 interval promociones.duracion day)

	)


union all /* se repiten */
-- union  /* no se repiten */


select articulos.desarticulo, catalogospromos.precioventa

from catalogospromos join promociones on catalogospromos.codpromo = promociones.codpromo	
	where curdate() between promociones.fecinipromo
	
				and date_add (promociones.fecinipromo,
 interval promociones.duracion day)