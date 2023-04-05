--NVL E NVL2

SELECT * FROM tcontrato;

SELECT total,
       desconto,
       desconto + total,
       Nvl(desconto,0),
       Nvl(desconto,0) + total,
       Nvl2(desconto, total, -1)
FROM tcontrato;

SELECT * FROM taluno;

UPDATE taluno SET nome = NULL WHERE cod_aluno = 46;

SELECT cod_aluno, Nvl(Nome, 'SEM NOME') FROM taluno;

SELECT * FROM taluno;


UPDATE taluno SET
estado = 'RJ'
WHERE cod_aluno = 2;


UPDATE taluno SET
estado = 'SP'
WHERE cod_aluno = 2;


--Case
SELECT nome, estado,
    CASE
      WHEN estado = 'SP' THEN 'PAULISTA'
      WHEN estado = 'RJ' THEN 'CARIOCA'
      WHEN estado = 'BA' AND salario > 500 THEN 'BAIANO'
      ELSE 'OUTROS'
     END AS apelido
FROM taluno;


--
SELECT SYSDATE AS data FROM dual

--
SELECT nome, estado,
       Decode(estado,'SP','PAULISTA',
                     'RJ','CARIOCA',
                     'BA','BAIANO',
                          'OUTROS') AS apelido
FROM taluno

COMMIT;

