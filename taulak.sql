-- 1. Tabla PERTSONA (Entidad base)
CREATE TABLE PERTSONA (
    NAN VARCHAR(20) PRIMARY KEY,
    izena VARCHAR(50) NOT NULL,
    abizenak VARCHAR(100) NOT NULL,
    jaiotze_data DATE,
    mail VARCHAR(100),
    helbidea VARCHAR(150)
);

-- 2. Tabla LANGILEA (Subtipo de Persona)
CREATE TABLE LANGILEA (
    NAN VARCHAR(20) PRIMARY KEY,
    CONSTRAINT fk_langilea_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 3. Tabla BAZKIDEA (Subtipo de Persona)
CREATE TABLE BAZKIDEA (
    NAN VARCHAR(20) PRIMARY KEY,
    CONSTRAINT fk_bazkidea_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 4. Tabla HARRERAKOA (Subtipo de Langilea)
CREATE TABLE HARRERAKOA (
    NAN VARCHAR(20) PRIMARY KEY,
    Kontratazio_data DATE,
    Antzintasuna INT,
    Alta_data DATE,
    CONSTRAINT fk_harrerakoa_lang FOREIGN KEY (NAN) REFERENCES LANGILEA(NAN) ON DELETE CASCADE
);

-- 5. Tabla ENTRENATZAILEA (Subtipo de Langilea)
CREATE TABLE ENTRENATZAILEA (
    NAN VARCHAR(20) PRIMARY KEY,
    Lizentzia_maila VARCHAR(50),
    CONSTRAINT fk_entrenatzailea_lang FOREIGN KEY (NAN) REFERENCES LANGILEA(NAN) ON DELETE CASCADE
);

-- 6. Tabla BAZKIDE_ENTRENATZAILE
CREATE TABLE BAZKIDE_ENTRENATZAILE (
    NAN VARCHAR(20) PRIMARY KEY,
    CONSTRAINT fk_bazkide_entrenatzaile_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 7. Atributo multivaluado TELEFONOA
CREATE TABLE TELEFONOA (
    NAN VARCHAR(20),
    telefonoa VARCHAR(20),
    PRIMARY KEY (NAN, telefonoa),
    CONSTRAINT fk_telefonoa_pers FOREIGN KEY (NAN) REFERENCES PERTSONA(NAN) ON DELETE CASCADE
);

-- 8. Tabla PISTA
CREATE TABLE PISTA (
    Zbkia INT PRIMARY KEY,
    Egoera VARCHAR(50)
);

-- 9. Tabla MANTENU_LANAK
CREATE TABLE MANTENU_LANAK (
    id_mantenu INT,
    zbkia INT,
    Data DATE,
    Deskribapena TEXT,
    Kostua DECIMAL(10, 2),
    PRIMARY KEY (id_mantenu, zbkia),
    CONSTRAINT fk_mantenu_pista FOREIGN KEY (zbkia) REFERENCES PISTA(Zbkia) ON DELETE CASCADE
);

-- 10. Tabla TALDEA
CREATE TABLE TALDEA (
    taldeID INT PRIMARY KEY,
    izena VARCHAR(50) NOT NULL,
    sorrera_data DATE,
    NAN VARCHAR(20),
    CONSTRAINT fk_taldea_bazkidea FOREIGN KEY (NAN) REFERENCES BAZKIDEA(NAN)
);

-- 11. Tabla SAIO_HARTZAILE
CREATE TABLE SAIO_HARTZAILE (
    harrID INT PRIMARY KEY,
    Izena VARCHAR(50),
    Sorrera_data DATE,
    NAN VARCHAR(20),
    CONSTRAINT fk_saio_hartzaile_bazkidea FOREIGN KEY (NAN) REFERENCES BAZKIDEA(NAN)
);

-- 12. Relación Ternaria PROGRAMATU (Sesiones)[cite: 9]
CREATE TABLE PROGRAMATU (
    saioID INT PRIMARY KEY,
    harrID INT NOT NULL,
    NAN VARCHAR(20) NOT NULL,
    zbkia INT NOT NULL,
    Hasiera_ordua TIME,
    Iraupena INT,
    Data DATE,
    CONSTRAINT fk_prog_hartzaile FOREIGN KEY (harrID) REFERENCES SAIO_HARTZAILE(harrID),
    CONSTRAINT fk_prog_entrenatzailea FOREIGN KEY (NAN) REFERENCES ENTRENATZAILEA(NAN),
    CONSTRAINT fk_prog_pista FOREIGN KEY (zbkia) REFERENCES PISTA(Zbkia)
);

-- 13. Tabla ERRESERBA[cite: 10]
CREATE TABLE ERRESERBA (
    id_erreserba INT PRIMARY KEY,
    Data DATE,
    Hasiera_ordua TIME,
    Amaiera_ordua TIME,
    Egoera VARCHAR(50),
    Sortze_data DATE,
    Pertsona_NAN VARCHAR(20),
    Pista_Zbkia INT,
    CONSTRAINT fk_erreserba_bazkidea FOREIGN KEY (Pertsona_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_erreserba_pista FOREIGN KEY (Pista_Zbkia) REFERENCES PISTA(Zbkia)
);

-- 14. Relación PARTE_HARTU (Bazkidea y Erreserba)[cite: 10]
CREATE TABLE PARTE_HARTU (
    Bazkide_NAN VARCHAR(20),
    Erreserba_ID INT,
    Rola VARCHAR(50),
    Asistentzia BOOLEAN,
    PRIMARY KEY (Bazkide_NAN, Erreserba_ID),
    CONSTRAINT fk_parte_bazkidea FOREIGN KEY (Bazkide_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_parte_erreserba FOREIGN KEY (Erreserba_ID) REFERENCES ERRESERBA(id_erreserba) ON DELETE CASCADE
);

-- 15. Relación EGON (Bazkidea y Taldea)[cite: 10]
CREATE TABLE EGON (
    Bazkide_NAN VARCHAR(20),
    Talde_ID INT,
    PRIMARY KEY (Bazkide_NAN, Talde_ID),
    CONSTRAINT fk_egon_bazkidea FOREIGN KEY (Bazkide_NAN) REFERENCES BAZKIDEA(NAN),
    CONSTRAINT fk_egon_taldea FOREIGN KEY (Talde_ID) REFERENCES TALDEA(taldeID) ON DELETE CASCADE
);

-- 16. Relación SORTU (Entrenatzailea y Taldea)[cite: 10]
CREATE TABLE SORTU (
    NAN VARCHAR(20),
    Talde_ID INT,
    PRIMARY KEY (NAN, Talde_ID),
    CONSTRAINT fk_sortu_entrenatzailea FOREIGN KEY (NAN) REFERENCES ENTRENATZAILEA(NAN),
    CONSTRAINT fk_sortu_taldea FOREIGN KEY (Talde_ID) REFERENCES TALDEA(taldeID) ON DELETE CASCADE
);