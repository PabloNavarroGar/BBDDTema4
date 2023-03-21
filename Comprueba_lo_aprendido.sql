use empresaclase;

 -- 1.Prepara una rutina que, dado el número de un departamento, devuelva el presupuesto del mismo.
 
 delimiter $$
 drop procedure if exists comprueba11 $$
create procedure comprueba11
(in numeroDepartamento int)
begin
    select departamentos.presude as Presupuesto
    from departamentos
    where departamentos.numde = numeroDepartamento;
end$$
delimiter ;

call comprueba11(100);
 
 
 
 -- 2. Prepara una rutina que, dado el número de un empleado, nos devuelva la fecha de ingreso en la empresa y el nombre de su director/a.
 select *
 from empleados;
 delimiter $$
drop procedure if exists comprueba12 $$
create procedure comprueba12
(in numeroEmpleado int)
 -- out fecha_ingreso date, out nombreDirector varchar(20)
begin
    select empleado.numde as numero_del_empleado,empleados.fecinem as fecha_ingreso, dirigir.numempdirec as nombreDelDirector
    from empleados join dirigir on departamentos.numde = dirigir.numdepto
  join empleados as e1 on dirigir.nuempdirec = e1.numem 
    
    where empleados.numem = numeroEmpleado and dirigir.numempdirec = nombreDirector;
    
end $$
delimiter ;
 
 call comprueba12(110);
 -- 3. Prepara una rutina que muestre el nombre de todos los empleados y el nombre del último departamento que ha dirigido (si es que  ha dirigido alguno)
 
  delimiter $$
 drop procedure if exists comprueba13 $$
create procedure comprueba13()

begin
    select empleados.nomem , departamentos.nomde
    from empleados join departamentos on empleados.numde = departamentos.numde
 join dirigir on departamentos.numde = dirigir.numdepto
 join empleados as e1 on dirigir.nuempdirec = e1.numem ;
    
end$$
delimiter ;

call comprueba13();
 
 -- Version corregida del profesor del ejercicio 2
 
 
 
 delimiter $$
 
 drop procedure if exists ejercicio2Cor $$
 create procedure  ejercicio2Cor 
 (in empleado int,
 out fechaIngreso date,
 out director int -- out director varchar(100))
 
 )
 begin
 select fecinem,
	dirigir.numempdirec
    into fechaIngreso, director
    from empleados join departamentos on empleados.numde = departamentos.numde
    join dirigir on departamentos.numde = dirigir.numdepto
    where numem = empleado
    and (dirigir.fecfindir is null or dirigit.fecfindir >=curdate());
    
    end $$
    
    delimiter ;
 
 -- Version corregida ejercicio 3
 
 delimiter $$
 drop procedure if exists ejercicio3Corr $$
 create procedure  ejercicio3Corr 
 ()
 begin
		select empleados.nomem,departamentos.nomde
        from empleados
			left join dirigir on empleados.numem = dirigir.numempdirec
            left join departamentos on dirigir.numdepto = departamentos.numde
            and (fecfindir is null or fecfindir >= curdate());
 end $$ 
 
 delimiter ;
 
 call ejercicio3Corr();
 -- es importante que el orden sea igual a la hora de un left join
 
 
 