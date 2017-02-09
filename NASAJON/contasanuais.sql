CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, numeroconta character varying, nomeconta character varying, anoconta integer, reduzidoconta character varying, naturezaconta integer, naturezacontalegado character varying, naturezasaldo integer, naturezasaldolegado character varying, permitecentrocusto smallint, permitecentrocustolegado character varying);


COPY importacao FROM 'C:\NASAJONIMPORTACAO\contasanuais.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';


UPDATE contabil.contasanuais SET
	nome = CASE WHEN importacao.nomeconta IS NULL THEN contasanuais.nome ELSE importacao.nomeconta END,
	reduzido = CASE WHEN importacao.reduzidoconta IS NULL THEN contasanuais.reduzido ELSE importacao.reduzidoconta END,
	natconta = CASE WHEN importacao.naturezaconta IS NULL THEN contasanuais.natconta ELSE importacao.naturezaconta END,
	natsaldo = CASE WHEN importacao.naturezasaldo IS NULL THEN contasanuais.natsaldo ELSE importacao.naturezasaldo END,
	permitecentrodecusto = CASE WHEN importacao.permitecentrocusto IS NULL THEN contasanuais.permitecentrodecusto ELSE importacao.permitecentrocusto END
FROM importacao, ns.gruposempresariais, ns.empresas, contabil.contas
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.numeroconta = contas.codigo
AND empresas.empresa = contas.empresa
AND contas.conta = contasanuais.conta
AND importacao.anoconta = contasanuais.ano;


INSERT INTO contabil.contasanuais (conta, nome, ano, reduzido, natconta, natsaldo, permitecentrodecusto)
SELECT contas.conta, importacao.nomeconta, importacao.anoconta, importacao.reduzidoconta, importacao.naturezaconta, importacao.naturezasaldo, importacao.permitecentrocusto
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
INNER JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
INNER JOIN contabil.contas ON importacao.numeroconta = contas.codigo AND empresas.empresa = contas.empresa
LEFT JOIN contabil.contasanuais ON contas.conta = contasanuais.conta AND importacao.anoconta = contasanuais.ano
WHERE contasanuais.contaanual IS NULL;


DROP TABLE importacao;