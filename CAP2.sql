SELECT cod_aluno, nome, cidade
FROM taluno;


SELECT cod_aluno AS "Codigo", nome AS "Nome do Aluno"
FROM taluno;

--Distinct retira linhas duplicadas
--Todas as colunas tem que ser iguais

SELECT cidade FROM taluno;


SELECT DISTINCT cidade FROM taluno;


--Nao agrupa pois cod_aluno e diferente
--Para cada linha
SELECT DISTINCT cidade, cod_aluno
FROM taluno
ORDER BY cidade;


-----CALCULOS-----

SELECT nome AS curso,
       valor,
       valor/carga_horaria,
       Round(valor/carga_horaria,2) AS valor_hora
FROM tcurso
ORDER BY valor_hora;


--Apelido de coluna so funciona em ORDER BY

SELECT * FROM tcontrato;


UPDATE tcontrato SET
desconto = NULL
WHERE cod_contrato = 4;

--Calculo com colunas = NULL
--Resultado = NULL
--Lembrando que qualquer coluna que estver NULL ira anular o calculo

SELECT cod_contrato,
       total,
       desconto,
       total + desconto
FROM tcontrato;

--Tornando o NULL em 0

SELECT cod_contrato,
       desconto,
       Nvl(desconto,0),
       total,
       total + Nvl(desconto,0) AS total_mais_desconto
FROM tcontrato;


--Exemplo de concatenacao

SELECT cod_aluno || ' - ' || nome || ' // ' || cidade AS aluno
FROM taluno
ORDER BY cod_aluno;

COMMIT;

