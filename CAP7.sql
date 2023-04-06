SELECT cod_contrato, data, total
FROM tcontrato
WHERE total >=
  (SELECT valor FROM tcurso
   WHERE cod_curso = 2);


--Errado(so pode retornar 1 linha na subconsulta)
SELECT cod_contrato, data, total
FROM tcontrato
WHERE total >=
  (SELECT valor FROM tcurso
   WHERE valor > 500);

SELECT * FROM taluno;

--Todos os alunos da mesma cidade do Aluno 1
--menos o Aluno 1
SELECT cod_aluno, nome, cidade
FROM taluno
WHERE cidade = (SELECT cidade FROM taluno
                WHERE cod_aluno = 1)
AND cod_aluno <> 1;


--Todos os alunos da mesma cidade e estados do aluno 1
--Menos o aluno 1
SELECT cod_aluno, nome, cidade, estado
FROM taluno
WHERE (cidade, estado) =
         (SELECT cidade, estado FROM taluno
          WHERE cod_aluno = 1)
AND cod_aluno <> 1;

SELECT * FROM taluno;
SELECT * FROM tgestao;

--Soma toda a gestao, e mostra somente cujo o valor minimo
--seja maior que o valor medio dos cursos
SELECT cod_curso, Min(pagamento), Sum(pagamento),
       Count(*) qtde
FROM tgestao
WHERE cod_curso > 0
GROUP BY cod_curso
HAVING Min(pagamento) >=
       (SELECT Avg(valor) FROM tcurso)
ORDER BY cod_curso;


--Soma total de contrato por aluno e mostra somente
--cujo o menor contrato seja maior que o valor medio de curso
SELECT cod_aluno, Min(total), Sum(total)
FROM tcontrato
GROUP BY cod_aluno
HAVING Min(total) >
       (SELECT Avg(valor) FROM tcurso);


--Todos os cursos de questao na tabela de gestao (vendidos)
SELECT cod_curso, nome, valor
FROM tcurso
WHERE cod_curso IN (SELECT cod_curso FROM tgestao);


--Todos os cursos que nao estao na tabela de gestao
--(Nao vendidos)
SELECT cod_curso, nome, valor
FROM tcurso
WHERE cod_curso NOT IN (SELECT cod-curso FROM tgestao)
ORDER BY nome


--Codigo equivalente a subselect
--(se os valores sao conhecidos)
SELECT cod_curso, nome, valor
FROM tcurso WHERE cod_curso IN (1,2,3,4);

--
SELECT cod_curso, nome. valor
FROM tcurso
WHERE cod_curso = 1
OR cod_curso = 2
OR cod_curso = 3
OR cod_curso = 4;

--Todos cursos que foram vendidos pelo valor padrao
SELECT * FROM tgestao
WHERE (cod_curso, pagamento) IN
      (SELECT cod_curso, valor FROM tcurso)

--SubCoonsulta na clausula From
SELECT ges.cod_contrato, ges.pagamento,
       ges.cod_curso,
       cur.cod_curso, cur.valor
FROM tgestao ges,
     (SELECT cod_curso, valor
      FROM tcurso WHERE valor > 500 ) cur

WHERE cur.cod_curso = ges.cod_curso

COMMIT;