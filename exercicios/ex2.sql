--Crie uma função que dado o título de um objeto de arte retorne o nome do artista que o criou.

CREATE OR REPLACE function artista (varchar) RETURNS character AS $$
select nome from artista where id_artista= (
select id_artista from objetos_arte where objetos_arte.titulo=$1);
$$ language sql;

select artista('Abaporu') -->abaporu pode ser substituido por outro titulo