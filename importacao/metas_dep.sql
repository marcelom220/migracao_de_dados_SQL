CREATE TABLE importacao (empresa character varying, departamento character varying, dois character varying, tres character varying, quatro character varying);

COPY importacao FROM 'C:\importacao\metas_emp_dep.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO teste.dep_metas (periodo, empresa, departamento, meta)
SELECT '2012', importacao.empresa, importacao.departamento, CAST(importacao.dois AS REAL) 
FROM importacao

INSERT INTO teste.dep_metas (periodo, empresa, departamento, meta)
SELECT '2013', importacao.empresa, importacao.departamento, CAST(importacao.tres AS REAL) 
FROM importacao

INSERT INTO teste.dep_metas (periodo, empresa, departamento, meta)
SELECT '2014', importacao.empresa, importacao.departamento, CAST(importacao.quatro AS REAL)
FROM importacao

DROP TABLE importacao;


