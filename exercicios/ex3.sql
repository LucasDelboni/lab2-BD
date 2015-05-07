create or replace function ex3 (char) returns table( id_objeto_arte, titulo) as --> colocar para retornar uma view
select id_objeto_arte, titulo from objetos_arte where id_exposicoes = (
select id_exposicoes from exposicoes where nome=$1);
$$ language sql;

select ex3('O Modernismo' )-->o renascimento pode ser mudado para outra exposicao
--> o modernismo e exposaicao numero 2