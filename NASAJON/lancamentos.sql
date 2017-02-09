CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, codigoestabelecimento character varying, numerocontacredito character varying, numerocontadebito character varying, numerolancamento bigint, anolancamento integer, tipolancamento integer, tipolancamentolegado character varying, historicolancamento character varying, valorlancamento numeric, lancamentogerencial boolean, lancamentogerenciallegado character varying, nomemaquina character varying, tipooperacaolancamento integer, tipooperacaolancamentolegado character varying, indicadorlancamentofcont integer, indicadorlancamentofcontlegado character varying, societario boolean, societariolegado character varying, datalancamento date, datainclusaolancamento timestamp without time zone, codigocentrocusto character varying, codigolote character varying, codigoparticipante character varying, loginusuariosistema character varying);


COPY importacao FROM 'C:\NASAJONIMPORTACAO\lancamentos.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';


INSERT INTO contabil.lancamentos (estabelecimento, contacredito, contadebito, numero, ano, tipo, historico, valor, lancamentogerencial, nomemaquina, operacao, indicadorlancamentofcont, societario, data, datainclusao, centrodecusto, lote, pessoa, usuario)
SELECT estabelecimentos.estabelecimento, contascredito.contaanual, contasdebito.contaanual, importacao.numerolancamento, importacao.anolancamento, importacao.tipolancamento, importacao.historicolancamento, importacao.valorlancamento, importacao.lancamentogerencial, importacao.nomemaquina, importacao.tipooperacaolancamento, importacao.indicadorlancamentofcont, importacao.societario, importacao.datalancamento, importacao.datainclusaolancamento, centrosdecustoanuais.centrodecustoanual, lotes.lote, pessoas.id, usuarios.usuario
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
INNER JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
INNER JOIN ns.estabelecimentos ON importacao.codigoestabelecimento = estabelecimentos.codigo AND empresas.empresa = estabelecimentos.empresa
LEFT JOIN contabil.contas contasc ON estabelecimentos.empresa = contasc.empresa AND importacao.numerocontacredito = contasc.codigo
LEFT JOIN contabil.contasanuais contascredito ON contasc.conta = contascredito.conta AND importacao.anolancamento = contascredito.ano
LEFT JOIN contabil.contas contasd ON estabelecimentos.empresa = contasd.empresa AND importacao.numerocontadebito = contasd.codigo
LEFT JOIN contabil.contasanuais contasdebito ON contasd.conta = contasdebito.conta AND importacao.anolancamento = contasdebito.ano
LEFT JOIN contabil.centrosdecusto ON importacao.codigocentrocusto = centrosdecusto.codigo AND empresas.empresa = centrosdecusto.empresa
LEFT JOIN contabil.centrosdecustoanuais ON centrosdecusto.centrodecusto = centrosdecustoanuais.centrodecusto AND importacao.anolancamento = centrosdecustoanuais.ano
LEFT JOIN contabil.lotes ON importacao.codigolote = lotes.codigo AND estabelecimentos.estabelecimento = lotes.estabelecimento
LEFT JOIN ns.usuarios ON importacao.loginusuariosistema = usuarios.login
LEFT JOIN ns.pessoas ON importacao.codigoparticipante = pessoas.pessoa AND pessoas.id IN (SELECT registro FROM ns.conjuntosfichas WHERE conjunto IN 
    										   (SELECT conjunto FROM ns.estabelecimentosconjuntos WHERE estabelecimento IN 
											    (SELECT estabelecimento FROM ns.estabelecimentos WHERE empresa IN 
											     (SELECT empresa FROM ns.empresas WHERE grupoempresarial IN 
											      (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = importacao.codigogrupoempresarial
											      )
											     )
											    )
											   )
											  );

DROP TABLE importacao;