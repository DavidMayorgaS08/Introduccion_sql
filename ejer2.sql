/*Sistema de seguimiento y gestión de arte en galería:
Imagina que diriges una galería de arte que exhibe y vende obras de artistas contemporáneos. Para llevar un registro detallado de las obras de arte y facilitar la gestión de la galería, podrías utilizar una base de datos. Aquí te muestro cómo podría funcionar:
Almacenamiento de información de obras de arte: La base de datos almacenaría información detallada sobre cada obra de arte, incluyendo el nombre del artista, título de la obra, año de creación, dimensiones, técnica utilizada y una descripción.
Gestión de exposiciones: Podrías utilizar la base de datos para planificar y programar exposiciones. Registrarías qué obras de arte se exhibirán en cada exposición, la disposición de la galería y la duración de la muestra.
Registro de ventas y transacciones: Cuando se venda una obra de arte, la base de datos registraría los detalles de la transacción, incluyendo el comprador, la fecha de venta y el precio de venta. Esto permitiría un seguimiento financiero preciso.
Historial de propiedad y ubicación: La base de datos podría rastrear el historial de propiedad de cada obra de arte, desde su creación hasta su ubicación actual. Esto es especialmente valioso para obras que pasan por préstamos a otras galerías o museos.
Gestión de préstamos: Si la galería presta obras de arte a otras instituciones, la base de datos podría gestionar estos préstamos, registrando las fechas de inicio y finalización, así como la ubicación temporal de las obras.
Valoración y precios: La base de datos podría almacenar información sobre la valoración de cada obra de arte a lo largo del tiempo, lo que ayudaría a determinar los precios de venta y facilitaría la negociación con posibles compradores.
Gestión de eventos: Si la galería organiza eventos, charlas o presentaciones relacionadas con las obras de arte, la base de datos podría ayudar a planificar y coordinar estos eventos.
Acceso restringido: Dado que la información sobre obras de arte puede ser confidencial, la base de datos podría implementar niveles de acceso para garantizar que solo el personal autorizado tenga acceso a ciertos datos.*/


create database galeria;

use galeria;

create table obra_arte(
    id int not null primary key,
    titulo varchar(50) not null,
    nombre_artista varchar(50) not null,
    anio_creacion date not null,
    dimensiones varchar(50) not null,
    tecnica varchar(50) not null
)

create table comprador(
    cc int not null primary key,
    nombre varchar(50) not null,
    edad int not null,
    dinero int not null,
    direccion varchar(50) not null,
    telefono int not null
)

create table Ventas(
    id int not null primary key,
    fecha date not null,
    precio decimal(10,2) not null,
    cc_comprador int not null,
    id_obra int not null,
    foreign key(cc_comprador) references comprador(cc),
    foreign key(id_obra) references obra_arte(id)
)

create table historial(
    id int not null primary key,
    nombre_propietario varchar(50) not null,
    fecha date not null,
    id_obra int not null,
    foreign key(id_obra) references obra_arte(id)
)

create table exposiciones(
    id int not null primary key,
    cant_obras int not null
)

create table Dia_expo(
    id int not null primary key,
    fecha date not null,
    id_obras int not null,
    id_exposicion int not null,
    foreign key(id_obras) references obra_arte(id),
    foreign key(id_exposicion) references exposiciones(id)
)

create table Evento(
    id int not null primary key,
    Tipo varchar(50) not null,
    cant_Arte_expuesto int not null,
    nombre varchar(50) not null
)

create table Fecha_evento(
    id int not null primary key,
    fecha date not null,
    cant_personas int not null,
    id_evento int not null,
    id_obras int not null,
    foreign key(id_evento) references Evento(id),
    foreign key(id_obras) references obra_arte(id)
)

create table Valor_obra(
    id int not null primary key,
    fecha date not null,
    precio_anterior decimal(10,2) not null,
    precio_actual decimal(10,2) not null,
    id_obra int not null,
    foreign key(id_obra) references obra_arte(id)
)

create table Institucion(
    cc int not null primary key,
    nombre varchar(50) not null,
    direccion varchar(50) not null,
    telefono int not null
)

create table Prestamo(
    id int not null primary key,
    fecha_inicio date not null,
    fecha_final date not null,
    ubicación varchar(50) not null,
    id_obra int not null,
    cc_institucion int not null,
    foreign key(id_obra) references obra_arte(id),
    foreign key(cc_institucion) references Institucion(cc)
)


/* ingresar datos a las tablas */

/* 5 datos a tabla obra_arte */

insert into obra_arte values(1, 'La noche estrellada', 'Vincent van Gogh', '1889-06-18', '73.7 cm x 92.1 cm', 'Óleo sobre lienzo');
insert into obra_arte values(2, 'El grito', 'Edvard Munch', '1893-01-01', '91 cm x 73.5 cm', 'Óleo, temple y pastel sobre cartón');
insert into obra_arte values(3, 'La persistencia de la memoria', 'Salvador Dalí', '1931-01-01', '24 cm x 33 cm', 'Óleo sobre lienzo');
insert into obra_arte values(4, 'La joven de la perla', 'Johannes Vermeer', '1665-01-01', '44.5 cm x 39 cm', 'Óleo sobre lienzo');
insert into obra_arte values(5, 'La noche estrellada sobre el Ródano', 'Vincent van Gogh', '1888-01-01', '72.5 cm x 92 cm', 'Óleo sobre lienzo');


/* 5 datos a tabla comprador */

insert into comprador values(1254665, 'Juan', 25, 10000000, 'Calle 1 # 1-1', 356465484);
insert into comprador values(168666, 'Pedro', 30, 20000000, 'Calle 2 # 2-2', 465164621);
insert into comprador values(6546465, 'Maria', 35, 30000000, 'Calle 3 # 3-3', 321465465);
insert into comprador values(654674, 'Camila', 40, 40000000, 'Calle 4 # 4-4', 654654654);
insert into comprador values(6548946, 'Sofia', 45, 50000000, 'Calle 5 # 5-5', 12654654);


/* 15 datos a tabla Ventas*/

insert into Ventas values(1, '2021-01-01', 1000000, 1, 1);
insert into Ventas values(2, '2021-01-02', 2000000, 2, 1);
insert into Ventas values(3, '2021-01-03', 3000000, 3, 4);
insert into Ventas values(4, '2021-01-04', 4000000, 4, 5);
insert into Ventas values(5, '2021-01-05', 5000000, 5, 3);
insert into Ventas values(6, '2021-01-06', 6000000, 3, 2);
insert into Ventas values(7, '2021-01-07', 7000000, 2, 4);
insert into Ventas values(8, '2021-01-08', 8000000, 1, 5);
insert into Ventas values(9, '2021-01-09', 9000000, 5, 3);
insert into Ventas values(10, '2021-01-10', 10000000, 4, 2);
insert into Ventas values(11, '2021-01-11', 11000000, 3, 1);
insert into Ventas values(12, '2021-01-12', 12000000, 2, 5);
insert into Ventas values(13, '2021-01-13', 13000000, 1, 4);
insert into Ventas values(14, '2021-01-14', 14000000, 5, 2);
insert into Ventas values(15, '2021-01-15', 15000000, 4, 3);


/* 10 datos a tabla historial*/

insert into historial values(1, 'Juan', '2021-01-01', 1);
insert into historial values(2, 'Pedro', '2021-01-02', 2);
insert into historial values(3, 'Maria', '2021-01-03', 3);
insert into historial values(4, 'Luis', '2021-01-04', 4);
insert into historial values(5, 'Ana', '2021-01-05', 5);
insert into historial values(6, 'Juan', '2021-01-06', 3);
insert into historial values(7, 'Pedro', '2021-01-07', 2);
insert into historial values(8, 'Maria', '2021-01-08', 1);
insert into historial values(9, 'Luis', '2021-01-09', 5);
insert into historial values(10, 'Ana', '2021-01-10', 4);


/* 5 datos a tabla exposiciones*/

insert into exposiciones values(1, 15);
insert into exposiciones values(2, 12);
insert into exposiciones values(3, 10);
insert into exposiciones values(4, 16);
insert into exposiciones values(5, 14);


/* 15 datos a tabla Dia_expo*/

insert into Dia_expo values(1, '2021-01-01', 1, 1);
insert into Dia_expo values(2, '2021-01-02', 3, 2);
insert into Dia_expo values(3, '2021-01-03', 5, 3);
insert into Dia_expo values(4, '2021-01-04', 4, 4);
insert into Dia_expo values(5, '2021-01-05', 2, 5);
insert into Dia_expo values(6, '2021-01-06', 1, 5);
insert into Dia_expo values(7, '2021-01-07', 3, 4);
insert into Dia_expo values(8, '2021-01-08', 5, 3);
insert into Dia_expo values(9, '2021-01-09', 4, 2);
insert into Dia_expo values(10, '2021-01-10', 2, 1);
insert into Dia_expo values(11, '2021-01-11', 1, 2);
insert into Dia_expo values(12, '2021-01-12', 3, 3);
insert into Dia_expo values(13, '2021-01-13', 5, 4);
insert into Dia_expo values(14, '2021-01-14', 4, 5);
insert into Dia_expo values(15, '2021-01-15', 2, 1);


/* 5 datos a tabla Evento*/

insert into Evento (id, Tipo, cant_Arte_expuesto, nombre) values(1, 'Presencial', 15, 'Exposicion 1');
insert into Evento (id, Tipo, cant_Arte_expuesto, nombre) values(2, 'Virtual', 12, 'Exposicion 2');
insert into Evento (id, Tipo, cant_Arte_expuesto, nombre) values(3, 'Presencial', 10, 'Exposicion 3');
insert into Evento (id, Tipo, cant_Arte_expuesto, nombre) values(4, 'Virtual', 16, 'Exposicion 4');
insert into Evento (id, Tipo, cant_Arte_expuesto, nombre) values(5, 'Presencial', 14, 'Exposicion 5');


/* 15 datos a tabla Fecha_evento*/

insert into Fecha_evento values(1, '2021-01-01', 20, 4, 1);
insert into Fecha_evento values(2, '2021-01-02', 30, 3, 2);
insert into Fecha_evento values(3, '2021-01-03', 10, 2, 3);
insert into Fecha_evento values(4, '2021-01-04', 23, 3, 4);
insert into Fecha_evento values(5, '2021-01-05', 15, 4, 5);
insert into Fecha_evento values(6, '2021-01-06', 20, 2, 5);
insert into Fecha_evento values(7, '2021-01-07', 30, 3, 4);
insert into Fecha_evento values(8, '2021-01-08', 10, 4, 3);
insert into Fecha_evento values(9, '2021-01-09', 23, 2, 2);
insert into Fecha_evento values(10, '2021-01-10', 15, 3, 1);
insert into Fecha_evento values(11, '2021-01-11', 20, 4, 2);
insert into Fecha_evento values(12, '2021-01-12', 30, 3, 3);
insert into Fecha_evento values(13, '2021-01-13', 10, 2, 4);
insert into Fecha_evento values(14, '2021-01-14', 23, 3, 5);
insert into Fecha_evento values(15, '2021-01-15', 15, 4, 1);


/* 10 datos a la tabla Valor_obra*/

insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(1, '2021-01-01', 1000000, 2000000, 1);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(2, '2021-01-02', 2000000, 3000000, 5);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(3, '2021-01-03', 3000000, 4000000, 3);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(4, '2021-01-04', 4000000, 5000000, 1);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(5, '2021-01-05', 5000000, 6000000, 4);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(6, '2021-01-06', 6000000, 7000000, 2);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(7, '2021-01-07', 7000000, 8000000, 4);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(8, '2021-01-08', 8000000, 9000000, 1);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(9, '2021-01-09', 9000000, 10000000, 3);
insert into Valor_obra (id, fecha, precio_anterior, precio_actual, id_obra) values(10, '2021-01-10', 10000000, 11000000, 2);