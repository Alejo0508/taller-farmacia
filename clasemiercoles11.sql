use empresa
select * from cliente
--- personas quew tengan 20 años

select * from cliente where antiguedad= '20años'
--- realizar un consulta que comience por la letra j
select * from cliente where nom_cliente like 'J%'
select * from cliente where nom_cliente like '%N'
---Donde muestre un nombre en particular
select * from cliente where nom_cliente like 'William'
--- Muestre en forma ascendente
select * from cliente order by nom_cliente asc
---Muestre en forma descendente
select * from cliente order by nom_cliente desc

---enpleo de la clausala count contar y agupar
select * from devoluciones
select nom_devolucion , count(nom_devolucion) as cantidad from devoluciones
group by nom_devolucion

---quitando group by
select  nom_devolucion , count(nom_devolucion) as cantidad from devoluciones
--having para el filtro
select nom_devolucion , count(nom_devolucion) as cantidad from devoluciones
group by nom_devolucion having count(*)>2

-- sumas
select * from devoluciones
select sum(id_devolucion) as suma from devoluciones
--- antes del between
select nom_devolucion, personaquienrecibe  from devoluciones
where id_devolucion>= 1 and id_devolucion<=3 order by nom_devolucion
---con el between
select nom_devolucion, personaquienrecibe  from devoluciones
where id_devolucion between 1 and 3 order by nom_devolucion

---para mostrar una información en partícular
select * from devoluciones where(personaquienrecibe in('Susana Zapata'))
--para no mostrar
select * from devoluciones where(personaquienrecibe not in('Susana Zapata'))
---Para mostrar un numero de registros
select top 2 * from  devoluciones
---distinc para eleminat repeticiones
select distinct personaquienrecibe from devoluciones order by personaquienrecibe
select distinct personaquienrecibe from devoluciones 
---promedio avg
select avg (id_devolucion) as promedio from devoluciones 
--- minimo
select min (id_devolucion) from devoluciones
select max(id_devolucion) from devoluciones
-- coloquemos un nombre de columnas
select min(id_devolucion) as minimo from devoluciones
select max (id_devolucion) as maximo from devoluciones
