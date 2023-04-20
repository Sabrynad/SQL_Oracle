--
SELECT * FROM taluno;


-- Concat -> juntar dois valores
SELECT Concat(cod_aluno,nome) FROM taluno;


--Outra opcao de juncao de valores
SELECT cod_aluno||'-'||nome FROM taluno;


--IntCap -> tarnsforma a primeira letra de cada palavra em maiuscila e o resto em minuscula
SELECT nome, InitCap(nome) FROM taluno;


--InStr -> retorna dentro do caracter a posicao da letr 'R' por examplo
SELECT nome, InStr(nome,'R') FROM taluno;


-- Length ->conta quantos caracteres tem na coluna
SELECT nome, Length(nome) FROM taluno;


--Lower -> transforma a tabela em minuscula
SELECT nome, Lower(nome) FROM taluno;


--Upper -> transforma a tabela em maiuscula
SELECT nome, Upper(nome) FROM taluno;

--
SELECT InitCap('SABRYNA DE ANGELO') FROM taluno;


--Left -> esquerda
SELECT cod_aluno, LPad(cod_aluno,5,'0') FROM taluno;


--Right -> direita
SELECT nome, salario, RPad(salario,8,'0') FROM taluno;

--
SELECT nome, RPad(nome,10,'$') FROM taluno;


-- SubStr -> copia parte de um texto
-- substr (campo/texto, posicao, quantidade de caracter)
SELECT nome, SubStr(nome,1,3) FROM taluno;

--
SELECT nome, SubStr(nome,1,1) FROM taluno;

--
SELECT nome, SubStr(nome,3,1) FROM TALUNO;

--
SELECT REPLACE(Upper(nome),'R','$') FROM taluno;

--

SELECT nome, SubStr(nome,Length(nome),1) FROM taluno;

--
SELECT nome, SubStr(nome,Length(nome)-1,2) FROM TALUNO;

--
SELECT nome, SubStr(nome, 3, Length(nome)-3) FROM taluno;

COMMIT;

SELECT * FROM taluno
WHERE LOWER(nome) = 'marta';

SELECT * FROM taluno
WHERE Upper(nome) = 'TONY';

SELECT * FROM taluno
WHERE Upper(SubStr(cidade,1,3)) = 'SAO';


UPDATE taluno SET
salario = 688.50
WHERE cod_aluno = 1;




SELECT
  salario,
  REPLACE(salario, ',' , ''),
  RPad(salario, 10, '0'),  --Zeros a direita ate 10 casas
  LPad(salario, 10, '0'),  --Zeros a esquerda ate 10 casas
  LPad(REPLACE(salario, ',',''),10,'0')
FROM taluno;


COMMIT;





