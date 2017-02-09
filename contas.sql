CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, numeroconta character varying, numerocontamae character varying);

COPY importacao FROM 'C:\NASAJONIMPORTACAO\contas.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

INSERT INTO contabil.contas (empresa, codigo)
SELECT empresas.empresa, importacao.numeroconta
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
INNER JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
LEFT JOIN contabil.contas ON importacao.numeroconta = contas.codigo AND empresas.empresa = contas.empresa
WHERE contas.conta IS NULL;

UPDATE contabil.contas SET
	contamae = CASE WHEN importacao.numerocontamae IS NULL THEN contas.contamae ELSE (SELECT conta FROM contabil.contas WHERE codigo = importacao.numerocontamae AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial))) END
FROM importacao, ns.gruposempresariais, ns.empresas
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.numeroconta = contas.codigo
AND empresas.empresa = contas.empresa;

DROP TABLE importacao;