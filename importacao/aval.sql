CREATE TABLE importacao (matricula character varying, dois character varying, tres character varying, quatro character varying);

COPY importacao FROM 'C:\importacao\aval.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO teste.aval (periodo, matricula, nota)
SELECT '2012', CAST(importacao.matricula AS NUMERIC), CAST(importacao.dois AS REAL)
FROM importacao

INSERT INTO teste.aval (periodo, matricula, nota)
SELECT '2013', CAST(importacao.matricula AS NUMERIC), CAST(importacao.tres AS REAL)
FROM importacao

INSERT INTO teste.aval (periodo, matricula, nota)
SELECT '2014', CAST(importacao.matricula AS NUMERIC), CAST(importacao.quatro AS REAL)
FROM importacao

DROP TABLE importacao;

