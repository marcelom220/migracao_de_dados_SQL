CREATE TABLE importacao (matricula character varying, nome character varying, empresa character varying, departamento character varying);

COPY importacao FROM 'C:\importacao\person1.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO teste.pessoas (matricula, nome, empresa, departamento)
SELECT CAST(importacao.matricula AS NUMERIC), importacao.nome, importacao.empresa, importacao.departamento 
FROM importacao




DROP TABLE importacao;
