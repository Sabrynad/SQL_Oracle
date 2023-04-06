CREATE TABLE teste
(codigo INTEGER NOT NULL PRIMARY KEY,
  data DATE DEFAULT SYSDATE
);

INSERT INTO teste (codigo) VALUES (1);


SELECT * FROM teste;


--Tipos de Dados
VARCHAR2(10) -> 'PEDRO'
CHAR(10) -> 'PEDRO     '

NUMBER(5,2) -> 999.99


--tabelas criadas pelo usuario -USER_TABLES(View)
SELECT * FROM user_tables;

SELECT * FROM all_tables;


CREATE TABLE tcontrato_vip
AS
 SELECT * FROM tcontrato WHERE total > 500;

SELECT * FROM tcontrato_vip;


--Add coluna na tabela
ALTER TABLE tcontrato_vip ADD valor NUMBER(5,2);

--Alterar coluna
ALTER TABLE tcontrato_vip MODIFY valor NUMBER(8,2);

--Alterar coluna
ALTER TABLE tcontrato_vip MODIFY valor NUMBER(12,2); DEFAULT 0;

--Renomear coluna
ALTER TABLE tcontrato_vip RENAME COLUMN valor TO valor2;

--Excluir cluna
ALTER TABLE tcontrato_vip DROP COLUMN valor2;

--Excluir coluna
DROP TABLE tcontrato_vip
DROP TABLE titem;

--Renomear tabela
RENAME tcontrato TO tcontrato_top;

SELECT * FROM tcontrato_top;

RENAME tcontrato_top TO tcontrato;

SELECT * FROM tcontrato;


--Comentatio na tabela
COMMENT ON TABLE tcontrato IS 'Informacao de Contratos';

--Comentario na coluna da tabela
COMMENT ON COLUMN tcontrato.cod_contrato IS 'Codigo de Contrato';

COMMENT ON COLUMN tcontrato.data IS 'Data de emissao do Contrato';

SELECT * FROM user_col_comments WHERE table_name = 'TCONTRATO';

SELECT * FROM user_table_comments WHERE table_nome = 'TCONTRATO';


--Desabilita coluna
ALTER TABLE tcontrato ADD total2 NUMERIC(8,2);

ALTER TABLE tcontrato SET unused (total2);

SELECT * FROM tcontrato;

--Excluir colunas nao usadas
ALTER TABLE tcontrato DROP unused COLUMNS;


--TRUNCATE TABLE -> esclui todos os registros da tabela
--Nao tem WHERE nem COMMIT/ROLLBACK
TRUNCATE TABLE teste;

COMMIT;
