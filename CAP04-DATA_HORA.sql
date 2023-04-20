----DATA----
SELECT * FROM dual;

--SysDate retorna data/hora do Servidor.
SELECT SYSDATE FROM dual;

--Round e Trunc
SELECT Round(45.925,2),
       Trunc(45.929,2),
       Mod(10,2) AS resto_divisao,
       Trunc(1.99),
       Trunc(1.99, 2),
       Round(1.99)
FROM dual;

SELECT * FROM tcontrato;

-- Funcoes de Data/Hora
SELECT data, SYSDATE, data + 5 FROM tcontrato;

SELECT SYSDATE - data AS dif_data FROM tcontrato;

SELECT Trunc(SYSDATE - data) AS dia FROM tcontrato;

--Somando horas em uma data
SELECT SYSDATE, SYSDATE + 2 /24 AS add_hora FROM tcontrato;

--Somar minutos
SELECT SYSDATE, SYSDATE + 15 / 1440 AS add_minutos FROM tcontrato;

SELECT SYSDATE, SYSDATE + 30 / (3600 * 24) AS add_segundos FROM tcontrato;


--Hora fica 00:00:00
SELECT SYSDATE, Trunc(SYSDATE) FROM dual;

--Diferenca de meses entre datas
SELECT Months_Between(SYSDATE, SYSDATE-90) AS dif_mes FROM dual;

--Adiciona meses
SELECT Add_Months(SYSDATE, 5) AS adicionar_mes_data FROM dual;

--Proxima data apartir de um dia da semana
SELECT Next_Day(SYSDATE, 'FRIDAY') AS proxima_friday_data FROM dual;

--Ultimo dia do mes
SELECT Last_Day(SYSDATE) AS ultimo_dia_mes FROM dual;

--Primeiro dia do mes
--ate o dia 15 do mes pega o primeiro dia do mes atual
--a partir do dia 16 retorna o primeiro dia do proximo mes
SELECT Round(SYSDATE, 'MONTH') AS primeiro_dia_proximo_mes FROM dual;

--Primeiro dia do mes
SELECT Trunc(SYSDATE, 'MONTH') AS primeiro_dia_mes_corrente FROM dual;


--Formatacao de data

--Conversor to_char(data, formato)

--DD -> Dia do mes
SELECT SYSDATE, To_Char(SYSDATE,'DD') FROM dual;

-- Somente a data, sem as horas
SELECT To_Char(SYSDATE,'DD/MM/YYYY') data FROM dual;

SELECT To_Char(SYSDATE,'DD/MM') dia_mes FROM dual;

SELECT To_Char(SYSDATE,'DD') dia FROM dual;

SELECT To_Char(SYSDATE,'MM') mes FROM dual;

SELECT To_Char(SYSDATE,'YYYY') ano FROM dual;

SELECT To_Char(SYSDATE,'YY') ano FROM dual

--Informa o nome do mes
SELECT To_Char(SYSDATE,'MONTH') mes1 FROM dual;

--
SELECT To_Char(SYSDATE,'D') dia_semana FROM dual;

SELECT To_Char(SYSDATE,'DY') dia_semana FROM dual;

SELECT To_Char(SYSDATE,'DAY') dia_semana1 FROM dual;

SELECT To_Char(SYSDATE,'YEAR') ano FROM dual;

SELECT To_Char(SYSDATE,'"GUARULHOS," fmDAY ", " DD "de" fmMonth "de" YYYY') FROM DUAL;

--To_char em horas

SELECT To_Char(SYSDATE,'HH24:MI') hora_min FROM dual;

SELECT To_Char(SYSDATE,'HH24:MI:SS') hora_min_seg FROM dual;

SELECT To_Char(SYSDATE,'DD/MM HH24:MI') data_hora FROM dual;

SELECT To_Char(SYSDATE,'DD/MM/YYYY HH24:MI:SS') data_hora FROM dual;


--Outros exemplos de To_char
--L ->R$
--G ->ponto
--D ->casas decimais
--Trim -> tira espacos em branco

SELECT Trim(To_Char(Salario,'L99999.99')) salario1, Trim(To_Char(Salario,'L99g999D99')) salario2
FROM taluno;

--
SELECT 'R$ '||(Round(Salario,2)) AS salario FROM taluno;

--
SELECT LPad(Trim((To_Char(5000,'L99999.99'))),'12',' ') FROM dual;

COMMIT;
