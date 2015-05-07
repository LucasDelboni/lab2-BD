create view ex1 as
select nome, count(*) from artista, objetos_arte where artista.id_artista = objetos_arte.id_artista
group by artista.nome

select artista.nome, count from ex1, artista where artista.nome = ex1.nome and artista.paisorigem='Italia'
