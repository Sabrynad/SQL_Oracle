SELECT * FROM taluno
WHERE estado <> 'BA'
AND salario <= 800
ORDER BY salario DESC;

COMMIT;

INSERT INTO taluno (cod_aluno,nome,cidade)
VALUES (seq_aluno.NEXTVAL,'VALDO','ARRAIAL DO CABO');

INSERT INTO taluno (cod_aluno,nome,cidade)
VALUES (seq_aluno.NEXTVAL,'LAURA','BELO HORIZONTE');

SELECT * FROM taluno;


UPDATE taluno SET
estado = 'RJ', salario = 900, nome = 'MARIANA'
WHERE cod_aluno = 46;

UPDATE taluno SET
estado = 'MG'
WHERE cod_aluno = 47;


--
DELETE FROM taluno WHERE cod_aluno = 49;

--

SELECT estado, salario, nome FROM taluno
ORDER BY estado, salario DESC;

ALTER TABLE taluno ADD nascimento DATE DEFAULT SYSDATE -1500;

SELECT SYSDATE - SYSDATE - 20 FROM dual;

--
SELECT * FROM taluno

UPDATE taluno SET
nascimento = SYSDATE -10
WHERE cod_aluno = 3;


UPDATE taluno SET
nascimento = SYSDATE -100
WHERE cod_aluno = 47;

UPDATE taluno SET
nascimento = SYSDATE -300
WHERE cod_aluno = 1;

UPDATE taluno SET
nascimento = SYSDATE -800
WHERE cod_aluno = 4;


--
SELECT * FROM taluno

SELECT cod_aluno, nascimento, Trunc(nascimento), nome
FROM taluno
WHERE Trunc(nascimento) = '05/02/2019';


SELECT cod_aluno, nascimento, Trunc(nascimento), nome
FROM taluno
WHERE nascimento
   BETWEEN TO_DATE ('05/02/2019 15:00','DD/MM/YYYY HH24:MI')
   AND TO_DATE('05/02/2019 17:00','DD/MM/YYYY HH24:MI')


SELECT cod_contrato, data, total,
      desconto, desconto + 1000 AS calculo
FROM tcontrato
WHERE total <= desconto + 1000;

--
SELECT * FROM tcontrato;

--
UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 2;
--

SELECT * FROM tcontrato
WHERE desconto IS NULL;
--

SELECT * FROM tcontrato
WHERE desconto IS NOT NULL;
--

SELECT * FROM tcontrato
WHERE desconto BETWEEN 0 AND 10;


--NLV 0 ->Colunas com valor NULL
--BETWEEN -> Entre
SELECT cod_contrato, total, desconto, NVL(desconto,0)
FROM tcontrato
WHERE Nvl(desconto,0) BETWEEN 0 AND 10;

--Mesmo efeito do between

SELECT * FROM tcontrato
WHERE desconto >= 0
AND desconto <= 10
OR desconto IS NULL;


-- IN /// NOT IN
SELECT * FROM tgestao
WHERE cod_curso IN (1, 2, 3);

SELECT * FROM tgestao
WHERE cod_curso NOT IN (5, 2, 4);

SELECT * FROM tcurso;

INSERT INTO tcurso VALUES (7, 'WINDOWS', 1400, 50);

--Cursos nao vendidos
SELECT * FROM tcurso
WHERE cod_curso NOT IN (SELECT cod_curso FROM tgestao);


--Cursos vendidos
SELECT * FROM tcurso
WHERE cod_curso IN (SELECT cod_curso FROM tgestao);


--Equivalente ao SELECT IN
SELECT * FROM tgestao
WHERE cod_curso = 1
OR cod_curso = 2
OR cod_curso = 4;


--Somente onde a segunda letra seja A
SELECT * FROM taluno WHERE nome LIKE 'M%' -- % -> registros que inicia com M
SELECT * FROM tcurso WHERE nome LIKE '%JAVA%'
SELECT * FROM tcurso WHERE nome LIKE '%SCRIPT'

SELECT * FROM tcurso;

COMMIT;

ALTER TABLE tcurso ADD pre_req INTEGER;

UPDATE tcurso SET
pre_req = 1
WHERE cod_curso = 2;

UPDATE tcurso SET
pre_req = 7
WHERE cod_curso = 4;

UPDATE tcurso SET
pre_req =5
WHERE cod_curso = 3;

SELECT * FROM tcurso;

--Cursos sem pre requisito
SELECT * FROM tcurso WHERE pre_req IS NULL

--Curso com pre requisito
SELECT * FROM tcurso WHERE pre_req IS NOT NULL
--

--Precedencia de operadores
--()
--AND
--OR
SELECT * FROM tcurso
WHERE valor > 700
OR valor < 1000
AND carga_horaria = 25
--

SELECT * FROM tcurso
WHERE (valor > 700
OR valor < 1000)
AND carga_horaria = 25;

COMMIT;


