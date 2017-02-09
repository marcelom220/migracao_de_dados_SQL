CREATE TABLE importacao (empresa character varying, dois character varying, tres character varying, quatro character varying);

COPY importacao FROM 'C:\importacao\metas_emp.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO teste.emp_metas (periodo, empresa, meta)
SELECT '2012', importacao.empresa, CAST(importacao.dois AS REAL) 
FROM importacao

INSERT INTO teste.emp_metas (periodo, empresa, meta)
SELECT '2013', importacao.empresa, CAST(importacao.tres AS REAL) 
FROM importacao

INSERT INTO teste.emp_metas (periodo, empresa, meta)
SELECT '2014', importacao.empresa, CAST(importacao.quatro AS REAL)
FROM importacao

DROP TABLE importacao;


