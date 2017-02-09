CREATE TABLE importacao (empresa character varying, razao character varying, departamento character varying, descricao character varying, gestor character varying);

COPY importacao FROM 'C:\importacao\emp_dep.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO teste.empresa (empresa, nome)
SELECT DISTINCT importacao.empresa, importacao.razao 
FROM importacao

INSERT INTO teste.departamento (departamento, nome, empresa, matricula)
SELECT DISTINCT importacao.departamento, importacao.descricao, empresa.empresa, CAST(importacao.gestor AS NUMERIC)
FROM importacao
INNER JOIN teste.empresa ON IMPORTACAO.empresa = empresa.empresa

DROP TABLE importacao;