
--Insercao Exposicoes

INSERT INTO exposicoes(id_exposicoes, nome, datainicio, datafinal)
    VALUES (00001, 'O renascimento', '01/10/2010', '30/10/2010');

INSERT INTO exposicoes(id_exposicoes, nome, datainicio, datafinal)
    VALUES (00002, 'O Modernismo', '13/02/2004', '28/02/2004');

INSERT INTO exposicoes(id_exposicoes, nome, datainicio, datafinal)
    VALUES (00003, 'Arte no Novo Milenio', '01/01/2000', '28/02/2000');

INSERT INTO exposicoes(id_exposicoes, nome, datainicio, datafinal)
    VALUES (00004, 'Novas Eras', '11/10/1993', '20/12/1993');

--Insercao Artista

INSERT INTO artista(nome, id_artista, datanasc, datamorte, paisorigem, periodo, estiloprincipal, descricao)
    VALUES ('Leonardo da Vinci', 00001, '15/04/1452', '02/05/1519', 'Italia', 'Renascimento', 'Pintura Renascentista', 'Leonardo di Ser Piero da Vinci, ou simplesmente Leonardo da Vinci');

INSERT INTO artista(nome, id_artista, datanasc, datamorte, paisorigem, periodo, estiloprincipal, descricao)
    VALUES ('Michelangelo di Lodovico', 00002, '06/03/1475', '18/02/1564', 'Italia', 'Renascimento', 'Pintura Renascentista', 'foi um pintor, escultor, poeta e arquiteto italiano');
	
INSERT INTO artista(nome, id_artista, datanasc, datamorte, paisorigem, periodo, estiloprincipal, descricao)
    VALUES ('Tarsila do Amaral', 00003, '01/09/1886', '09/12/1973', 'Brasil', 'Modernismo', 'Pintura Modernista', 'Tarsila');
	
INSERT INTO artista(nome, id_artista, datanasc, datamorte, paisorigem, periodo, estiloprincipal, descricao)
    VALUES ('Emiliano Cavalcanti', 00004, '06/09/1897', '25/08/1976', 'Brasil', 'Modernismo', 'Pintura Modernista', 'um pintor modernista, desenhista, ilustrador e caricaturista brasileiro e muralista');

INSERT INTO artista(nome, id_artista, datanasc, datamorte, paisorigem, periodo, estiloprincipal, descricao)
    VALUES ('Clarice Lispector', 00005, '10/12/1920', '09/12/1920', 'Ucrania', 'Modernismo', 'Escritora Modernista', 'Clarice Lispector foi uma escritora e jornalista nascida na Ucrânia e naturalizada brasileira');
	
--Insercao Objetos_ARte	
	
INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00001, 000001, 1506, 'Mona Lisa', 'A mais notavel obra de Leonardo a Vinci','Italia', 'Renascimento', 00001, 192810002.03);
	
INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00002, 000002, 1504, 'Davi', 'A grande escultura','Italia', 'Renascimento', 00001, 193810002.03);

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00003, 000002, 1541, 'O Juízo Final', 'um célebre afresco canônico','Italia', 'Renascimento', 00001, 9810002.03);

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00004, 000003, 1928, 'Abaporu', 'Pintura do Modernismo','Brasil', 'Modernismo', 00002, 9110283902);
	
INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00005, 000004, 1940, 'O nascimento de Venus', 'uma releitura da obra de Sandro Botticelli','Brasil', 'Modernismo', 00002, 1210002.03);
	
INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00006, 000005, 1943, 'Perto do Coração Selvagem', 'o romance de estreia de Clarice Lispector, o manuscrito','Brasil', 'Modernismo', 00002, 410002.03);

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00007, NULL, 2001, 'Coração Selvagem', 'Escutura Realista','Brasil', 'Desconhecido', 00004, 4102.03);	

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00008, NULL, 2000, 'Amar', 'Fotos sobre o tema','Brasil', 'Desconhecido', 00004, 5103.03);

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00009, NULL, 1980, 'A mao', 'Pintura Real','Brasil', 'Desconhecido', 00004, 3203.03);

INSERT INTO objetos_arte(id_objeto_arte, id_artista, ano, titulo, descricao, pais_cultura, periodo, id_exposicoes, Custo)
    VALUES (00010, NULL, 1985, 'Fazenda', 'quadro que retrata uma fazenda','Brasil', 'Desconhecido', 00004, 1203.03);	
	
--Insercao TIPO
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00001, 'Renascimento', 00001, NULL, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00002, 'Renascimento', NULL, NULL, 00002);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00003, 'Renascimento', 00003, NULL, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00004, 'Modernismo', 00004, NULL, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00005, 'Modernismo', 00005, NULL, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00006, 'Modernismo', NULL, 00006, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00007, 'Desconhecido', NULL, NULL, 00007);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00008, 'Desconhecido', NULL, 00008, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00009, 'Desconhecido', 00009, NULL, NULL);
	
INSERT INTO tipo(id_objeto_arte, estilo, pintura, outros, escultura)
    VALUES (00010, 'Desconhecido', 00010, NULL, NULL);
	
--Insercao PINTURA
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00001, 'Oleo', 'Madeira');
	
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00003, 'Oleo', 'Madeira');
	
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00004, 'Oleo', 'Madeira');
	
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00005, 'Oleo', 'Madeira');
	
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00009, 'Oleo', 'Madeira');
	
INSERT INTO pintura(id_objeto_arte, tipotinta, suporte)
    VALUES (00010, 'Oleo', 'Madeira');
	
--Insercao Escultura
INSERT INTO escultura(id_objeto_arte, material, altura, peso)
    VALUES (00002, 'pedra', 5.5, 50.5);
	
INSERT INTO escultura(id_objeto_arte, material, altura, peso)
    VALUES (00007, 'carne', 1.5, 10.5);
	
--Insercao Outros

	INSERT INTO outros(id_objeto_arte, tipo)
		VALUES (00006, 'Manuscrito');
		
	INSERT INTO outros(id_objeto_arte, tipo)
		VALUES (00008, 'Fotografia');

--Insercao Propriedade

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00001, 00001, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00002, 00002, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00003, 00003, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00004, NULL, 00004);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00005, NULL, 00005);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00006, NULL, 00006);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00007, 00007, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00008, 00008, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00009, 00009, NULL);

INSERT INTO propriedade(id_objeto_arte, emprestado, colecao_permanente)
VALUES (00010, 00010, NULL);

--Insercao ColecaoPermanente

INSERT INTO colecao_permanente(id_objeto_arte, dataaquisicao, emexposicao)
    VALUES (00004, '02/03/2002', true);
	
INSERT INTO colecao_permanente(id_objeto_arte, dataaquisicao, emexposicao)
    VALUES (00005, '02/03/2002', true);
	
INSERT INTO colecao_permanente(id_objeto_arte, dataaquisicao, emexposicao)
    VALUES (00006, '02/03/2002', true);
	
--Insercao Colecoes_Externas
	
INSERT INTO colecoes_externas(id_colecoes_ex, nome, tipo, descricao, endereco, telefone, pessoacontato)
    VALUES (00001,'Colecao Renascimento', 'museu', 'Obras do Museu Renascentista', 'rue de Rivoli, 75058 Paris, Franca', 33140205050, 'Jean-Luc Martinez');

INSERT INTO colecoes_externas(id_colecoes_ex, nome, tipo, descricao, endereco, telefone, pessoacontato)
    VALUES (00002,'Colecao Anonima', 'museu', 'Obras Independentes', 'Rua Brasil', 23344050, 'Kuis Pauh');

	
--Insercao Emprestado
	
INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00001,'01/09/2014' , '01/11/2016', 00001);

INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00002,'01/09/2014' , '01/11/2016', 00001);

INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00003,'01/09/2014' , '01/11/2012', 00001);
	
INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00007,'01/09/2012' , '01/11/2016', 00002);
	
INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00008,'01/09/2012' , '01/11/2017', 00002);
	
INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00009,'01/09/2012' , '01/11/2016', 00002);
	
INSERT INTO emprestado(id_objeto_arte, dataemprestimo, datadevolucao, id_colecoes_ex)
    VALUES (00010,'01/09/2012' , '01/11/2017', 00002);

