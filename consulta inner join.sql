--inner join
create database escuela

use escuela

create table carrera(

Clave_c int,

nom_c varchar(50),

durac_c float,

constraint pk_cc primary key (clave_c))
insert into carrera values(1, 'Medicina', 5)
insert into carrera values(1, 'Arquelogìa', 5)

create table materia(

clave_m int,

nom_m varchar(50),

cred_m float,

constraint pk_cm primary key (clave_m))
insert into materia values(11, 'Base de Datos', 15)
insert into materia values(12, 'Historia', 25)

create table profesor(clave_p int,

nom_p varchar(150), dir_p varchar(200),

tel_p bigint, hor_p datetime,

constraint pk_cp primary key (Clave_p))
insert into profesor values(111,'Luis Fernando Zapata','centro', 988855,  6)
insert into profesor values(112,'Valeria grajales','centro', 988855,  6)

-------Tabla alumno con clave foranea

create table alumno(

mat_alu int,

nom_alu varchar(150),

edad_alu int,

sem_alu int,

gen_alu varchar(10),

clave_c1 int,

constraint pk_calu primary key (mat_alu), constraint fk_fc1 foreign key (clave_c1) references carrera(clave_c))
insert into alumno values(666,' Santiago', 25, 6, 'Masculino',1)
insert into alumno values(667,' Sandra', 25, 6, 'Femenino',1)
------tablas intermedias alumno-profesor

create table alu_pro(

mat_alu1 int,

clave_p1 int,

constraint fk_falu1 foreign key(mat_alu1) references alumno (mat_alu),

constraint fk_fp1 foreign key (clave_p1) references profesor (clave_p))
insert into alu_pro values(666,111)

-------tabla intermedia materia-alumno

create table mat_alu(

clave_m1 int,

mat_alu2 int,

constraint fk_fm1 foreign key (clave_m1) references materia (clave_m),

constraint fk_falu2 foreign key (mat_alu2) references alumno(mat_alu) )
insert into mat_alu values(11, 666)
insert into mat_alu values(12, 667)
------------tabla intermedia materia profesor

create table mat_pro(

clave_m2 int,

clave_p2 int,

constraint fk_fm2 foreign key (clave_m2) references materia(clave_m),

constraint fk_fp2 foreign key (clave_p2) references profesor (clave_p))
insert into mat_pro values(11, 111)
use escuela
select * from profesor

--inner join
--Consultar informmaciòn del alumno y verificar cual es la carrera que estudia
select nom_alu, edad_alu, sem_alu, nom_c from alumno 
inner join carrera  on alumno.clave_c1= carrera.Clave_c

--Realizar la consulta anterior y debe de integrar el nombre del profesor
select nom_alu, edad_alu, sem_alu, nom_c, nom_p from alumno
inner join carrera  on alumno.clave_c1= carrera.Clave_c
inner join alu_pro on alu_pro.mat_alu1= alumno.mat_alu
inner join profesor on profesor.clave_p= alu_pro.clave_p1

--Realizar la consulta anterior y debe de integrar el nombre de la materia
select nom_alu, edad_alu, sem_alu, nom_c, nom_p, nom_m  from alumno 
inner join carrera  on alumno.clave_c1= carrera.Clave_c
inner join alu_pro on alu_pro.mat_alu1= alumno.mat_alu
inner join profesor on profesor.clave_p= alu_pro.clave_p1
inner join mat_alu on mat_alu.mat_alu2= alumno.mat_alu
inner join materia on materia.clave_m= mat_alu.clave_m1
