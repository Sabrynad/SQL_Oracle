SELECT COD_ALUNO, NOME, CIDADE
FROM TALUNO;


SELECT COD_ALUNO AS "Codigo", NOME AS "Nome do Aluno"
FROM TALUNO;

--Distinct retira linhas duplicadas
--Todas as colunas tem que ser iguais

SELECT CIDADE FROM TALUNO;


SELECT DISTINCT CIDADE FROM TALUNO;


--Nao agrupa pois cod_aluno e diferente
--Para cada linha
SELECT DISTINCT CIDADE, COD_ALUNO
FROM TALUNO
ORDER BY CIDADE;


-----CALCULOS-----

SELECT NOME AS CURSO,
       VALOR,
       VALOR/CARGA_HORARIA,
       Round(VALOR/CARGA_HORARIA,2) AS VALOR_HORA
FROM TCURSO
ORDER BY VALOR_HORA;


--Apelido de coluna so funciona em ORDER BY

SELECT * FROM TCONTRATO;


UPDATE TCONTRATO SET
DESCONTO = NULL
WHERE COD_CONTRATO = 4;

--Calculo com colunas = NULL
--Resultado = NULL
--Lembrando que qualquer coluna que estver NULL ira anular o calculo

SELECT COD_CONTRATO,
       TOTAL,
       DESCONTO,
       TOTAL+DESCONTO
FROM TCONTRATO;

--Tornando o NULL em 0

SELECT COD_CONTRATO,
       DESCONTO,
       Nvl(DESCONTO,0),
       TOTAL,
       TOTAL + Nvl(DESCONTO,0) AS TOTAL_MAIS_DESCONTO
FROM TCONTRATO;


--Exemplo de concatenacao

SELECT COD_ALUNO || ' - ' || NOME || ' // ' || CIDADE AS ALUNO
FROM TALUNO
ORDER BY COD_ALUNO;

