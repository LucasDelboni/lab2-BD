--Dados o esquema de Bancos de Dados do Museu. Suponha que à tabela de Coleções foi adicionado um atributo Custo_Total 
--que calcula a soma dos custos dos objetos de arte que pertencem a essa coleção e um atributo custo associado ao objeto emprestado. 
--Já que esse campo é calculado a partir de dados existentes, isto é, os custos dos objetos emprestados que pertencem a essa coleção, 
--ele precisa ser mantido para evitar inconsistências. Como você faria isso?


--Trigger CustoTotal
-- Para lidar com esse problema, adicionaremos um comando "ON CASCADE" para "DELETE" e "UPDATE" na tabela "EMPRESTADO" que replicará as mudanças para a tabela "OBJETOS_ARTE". Nesta, o seguinte trigger será ativado e garantirá a consistência dos custos calculados

CREATE FUNCTION atualiza_custo_total() RETURNS trigger AS $$
	BEGIN
		IF (TG_OP = 'DELETE') THEN
			UPDATE COLECOES_EXTERNAS 
			SET Custo_Total = Custo_Total - OLD.Custo
			WHERE Id_Colecoes_Ex IN (SELECT CE.Id_Colecoes_Ex
									FROM COLECOES_EXTERNAS AS CE , EMPRESTADO AS E
									WHERE CE.Id_Colecoes_Ex = E.Id_Colecoes_Ex AND E.id_Objeto_Arte = OLD.id_Objeto_Arte);
		END IF;
		IF (TG_OP = 'UPDATE') THEN
			UPDATE COLECOES_EXTERNAS 
			SET Custo_Total = (Custo_Total + (NEW.Custo - OLD.Custo)) 
			WHERE Id_Colecoes_Ex IN (SELECT CE.Id_Colecoes_Ex
									FROM COLECOES_EXTERNAS AS CE , EMPRESTADO AS E
									WHERE CE.Id_Colecoes_Ex = E.Id_Colecoes_Ex AND E.id_Objeto_Arte = OLD.id_Objeto_Arte);
		END IF;
		IF (TG_OP = 'INSERT') THEN
			UPDATE COLECOES_EXTERNAS 
				SET Custo_Total = Custo_Total + NEW.Custo
				WHERE Id_Colecoes_Ex IN (SELECT CE.Id_Colecoes_Ex
										FROM COLECOES_EXTERNAS AS CE , EMPRESTADO AS E
										WHERE CE.Id_Colecoes_Ex = E.Id_Colecoes_Ex AND E.id_Objeto_Arte = OLD.id_Objeto_Arte);
		END IF;
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualiza_custo_total AFTER INSERT OR UPDATE OR DELETE ON OBJETOS_ARTE
FOR EACH ROW EXECUTE PROCEDURE atualiza_custo_total();
