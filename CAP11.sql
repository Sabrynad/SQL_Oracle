CREATE OR REPLACE VIEW v_aluno
AS
  SELECT cod_aluno AS codigo, salario,
         nome AS aluno, cidade
  FROM taluno
  WHERE estado = 'SP';


--Usando a view
SELECT  * FROM v_aluno
ORDER BY aluno;


--
CREATE OR REPLACE VIEW v_contrato_top
AS
  SELECT cod_contrato, desconto
  FROM tcontrato
  WHERE desconto >= 10;

SELECT * FROM v_contrato_top;


--Nome e conteudo das views
SELECT view_name, text
FROM user_views;


--view com parametros de saida
CREATE OR REPLACE VIEW v_aluno2(cod, aluno, sal)
AS
  SELECT cod_aluno, nome, salario
  FROM taluno;

SELECT * FROM v_aluno2;



--View Complexa
CREATE OR REPLACE VIEW v_contrato
AS
  SELECT Trunc(data) AS data,
         Max (desconto) maximo,
         Avg (desconto) media,
         Count (*) qtde
  FROM tcontrato
  GROUP BY Trunc(data);


--
SELECT * FROM v_contrato;


--View Simples
CREATE OR REPLACE VIEW v_pessoa_f
AS
  SELECT cod_pessoa, tipo, nome, cod_rua AS rua
  FROM tpessoa
  WHERE tipo = 'F';

SELECT * FROM v_pessoa_f


--Exemplos de consulta usando view e tabela
SELECT pes.cod_pessoa AS codigo,
       pes.nome AS pessoa,
       cid.nome AS cidade,
       rua.nome AS rua
FROM v_pessoa_f pes, trua rua, tcidade cid
WHERE pes.rua = rua.cod_rua (+)
AND cid.cod_cidade = rua.cod_cidade
ORDER BY pes.nome;



--Operacao dml na view
CREATE OR REPLACE VIEW vcursos1000ck
AS
  SELECT cod_curso, nome, valor
  FROM tcurso
  WHERE valor = 1000
  WITH CHECK OPTION CONSTRAINT vcursos1000_ck;


INSERT INTO vcursos1000ck
          (cod_curso, nome, valor)
VALUES    (52,'teste y', 1000);


SELECT * FROM tcurso;


--Delete em view
SELECT * FROM v_aluno;
--
DELETE FROM v_aluno WHERE codigo = 3;


--Insert em view

SELECT * FROM taluno;

INSERT INTO v_aluno
VALUES (50, 500, 'Maria', 'NH');

COMMIT;


--Delete em View
--(nao pode fazer DML em view complexa)
DELETE FROM v_contrato;


--view somente leitura (nao permite DML)
CREATE OR REPLACE VIEW v_aluno3
AS
  SELECT cod_aluno codigo,
         nome aluno, cidade
  FROM taluno
  WHERE estado ='RJ'
  WITH READ ONLY;


--Nao pode execultar delete em view
--somente leitura
DELETE FROM v_aluno3;


--Excluindo visao
DROP VIEW v_aluno3;

COMMIT;


