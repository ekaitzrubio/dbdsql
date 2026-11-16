--gutxienez 2 gehienez 8

--1. Inplikazio motako murriztapena (“x bada ---> y”) — Taula bakarrekoa
--Deskribapena: Erreserba bat konfirmatuta dagoen bakoitzean, ezinbestekoa da pista bat esleituta egotea
ALTER TABLE ERRESERBA 
ADD CONSTRAINT chk_erreserba_konf 
CHECK (Egoera <> 'Konfirmatuta' OR Pista_Zbkia IS NOT NULL);

--2. Murriztapena (Data-konparazioa taula berean - Check)
--Deskribapena: Harrerakoa taulan, sisteman alta ofiziala emandako data (Alta_data) ezin da pertsona hori kontratatu zen eguna baino lehenagokoa izan (Kontratazio_data). Hau da, alta-datak kontratazio-data baino beranduagokoa edo berdina izan behar du beti.
ALTER TABLE HARRERAKOA 
ADD CONSTRAINT chk_harrerakoa_datak 
CHECK (Alta_data >= Kontratazio_data);

--3. Balio-tartearen murriztapena (Check) — Taula bakarrekoa
--Deskribapena: Entrenamendu-saio baten iraupenak (Iraupena, minututan) balio positiboa izan behar du, eta gehienez 180 minutu (3 ordu) baino gutxiagokoa edo berdina izan behar du.
ALTER TABLE PROGRAMATU 
ADD CONSTRAINT chk_prog_iraupena 
CHECK (Iraupena > 0 AND Iraupena <= 180);

--4. Denbora-konparazioaren murriztapena (Check) — Taula bakarrekoa
--Deskribapena: Erreserba baten amaiera-ordua (Amaiera_ordua) hasiera-ordua (Hasiera_ordua) baino beranduagokoa izan behar da beti.
ALTER TABLE ERRESERBA 
ADD CONSTRAINT chk_erreserba_orduak 
CHECK (Amaiera_ordua > Hasiera_ordua);

--5. zenbakirako: Balio bakarreko murriztapena (UNIQUE) — Taula bakarrekoa
--Deskribapena / Descripción: Ziurtatzea PERTSONA taulan posta elektronikoak (mail) ez errepikatzea; hau da, bi pertsonek ezin dute email bera erregistratu klubaren datu-basean.
ALTER TABLE PERTSONA 
ADD CONSTRAINT uk_pertsona_mail UNIQUE (mail);