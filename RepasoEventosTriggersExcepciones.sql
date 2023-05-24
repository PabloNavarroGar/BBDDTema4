/*Triggers */
use empresaclase;
-- Para la base de datos empresaclase haz los siguientes ejercicios:
-- 1Comprueba que no podamos contratar a empleados que no tengan 16 años.
delimiter $$
drop trigger if exists compruebaedad $$
create trigger compruebaedad
 -- se pone una vez creaod el trigger before insert para antes de introcudir un alter
 -- Antes de meter un empleado si tiene 16 años...
	before insert on empleados
for each row -- por cada fila
begin
	-- si la fecha de nacimiento se le añade un intervalo de 16 años y es mayor que la actualidad...
	-- if date_sub(curdate(), interval 16 year) < new.fecnaem then
    if date_add(new.fecnaem, interval 16 year) > curdate() then
    
		signal sqlstate '45000' set message_text = 'No se cumple la edad...';
	end if;
end $$
delimiter ;
-- lo probamos:
insert into empleados
	(numem, numde, extelem, fecnaem, fecinem,salarem,
	 comisem, numhiem,nomem,ape1em,ape2em,dniem, userem, passem)
values
	(1201, 110, '342','2010/12/12', curdate(), 1000,10,
	0,'María', 'del Campo', 'Flores','10000001a','maria','1234');

-- 2Comprueba que el departamento de las personas que ejercen la dirección de los departamentos pertenezcan a dicho departamento.

delimiter $$
drop trigger if exists compruebadeptodir $$
create trigger compruebadeptodir
	before insert on dirigir
for each row
begin
	declare mensaje varchar(100);
	if (select numde from departamentos where numem = new.numempdirec) <> new.numdepto then
	begin
		set mensaje = concat('El empleado no pertenece al departamento ', new.numdepto); -- en algunas versiones de mysql de error usar concat directamente en la sentencia signal
		signal sqlstate '45000' set message_text = mensaje;
	end;
    end if;
end $$
delimiter ;
-- lo probamos:
insert into dirigir
	(numdepto, numempdirec, fecinidir, fecfindir, tipodir)
values
	(....);
-- 3Añade lo que consideres oportuno para que las comprobaciones anteriores se hagan también cuando se modifiquen la fecha de nacimiento de un empleado o al director/a de un departamento.
-- EJER 3
-- sobre ejer 1
delimiter $$
drop trigger if exists compruebaedadEditar $$
create trigger compruebaedadEditar
	before update on empleados
for each row
begin
	if old.fecnaem <> new.fecnaem -- siempre se comprueba en los triggers de update si el campo modificado es el que nos afecta
		and date_add(new.fecnaem, interval 16 year) > curdate() then
    
		signal sqlstate '45000' set message_text = 'el empleado no cumple la edad';
	end if;
end $$
delimiter ;
-- lo probamos:
UPDATE empleados 
SET 
    extelem = '567'
WHERE
    numem = 999;

update empleados
set fecnaem = '2007/1/1'
where numem = 999;
-- 4Añade una columna numempleados en la tabla departamentos. En ella vamos a almacenar el número de empleados de cada departamento.
	alter table departamentos
	add column numempleados int not null default 0
-- 5Prepara un procecdimiento que para cada departamento calcule el número de empleados y guarde dicho valor en la columna creada en el apartado 4.
delimiter $$
drop procedure if exists calculaNumEmple $$
create procedure calculaNumEmple ()
begin
	update departamentos
    set numempleados = (select count(*) -- count cuenta las celdas
						from empleados
						where empleados.numde = departamentos.numde);
end $$
delimiter ;
-- 6Prepara lo que consideres necesario para que cada trimestre se compruebe y actualice, en caso de ser necesario, el número de empleados de cada departamento.

delimiter $$
create event actualizaNumeroEmpleados
on schedule
	every 1 quarter
    starts '2022/6/1'
do
	begin
		call calculaNumEmple();
    end $$
    
delimiter ;
-- 7Asegúrate de que cuando eliminemos a un empleado, se actualice el número de empleados del departamento al que pertenece dicho empleado.
delimiter $$
drop trigger if exists calculaNumEmpleborrado $$
create trigger calculaNumEmpleborrado 
	after delete on empleados
for each row
begin
	update departamentos
    set numempleados = (select count(*) from empleados where numde = old.numde)
    where numde = old.numde;
end $$
delimiter ;

-- A partir de esta parte uso de gestina Tests
/*8.El profesorado también puede matricularse en nuestro centro pero no de las materias que imparte. Para ello tendrás que hacer lo sigjuiente:
Añade el campo dni en la tabla de alumnado.
Añade la tabla profesorado (codprof, nomprof, ape1prof, ape2prof, dniprof).
Añade una clave foránea en materias ⇒ codprof references a profesorado (codprof).
Introduce datos en las tablas y campos creados para hacer pruebas.
*/

-- PROPUESTO: comprueba que un profesor no pueda matricularse de las materias que imparte:


drop trigger if exists compruebafechatest;
delimiter $$
create trigger compruebafechatest
	before insert on tests
for each row
begin
	if new.fecpublic < new.feccreacion then
		signal sqlstate '45000' set message_text = 'la fecha de publicación no puede ser anterior a la de creación';
	end if;
end $$
delimiter ;


drop trigger if exists compruebafechatestEditar;
delimiter $$
create trigger compruebafechatestEditar
	before update on tests
for each row
begin
	if (new.fecpublic <> old.fecpublic or new.feccreacion <> old.feccreacion) -- si lo que han cambiado son las fechas de creación o publicación
		and new.fecpublic < new.feccreacion then
		signal sqlstate '45000' set message_text = 'la fecha de publicación no puede ser anterior a la de creación';
	end if;
end $$
delimiter ;

/*Comprueba que un profesor no se matricule de las materias que imparte.
before insert on matriculas
si el dni del alumno = dni profesor que imparte la materia de la matricula entonces
	provocar error
*/
drop trigger if exists compruebarepeticiontestsalumno;
delimiter $$
create trigger compruebarepeticiontestsalumno
	before insert on respuestas
for each row
begin
	if (select repetible from tests where codtest = new.codtest) = false and
	  (select count(*) from respuestas where codtest = new.codtest and numexped = new.numexped) > 0 then
		signal sqlstate '45000' set message_text = 'el test no se puede repetir';
	end if;
end $$
delimiter ;


use bdalmacen;
/* ACLARACIÓN:
En realidad vamos a trabajar con la bd "gestionpromoscompleta"
*/
-- ejer 1
/*Hemos detectado que hay usuarios que consiguen que el precio del pedido
 sea negativo, con lo cual no se hace un cobro del cliente sino un pago, por esta
 razón hemos decidido comprobar el precio del pedido y hacer que 
 siempre sea un valor positivo.
*/
delimiter $$
drop trigger if exists cantidadPositiva $$
create trigger cantidadPositiva
	before insert on pedidos
for each row
begin
	set new.cantidad = abs(new.cantidad);

end $$
delimiter ;

/*Cuando vendemos un producto:
Comprobar si tenemos suficiente stock para ello, si no es así, mostraremos un mensaje de no disponibilidad.
Si tenemos suficiente stock, se hará la venta y se disminuirá de forma automática el stock de dicho producto.
*/

-- ejer 2
delimiter $$
drop trigger if exists cantidadPositivaYCompruebaStock $$
create trigger cantidadPositivaYCompruebaStock
	before insert on pedidos
for each row
begin
	set new.cantidad = abs(new.cantidad);

	if (select stock from productos where codproducto = new.codproducto) < new.cantidad then
		signal sqlstate '45000' set message_text = 'no hay suficiente stock para este pedido';
    end if;
end $$
delimiter ;