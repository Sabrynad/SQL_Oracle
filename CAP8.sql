

SELECT * FROM tdesconto

INSERT INTO tdesconto (classe, inferior, superior)
VALUES ('&cla', &inf, &sup);

SELECT * FROM tdesconto
WHERE classe = '&cla';

UPDATE tdesconto SET
inferior = &inf,
superior = &sup
WHERE classe = '&cla';

DELETE FROM tdesconto
WHERE classe = '&cla';

-----------------------
CREATE TABLE tdesconto2
  AS SELECT * FROM tdesconto

SELECT * FROM tdesconto2;

COMMIT;

--Transacao (commit/rollback)

DELETE FROM tdesconto2;

ROLLBACK;


--Deleta todos os registros da tabela
-- nao tem clausula Whwere

TRUNCATE TABLE tdesconto2;

SELECT * FROM tdesconto2;


COMMIT;

SELECT * FROM tdesconto;

--Savepoint
SAVEPOINT upd_b;

UPDATE tdesconto SET
superior = 88
WHERE classe = 'B';

SAVEPOINT upd_a;

UPDATE tdesconto SET
superior = 99
WHERE classe = 'A';


--Ponto de restauracao
SAVEPOINT ins_ok;

INSERT INTO tdesconto(classe, inferior, superior)
VALUES ('&cla', &inf, &sup);

SELECT * FROM tdesconto;

ROLLBACK TO SAVEPOINT ins_ok;
ROLLBACK TO SAVEPOINT upd_a;
ROLLBACK TO SAVEPOINT upd_b;

--Excluir tabela
DROP TABLE tdesconto2;

COMMIT;
