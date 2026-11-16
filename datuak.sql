-- PERTSONA
INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('12345678A', 'Aitziber', 'Agirre Etxeberria', TO_DATE('1990-05-12', 'YYYY-MM-DD'), 'aitziber.agirre@email.eus', 'Kale Nagusia 12, Donostia');

INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('23456789B', 'Jon', 'Goikoetxea Mendizabal', TO_DATE('1985-08-23', 'YYYY-MM-DD'), 'jon.goikoi@email.eus', 'Askatasuna Etorbidea 4, Bilbo');

INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('34567890C', 'Miren', 'Elustondo Urretxu', TO_DATE('1995-02-15', 'YYYY-MM-DD'), 'miren.elus@email.eus', 'Nafarroa Etorbidea 8, Irun');

INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('45678901D', 'Inaki', 'Zubiaurre Arana', TO_DATE('1982-11-30', 'YYYY-MM-DD'), 'inaki.zubia@email.eus', 'San Frantzisko Kalea 19, Gasteiz');


-- LANGILEA
INSERT INTO LANGILEA (NAN) VALUES ('12345678A');
INSERT INTO LANGILEA (NAN) VALUES ('45678901D');


-- BAZKIDEA
INSERT INTO BAZKIDEA (NAN) VALUES ('23456789B');
INSERT INTO BAZKIDEA (NAN) VALUES ('34567890C');


-- HARRERAKOA
INSERT INTO HARRERAKOA (NAN, Kontratazio_data, Antzintasuna, Alta_data) VALUES
('12345678A', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 4, TO_DATE('2022-01-15', 'YYYY-MM-DD'));


-- ENTRENATZAILEA
INSERT INTO ENTRENATZAILEA (NAN, Lizentzia_maila) VALUES ('45678901D', 'Maila Nagusia');


-- BAZKIDE_ENTRENATZAILE
INSERT INTO BAZKIDE_ENTRENATZAILE (NAN) VALUES ('45678901D');


-- TELEFONOA
INSERT INTO TELEFONOA (NAN, telefonoa) VALUES ('12345678A', '600111222');
INSERT INTO TELEFONOA (NAN, telefonoa) VALUES ('23456789B', '611333444');
INSERT INTO TELEFONOA (NAN, telefonoa) VALUES ('34567890C', '622555666');
INSERT INTO TELEFONOA (NAN, telefonoa) VALUES ('45678901D', '633777888');


-- PISTA
INSERT INTO PISTA (Zbkia, Egoera) VALUES (1, 'Erabilgarri');
INSERT INTO PISTA (Zbkia, Egoera) VALUES (2, 'Erabilgarri');
INSERT INTO PISTA (Zbkia, Egoera) VALUES (3, 'Mantentze-lanetan');


-- MANTENU_LANAK
INSERT INTO MANTENU_LANAK (id_mantenu, zbkia, Data, Deskribapena, Kostua) VALUES
(1, 3, TO_DATE('2026-05-10', 'YYYY-MM-DD'), 'Kristalaren ordezkapena eta garbiketa', 150.00);

INSERT INTO MANTENU_LANAK (id_mantenu, zbkia, Data, Deskribapena, Kostua) VALUES
(2, 3, TO_DATE('2026-05-11', 'YYYY-MM-DD'), 'Sare berria jarri', 45.50);


-- TALDEA
INSERT INTO TALDEA (taldeID, izena, sorrera_data, NAN) VALUES
(1, 'Goizeko Taldea', TO_DATE('2026-01-10', 'YYYY-MM-DD'), '23456789B');

INSERT INTO TALDEA (taldeID, izena, sorrera_data, NAN) VALUES
(2, 'Arratsaldekoak', TO_DATE('2026-02-01', 'YYYY-MM-DD'), '34567890C');


-- SAIO_HARTZAILE
INSERT INTO SAIO_HARTZAILE (harrID, Izena, Sorrera_data, NAN) VALUES
(1, 'Jon Saio Pertsonala', TO_DATE('2026-03-01', 'YYYY-MM-DD'), '23456789B');

INSERT INTO SAIO_HARTZAILE (harrID, Izena, Sorrera_data, NAN) VALUES
(2, 'Goizeko Taldearen Saioa', TO_DATE('2026-03-02', 'YYYY-MM-DD'), NULL);


-- PROGRAMATU
INSERT INTO PROGRAMATU (saioID, harrID, NAN, zbkia, Hasiera_ordua, Iraupena, Data) VALUES
(101, 1, '45678901D', 1, TO_DATE('2026-06-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 60, TO_DATE('2026-06-01', 'YYYY-MM-DD'));

INSERT INTO PROGRAMATU (saioID, harrID, NAN, zbkia, Hasiera_ordua, Iraupena, Data) VALUES
(102, 2, '45678901D', 2, TO_DATE('2026-06-02 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 90, TO_DATE('2026-06-02', 'YYYY-MM-DD'));


-- ERRESERBA
INSERT INTO ERRESERBA (id_erreserba, Data, Hasiera_ordua, Amaiera_ordua, Egoera, Sortze_data, Pertsona_NAN, Pista_Zbkia) VALUES
(1, TO_DATE('2026-06-05', 'YYYY-MM-DD'), TO_DATE('2026-06-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-05 18:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Konfirmatuta', TO_DATE('2026-06-01', 'YYYY-MM-DD'), '23456789B', 1);

INSERT INTO ERRESERBA (id_erreserba, Data, Hasiera_ordua, Amaiera_ordua, Egoera, Sortze_data, Pertsona_NAN, Pista_Zbkia) VALUES    Egoera VARCHAR2(50),

(2, TO_DATE('2026-06-06', 'YYYY-MM-DD'), TO_DATE('2026-06-06 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2026-06-06 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'Konfirmatuta', TO_DATE('2026-06-02', 'YYYY-MM-DD'), '34567890C', 2);


-- PARTE_HARTU
INSERT INTO PARTE_HARTU (Bazkide_NAN, Erreserba_ID, Rola, Asistentzia) VALUES
('23456789B', 1, 'Antolatzailea', 1);

INSERT INTO PARTE_HARTU (Bazkide_NAN, Erreserba_ID, Rola, Asistentzia) VALUES
('34567890C', 2, 'Kidea', 0);


-- EGON
INSERT INTO EGON (Bazkide_NAN, Talde_ID) VALUES ('23456789B', 1);
INSERT INTO EGON (Bazkide_NAN, Talde_ID) VALUES ('34567890C', 2);


-- SORTU
INSERT INTO SORTU (NAN, Talde_ID) VALUES ('45678901D', 1);


-- PERTSONA (Adingabea)
INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('78901234E', 'Malen', 'Agirre Etxeberria', TO_DATE('2010-06-15', 'YYYY-MM-DD'), 'malen.agirre@email.eus', 'Kale Nagusia 12, Donostia');

-- BAZKIDEA (Adingabea bada)
INSERT INTO BAZKIDEA (NAN) VALUES ('78901234E');