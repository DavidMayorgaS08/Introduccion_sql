/*Título: Diseño de una Base de Datos para una Tienda en Línea

Descripción: Imagina que estás trabajando como consultor de bases de datos para una tienda en línea que vende una variedad de productos. Tu tarea es diseñar la estructura de la base de datos utilizando MySQL y el lenguaje DDL. Debes definir las tablas necesarias para almacenar información sobre los productos, los clientes y los pedidos. Asegúrate de considerar las relaciones entre estas entidades y aplicar buenas prácticas de diseño de bases de datos.
la relacion del pedido y los productos debe ser atravez de una factura
*/

create database tienda;

use tienda;

create table productos(
    id int not null,
    nombre varchar(50) not null,
    precio float not null,
    descripcion varchar(100) not null,
    primary key(id)
);

create table clientes(
    id int not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    email varchar(50) not null,
    primary key(id)
);

create table pedidos(
    id int not null,
    fecha date not null,
    cliente_id int not null,
    primary key(id),
    foreign key(cliente_id) references clientes(id)
);

create table factura(
    id int not null,
    pedido_id int not null,
    producto_id int not null,
    cantidad int not null,
    descripcion varchar(100) not null,
    primary key(id),
    foreign key(pedido_id) references pedidos(id),
    foreign key(producto_id) references productos(id)
);