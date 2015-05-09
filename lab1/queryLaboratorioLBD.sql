--1.Adicione um campo Custo nos objetos de arte e remova esse campo dos objetos permanentes.
ALTER TABLE OBJETOS_ARTE ADD COLUMN Custo numeric(12,2);
ALTER TABLE COLECAO_PERMANENTE DROP COLUMN CUSTO;

--2. Listar os objetos de arte (Numid e título) de artistas desconhecidos
SELECT id_Objeto_Arte, Titulo FROM OBJETOS_ARTE  WHERE Id_artista IS NULL;

--3.  Listar os objetos de arte (Numid e título) expostos em todas as exposições de 2010.
SELECT id_Objeto_Arte, Titulo FROM OBJETOS_ARTE AS OA, EXPOSICOES AS E 
WHERE OA.Id_exposicoes = E.Id_exposicoes 
AND (E.DataInicio BETWEEN DATE '2010/01/01' AND DATE '2010/12/31' )
AND (E.DataFinal BETWEEN DATE '2010/01/01' AND DATE '2010/12/31' )
 
--4.  Listar os objetos de arte (Numid, título, coleção) criados pelo autor X (Nome).
SELECT OA.id_Objeto_Arte, OA.Titulo, E.Nome FROM OBJETOS_ARTE AS OA, EXPOSICOES AS E, ARTISTA AS A
WHERE OA.Id_exposicoes = E.Id_exposicoes
AND OA.Id_Artista = A.Id_Artista
AND A.Nome = 'Leonardo da Vinci'; --X(pode mudar o nome aqui)
 
--5. Listar as coleções (Nome e típo) que contêm objetos de arte produzidos pelo artista X.
SELECT CE.Nome, CE.Tipo FROM OBJETOS_ARTE AS OA, COLECOES_EXTERNAS AS CE, EMPRESTADO AS E, ARTISTA AS A
WHERE E.Id_Colecoes_Ex = CE.Id_Colecoes_Ex
AND OA.Id_Objeto_Arte = E.Id_Objeto_Arte
AND OA.Id_Artista = A.Id_Artista 
AND A.Nome = 'Leonardo da Vinci'; -- X(pode mudar o nome aqui)
 
--6.  Qual é o custo total da coleção permanente do museu?
SELECT SUM(OA.CUSTO)  FROM COLECAO_PERMANENTE AS CP, OBJETOS_ARTE AS OA 
WHERE  CP.id_Objeto_Arte = OA.id_Objeto_Arte;
 
--7.  Quais são os objetos (Numid e título) da coleção permanente cujo custo é maior que o custo médio de todos os objetos do museu?
SELECT OA.id_Objeto_Arte, OA.Titulo FROM COLECAO_PERMANENTE AS CP, OBJETOS_ARTE AS OA 
WHERE  CP.id_Objeto_Arte = OA.id_Objeto_Arte
AND OA.Custo > ALL (SELECT AVG(CUSTO) FROM OBJETOS_ARTE);

--8.  Quais são as coleções (sem considerar a permanente) com o maior número de objetos de arte emprestados?
SELECT Id_Colecoes_Ex, Nome
FROM	(SELECT COUNT (E.Id_COLECOES_Ex) AS contador, E.Id_COLECOES_Ex, CE.Nome 
		 FROM EMPRESTADO AS E JOIN COLECOES_EXTERNAS AS CE ON E.Id_COLECOES_Ex = CE.ID_COLECOES_Ex
		 WHERE E.DataDevolucao >= now()
		 GROUP BY E.Id_COLECOES_Ex, CE.NOme
		 ORDER BY contador DESC
		 LIMIT 1) AS MaiorNuEmprestado;
		 
--9.  Quais são as coleções (sem considerar a permanente) com o maior custo total de objetos emprestados?
SELECT Id_Colecoes_Ex, Nome
FROM	(SELECT SUM(CUSTO) AS somador, E.Id_COLECOES_Ex, CE.Nome 
		 FROM EMPRESTADO AS E 
		 JOIN COLECOES_EXTERNAS AS CE ON E.Id_COLECOES_Ex = CE.ID_COLECOES_Ex
		 JOIN OBJETOS_ARTE AS OA ON E.Id_OBJETO_ARTE = OA.Id_OBJETO_ARTE
		 WHERE E.DataDevolucao >= now()
		 GROUP BY E.Id_COLECOES_Ex, CE.NOme
		 ORDER BY somador DESC
		 LIMIT 1) AS MaiorSomaCusto;

--10. Quais são as coleções com maior número de objetos emprestados que o número de objetos da coleção permanente?
SELECT Id_Colecoes_Ex, Nome
FROM	(
		SELECT COUNT (E.Id_COLECOES_Ex) AS contador, E.Id_COLECOES_Ex, CE.Nome 
		FROM EMPRESTADO AS E JOIN COLECOES_EXTERNAS AS CE 
		ON E.Id_COLECOES_Ex = CE.ID_COLECOES_Ex
		WHERE E.DataDevolucao >= now()
		GROUP BY E.Id_COLECOES_Ex, CE.NOme
		ORDER BY contador DESC
		) AS MaiorNuEmprestado
WHERE	MaiorNuEmprestado.contador >  (SELECT COUNT (Id_Objeto_Arte)
									   FROM COLECAO_PERMANENTE);

--11. Quais são as coleções que tem contribuído em todas as exposições de 2010?
SELECT Id_Colecoes_Ex, Nome
FROM COLECOES_EXTERNAS
WHERE Id_Colecoes_Ex IN (
						SELECT Id_Colecoes_Ex
						FROM EXPOSICOES AS EX, EMPRESTADO AS EM, OBJETOS_ARTE AS OA 
						WHERE EX.Id_Exposicoes = OA.Id_Exposicoes
							AND EM.Id_OBJETO_ARTE = OA.Id_OBJETO_ARTE
							AND (EX.DataInicio BETWEEN DATE '01/01/2010' AND DATE '31/12/2010' )
							AND (EX.DataFinal BETWEEN DATE '01/01/2010' AND DATE '31/12/2010' )
						);
						 

--12. Remover todos os objetos emprestados da coleção Y.
-- Como a tabela OBJETOS_ARTE tem um comando ON CASCADE em seu id primário, as outras inserções de objetos no banco de dados serão tratadas automaticamente
-- Para esse exercício, assumimos que ´Y´ é o id da coleção que deve ser afetada
DELETE FROM objetos_arte WHERE id_objeto_arte IN (
	SELECT id_objeto_arte FROM emprestado WHERE id_colecoes_ex = '1' --Y (pode mudar o nome aqui)
)

--13. Transferir o objeto de título X da coleção Y para coleção permanente
INSERT INTO COLECAO_PERMANENTE (id_objeto_arte,dataaquisicao,emexposicao) (
	SELECT OBJETOS_ARTE.id_objeto_arte, current_date, TRUE FROM objetos_arte 
	INNER JOIN emprestado ON objetos_arte.id_objeto_arte = emprestado.id_objeto_arte 
	WHERE OBJETOS_ARTE.titulo = 'Amar'--X (pode mudar o nome aqui)
	AND emprestado.id_colecoes_ex = '2'--Y (pode mudar o nome aqui)
);
DELETE FROM emprestado where id_objeto_arte = (SELECT objetos_arte.id_objeto_arte FROM objetos_arte 
	INNER JOIN emprestado ON objetos_arte.id_objeto_arte = emprestado.id_objeto_arte 
	WHERE OBJETOS_ARTE.titulo = 'Amar'); --X (pode mudar o nome aqui)


