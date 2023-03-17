----DATA----
SELECT * FROM DUAL;

--SysDate retorna data/hora do Servidor.
SELECT SYSDATE FROM DUAL;

--Round e Trunc
SELECT Round(45.925,2),
       Trunc(45.929,2),
       Mod(10,2) AS RESTO_DIVISAO,
       Trunc(1.99),
       Trunc(1.99, 2),
       Round(1.99)
FROM DUAL;

SELECT * FROM TCONTRATO;

-- Funcoes de Data/Hora
SELECT DATA, SYSDATE, DATA + 5 FROM TCONTRATO;

SELECT SYSDATE - DATA AS DIF_DIAS FROM TCONTRATO;

SELECT Trunc(SYSDATE - DATA) AS DIAS FROM TCONTRATO;

--Somando horas em uma data
SELECT SYSDATE, SYSDATE + 2 /24 AS ADD_HORAS FROM TCONTRATO;

--Somar minutos
SELECT SYSDATE, SYSDATE + 15 / 1440 AS ADD_MINUTOS FROM TCONTRATO;

SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) AS ADD_SEGUNDOS FROM TCONTRATO;


--Hora fica 00:00:00
SELECT SYSDATE, Trunc(SYSDATE) FROM DUAL;

--Diferenca de meses entre datas
SELECT Months_Between(SYSDATE, SYSDATE-90) AS DIF_MES FROM DUAL;

--Adiciona meses
SELECT Add_Months(SYSDATE, 5) AS ADICIONA_MES_DATA FROM DUAL;

--Proxima data apartir de um dia da semana
SELECT Next_Day(SYSDATE, 'FRIDAY') AS PROXIMA_FRIDAY_DATA FROM DUAL;

--Ultimo dia do mes
SELECT Last_Day(SYSDATE) AS ULTIMO_DIA_MES FROM DUAL;

--Primeiro dia do mes
--ate o dia 15 do mes pega o primeiro dia do mes atual
--a partir do dia 16 retorna o primeiro dia do proximo mes
SELECT Round(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_PROXIMO_MES FROM DUAL;

--Primeiro dia do mes
SELECT Trunc(SYSDATE, 'MONTH') AS PRIMEIRO_DIA_MES_CORRENTE FROM DUAL;


--Formatacao de data

--Conversor to_char(data, formato)

--DD -> Dia do mes
SELECT SYSDATE, To_Char(SYSDATE,'DD') FROM DUAL;

-- Somente a data, sem as horas
SELECT To_Char(SYSDATE,'DD/MM/YYYY') DATA FROM DUAL;

SELECT To_Char(SYSDATE,'DD/MM') DIA_MES FROM DUAL;

SELECT To_Char(SYSDATE,'DD') DIA FROM DUAL;

SELECT To_Char(SYSDATE,'MM') MES FROM DUAL;

SELECT To_Char(SYSDATE,'YYYY') ANO FROM DUAL;

SELECT To_Char(SYSDATE,'YY') ANO FROM DUAL

--Informa o nome do mes
SELECT To_Char(SYSDATE,'MONTH') MES1 FROM DUAL;

--
SELECT To_Char(SYSDATE,'D') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE,'DY') DIA_SEMANA FROM DUAL;

SELECT To_Char(SYSDATE,'DAY') DIA_SEMANA1 FROM DUAL;

SELECT To_Char(SYSDATE,'YEAR') ANO FROM DUAL;

SELECT To_Char(SYSDATE,'"GUARULHOS," fmDAY ", " DD "de" fmMonth "de" YYYY') FROM DUAL;

--To_char em horas

SELECT To_Char(SYSDATE,'HH24:MI') HORA_MIN FROM DUAL;

SELECT To_Char(SYSDATE,'HH24:MI:SS') HORA_MIN_SEG FROM DUAL;

SELECT To_Char(SYSDATE,'DD/MM HH24:MI') DATA_HORA FROM DUAL;

SELECT To_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS') DATA_HORA FROM DUAL;


--Outros exemplos de To_char
--L ->R$
--G ->ponto
--D ->casas decimais
--Trim -> tira espacos em branco

SELECT Trim(To_Char(Salario,'L99999.99')) salario1, Trim(To_Char(Salario,'L99g999D99')) salario2
FROM TALUNO;

--
SELECT 'R$ '||(Round(Salario,2)) AS salario FROM TALUNO;

--
SELECT LPad(Trim((To_Char(5000,'L99999.99'))),'12',' ') FROM DUAL;

COMMIT;
