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
select  reservas.codreserva , concat(nomcli,ape1cli,ifnull(ape2cli,' ')) as 'Datos clientes', ifnull(devoluciones.importedevol, 0) as 'Devolucion' 

from reservas join clientes on reservas.codcliente = clientes.codcli
	join devoluciones on reservas.codreserva = devoluciones.codreserva
where reservas. fecanulacion >='2021-01-01';

end $$

delimiter ;
call ejercicio2();

-- P3-
-- Prepara un procedimiento que, dado un código de característica,
-- muestre el código de casa, nombre,  población y tipo de casa (nombre del tipo)
-- de las casas que tienen esa característica. Queremos mostrar los datos por poblaciones 
 -- y, dentro de una población, las más caras (precio base) primero. 

drop procedure if exits ejercicio3 $$
delimiter $$
-- dado un codigo de caracteristica
create procedure ejercicio3(in caracteristica int)
deterministic
begin
	select casas.codcasa, casas.nomcasa,casas.poblacion,tiposcasa.nomtipo
	from casas join tiposcasa on casas.codtipocasa = tipocasa.numtipo
			join caracteristicasdecasas on casas.codcasa = caracteristicasdecasas.codcasa
	where caracteristicasdecasas.codcaracter = caracteristica
    order by casas.poblacion, casas.preciobase desc;
end $$

delimiter ;

call ejercicio3(1);

-- p4

drop procedure if exists ejercicio4;
delimiter $$
-- dado un codigo de caracteristica
create procedure ejercicio4(in zona int)
deterministic
begin
	select nomcasa,poblacion
	from casas
	where codzona = zona;
    
end $$

delimiter ;

call ejercicio4(1);


-- p5
drop procedure if exists ejercicio5;
delimiter $$
-- dado un codigo de caracteristica
create procedure ejercicio5(in numzona int, out nomzona varchar(20),out deszona varchar(200))
deterministic
begin
	select zonas.nomzona,count(*),avg(casa.preciobase)
	from zonas left join casas on zonas.numzona = casas.codzona
	group by zonas.nomzona;
    
end $$

delimiter ;

call ejercicio5(3);

-- p6

-- Prepara un procedimiento que, dado el código de una reserva,
-- devuelva el número de teléfono del cliente que ha hecho dicha 
-- reserva y su nombre completo (todo junto).

drop procedure if exists ejercicio6;
delimiter $$
-- dado un codigo de caracteristica
create procedure ejercicio6(in reserva int, out numTelefono char(9))
deterministic
begin
	select clientes.tlf_contacto into numTelefono
	from reservas join clientes on reservas.codcliente = clientes.codcli
	where reservas.codreserva = reserva;
    
end $$

delimiter ;

call ejercicio6(2,@numTelefono);
