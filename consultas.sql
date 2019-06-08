
/*Consultas para la tabla cliente_domicilio*/


/* 1 SELECT con condiciones y orden (WHERE y ORDER BY). */

select * from localidad
where id_provincia = 1
order by nombre desc;

/* 1 SELECT que relacione 2 tablas (INNER JOIN). */

select id_localidad, l.nombre as Localidad, p.nombre as Provincia
from localidad as l
inner join provincia as p
on l.id_provincia = p.id_provincia;

/* 1 SELECT que relacione 3 tablas (INNER JOIN). */

select cd.id_cliente, c.nombre, c.apellido, d.calle, d.nro 
from cliente_domicilio as cd
inner join cliente as c
on cd.id_cliente = c.id_cliente
inner join domicilio as d
on cd.id_domicilio = d.id_domicilio;

/* 1 SELECT con patrones de búsqueda (LIKE y '%'). */

select *
from localidad
where nombre
like 'p%';

/* 1 SELECT con la unión de dos consultas (UNION). */

select *
from localidad
union
select *
from provincia;

/* 1 SELECT con agrupadores, columnas calculadas y filtros (COUNT -u otros-, GROUP BY y HAVING). */

select id_provincia, count(id_localidad) as Cantidad_de_Localidades
from localidad
group by id_provincia
having id_provincia = 6;

/* 1 SELECT con una subconsulta (Consulta WHERE COLUMNA... OPERADOR Subconsulta). */

select id_pedido, id_producto, cantidad_producto
from pedido_producto
where id_producto
in (select id_producto
from producto
where id_producto = 1);

/* 1 UPDATE para actualizar una sola fila de una tabla cualquiera, tiene que estar dentro de un BEGIN y COMMIT. */

begin;

update cliente
set nombre = 'José'
where id_cliente = 1;

commit;

/* 1 DELETE para actualizar una sola fila de una tabla cualquiera, tiene que estar dentro de un BEGIN y ROLLBACK. */

begin;

delete from pais

where id_pais = 5;

rollback;






