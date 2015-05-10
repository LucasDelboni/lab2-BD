--trigger Remocao
DROP TRIGGER remova_pintura ON PINTURA;
DROP FUNCTION remova_pintura();

CREATE FUNCTION remova_pintura() RETURNS trigger AS $$
	BEGIN
		
		DELETE FROM TIPO
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		DELETE FROM COLECAO_PERMANENTE
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		DELETE FROM EMPRESTADO
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		DELETE FROM PROPRIEDADE
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte; 
		
		DELETE FROM OBJETOS_ARTE
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER remova_pintura AFTER DELETE ON PINTURA
FOR EACH ROW EXECUTE PROCEDURE remova_pintura();

--trigger Atualizacao NumId

DROP TRIGGER atualiza_pintura ON PINTURA;
DROP FUNCTION atualiza_pintura();

CREATE FUNCTION atualiza_pintura() RETURNS trigger AS $$
	BEGIN
		UPDATE PINTURA
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		UPDATE FROM TIPO
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		UPDATE FROM COLECAO_PERMANENTE
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		UPDATE FROM EMPRESTADO
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		UPDATE FROM PROPRIEDADE
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte; 
		
		UPDATE FROM OBJETOS_ARTE
		SET Id_Objeto_Arte = NEW.Id_Objeto_Arte
		WHERE Id_Objeto_Arte = OLD.Id_Objeto_Arte;
		
		RETURN NULL;
	END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER atualiza_pintura AFTER UPDATE ON PINTURA
FOR EACH ROW EXECUTE PROCEDURE atualiza_pintura();
