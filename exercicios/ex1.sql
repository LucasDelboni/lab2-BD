--Criar uma view que apresente o nome do artista e o número de objetos de arte criados por ele. 
--Depois a use para responder a consulta “Apresente o nome e o número de objetos de arte criados pelos artistas de origem Italiano”
create view ex1 as
select nome, count(*) from artista, objetos_arte where artista.id_artista = objetos_arte.id_artista
group by artista.nome;

select artista.nome, count from ex1, artista where artista.nome = ex1.nome and artista.paisorigem='Italia'
