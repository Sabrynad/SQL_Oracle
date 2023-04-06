SELECT Count(*)   AS qtde_registros,
       Avg(total) AS media,
       Round (Avg(total),2) AS media,
       Max(total) AS maximo,
       Min(total) AS minimo,
       Sum(total) AS soma,
       Max(data)  AS data_maior,
       Min(data)  AS data_menor
FROM tcontrato

--Proximo codigo sequencial tabela
SELECT Max(cod_contrato) AS proximo_codigo
FROM tcontrato;

SELECT * FROM taluno;
SELECT * FROM tcontrato;

--Total de contratos por aluno
SELECT cod_aluno,
       Count(*) AS qtde_contrato,
       Sum(total) AS valor_total
FROM tcontrato
GROUP BY cod_aluno;

--Total de contrato por data
SELECT To_Char(Trunc(data), 'DD/MM/YYY') AS data,
       Sum(total) AS soma,
       Avg(total) AS media,
       Count(*) AS qtde
FROM tcontrato
GROUP BY Trunc(data)
ORDER BY data DESC;

------------------
UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 6;

UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 3

SELECT Count(*) AS qtde_registros
FROM tcontrato;

SELECT * FROM tcontrato

--COUNT -> IGNORA NULOS
SELECT Count(desconto)
FROM tcontrato;

--qtde de registros com estado informado
SELECT Count(estado) FROM taluno;

--qtde de estados diferentes
SELECT Count(DISTINCT(estado)) FROM taluno;

--qtde de registros por estado
SELECT estado, Count(*)
FROM taluno
GROUP BY estado;


SELECT Sum(desconto),
       Avg(desconto),
       Count(desconto),
       Round(Avg( Nvl(desconto,0) ), 2)
FROM tcontrato;

SELECT * FROM tcontrato

--Total de contrato por estado e data
SELECT alu.estado, Trunc(con.data) AS data,
       Sum(con.total) total, Count(*) qtde

FROM taluno alu, tcontrato con
WHERE alu.cod_aluno = con.cod_aluno
GROUP BY alu.estado, Trunc(con.data)
ORDER BY alu.estado, data DESC;


--Total de contrato por estado
SELECT alu.estado,
       Sum(con.total) total, Count(*) qtde

FROM taluno alu, tcontrato con
WHERE alu.cod_aluno = con.cod_aluno
GROUP BY alu.estado
ORDER BY alu.estado;

--Having - filtrar aluna com funcao de grupo
SELECT cod_aluno, Avg(total) media
FROM tcontrato
WHERE cod_aluno > 0
HAVING Avg (total) > 500
GROUP BY cod_aluno
ORDER BY cod_aluno;

SELECT Trunc(data), Sum(total) total
FROM tcontrato
WHERE cod_contrato > 0
GROUP BY Trunc(data)
HAVING Sum(total) > 500
ORDER BY total DESC;


--Media mais alta por aluno
SELECT Max(Avg(total))
FROM tcotrato
GROUP BY cod_aluno;

--Soma dos salarios por estado
SELECT estado, Sum(salario) AS total
FROM taluno
GROUP BY estado
ORDER BY 2 DESC;

COMMIT;