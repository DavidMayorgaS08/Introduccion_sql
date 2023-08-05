/*Título: Diseño de una Base de Datos para una Tienda en Línea

Descripción: Imagina que estás trabajando como consultor de bases de datos para una tienda en línea que vende una variedad de productos. Tu tarea es diseñar la estructura de la base de datos utilizando MySQL y el lenguaje DDL. Debes definir las tablas necesarias para almacenar información sobre los productos, los clientes y los pedidos. Asegúrate de considerar las relaciones entre estas entidades y aplicar buenas prácticas de diseño de bases de datos.
*/

create database tienda;

use tienda;

create table productos(
    id int primary key,
    nombre varchar(50),
    precio int,
    cantidad int
);

create table clientes(
    id int primary key,
    nombre varchar(50),
    apellido varchar(50),
    email varchar(50),
    telefono int
);

create table pedidos(
    id int primary key,
    id_cliente int,
    id_producto int,
    fecha date,
    foreign key(id_cliente) references clientes(id),
);

ALTER TABLE pedidos ADD FOREIGN KEY (id_producto) references productos(id);
