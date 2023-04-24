use ventapromoscompleta;

select *
from articulos;



/*(1,25 ptos.) 1.Queremos saber el importe de las ventas de artículos a 
cada uno de nuestros clientes (muestra el nombre). Queremos que cada cliente
 se muestre una sola vez y que aquellos a los que hayamos vendido más se muestren primero. 
*/

drop view if exists importeVentas;
create view  importeVentas
as
select cant
from ventas
union distinct -- union, y que no se repiten

select clientes.nomcli
from clientes
order by detalleventa.cant asc;


/*(1,5 ptos.) Obtén un listado de artículos (referencia y nombre) cuyo precio venta 
sin promocionar sea el mismo que el que han tenido en alguna promoción.*/


drop view if exists listadoArticulos;
CREATE VIEW listadoArticulos AS
SELECT refart, categorias.codcat, articulos.nomart,precioventa
FROM articulos
-- esta seleccion es para los que SI estan en promocion 
where refart in
(select catalogospromos.refart
from catalogomospromos join promociones on catalogospromos.codpromo = promociones.codpromo
where curdate() between promociones.fecinipromo

	and date_add(promociones.fecinipromo,interval promociones.duracionpromo day)
)
-- union all se repiten

union -- no se repiten
-- Esta seleccion es para los que NO estan en promocion
select articulos.refart,articulos.nomart,articulos.preciobase,catalogospromos.precioartpromo,articulos.codcat

from articulos join catalogospromos on articulos.refart = catalogospromos.refart
	join promociones on catalogospromos.codcat = promociones.codpromo
		where curdate() between promociones.fecinipromo
			and date_add(promocones.fecinipromo,interval promociones.duracionpromo day);




 



SELECT * FROM CATALOGOPRODUCTOS;
