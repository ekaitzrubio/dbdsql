-- 1. PERTSONA taula (Entitate nagusia)
CREATE TABLE PERTSONA (
    NAN VARCHAR2(20) PRIMARY KEY,
    izena VARCHAR2(50) NOT NULL,
    abizenak VARCHAR2(100) NOT NULL,
    jaiotze_data DATE,
    mail VARCHAR2(100),
    helbidea VARCHAR2(150)
);

-- 2. LANGILEA taula (Pertsonaren azpiklasea)
CREATE TABLE LANGILEA (
    NAN VARCHAR2(20) PRIMARY KEY,
    CONSTRAINT fk_langilea_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 3. BAZKIDEA taula (Pertsonaren azpiklasea)
CREATE TABLE BAZKIDEA (
    NAN VARCHAR2(20) PRIMARY KEY,
    CONSTRAINT fk_bazkidea_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 4. HARRERAKOA taula (Langilearen azpiklasea)
CREATE TABLE HARRERAKOA (
    NAN VARCHAR2(20) PRIMARY KEY,
    Kontratazio_data DATE,
    Antzintasuna NUMBER,
    Alta_data DATE,
    CONSTRAINT fk_harrerakoa_lang FOREIGN KEY (NAN) REFERENCES LANGILEA(NAN) ON DELETE CASCADE
);

-- 5. ENTRENATZAILEA taula (Langilearen azpiklasea)
CREATE TABLE ENTRENATZAILEA (
    NAN VARCHAR2(20) PRIMARY KEY,
    Lizentzia_maila VARCHAR2(50),
    CONSTRAINT fk_entrenatzailea_lang FOREIGN KEY (NAN) REFERENCES LANGILEA(NAN) ON DELETE CASCADE
);

-- 6. BAZKIDE ENTRENATZAILE taula
CREATE TABLE BAZKIDE_ENTRENATZAILE (
    NAN VARCHAR2(20) PRIMARY KEY,
    CONSTRAINT fk_bazkide_entrenatzaile_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 7. TELEFONOA taula (Atributu balioaniztuna)
CREATE TABLE TELEFONOA (
    NAN VARCHAR2(20),
    telefonoa VARCHAR2(20),
    PRIMARY KEY (NAN, telefonoa),
    CONSTRAINT fk_telefonoa_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 8. PISTA taula
CREATE TABLE PISTA (
    Zbkia NUMBER PRIMARY KEY,
    Egoera VARCHAR2(50)
);

-- 9. MANTENU LANAK taula
CREATE TABLE MANTENU_LANAK (
    id_mantenu NUMBER,
    zbkia NUMBER,
    Data DATE,
    Deskribapena CLOB,
    Kostua NUMBER(10, 2),
    PRIMARY KEY (id_mantenu, zbkia),
    CONSTRAINT fk_mantenu_pista FOREIGN KEY (zbkia) REFERENCES PISTA(Zbkia) ON DELETE CASCADE
);

-- 10. TALDEA taula
CREATE TABLE TALDEA (
    taldeID NUMBER PRIMARY KEY,
    izena VARCHAR2(50) NOT NULL,
    sorrera_data DATE,
    NAN VARCHAR2(20),
    CONSTRAINT fk_taldea_bazkidea FOREIGN KEY (NAN) REFERENCES BAZKIDEA(NAN)
);

-- 11. SAIO HARTZAILE taula
CREATE TABLE SAIO_HARTZAILE (
    harrID NUMBER PRIMARY KEY,
    Izena VARCHAR2(50),
    Sorrera_data DATE,
    NAN VARCHAR2(20),
    CONSTRAINT fk_saio_hartzaile_bazkidea FOREIGN KEY (NAN) REFERENCES BAZKIDEA(NAN)
);

-- 12. PROGRAMATU errelazio ternarioa (Pista, saio hartzaile eta entrenatzailea)
CREATE TABLE PROGRAMATU (
    saioID NUMBER PRIMARY KEY,
    harrID NUMBER NOT NULL,
    NAN VARCHAR2(20) NOT NULL,
    zbkia NUMBER NOT NULL,
    Hasiera_ordua DATE,
    Iraupena NUMBER,
    Data DATE,
    CONSTRAINT fk_prog_hartzaile FOREIGN KEY (harrID) REFERENCES SAIO_HARTZAILE(harrID),
    CONSTRAINT fk_prog_entrenatzailea FOREIGN KEY (NAN) REFERENCES ENTRENATZAILEA(NAN),
    CONSTRAINT fk_prog_pista FOREIGN KEY (zbkia) REFERENCES PISTA(Zbkia)
);

-- 13. ERRESERBA taula
CREATE TABLE ERRESERBA (
    id_erreserba NUMBER PRIMARY KEY,
    Data DATE,
    Hasiera_ordua DATE,
    Amaiera_ordua DATE,
    Egoera VARCHAR2(50),
    Sortze_data DATE,
    Pertsona_NAN VARCHAR2(20),
    Pista_Zbkia NUMBER,
    CONSTRAINT fk_erreserba_bazkidea FOREIGN KEY (Pertsona_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_erreserba_pista FOREIGN KEY (Pista_Zbkia) REFERENCES PISTA(Zbkia)
);

-- 14. PARTE HARTU errelazioa (Bazkidea eta Erreserba)
CREATE TABLE PARTE_HARTU (
    Bazkide_NAN VARCHAR2(20),
    Erreserba_ID NUMBER,
    Rola VARCHAR2(50),
    Asistentzia NUMBER(1) CHECK (Asistentzia IN (0, 1)), -- True (1) ala False (0) adierazteko
    PRIMARY KEY (Bazkide_NAN, Erreserba_ID),
    CONSTRAINT fk_parte_bazkidea FOREIGN KEY (Bazkide_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_parte_erreserba FOREIGN KEY (Erreserba_ID) REFERENCES ERRESERBA(id_erreserba) ON DELETE CASCADE
);

-- 15. EGON errelazioa (Bazkidea eta Taldea)
CREATE TABLE EGON (
    Bazkide_NAN VARCHAR2(20),
    Talde_ID NUMBER,
    PRIMARY KEY (Bazkide_NAN, Talde_ID),
    CONSTRAINT fk_egon_bazkidea FOREIGN KEY (Bazkide_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_egon_taldea FOREIGN KEY (Talde_ID) REFERENCES TALDEA(taldeID) ON DELETE CASCADE
);

-- 16. SORTU errelazioa (Entrenatzailea eta Taldea)
CREATE TABLE SORTU (
    NAN VARCHAR2(20),
    Talde_ID NUMBER,
    PRIMARY KEY (NAN, Talde_ID),
    CONSTRAINT fk_sortu_entrenatzailea FOREIGN KEY (NAN) REFERENCES ENTRENATZAILEA(NAN),
    CONSTRAINT fk_sortu_taldea FOREIGN KEY (Talde_ID) REFERENCES TALDEA(taldeID) ON DELETE CASCADE
);