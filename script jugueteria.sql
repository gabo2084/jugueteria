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
    subtotal decimal(10,2) unsigned,
    
    primary key(id_pedido_producto),
    foreign key(id_pedido) references pedido(id_pedido),
    foreign key(id_producto) references producto(id_producto)
);
