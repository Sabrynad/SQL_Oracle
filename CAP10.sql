TALUNO
cod_aluno - PK

TCONTRATO
cod_contrato - PK  -> Chave primaria -> PRIMARY KEY
cod_aluno - FK -> Chave primaria que vem de outra tabela

SELECT * FROM user_constraints;

SELECT * FROM all_constraints;

--Drop table tcidade
CREATE TABLE tcidade
(
 cod_cidade INTEGER NOT NULL,
 nome VARCHAR(40),
 CONSTRAINT pk_cidade PRIMARY KEY(cod_cidade)

);

CREATE TABLE tbairro
( cod_cidade INTEGER NOT NULL,
  cod_bairro INTEGER NOT NULL,
  nome VARCHAR(20),
  CONSTRAINT pk_bairro PRIMARY KEY(cod_cidade,cod_bairro)
);

   1 - 1
   1 - 2
   2 - 1
   2 - 2

--Add chave estrangeira
ALTER TABLE tbairro ADD CONSTRAINT fk_cod_cidade
FOREIGN KEY (cod_cidade)
REFERENCES tcidade (cod_cidade);


CREATE TABLE trua(
 cod_rua INTEGER NOT NULL,
 cod_cidade INTEGER,
 cod_bairro INTEGER,
 nome VARCHAR(40),
 CONSTRAINT pk_rua PRIMARY KEY(cod_rua)
 );


ALTER TABLE trua ADD CONSTRAINT fk_cidadebairro
FOREIGN KEY (cod_cidade, cod_bairro)
REFERENCES tbairro(cod_cidade, cod_bairro);


--DROP TABLES tpessoa (Fornec ou Cliente)
CREATE TABLE tpessoa (
  cod_pessoa INTEGER      NOT NULL,
  tipo       VARCHAR2(1)  NOT NULL,
  nome       VARCHAR2(30) NOT NULL,
  pessoa     VARCHAR2(1)  NOT NULL,
  cod_rua    INTEGER      NOT NULL,
  cpf        VARCHAR(15) ,
  CONSTRAINT pk_pessoa PRIMARY KEY (cod_pessoa)
);

--Unique Key
ALTER TABLE tpessoa ADD CONSTRAINT uk_cpf UNIQUE(cpf);


--ALTER TABLE TPESSOA DROP CONSTRAIT NOME_CONSTRAIT
ALTER TABLE tpessoa ADD CONSTRAINT fk_pessoa_rua
FOREIGN KEY (cod_rua)
REFERENCES trua;


--Cidade
INSERT INTO tcidade VALUES (1, 'Guarulhos');
INSERT INTO tcidade VALUES (2, 'Sao Paulo');
INSERT INTO tcidade VALUES (3, 'Salvador');
INSERT INTO tcidade VALUES (4, 'Aruja');

SELECT * FROM tcidade;

--Bairro
INSERT INTO tbairro VALUES (1,1, 'Centro');
INSERT INTO tbairro VALUES (2,1, 'Vila Mazzei');
INSERT INTO tbairro VALUES (3,1, 'Vale das Pedrinhas');
INSERT INTO tbairro VALUES (4,1, 'Mirante');

SELECT * FROM tbairro;

--Rua
INSERT INTO trua VALUES (1,1,1, 'Sete de setembro');
INSERT INTO trua VALUES (2,2,1, 'Avenida Mazzei');
INSERT INTO trua VALUES (3,3,1, 'Francisco Rosa');
INSERT INTO trua VALUES (4,4,1, 'Estrada dos Fernandes');

SELECT * FROM trua;

--Check
ALTER TABLE tpessoa ADD CONSTRAINT ck_pessoa_tipo
CHECK (tipo IN ('C','F'));


ALTER TABLE tpessoa ADD CONSTRAINT ck_pessoa_jf
CHECK (pessoa IN ('J','F'));


--Excluir constraint
ALTER TABLE tpessoa DROP CONSTRAINT uk_cpf;

--Unique key
ALTER TABLE tpessoa ADD CONSTRAINT uk_cpf UNIQUE (cpf);

DELETE FROM tpessoa;

INSERT INTO tpessoa VALUES (1,'C','Sabryna','F',1,'1234');
INSERT INTO tpessoa VALUES (2,'F','Tony','F',2,'123');
INSERT INTO tpessoa VALUES (3,'F','Geovana','F',3,'12345');
INSERT INTO tpessoa VALUES (4,'C','Marta','J',4,'123456');

SELECT * FROM tpessoa;


--Foreing key Drop
ALTER TABLE tpessoa DROP CONSTRAINT nome_da_constraint
CASCADE CONSTRAINT;

--Check
ALTER TABLE tcontrato
ADD CONSTRAINT ck_contrato_desconto
CHECK (desconto BETWEEN 0 AND 30);

SELECT * FROM tcontrato

--Desabilitando/Habilitando constraint
ALTER TABLE tpessoa DISABLE CONSTRAINT uk_cpf;
ALTER TABLE tpessoa ENABLE CONSTRAINT uk_cpf;

--Excluir Constraint
ALTER TABLE tpessoa
DROP CONSTRAINT uk_cpf


SELECT * FROM user_constraints
WHERE table_name = 'tpessoa';

--Constraints e as colunas associadas
SELECT constraint_name, column_name
FROM user_cons_columns
WHERE table_name = 'tpessoa';

--
SELECT object_name, object_type
FROM user_objects
WHERE object_name IN ('tpessoa')

SELECT * FROM tpessoa;

COMMIT;













