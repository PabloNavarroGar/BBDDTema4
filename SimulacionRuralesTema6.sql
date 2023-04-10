use GBDturRural2015;
-- Ejercicio 5 no entra
-- 1.Prepara una consulta que muestre, de la forma más 
-- eficientemente posible, todos los datos de las casas 
-- con capacidad de entre 4 y 6 personas de la provincia de Sevilla. 

delimiter $$

drop procedure if exists ejercicio1 $$

create procedure ejercicio1()
deterministic
begin 

	select *
	from casas
	where casas.minpersonas between 4  and 6 and trim(casas.provincia) ='Sevilla';
    
   end $$
   
   delimiter ;

call ejercicio1();

-- 2.Prepara una consulta que muestre las reservas 
-- que se han anulado este año y el importe de la devolución (si se ha producido). 
-- Nos interesa mostrar el código de la reserva y el nombre y apellidos del cliente (en una sola columna). 
-- Ten en cuenta que no todas las reservas anuladas han provocado devolución
-- y que solo existirá la fila en devoluciones para aquellas reservas con devolución.

delimiter $$
-- importante poner su esta en null poner el campo vacio
drop procedure if exists ejercicio2 $$
create procedure ejercicio2()
begin
select  codreserva , concat(nomcli,ape1cli,ifnull(ape2cli,' ')) as 'Datos clientes', devoluciones.importedevol

from reservas join clientes on reservas.codcliente = clientes.codcli
	join devoluciones on reservas.codreserva = devoluciones.codreserva
where fecanulacion = date('2016');

end $$

delimiter ;
call ejercicio2();