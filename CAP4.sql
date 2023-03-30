--
SELECT * FROM TALUNO;


-- Concat -> juntar dois valores
SELECT Concat(COD_ALUNO,NOME) FROM TALUNO;


--Outra opcao de juncao de valores
SELECT COD_ALUNO||'-'||NOME FROM TALUNO;


--IntCap -> tarnsforma a primeira letra de cada palavra em maiuscila e o resto em minuscula
SELECT nome, InitCap(NOME) FROM TALUNO;


--InStr -> retorna dentro do caracter a posicao da letr 'R' por examplo
SELECT nome, InStr(NOME,'R') FROM TALUNO;


-- Length ->conta quantos caracteres tem na coluna
SELECT nome, Length(NOME) FROM TALUNO;


--Lower -> transforma a tabela em minuscula
SELECT nome, Lower(NOME) FROM TALUNO;


--Upper -> transforma a tabela em maiuscula
SELECT nome, Upper(NOME) FROM TALUNO;

--
SELECT InitCap('SABRYNA DE ANGELO') FROM TALUNO;


--Left -> esquerda
SELECT cod_aluno, LPad(COD_ALUNO,5,'0') FROM TALUNO;


--Right -> direita
SELECT nome, salario, RPad(SALARIO,8,'0') FROM TALUNO;

--
SELECT nome, RPad(NOME,10,'$') FROM TALUNO;


-- SubStr -> copia parte de um texto
-- substr (campo/texto, posicao, quantidade de caracter)
SELECT nome, SubStr(NOME,1,3) FROM TALUNO;

--
SELECT nome, SubStr(NOME,1,1) FROM TALUNO;

--
SELECT nome, SubStr(NOME,3,1) FROM TALUNO;

--
SELECT REPLACE(Upper(NOME),'R','$') FROM TALUNO;

--

SELECT nome, SubStr(NOME,Length(nome),1) FROM TALUNO;

--
SELECT nome, SubStr(NOME,Length(nome)-1,2) FROM TALUNO;

--
SELECT nome, SubStr(NOME, 3, Length(nome)-3) FROM TALUNO;

COMMIT;

SELECT * FROM TALUNO
WHERE LOWER(NOME) = 'marta';

SELECT * FROM TALUNO
WHERE Upper(NOME) = 'TONY';

SELECT * FROM TALUNO
UNOWHERE Upper(SubStr(CIDADE,1,3)) = 'SAO';


UPDATE TALUNO SET
SALARIO = 688.50
WHERE COD_ALUNO = 1;




SELECT
  SALARIO,
  REPLACE(SALARIO, ',' , ''),
  RPad(SALARIO, 10, '0'),  --Zeros a direita ate 10 casas
  LPad(SALARIO, 10, '0'),  --Zeros a esquerda ate 10 casas
  LPad(REPLACE(SALARIO, ',',''),10,'0')
FROM TALUNO;


COMMIT;





