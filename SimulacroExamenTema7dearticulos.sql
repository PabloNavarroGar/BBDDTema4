-- Examen de consultas avanzados de tema 7 simulacro de produtos
/*P1.Queremos saber el importe de las ventas de artículos a cada uno de nuestros clientes (muestra el nombre).
 Queremos que cada cliente se muestre una sola vez y que aquellos a los que hayamos vendido más se muestren primero.*/
 ** EJERCICIO 1 **/
select clientes.codcli, nomcli, sum(precioventa)
from clientes join ventas
		on clientes.codcli = ventas.codcli
    join detalleVenta
		on ventas.codventa = detalleVenta.codventa
group by clientes.codcli
order by sum(precioventa) desc;
 /*P2.Muestra un listado de todos los artículos vendidos, queremos mostrar la descripción del artículo 
 y entre paréntesis la descripción de la categoría a la que pertenecen y la fecha de la venta con el formato “march - 2016, 1 (tuesday)”.
 Haz que se muestren todos los artículos de la misma categoría juntos.*/
 
 /** EJERCICIO 2 **/
select desart, concat(nomart,' (',descat,')'), date_format(fecventa, '%M - %Y, %d (%W)')
from articulos join categorias
		on articulos.codcat = categorias.codcat
    join detalleVenta
		on articulos.refart = detalleVenta.refart
	join ventas
		on ventas.codventa = detalleVenta.codventa
order by categorias.descat;

 
 /*(1 pto.)P3 Obtener el precio medio de los artículos de cada promoción (muestra la descripción de la promoción) del año 2012. (Se usará en el ejercicio 7).
*/
 /** EJERCICIO 3 **/

select despromo, avg(precioartpromo)
from articulos join catalogospromos
		on articulos.refart = catalogospromos.refart
	join promociones
		on catalogospromos.codpromo = promociones.codpromo
where year(fecinipromo)=2012
group by promociones.codpromo;


delimiter $$

 
 
 /* P4Prepara una rutina que muestre un listado de artículos, su referencia, su nombre y la categoría que no hayan estado en ninguna promoción que haya empezado en este año.
*/
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

 
 /*P5Queremos asignar una contraseña a nuestros clientes para la APP de la cadena, prepara una rutuina que dado un dni y un teléfono,
 nos devueltva la contraseña inicial que estará formada por: la inicial del nombre, los números correspondientes a las posiciones 3ª, 4ª Y 5ª del dni y el
 número de caracteres de su nombre completo. Asegúrate que el nombre no lleva espacios a izquierda ni derecha.*/
 
 /** EJERCICIO 5 **/
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
 /*P6.Sabemos que de nuestros vendedores almacenamos en nomvende su nombre y su primer apellido y 
 su segundo apellido, no hay vendedores con nombres ni apellidos compuestos. Obten su contraseña
 formada por la inicial del nombre, las 3 primeras letras del primer apellido y las 3 primeras letras del segundo apellido. */
 /** EJERCICIO 6 **/

/* PROBAR CON:
UPDATE `gestventapromos`.`vendedores` SET `nomvende` = 'Pedro González Sánchez' WHERE (`codvende` = '1');
UPDATE `gestventapromos`.`vendedores` SET `nomvende` = 'María Pérez Lima' WHERE (`codvende` = '2');
UPDATE `gestventapromos`.`vendedores` SET `nomvende` = 'Germán Torres Campos' WHERE (`codvende` = '3');
UPDATE `gestventapromos`.`vendedores` SET `nomvende` = 'Anaís Rubio García' WHERE (`codvende` = '4');
*/
select nomvende, concat(
						substring(nomvende,1,1),
						substring(nomvende,
								  locate(' ',nomvende)+1,3),
						substring(nomvende,locate(' ',nomvende,locate(' ',nomvende) + 1)+1,3)
					)
from vendedores;
 /*P7. Queremos saber las promociones que comiencen en el mes actual y para las que la media de los precios de los artículos
 de dichas promociones coincidan con alguna de las de un año determinado (utiliza el ejercicio P3. Tendrás que hacer alguna modificación).
*/
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
/*P8.Obtén un listado de artículos (referencia y nombre) cuyo precio venta sin promocionar sea el mismo que el que han tenido en alguna promoción.
*/

select refart, nomart
from articulos
-- subconsultado con any 
where precioventa = any (
						select precioartpromo
						from catalogospromos
						where catalogospromos.refart = articulos.refart
						);