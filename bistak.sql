--3 ariketa bistekin
-------------------------1.BISTAREN PLANTEAMENDUA-------------------------
--1. Bista bat sortu, adingabeak diren pertsonak erakusten
--2. Bista bat sortu, adingabeak ez diren pertsonak erakusten
--3. Bista bat sortu, adingabeak diren pertsonak eta adingabeak ez diren pertsonak erakusten
--4. Bista bat sortu, adingabeak diren pertsonak eta adingabeak ez diren pertsonak erak

--_______________________adingabekoen bista____________________________________
CREATE OR REPLACE VIEW adinGabea AS
SELECT NAN, izena, abizenak, jaiotze_data
FROM PERTSONA
WHERE MONTHS_BETWEEN(TRUNC(CURRENT_DATE), jaiotze_data) / 12 < 18;

--
INSERT INTO adinGabea (NAN, izena, abizenak, jaiotze_data)
VALUES ('PROBA_ADIN_01', 'Ane', 'Etxeberria', DATE '1990-01-01');


-- En la vista
SELECT *
FROM adinGabea
WHERE NAN = 'PROBA_ADIN_01';

-- En la tabla base
SELECT *
FROM PERTSONA
WHERE NAN = 'PROBA_ADIN_01';

DELETE FROM PERTSONA
WHERE NAN = 'PROBA_ADIN_01';

COMMIT;

--
CREATE OR REPLACE VIEW adinGabea AS
SELECT NAN, izena, abizenak, jaiotze_data
FROM PERTSONA
WHERE MONTHS_BETWEEN(TRUNC(CURRENT_DATE), jaiotze_data) / 12 < 18
WITH CHECK OPTION;


INSERT INTO adinGabea (NAN, izena, abizenak, jaiotze_data)
VALUES ('PROBA_ADIN_01', 'Ane', 'Etxeberria', DATE '1990-01-01');


-- ORA-01402: view WITH CHECK OPTION where-clause violation



-------------------------2.BISTAREN PLANTEAMENDUA-------------------------

--pistaren kostu totala

CREATE OR REPLACE VIEW pistaGastuak AS
SELECT zbkia, SUM(Kostua) AS guztizko_kostua, COUNT(*) AS lan_kopurua
FROM MANTENU_LANAK
GROUP BY zbkia;


-------------------------3.BISTAREN PLANTEAMENDUA-------------------------
SELECT A.NAN, A.izena, A.abizenak, A.jaiotze_data
FROM adinGabea A
JOIN BAZKIDEA B ON A.NAN = B.NAN;