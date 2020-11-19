create database reportematricula

use reportematricula


create table especialidad (

codigo_especialidad int,
especialidad varchar,

constraint codico_especialidadprimario primary key (codigo_especialidad)

)

create table seccion (

codigo_seccion int,
nombre_seccion varchar (50),

constraint codigo_seccionprimario primary key (codigo_Seccion)

)

create table alumno (

codigo_alumno int,
nombre_alumn varchar (50),
codigo_especialidad1 int,

constraint codigo_alumnoprimario primary key (codigo_alumno),
constraint codigo_especialidad1foraneo foreign key (codigo_especialidad1) references especialidad (codigo_especialidad)

)

create table oficina (

codigo_oficina int,
nombre_oficina varchar (50),

constraint codigo_oficinaprimario primary key (codigo_oficina)

)

create table docente (

codigo_docente int,
nombre_docente varchar,
codigo_oficina1 int,

constraint codigo_docenteprimario primary key (codigo_docente),
constraint codigo_oficina1foraneo foreign key (codigo_oficina1) references oficina (codigo_oficina)

)

create table curso (

codigo_curso int,
nombre_curso varchar (50),
codigo_docente1 int,

constraint codigo_cursoprimario primary key (codigo_curso),
constraint codigo_docenteforaneo foreign key (codigo_docente1) references docente (codigo_docente)

)


--- tablas intermedias

create table especialidadcurso (

codigo_especialidad2 int,
codigo_curso1 int,

constraint codigo_especialidad2foraneo foreign key (codigo_especialidad2) references especialidad (codigo_especialidad),
constraint codigo_curso1foraneo foreign key (codigo_curso1) references curso (codigo_curso)

)

create table oficinaseccion (

codigo_oficina2 int,
codigo_seccion1 int,

constraint codigo_oficinaforaneo foreign key (codigo_oficina2) references oficina (codigo_oficina),
constraint codigo_seccionforaneo foreign key (codigo_seccion1) references seccion (codigo_seccion)
)

