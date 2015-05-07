create view ex1 as
select nome, count(*) from artista, objetos_arte where artista.id_artista = objetos_arte.id_artista
group by artista.nome