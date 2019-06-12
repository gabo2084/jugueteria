create database if not exists jugueteria;

use jugueteria;

create table if not exists pais
(
    id_pais int unsigned not null auto_increment,
    nombre varchar(100) not null,
    
   primary key(id_pais)
);

create table if not exists provincia
(
    id_provincia int unsigned not null auto_increment,
    id_pais int unsigned not null,
    nombre varchar(100) not null,
    
    primary key(id_provincia),
    foreign key(id_pais) references pais(id_pais)
);

create table if not exists localidad
(
    id_localidad int unsigned not null auto_increment,
    id_provincia int unsigned not null,
    nombre varchar(100) not null,
    
    primary key(id_localidad),
    foreign key(id_provincia) references provincia(id_provincia)
);

create table if not exists domicilio
(
    id_domicilio int unsigned not null auto_increment,
    id_localidad int unsigned not null,
    calle varchar(255) not null,
    nro int unsigned,
    piso varchar(5),
    dpto varchar(5),
    cp varchar(8),
    
    primary key(id_domicilio),
    foreign key(id_localidad) references localidad(id_localidad)
    
);

create table if not exists cliente
(
    id_cliente int unsigned not null auto_increment,
    nombre varchar(100) not null,
    apellido varchar(100) not null,
    nro_dni varchar(8) not null,
    sexo char not null,
    telefono varchar(20),
    email varchar(255) unique,
    
    primary key(id_cliente)
);

create table if not exists fabricante
(
    id_fabricante int unsigned not null auto_increment,
    razon_social varchar(255) not null,
    cuit varchar(13) not null,
    telefono varchar(20),
    email varchar(255) unique,
    sitio_web varchar(255) unique,
    
    primary key(id_fabricante)
);

create table if not exists cliente_domicilio
(
    id_cliente_domicilio int unsigned not null auto_increment,
    id_cliente int unsigned not null,
    id_domicilio int unsigned not null,
    
    primary key(id_cliente_domicilio),
    foreign key(id_cliente) references cliente(id_cliente),
    foreign key(id_domicilio) references domicilio(id_domicilio)
);

create table if not exists fabricante_domicilio
(
    id_fabricante_domicilio int unsigned not null auto_increment,
    id_fabricante int unsigned not null,
    id_domicilio int unsigned not null,
    
    primary key(id_fabricante_domicilio),
    foreign key(id_fabricante) references fabricante(id_fabricante),
    foreign key(id_domicilio) references domicilio(id_domicilio)
);

create table if not exists pedido
(
    id_pedido int unsigned not null auto_increment,
    id_cliente_domicilio int unsigned not null,
    fecha_pedido date,
    fecha_envio date,
    
    primary key(id_pedido),
    foreign key(id_cliente_domicilio) references cliente_domicilio(id_cliente_domicilio)
);

create table if not exists categoria
(
    id_categoria int unsigned not null auto_increment,
    nombre varchar(255) not null,
    
    primary key(id_categoria)
);

create table if not exists producto
(
    id_producto int unsigned not null auto_increment,
    id_categoria int unsigned not null,
    id_fabricante int unsigned not null,
    nombre varchar(255) not null,
    descripcion mediumtext,
    edad_recomendada varchar(3) not null,
    precio_compra decimal(10,2) unsigned not null,
    precio_venta decimal(10,2) unsigned not null,
    
    primary key(id_producto),
    foreign key(id_categoria) references categoria(id_categoria),
    foreign key(id_fabricante) references fabricante(id_fabricante)
);

create table if not exists pedido_producto
(
    id_pedido_producto int unsigned not null auto_increment,
    id_pedido int unsigned not null,
    id_producto int unsigned not null,
    cantidad_producto int unsigned not null,
    
    primary key(id_pedido_producto),
    foreign key(id_pedido) references pedido(id_pedido),
    foreign key(id_producto) references producto(id_producto)
);


/*Datos para tabla pais*/

insert into pais
values (null, 'Argentina'),
(null, 'Chile'),
(null, 'Brasil'),
(null, 'Paraguay'),
(null, 'Perú');


/*Datos para tabla provincia*/

insert into provincia
values (null, 1, 'Ciudad Autónoma de Buenos Aires'),
(null, 1, 'Buenos Aires'),
(null, 1, 'Catamarca'),
(null, 1, 'Chaco'),
(null, 1, 'Chubut'),
(null, 1, 'Córdoba'),
(null, 1, 'Corrientes'),
(null, 1, 'Entre Ríos'),
(null, 1, 'Formosa'),
(null, 1, 'Jujuy'),
(null, 1, 'La Pampa'),
(null, 1, 'La Rioja'),
(null, 1, 'Mendoza'),
(null, 1, 'Misiones'),
(null, 1, 'Neuquén'),
(null, 1, 'Río Negro'),
(null, 1, 'Salta'),
(null, 1, 'San Juan'),
(null, 1, 'San Luis'),
(null, 1, 'Santa Cruz'),
(null, 1, 'Santa Fe'),
(null, 1, 'Santtiago del Estero'),
(null, 1, 'Tierra del Fuego, Antártida e Islas del Atlántico Sur'),
(null, 1, 'Tucumán');


/*Datos para tabla localidad*/

insert into localidad
values (null, 1, 'Agronomía'),
(null, 1, 'Almagro'),
(null, 1, 'Balvanera'),
(null, 1, 'Barracas'),
(null, 1, 'Belgrano'),
(null, 1, 'Boedo'),
(null, 1, 'Caballito'),
(null, 1, 'Chacarita'),
(null, 1, 'Coghlan'),
(null, 1, 'Colegiales'),
(null, 1, 'Constitución'),
(null, 1, 'Flores'),
(null, 1, 'Floresta'),
(null, 1, 'La Boca'),
(null, 1, 'La Paternal'),
(null, 1, 'Liniers'),
(null, 1, 'Mataderos'),
(null, 1, 'Monte Castro'),
(null, 1, 'Monserrat'),
(null, 1, 'Nueva Pompeya'),
(null, 1, 'Núñez'),
(null, 1, 'Palermo'),
(null, 1, 'Parque Avellaneda'),
(null, 1, 'Parque Chacabuco'),
(null, 1, 'Parque Chas'),
(null, 1, 'Parque Patricios'),
(null, 1, 'Puerto Madero'),
(null, 1, 'Recoleta'),
(null, 1, 'Retiro'),
(null, 1, 'Saavedra'),
(null, 1, 'San Cristóbal'),
(null, 1, 'San Nicolás'),
(null, 1, 'San Telmo'),
(null, 1, 'Vélez Sársfield'),
(null, 1, 'Versalles'),
(null, 1, 'Villa Crespo'),
(null, 1, 'Villa del Parque'),
(null, 1, 'Villa Devoto'),
(null, 1, 'Villa General Mitre'),
(null, 1, 'Villa Lugano'),
(null, 1, 'Villa Luro'),
(null, 1, 'Villa Ortúzar'),
(null, 1, 'Villa Pueyrredón'),
(null, 1, 'Villa Real'),
(null, 1, 'Villa Riachuelo'),
(null, 1, 'Villa Santa Rita'),
(null, 1, 'Villa Soldati'),
(null, 1, 'Villa Urquiza'),
(null, 2, 'Adolfo Alsina'),
(null, 2, 'Adolfo Gonzales Chaves'),
(null, 2, 'Alberti'),
(null, 2, 'Almirante Brown'),
(null, 2, 'Arrecifes'),
(null, 2, 'Avellaneda'),
(null, 2, 'Ayacucho'),
(null, 2, 'Azul'),
(null, 2, 'Bahía Blanca'),
(null, 2, 'Balcarce'),
(null, 2, 'Baradero'),
(null, 2, 'Benito Juárez'),
(null, 2, 'Berazategui'),
(null, 2, 'Berisso'),
(null, 2, 'Bolívar'),
(null, 2, 'Bragado'),
(null, 2, 'Brandsen'),
(null, 2, 'Campana'),
(null, 2, 'Cañuelas'),
(null, 2, 'Capitán Sarmiento Carlos'),
(null, 2, 'Carapachay'),
(null, 2, 'Carlos Casares'),
(null, 2, 'Carlos Tejedor'),
(null, 2, 'Carmen de Areco'),
(null, 2, 'Castelliacabuco'),
(null, 2, 'Chascomús'),
(null, 2, 'Chivilcoy'),
(null, 2, 'Colón'),
(null, 2, 'Coronel de Marina Leonardo Rosales'),
(null, 2, 'Coronel Dorrego'),
(null, 2, 'Coronel Pringles'),
(null, 2, 'Coronel Suárez'),
(null, 2, 'Daireaux'),
(null, 2, 'Dolores'),
(null, 2, 'Ensenada'),
(null, 2, 'Escobar'),
(null, 2, 'Esteban Echeverría'),
(null, 2, 'Exaltación de la Cruz'),
(null, 2, 'Ezeiza'),
(null, 2, 'Florencio Varela'),
(null, 2, 'Florentino Ameghin'),
(null, 2, 'General Alvarado'),
(null, 2, 'General Alvear'),
(null, 2, 'General Arenales'),
(null, 2, 'General Belgrano'),
(null, 2, 'General Guid'),
(null, 2, 'General Juan Madariaga'),
(null, 2, 'General La Madrid'),
(null, 2, 'General Las Heras'),
(null, 2, 'General Lavalle'),
(null, 2, 'General Paz'),
(null, 2, 'General Pinto'),
(null, 2, 'General Pueyrredón'),
(null, 2, 'General Rodríguez'),
(null, 2, 'General San Martín'),
(null, 2, 'General Viamonte'),
(null, 2, 'General Villegas'),
(null, 2, 'Guaminí	Partido'),
(null, 2, 'Hipólito Yrigoyen'),
(null, 2, 'Hurlingham'),
(null, 2, 'Ituzaingó'),
(null, 2, 'José C. Paz'),
(null, 2, 'Junín'),
(null, 2, 'La Costa'),
(null, 2, 'La Matanza'),
(null, 2, 'Lanús'),
(null, 2, 'La Plata'),
(null, 2, 'Laprida'),
(null, 2, 'Las Flores'),
(null, 2, 'Leandro N. Alem'),
(null, 2, 'Lincoln'),
(null, 2, 'Lobería'),
(null, 2, 'Lobos'),
(null, 2, 'Lomas de Zamora'),
(null, 2, 'Lomas del Mirador'),
(null, 2, 'Luján'),
(null, 2, 'Magdalena'),
(null, 2, 'Maipú'),
(null, 2, 'Malvinas Argentinas'),
(null, 2, 'Mar Chiquita'),
(null, 2, 'Marcos Paz'),
(null, 2, 'Mercedes'),
(null, 2, 'Merlo'),
(null, 2, 'Monte'),
(null, 2, 'Monte Hermoso'),
(null, 2, 'Moreno'),
(null, 2, 'Morón'),
(null, 2, 'Navarro'),
(null, 2, 'Necochea'),
(null, 2, 'Nueve de Julio (9 de Julio)'),
(null, 2, 'Olavarría'),
(null, 2, 'Patagones'),
(null, 2, 'Pehuajó'),
(null, 2, 'Pellegrini'),
(null, 2, 'Pergamino'),
(null, 2, 'Pila'),
(null, 2, 'Pilar'),
(null, 2, 'Pinamar'),
(null, 2, 'Presidente Perón'),
(null, 2, 'Puan'),
(null, 2, 'Punta Indio'),
(null, 2, 'Quilmes'),
(null, 2, 'Ramallo'),
(null, 2, 'Rauch'),
(null, 2, 'Rivadavia'),
(null, 2, 'Rojas'),
(null, 2, 'Roque Pérez'),
(null, 2, 'Saavedra'),
(null, 2, 'Saladillo'),
(null, 2, 'Salliqueló'),
(null, 2, 'Salto'),
(null, 2, 'San Andrés de Giles'),
(null, 2, 'San Antonio de Areco'),
(null, 2, 'San Cayetano'),
(null, 2, 'San Fernando'),
(null, 2, 'San Isidro'),
(null, 2, 'San Migue'),
(null, 2, 'San Nicolás'),
(null, 2, 'San Pedro'),
(null, 2, 'San Vice'),
(null, 2, 'Suipac'),
(null, 2, 'Tandil'),
(null, 2, 'Tapal'),
(null, 2, 'Tigre'),
(null, 2, 'Tordi'),
(null, 2, 'Tornquist'),
(null, 2, 'Trenque Lauquen'),
(null, 2, 'Tres Arroyos'),
(null, 2, 'Tres de Febrero'),
(null, 2, 'Tres Lo'),
(null, 2, 'Valentin Alsina'),
(null, 2, 'Veinticinco de Mayo (25 de Mayo)'),
(null, 2, 'Vicente López'),
(null, 2, 'Villa Gesell'),
(null, 2, 'Villarino'),
(null, 2, 'Zárate'),
(null, 6, 'Calamuchita'),
(null, 6, 'Córdoba Capital'),
(null, 6, 'Colón'),
(null, 6, 'Marcos Juárez'),
(null, 6, 'Río Primero');




/*Datos para la tabla cliente*/

insert into cliente
values (null, 'Juan', 'Perez', '32456987', 'M', '1543216789', 'juanpe@hotmail.com'),
(null, 'Pedro', 'Picapiedra', '31324521', 'M', '1543216789', 'pedropi@gmail.com'),
(null, 'Pablo', 'Marmol', '25321648', 'M', '1543216789', 'pablomar@yahoo.com'),
(null, 'Luciana', 'Romano', '29006357', 'F', '1543216789', 'lucianaro@hotmail.com'),
(null, 'Micaela', 'Robles', '20777034', 'F', '1543216789', 'micaelaro@gmail.com');


/*Datos para la tabla domicilio*/

insert into domicilio
values (null, 16, 'Rivadavia', 15000, 'PB', '', '1036'),
(null, 6, 'La Plata', 157, '3', 'F', '1146'),
(null, 32, 'Belgrano', 1756, '7', '33', '1215'),
(null, 172, 'Cabildo', 480, '', '', '1551'),
(null, 48, 'Triunvirato', 1200, '2', 'D', '1352'),
(null, 6, 'Boedo', 1241, '4', 'H', '1051'),
(null, 69, 'Independencia', 2972, '', '', 'B1606DNB'),
(null, 179, 'Remedios de Escalada de San Martín', 2870, '', '', 'B1822ABI'),
(null, 114, 'Saenz Peña', 307,'', '', 'B1823'),
(null, 123, 'Pueyrredón', 4038, '', '', 'B1752'),
(null, 15, 'Maturín', 2870, '', '', 'B1416'),
(null, 103, 'Ecuador', 2776, '', '', 'C1542'),
(null, 186, "Bernardo O'Higgins", 3151, '', '', 'X5014IGK'),
(null, 3,'Azcuenaga', 334, '', '', 'C1029AAH');


/*Datos para la tabla cliente_domicilio*/

insert into cliente_domicilio
values (null, 1, 1),
(null, 2, 2),
(null, 3, 3),
(null, 4, 4),
(null, 5, 5),
(null, 2, 6);


/*Datos para la tabla fabricante */

insert into fabricante
values (null, 'Aniano Perez', '20-04585052-9', '011-4762-1593', 'clientes@anianoperez.com.ar', 'www.anianoperez.com.ar'),
(null, 'Caupur S.A.', '30-56265783-1', '011-4228-2220', 'caupur@giba.com.ar', 'www.caupur.com.ar'),
(null, 'Dayan Didacticos S.A.', '30-42282220-7', '011-4225-0805', 'info@dayandicacticos.com.ar', 'www.dayandidacticos.com.ar'),
(null, 'Juguetes Rasti S.A.', '30-62855859-7', '011-4454-5756', 'info@rasti.com.ar', 'www.juguetesrasti.com.ar'),
(null, 'Errekaese S.A.', '30-68853253-8', '011-4583-7867', 'clientes@toptoptoys.com', 'www.toptoptoys.com'),
(null, 'Glaube S.A.', '30-70842003-0', '011-4755-1421', 'hola@rodacross.com', 'www.rodacross.com'),
(null, 'Mar-Plast S.A.', '30-56070969-9', '0351-4670006', 'clientes@mar-plast.com', 'www.mar-plast.com');


/*Datos para la tabla fabricante_domicilio */

insert into fabricante_domicilio
values (null, 1, 7),
(null, 2, 8),
(null, 3, 9),
(null, 4, 10),
(null, 5, 11),
(null, 6, 12),
(null, 7, 13),
(null, 7, 14);


/*Datos para la tabla categoria */

insert into categoria
values (null, 'Casas y Carpas'),
(null, 'Armas y Lanzadores'),
(null, 'Bloques y Construcción'),
(null, 'Dibujo, Pintura y Manualidades'),
(null, 'Disfraces y Cotillón'),
(null, 'Instrumentos Musicales'),
(null, 'Juegos de Agua y Playa'),
(null, 'Juegos de Mesa y Cartas'),
(null, 'Juegos de Plaza y Aire Libre'),
(null, 'Juegos de Salón'),
(null, 'Juguetes de Bromas'),
(null, 'Muñecos y Muñecas'),
(null, 'Patines y Patinetas'),
(null, 'Pelotas y Animales Saltarines'),
(null, 'Peloteros y Castillos'),
(null, 'Peluches'),
(null, 'Títeres y Marionetas'),
(null, 'Vehículos de Jueguete'),
(null, 'Otros');


/*Datos para la tabla producto */

insert into producto
values (null, 7, 1, 'Baldes Piluqui', 'Baldes de para la playa o arenero de diversos colores.', '+1', 50, 75),
(null, 8, 1, 'Metegol', 'Juego clásico de mesa para 2 o más jugadores.', '+5', 500, 800),
(null, 14, 1, 'Pelotas Saltarinas', 'Pelotas de distintas medidas y colores.', '+2', 80, 130),
(null, 8, 2, 'Puzzles Animales', 'Rompecabezas de diversos animales de la selva.', '+2', 30, 50),
(null, 3, 3, 'Arma-Estructuras', 'Bloques para armas estructuras.', '+3', 230, 300),
(null, 18, 4, 'Jeep Wrangler', 'Vehículo Jeep eléctrico con soporte hasta 35 kg.', '+4', 4500, 7000),
(null, 8, 7, '2 en 1 Avenger', 'Juego de mesa Domino y Memotest con los personajes de Avenger.', '+3', 130, 200);


/*Datos de la tabla pedido */

insert into pedido
values (null, 3, '2019-06-03', '2019-06-07'),
(null, 5, '2019-06-03', '2019-06-05'),
(null, 5, '2019-06-05', '2019-06-09'),
(null, 1, '2019-06-06', '2019-06-10'),
(null, 3, '2019-06-06', '2019-06-09'),
(null, 3, '2019-06-08', '2019-06-10'),
(null, 2, '2019-06-08', '2019-06-10'),
(null, 4, '2019-06-10', '2019-06-13');


/*Datos de la tabla pedido_producto */

insert into pedido_producto
values (null, 1, 2, 1),
(null, 2, 4, 10),
(null, 2, 7, 3),
(null, 2, 1, 2),
(null, 3, 3, 5),
(null, 4, 5, 3),
(null, 4, 1, 5),
(null, 5, 2, 1),
(null, 6, 6, 1),
(null, 6, 1, 15),
(null, 7, 5, 10),
(null, 8, 4, 3),
(null, 8, 6, 1);


/* Consultas para las tablas */


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

/* Corregido */

select nombre
from localidad
union
select nombre
from provincia;

/* 1 SELECT con agrupadores, columnas calculadas y filtros (COUNT -u otros-, GROUP BY y HAVING). */

/* Corregido */

select id_pedido, SUM(cantidad_producto) as Total_Producto
from pedido_producto
group by id_pedido
having Total_Producto >= 10;


/* 1 SELECT con una subconsulta (Consulta WHERE COLUMNA... OPERADOR Subconsulta). 

Muestren todos los productos cuyo precio sea menor o igual al promedio de precios de los productos. */

select id_producto, nombre, edad_recomendada, precio_venta
from producto
where precio_venta <= (
select AVG(precio_venta)
from producto);



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






