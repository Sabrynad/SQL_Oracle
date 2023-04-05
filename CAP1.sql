CREATE TABLE taluno
(
  cod_aluno INTEGER NOT NULL,
  nome VARCHAR(30),
  cidade VARCHAR2(30),
  cep VARCHAR(10),
  PRIMARY KEY (cod_aluno)
);

SELECT *FROM taluno;

INSERT INTO taluno(cod_aluno,nome,cidade,cep)
VALUES (1,'SABRYNA','GUARULHOS','8908000');

INSERT INTO taluno(cod_aluno,nome,cidade,cep)
VALUES (2,'TONY','SAO PAULO','4590000');

INSERT INTO taluno(cod_aluno,nome,cidade,cep)
VALUES (3,'MARIA','BAHIA','3467000');

INSERT INTO taluno(cod_aluno,nome,cidade,cep)
VALUES (4,'MARTA','ARUJA','2356000');

INSERT INTO taluno(cod_aluno,nome,cidade,cep)
VALUES (5,'GAEL','SANTO ANDRE','7869000');



CREATE TABLE tcurso
(
 cod_curso INTEGER NOT NULL PRIMARY KEY,
 nome VARCHAR(30),
 valor NUMBER(8,2),
 carga_horaria INTEGER
);

 SELECT * FROM tcurso;

INSERT INTO tcurso VALUES (1,'ORACLE SQL E PL/SQL',700,25);
INSERT INTO tcurso VALUES (2,'ORECLE DBA',500,25);
INSERT INTO tcurso VALUES (3,'JAVA FUNDAMENTOS',1200,100);
INSERT INTO tcurso VALUES (4,'REACT',600,50);



CREATE TABLE tcontrato
(
  cod_contrato INTEGER NOT NULL PRIMARY KEY,
  data DATE,
  cod_aluno INTEGER,
  total NUMBER(8,2),
  desconto NUMBER(5,2)
);

SELECT * FROM tcontrato;

INSERT INTO tcontrato VALUES (1,SYSDATE  ,1,700,15);
INSERT INTO tcontrato VALUES (2,SYSDATE  ,2,500,05);
INSERT INTO tcontrato VALUES (3,SYSDATE  ,3,1200,20);
INSERT INTO tcontrato VALUES (4,SYSDATE-5,2,600,05);
INSERT INTO tcontrato VALUES (5,SYSDATE-4,3,600,15);
INSERT INTO tcontrato VALUES (6,SYSDATE-3,4,700,10);
INSERT INTO tcontrato VALUES (7,SYSDATE-2,5,1200,20);

--Inserir uma coluna na tabela
ALTER TABLE tcontrato ADD col_teste VARCHAR(50);

SELECT * FROM tcontrato;

--Excluir coluna da tabela
ALTER TABLE tcontrato DROP COLUMN col_teste;

--Alterar nome de coluna
ALTER TABLE taluno RENAME COLUMN nome TO nome2;
ALTER TABLE taluno RENAME COLUMN nome2 TO nome;

--Excluir a tabela
DROP TABLE tabela;

--Sequence
CREATE SEQUENCE seq_curso START WITH 5;

INSERT INTO tcurso VALUES (seq_curso.NEXTVAL,'JAVA SCRIPT','800',48);

INSERT INTO tcurso VALUES (seq_curso.NEXTVAL,'PYTHON',1500,130);

SELECT * FROM tcurso;

--Data/hora atual
SELECT SYSDATE FROM dual;

--
SELECT * FROM dual;

--Valor atual da sequence
SELECT seq_aluno.CURRVAL FROM dual;


--Confirma alteracoes realizadas (insert, update e delete)
COMMIT;

SELECT * FROM taluno;

DELETE FROM taluno;

--Desfaz alteracoes realizadas (insert, update e delete)
ROLLBACK;

--Excluir registro da tabela
SELECT * FROM taluno;

DELETE FROM taluno;
WHERE cod_aluno = 5;

SELECT * FROM taluno;

ROLLBACK;

SELECT * FROM taluno WHERE nome = 'GAEL';

DELETE FROM taluno WHERE nome = 'GAEL';

COMMIT;

ROLLBACK;



CREATE TABLE tgestao
(
 cod_gestao INTEGER NOT NULL PRIMARY KEY,
 cod_curso INTEGER,
 cod_contrato INTEGER,
 pagamento NUMBER(8,2)
);

 SELECT * FROM tgestao


INSERT INTO tgestao VALUES (1, 1, 1, 500);
INSERT INTO tgestao VALUES (2, 1, 2, 700);
INSERT INTO tgestao VALUES (3, 2, 3, 1200);
INSERT INTO tgestao VALUES (4, 3, 4, 600);
INSERT INTO tgestao VALUES (5, 1, 5, 800);
INSERT INTO tgestao VALUES (6, 2, 6, 1500);


COMMIT;

SELECT * FROM tgestao


SELECT * FROM tcontrato
WHERE cod_contrato = 2;

--Alertar registro da tabela
UPDATE tcontrato SET
  desconto = 18
WHERE cod_contrato = 2;

SELECT * FROM taluno;

UPDATE taluno SET
 cidade = 'BAHIA'
WHERE Upper(cidade) = 'SALVADOR';


COMMIT;
