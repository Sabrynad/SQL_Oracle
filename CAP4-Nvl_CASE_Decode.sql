--NVL E NVL2

SELECT * FROM TCONTRATO;

SELECT Total,
       Desconto,
       Desconto+Total,
       Nvl(Desconto,0),
       Nvl(Desconto,0) + TOTAL,
       Nvl2(DESCONTO, TOTAL, -1)
FROM TCONTRATO;

SELECT * FROM TALUNO;

UPDATE TALUNO SET NOME = NULL WHERE COD_ALUNO = 46;

SELECT Cod_Aluno, Nvl(Nome, 'SEM NOME') FROM TALUNO;

SELECT * FROM TALUNO;


UPDATE TAluno SET
Estado = 'RJ'
WHERE Cod_Aluno = 2;


UPDATE TAluno SET
Estado = 'SP'
WHERE Cod_Aluno = 2;


--Case
SELECT NOME, Estado,
    CASE
      WHEN Estado = 'SP' THEN 'PAULISTA'
      WHEN Estado = 'RJ' THEN 'CARIOCA'
      WHEN Estado = 'BA' AND SALARIO > 500 THEN 'BAIANO'
      ELSE 'OUTROS'
     END AS Apelido
FROM TALUNO;


--
SELECT SYSDATE AS DATA FROM DUAL

--
SELECT NOME, ESTADO,
       Decode(ESTADO,'SP','PAULISTA',
                     'RJ','CARIOCA',
                     'BA','BAIANO',
                          'OUTROS') AS APELIDO
FROM TALUNO

COMMIT;

