CREATE TABLE TDESCONTO
(CLASSE VARCHAR(2),
 INFERIOR INTEGER,
 SUPERIOR INTEGER);

A 00 10
B 11 20
C 21 30

SELECT * FROM TDESCONTO

INSERT INTO TDESCONTO (CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);

SELECT * FROM TDESCONTO
WHERE CLASSE = '&cla';

UPDATE TDESCONTO SET
INFERIOR = &inf,
SUPERIOR = &sup
WHERE CLASSE = '&cla';

DELETE FROM TDESCONTO
WHERE CLASSE = '&cla';

-----------------------
CREATE TABLE TDESCONTO2
  AS SELECT * FROM TDESCONTO

SELECT * FROM TDESCONTO2;

COMMIT;

--Transacao (commit/rollback)

DELETE FROM TDESCONTO2;

ROLLBACK;


--Deleta todos os registros da tabela
-- nao tem clausula Whwere

TRUNCATE TABLE TDESCONTO2;

SELECT * FROM TDESCONTO2;


COMMIT;

SELECT * FROM TDESCONTO;

--Savepoint
SAVEPOINT upd_b;

UPDATE TDESCONTO SET
SUPERIOR = 88
WHERE CLASSE = 'B';

SAVEPOINT upd_a;

UPDATE TDESCONTO SET
SUPERIOR = 99
WHERE CLASSE = 'A';


--Ponto de restauracao
SAVEPOINT ins_ok;

INSERT INTO TDESCONTO(CLASSE, INFERIOR, SUPERIOR)
VALUES ('&cla', &inf, &sup);

SELECT * FROM TDESCONTO;

ROLLBACK TO SAVEPOINT ins_ok;
ROLLBACK TO SAVEPOINT upd_a;
ROLLBACK TO SAVEPOINT upd_b;

--Excluir tabela
DROP TABLE TDESCONTO2;

COMMIT;