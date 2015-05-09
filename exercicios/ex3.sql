-->Crie uma outra função que dado o nome de uma coleção retorne o NumId e Título das pinturas emprestadas ao museu por essa coleção.

create or replace function ex3 (char) returns table (id_objeto_arte numeric, titulo char) as $$
select id_objeto_arte, titulo from objetos_arte where id_objeto_arte = (
-->pegar id_objeto_arte a partir da id_colecoes
select id_colecoes_ex from colecoes_externa where nome=$1)
--> pegar id_colecao das colecoes permanentes tambem
;
$$ language sql;

select ex3('Colecao Renascimento' )-->o renascimento pode ser mudado para outra exposicao