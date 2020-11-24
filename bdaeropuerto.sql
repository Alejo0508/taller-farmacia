create database aeropuerto
use aeropuerto

create table piloto(
ide_piloto int unique,
nombrepiloto varchar(5) not null,
horasvuelo float not null,
constraint apdopiloto primary key(ide_piloto))

insert into piloto values(1,'Juan',30)
insert into piloto values(2,'Pepe',100)
insert into piloto values(3,'Leo',40)
insert into piloto values(4,'ana',1000)
insert into piloto values(5,'ana',50)

create table tripulacion(
ide_tripulacion int unique,
nombre varchar(60) not null,
constraint apodotripulacion primary key (ide_tripulacion))

insert into tripulacion values (01,'Consquistadores')
insert into tripulacion values (02,'Aventureros')
insert into tripulacion values (03,'Rangers')


create table avion(
placa_avion int unique,
nombre_avion varchar(60)
constraint apodoavion primary key (placa_avion))

select * from avion

insert into avion values (100,'Boing A330')
insert into avion values (200,'Boing A530')
insert into avion values (300,'Boing A747')
insert into avion values (400,'Boing A852')

create table base(
ide_base int unique,
nombre_base varchar(60) not null,
constraint ide_base primary key (ide_base))

insert into base values (1,'Base A')
insert into base values (2,'Base B')
insert into base values (3,'Base C')
insert into base values (4,'Base D')

create table vuelo(
ide_vuelo int unique,
origen varchar(60) not null,
destino varchar(60) not null,
hora_deter datetime not null,
placa_avion1 int,
constraint apodovuelo primary key (ide_vuelo),
constraint apodovuelo_placa foreign key(placa_avion1) references avion (placa_avion))

insert into vuelo values(1,'Medellin','Bogota','2020-11-03T09:39:04',100)
insert into vuelo values(2,'Medellin','San Andres','2020-11-03T14:39:04',200)
insert into vuelo values(3,'Medellin','berlin','2020-11-03T14:39:04',200)
insert into vuelo values(4,'Medellin','Moscu','2020-11-03T14:39:04',400)

create table piloto_vuelo(
ide_piloto1 int,
ide_vuelo1 int,
constraint apodopiloto_vuelo foreign key(ide_piloto1) references piloto(ide_piloto),
constraint apodovuelo_piloto foreign key(ide_vuelo1) references vuelo(ide_vuelo))

insert into piloto_vuelo values(1,1)
insert into piloto_vuelo values(2,2)
insert into piloto_vuelo values(3,3)
insert into piloto_vuelo values(4,4)

select * from piloto_vuelo

create table tripulacion_vuelo(
ide_tripulacion1 int,
ide_vuelo2 int,
constraint apodotripu_vuelo foreign key(ide_tripulacion1) references tripulacion (ide_tripulacion),
constraint apodovuelo_tripu foreign key(ide_vuelo2) references vuelo(ide_vuelo))

insert into tripulacion_vuelo values(01,1)
insert into tripulacion_vuelo values(02,2)
insert into tripulacion_vuelo values(03,4)
insert into tripulacion_vuelo values(03,3)


select * from tripulacion_vuelo

create table avion_base(
ide_base1 int,
placa_avion1 int,
constraint apodoavion_base foreign key(ide_base1) references base (ide_base),
constraint apodobase_avion foreign key(placa_avion1) references avion (placa_avion))
insert into avion_base values (1,100)
insert into avion_base values (2,100)
insert into avion_base values (3,400)
insert into avion_base values (4,200)
insert into avion_base values (4,300)


---filtro para traer valores no repetidos
select distinct nombrepiloto from piloto
---traer en un orden especifico
select * from piloto order by nombrepiloto, horasvuelo
---modificar informacion
update piloto set nombrepiloto='ani' where ide_piloto=5
---borrar informacion
delete from piloto where nombrepiloto='ani'
---agregar otro atributo o campo
alter table piloto add telefono varchar(10)
---renombrar columna a la tabla
exec sp_rename 'piloto.horasvuelo','horavuelos','column'
---borrar columna
alter table piloto drop column telefono


----------------------- usar el inner join-------------------------------

--- saber el tipo de avion, la placa y desde donde y cuando sale el vuelo a Moscu
select nombre_avion, placa_avion, destino, origen,hora_deter from avion

inner join vuelo  on avion.placa_avion = vuelo.placa_avion1

where destino = 'Moscu'


---saber el piloto que esta volando el avion a berlin
select nombre_avion, placa_avion, destino, origen,hora_deter, nombrepiloto from avion
inner join vuelo  on avion.placa_avion = vuelo.placa_avion1

inner join piloto_vuelo on piloto_vuelo.ide_vuelo1 = vuelo.ide_vuelo
inner join piloto on piloto.ide_piloto = piloto_vuelo.ide_piloto1

where destino = 'berlin'


---saber el piloto que esta volando el avion a bogota y que tripulacion va con el
select nombre_avion, placa_avion, destino, origen,hora_deter, nombrepiloto, nombre from avion

inner join vuelo  on avion.placa_avion = vuelo.placa_avion1

inner join piloto_vuelo on piloto_vuelo.ide_vuelo1 = vuelo.ide_vuelo
inner join piloto on piloto.ide_piloto = piloto_vuelo.ide_piloto1

inner join tripulacion_vuelo on tripulacion_vuelo.ide_vuelo2 = vuelo.ide_vuelo
inner join tripulacion on tripulacion.ide_tripulacion = tripulacion_vuelo.ide_tripulacion1

where destino = 'bogota'


---saber el piloto que esta volando el avion a san andres y que tripulacion va con el y en que base estaba el avion
select nombre_avion, placa_avion, destino, origen,hora_deter, nombrepiloto, nombre, nombre_base from avion

inner join vuelo  on avion.placa_avion = vuelo.placa_avion1

inner join piloto_vuelo on piloto_vuelo.ide_vuelo1 = vuelo.ide_vuelo
inner join piloto on piloto.ide_piloto = piloto_vuelo.ide_piloto1

inner join tripulacion_vuelo on tripulacion_vuelo.ide_vuelo2 = vuelo.ide_vuelo
inner join tripulacion on tripulacion.ide_tripulacion = tripulacion_vuelo.ide_tripulacion1

inner join  avion_base on avion_base.placa_avion1 = avion.placa_avion
inner join base on base.ide_base = avion_base.ide_base1

where destino = 'san andres'

