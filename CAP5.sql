SELECT * FROM taluno;

SELECT * FROM tcontrato;

--Produto cartesiano -> ERRADO
SELECT taluno.cod_aluno, taluno.nome, tcontrato.total
FROM taluno, tcontrato


--Correto
SELECT taluno.cod_aluno, taluno.nome, tcontrato.total
FROM taluno, tcontrato
WHERE taluno.cod_aluno = tcontrato.cod_aluno


--Coluna ambigua -> ERRADO
SELECT cod_aluno, taluno.nome, tcontrato.total
FROM taluno, tcontrato
WHERE taluno.cod_aluno = taluno.cod_aluno

--Correto, quando uma coluna existe com mesmo nome em mais de uma tabela,
--colocar prefixo na coluna
SELECT taluno.cod_aluno, taluno.nome, tcontrato.total
FROM taluno, tcontrato
WHERE taluno.cod_aluno = taluno.cod_aluno


--Uniao da tabela de aluno com contrato
SELECT alu.cod_aluno, alu.nome AS aluno,
       con.cod_contrato, con.data, con.total

FROM taluno alu, tcontrato con

WHERE con.cod_aluno = alu.cod_aluno

AND Upper (alu.nome) LIKE '%'

ORDER BY alu.nome


SELECT * FROM taluno
SELECT * FROM tcontrato
SELECT * FROM tgestao
SELECT * FROM tcurso

SELECT alu.cod_aluno, alu.nome AS aluno,
       con.cod_contrato, con.data, con.total,
       ges.cod_curso, cur.nome AS curso,
       ges.pagamento

FROM taluno alu, tcontrato con,
     tgestao ges, tcurso cur,

WHERE alu.cod_aluno = con.cod_aluno
AND   con.cod_contrato = ges.cod_contrato
AND   ges.cod_curso = cur.cod_curso

ORDER BY con.total DESC;


 --------------------------
CREATE TABLE tdesconto
( classe VARCHAR(1) PRIMARY KEY,
  inferior NUMBER(4,2),
  superior NUMBER (4,2)
);

INSERT INTO tdesconto VALUES ('A',00,10);
INSERT INTO tdesconto VALUES ('B',11,15);
INSERT INTO tdesconto VALUES ('C',16,20);
INSERT INTO tdesconto VALUES ('D',21,25);
INSERT INTO tdesconto VALUES ('E',26,30);

SELECT * FROM tdesconto;


COMMIT;

------------------------

SELECT * FROM tcontrato

UPDATE tcontrato SET
desconto = 27
WHERE cod_contrato = 2;


UPDATE tcontrato SET
desconto = 30
WHERE cod_contrato = 4;

-------------------------------------
SELECT con.cod_contrato AS contrato, con.desconto,
       des.classe AS desconto

FROM tcontrato con, tdesconto des
WHERE con.desconto BETWEEN des.inferior AND des.superior

ORDER BY con.cod_contrato;

--Mostrar cursos mais vendidos
SELECT cur.cod_curso, cur.nome, GES.cod_gestao
FROM tcurso cur, tgestao ges
WHERE cur.cod_curso = ges.cod_curso


-- Mostrar cursos nao vendidos
SELECT cur.cod_curso, cur.nome,ges.cod_gestao
FROM tcurso cur, tgestao ges
WHERE cur.cod_curso = ges.cod_curso(+)
AND ges.cod_gestao IS NULL;


SELECT * FROM tcurso;


UPDATE tcurso SET pre_req = 7
WHERE cod_curso = 6

UPDATE tcurso SET pre_req = 3
WHERE cod_curso = 5

UPDATE tcurso SET pre_req = 2
WHERE cod_curso = 1


--Select de duas tabelas (a mesma tabela)
SELECT curso.nome AS curso,
       pre_req.nome AS pre_requisito

FROM tcurso curso, tcurso pre_req
WHERE curso.pre_req = pre_req.cod_curso(+);

COMMIT;
