/*Consultas para la tabla cliente_domicilio*/

/*Obtener el id_cliente, nombre, apellido, calle y nro del domicilio del cliente*/

select cd.id_cliente, c.nombre, c.apellido, d.calle, d.nro
from cliente_domicilio as cd
inner join cliente as c
on cd.id_cliente = c.id_cliente
inner join domicilio as d
on cd.id_domicilio = d.id_domicilio;
