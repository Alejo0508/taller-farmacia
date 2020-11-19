
create database universidad1  ---estoc rea la base de datos

use universidad1   --- siempre que se crea se debe poner en uso la bd

create table carrera (  -- creamos la tabla

ide_carrera int,  ---creamos los campos de la tabla y se separan por ,
nombre_Carrera varchar (60),
ducarion_carrera float,

constraint apodo primary key (ide_carrera) --- se crea la primary key con el constraint y SIEMPRE  se debe poner un apodo

)  --- se cierra la tabla

create table alumno (

id_alumno int,
nom_alumno varchar (70),
edad_alumno int,
nro_contactalu bigint,
ide_Carrera1 int, --- esta sera la clave foranea

constraint apodo2 primary key (id_alumno), -- esta es la primary key
constraint apodo3 foreign key (ide_Carrera1) references carrera(ide_Carrera) --- esto crea la clave foranea

)

create table profesor(

id_profesor int ,
nom_profesor varchar (60),
dir_profesor varchar (60),
nro_profesor bigint,

constraint apodo4 primary key (id_profesor)

)

create table materia (

id_materia int,
nom_mate varchar (50) unique,  --- el unique es para que no se repita
credito_materia float null,

constraint apodo5 primary key (id_materia))

insert into materia values (11,'informatica',null)
insert into materia values (14,'matematica',20)

select * from materia

--- creacion de tablas intermedias

create table alumnoprofesor (

id_alumno1 int,
id_profesor1 int,

constraint apodo6 foreign key (id_alumno1) references alumno (id_alumno),
constraint apodo7 foreign key (id_profesor1) references profesor (id_profesor),

)

create table materiaprofesor (

id_profesor2 int,
id_materia2 int,

constraint apodo8 foreign key (id_profesor2) references profesor (id_profesor),
constraint apodo9 foreign key (id_materia2) references materia (id_materia),


)

select * from carrera -- siempre hay que llamar la tabla y ejecurtarla
insert into carrera values (1, 'informatica',5) --se le isnertan los datos a la tabla

select * from alumno
insert into alumno values (12, 'jorge',12,3135129722,1)

select * from materia
insert into materia values (89, 'base de datos', 15)

select * from profesor
insert into profesor values (111, 'freddy moscoso', 'calle 65 # 65-56', 98574789)

select * from materiaprofesor
insert into materiaprofesor values (111, 89) --- duando es una tabla intermedia se debe insertar las 2 claves primarias de las foraneas que estan dentrod e la tabla intermedia

insert into profesor values (112, 'valeria grajales', 'cra 36 # 63-70', 10574789)

select id_alumno, ide_Carrera1 from alumno where nom_alumno='jorge' ---consultamos los campos que deseemos

--- consultar