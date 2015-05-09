create table OBJETOS_ARTE (
     Id_Objeto_Arte numeric(5) not null,
	 Id_Artista numeric(5),
     Ano numeric(4),
     Titulo char(200) not null,
     Descricao char(1000) not null,
     Pais_Cultura char(40) not null,
     Periodo char(40) not null,
     Id_Exposicoes numeric(5),
     constraint ID_OBJETOS_ARTE_ID primary key (Id_Objeto_Arte));

create table ARTISTA (
     Nome char(40) not null,
     Id_Artista numeric(5) not null,
     DataNasc date not null,
     DataMorte date,
     PaisOrigem char(40) not null,
     Periodo char(40) not null,
     EstiloPrincipal char(40) not null,
     Descricao char(500) not null,
     constraint Id_Artista primary key (Id_Artista));

create table COLECAO_PERMANENTE (
     Id_Objeto_Arte numeric(5) not null,
     DataAquisicao date not null,
     EmExposicao boolean not null,
     Custo numeric(12,2) not null,
     constraint FKPRO_COL_ID primary key (Id_Objeto_Arte));

create table COLECOES_EXTERNAS (
     Id_Colecoes_Ex numeric not null,
     Nome char(40) not null,
     Tipo char(40) not null,
     Descricao char(400) not null,
     Endereco char(100) not null,
     Telefone numeric(13) not null,
     PessoaContato char(40) not null,
     constraint ID_ID primary key (Id_Colecoes_Ex));

create table EMPRESTADO (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     DataEmprestimo date not null,
     DataDevolucao date not null,
     Id_Colecoes_Ex numeric(10) not null,
     constraint FKPRO_EMP_ID primary key (Id_Objeto_Arte));

create table ESCULTURA (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     Material char(40) not null,
     Altura numeric(3,2) not null,
     Peso numeric(5,3) not null,
     constraint FKTIP_ESC_ID primary key (Id_Objeto_Arte));

create table EXPOSICOES (
     Id_Exposicoes numeric(5) not null,
     Nome char(40) not null,
     DataInicio date not null,
     DataFinal date not null,
     constraint ID_EXPOSICOES_ID primary key (Id_Exposicoes));

create table OUTROS (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     Tipo char(40) not null,
     constraint FKTIP_OUT_ID primary key (Id_Objeto_Arte));

create table PINTURA (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     TipoTinta char(40) not null,
     Suporte char(40) not null,
     constraint FKTIP_PIN_ID primary key (Id_Objeto_Arte));

create table PROPRIEDADE (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     EMPRESTADO numeric(5),
     COLECAO_PERMANENTE numeric(5),
     constraint FKRELACAO_PROPRIEDADE_ID primary key (Id_Objeto_Arte));

create table TIPO (
     Id_Objeto_Arte numeric(5) not null REFERENCES OBJETOS_ARTE ON DELETE CASCADE,
     Estilo char(40) not null,
     PINTURA numeric(5),
     OUTROS numeric(5),
     ESCULTURA numeric(5),
     constraint FKRELACAO_TIPO_ID primary key (Id_Objeto_Arte));