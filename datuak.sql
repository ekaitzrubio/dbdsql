-- 1. PERTSONA
INSERT INTO PERTSONA (NAN, izena, abizenak, jaiotze_data, mail, helbidea) VALUES
('12345678A', 'Aitziber', 'Agirre Etxeberria', '1990-05-12', 'aitziber.agirre@email.eus', 'Kale Nagusia 12, Donostia'),
('23456789B', 'Jon', 'Goikoetxea Mendizabal', '1985-08-23', 'jon.goikoi@email.eus', 'Askatasuna Etorbidea 4, Bilbo'),
('34567890C', 'Miren', 'Elustondo Urretxu', '1995-02-15', 'miren.elus@email.eus', 'Nafarroa Etorbidea 8, Irun'),
('45678901D', 'Inaki', 'Zubiaurre Arana', '1982-11-30', 'inaki.zubia@email.eus', 'San Frantzisko Kalea 19, Gasteiz');

-- 2. LANGILEA (Aitziber e Inaki son trabajadores)
INSERT INTO LANGILEA (NAN) VALUES
('12345678A'),
('45678901D');

-- 3. BAZKIDEA (Jon y Miren son socios)
INSERT INTO BAZKIDEA (NAN) VALUES
('23456789B'),
('34567890C');

-- 4. HARRERAKOA (Aitziber es harrerakoa)
INSERT INTO HARRERAKOA (NAN, Kontratazio_data, Antzintasuna, Alta_data) VALUES
('12345678A', '2022-01-15', 4, '2022-01-15');

-- 5. ENTRENATZAILEA (Inaki es entrenatzailea)
INSERT INTO ENTRENATZAILEA (NAN, Lizentzia_maila) VALUES
('45678901D', 'Maila Nagusia');

-- 6. BAZKIDE_ENTRENATZAILE (Inaki también puede ser socio a la vez, o creamos otro caso)
INSERT INTO BAZKIDE_ENTRENATZAILE (NAN) VALUES
('45678901D');

-- 7. TELEFONOA
INSERT INTO TELEFONOA (NAN, telefonoa) VALUES
('12345678A', '600111222'),
('23456789B', '611333444'),
('34567890C', '622555666'),
('45678901D', '633777888');

-- 8. PISTA
INSERT INTO PISTA (Zbkia, Egoera) VALUES
(1, 'Erabilgarri'),
(2, 'Erabilgarri'),
(3, 'Mantentze-lanetan');

-- 9. MANTENU_LANAK
INSERT INTO MANTENU_LANAK (id_mantenu, zbkia, Data, Deskribapena, Kostua) VALUES
(1, 3, '2026-05-10', 'Kristalaren ordezkapena eta garbiketa', 150.00),
(2, 3, '2026-05-11', 'Sare berria jarri', 45.50);

-- 10. TALDEA
INSERT INTO TALDEA (taldeID, izena, sorrera_data, NAN) VALUES
(1, 'Goizeko Taldea', '2026-01-10', '23456789B'),
(2, 'Arratsaldekoak', '2026-02-01', '34567890C');

-- 11. SAIO_HARTZAILE (Puede ser un socio individual o un taldea)
INSERT INTO SAIO_HARTZAILE (harrID, Izena, Sorrera_data, NAN) VALUES
(1, 'Jon Saio Pertsonala', '2026-03-01', '23456789B'),
(2, 'Goizeko Taldearen Saioa', '2026-03-02', NULL);

-- 12. PROGRAMATU (Relación ternaria de sesiones)
INSERT INTO PROGRAMATU (saioID, harrID, NAN, zbkia, Hasiera_ordua, Iraupena, Data) VALUES
(101, 1, '45678901D', 1, '10:00:00', 60, '2026-06-01'),
(102, 2, '45678901D', 2, '18:00:00', 90, '2026-06-02');

-- 13. ERRESERBA
INSERT INTO ERRESERBA (id_erreserba, Data, Hasiera_ordua, Amaiera_ordua, Egoera, Sortze_data, Pertsona_NAN, Pista_Zbkia) VALUES
(1, '2026-06-05', '17:00:00', '18:30:00', 'Konfirmatuta', '2026-06-01', '23456789B', 1),
(2, '2026-06-06', '19:00:00', '20:30:00', 'Konfirmatuta', '2026-06-02', '34567890C', 2);

-- 14. PARTE_HARTU
INSERT INTO PARTE_HARTU (Bazkide_NAN, Erreserba_ID, Rola, Asistentzia) VALUES
('23456789B', 1, 'Antolatzailea', TRUE),
('34567890C', 2, 'Kidea', FALSE);

-- 15. EGON
INSERT INTO EGON (Bazkide_NAN, Talde_ID) VALUES
('23456789B', 1),
('34567890C', 2);

-- 16. SORTU
INSERT INTO SORTU (NAN, Talde_ID) VALUES
('45678901D', 1);