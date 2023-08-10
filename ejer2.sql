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

create table artista(
    id int not null primary key,
    nombre varchar(50) not null
)

create table obras(
    id int not null primary key,
    información varchar(100) not null,
    titulo varchar(50) not null,
    año int not null,
    dimensiones varchar(50) not null,
    tecnica varchar(50) not null,
    id_artista int not null,
    foreign key(id_artista) references artista(id)
)

create table valoración(
    id int not null primary key,
    id_obra int not null,
    valoracion int not null,
    foreign key(id_obra) references obras(id)
)

create table fecha_expo(
    id int not null primary key,
    id_obra int not null,
    id_expo int not null,
    foreign key(id_obra) references obras(id),
    foreign key(id_expo) references exposiciones(id)
)

create table exposiciones(
    id int not null primary key,
    Nombre_obras varchar(50) not null,
    fecha_inicio date not null,
    fecha_fin date not null
)

create table fecha_evento(
    id int not null primary key,
    id_obra int not null,
    id_evento int not null,
    foreign key(id_obra) references obras(id),
    foreign key(id_evento) references eventos(id)
)

create table eventos(
    id int not null primary key,
    Nombre_evento varchar(50) not null,
    fecha_inicio date not null,
    fecha_fin date not null
)

create table prestamo(
    id int not null primary key,
    id_obra int not null,
    id_inst int not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    ubicación varchar(50) not null,
    foreign key(id_obra) references obras(id),
    foreign key(id_inst) references instituciones(id)
)

create table instituciones(
    id int not null primary key,
    nombre varchar(50) not null,
    ubicación varchar(50) not null
)

create table venta(
    id int not null primary key,
    id_obra int not null,
    id_comprador int not null,
    fecha_venta date not null,
    precio_venta float not null,
    foreign key(id_obra) references obras(id),
    foreign key(id_comprador) references comprador(id)
)

create table comprador(
    id int not null primary key,
    nombre varchar(50) not null
)

create table propiedad(
    id int not null primary key,
    id_obra int not null,
    id_propietario int not null,
    fecha_inicio date not null,
    fecha_fin date not null,
    ubicación varchar(50) not null,
    foreign key(id_obra) references obras(id),
    foreign key(id_propietario) references propietario(id)
)

create table propietario(
    id int not null primary key,
    nombre varchar(50) not null
)

create table precio(
    id int not null primary key,
    id_obra int not null,
    precio float not null,
    fecha date not null,
    foreign key(id_obra) references obras(id)
)