--gutxienez 2 gehienez 8
ALTER TABLE ERRESERBA 
ADD CONSTRAINT chk_erreserba_konf 
CHECK (Egoera <> 'Konfirmatuta' OR Pista_Zbkia IS NOT NULL);