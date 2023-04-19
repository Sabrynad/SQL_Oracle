--valor Inicial
CREATE SEQUENCE seq_aluno1
START WITH 60

--Qtde a Inclementar
INCREMENT BY 5

--valor Minimo
MINVALUE 60

--valor Maximo
MAXVALUE 250

--Nao guarda em cache faixa de
--valores
NOCACHE
--

INSERT INTO taluno(cod_aluno, nome)
VALUES (seq_aluno1.NEXTVAL,'master training');

--Poximo values
SELECT * FROM taluno

COMMIT;

SELECT * FROM user_sequences;

--Valor Atual
SELECT seq_aluno1.CURRVAL FROM dual;

ALTER SEQUENCE seq_aluno1
MAXVALUE 500;

--Alterar Valor da Sequencia
DROP SEQUENCE seq_aluno1;
CREATE TABLE seq_aluno START WITH 80;

COMMIT;


--Idices
SELECT nome FROM taluno
WHERE nome LIKE '%MA%';

CREATE INDEX ind_taluno_nome1 ON taluno (nome);

--
CREATE INDEX ind_talu_nomecidade
ON taluno (nome, cidade);

SELECT nome FROM taluno
WHERE nome LIKE '%MA%' AND cidade LIKE '%A%';

SELECT * FROM user_indexes;

DROP INDEX ind_talu_nomecidade;


--Sinonimos

CREATE SYNONYM alu FOR taluno;

SELECT * FROM alu;

COMMIT;
