SELECT COD_CONTRATO, DATA, TOTAL
FROM TCONTRATO
WHERE TOTAL >=
  (SELECT VALOR FROM TCURSO
   WHERE COD_CURSO = 2);


--Errado(so pode retornar 1 linha na subconsulta)
SELECT COD_CONTRATO, DATA, TOTAL
FROM TCONTRATO
WHERE TOTAL >=
  (SELECT VALOR FROM TCURSO
   WHERE VALOR > 500);

SELECT * FROM TALUNO;

--Todos os alunos da mesma cidade do Aluno 1
--menos o Aluno 1
SELECT COD_ALUNO, NOME, CIDADE
FROM TALUNO
WHERE CIDADE = (SELECT CIDADE FROM TALUNO
                WHERE COD_ALUNO = 1)
AND COD_ALUNO <> 1;


--Todos os alunos da mesma cidade e estados do aluno 1
--Menos o aluno 1
SELECT COD_ALUNO, NOME, CIDADE, ESTADO
FROM TALUNO
WHERE (CIDADE,ESTADO) =
         (SELECT CIDADE, ESTADO FROM TALUNO
          WHERE COD_ALUNO = 1)
AND COD_ALUNO <> 1;

SELECT * FROM TALUNO;
SELECT * FROM TGESTAO;

--Soma toda a gestao, e mostra somente cujo o valor minimo
--seja maior que o valor medio dos cursos
SELECT COD_CURSO, Min(PAGAMENTO), Sum(PAGAMENTO),
       Count(*) QTDE
FROM TGESTAO
WHERE cod_curso > 0
GROUP BY COD_CURSO
HAVING Min(PAGAMENTO) >=
       (SELECT Avg(VALOR) FROM TCURSO)
ORDER BY cod_curso;


--Soma total de contrato por aluno e mostra somente
--cujo o menor contrato seja maior que o valor medio de curso
SELECT COD_ALUNO, Min(TOTAL), Sum(TOTAL)
FROM TCONTRATO
GROUP BY COD_ALUNO
HAVING Min(TOTAL) >
       (SELECT Avg(VALOR) FROM TCURSO);


--Todos os cursos de questao na tabela de gestao (vendidos)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO IN (SELECT COD_CURSO FROM TGESTAO);


--Todos os cursos que nao estao na tabela de gestao
--(Nao vendidos)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO NOT IN (SELECT COD_CURSO FROM TGESTAO)
ORDER BY NOME


--Codigo equivalente a subselect
--(se os valores sao conhecidos)
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO WHERE COD_CURSO IN (1,2,3,4);

--
SELECT COD_CURSO, NOME, VALOR
FROM TCURSO
WHERE COD_CURSO = 1
OR COD_CURSO = 2
OR COD_CURSO = 3
OR COD_CURSO = 4;

--Todos cursos que foram vendidos pelo valor padrao
SELECT * FROM TGESTAO
WHERE (COD_CURSO, PAGAMENTO) IN
      (SELECT COD_CURSO, VALOR FROM TCURSO)

--SubCoonsulta na clausula From
SELECT GES.COD_CONTRATO, GES.PAGAMENTO,
       GES.COD_CURSO,
       CUR.COD_CURSO, CUR.VALOR
FROM TGESTAO GES,
     (SELECT COD_CURSO, VALOR
      FROM TCURSO WHERE VALOR > 500 ) CUR

WHERE CUR.COD_CURSO = GES.COD_CURSO

COMMIT;