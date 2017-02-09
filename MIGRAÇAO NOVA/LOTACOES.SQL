CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, codigolotacao character varying, nome character varying, tipo smallint, enderecodiferente boolean, tipologradouro character varying, logradouro character varying, numero character varying, complemento character varying, bairro character varying, cidade character varying, cep character varying, uf character varying, municipio character varying, centrocustonasajon bigint, classefinnasajon bigint, ccustopersona character varying, classefinpersona character varying, outrasentidadesdiferente boolean, fpas character varying, codigoterceiros character varying, aliquotaterceiros double precision, agentenocivo character varying, codigoestabelecimento character varying, codigotomador character varying, codigoobra character varying, nuncaexpostoagentenocivo boolean);

--COPY importacao FROM 'C:\NASAJONIMPORTACAO\lotacoes.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';



UPDATE persona.lotacoes SET
	
	
	nome  = case when importacao.Nome is null then lotacoes.nome  else importacao.Nome end,
	tipo  = case when importacao.Tipo is null then lotacoes.tipo  else importacao.Tipo end,
	enderecodiferente  = case when importacao.EnderecoDiferente is null then lotacoes.enderecodiferente  else importacao.EnderecoDiferente end,
	tipologradouro  = case when importacao.TipoLogradouro is null then lotacoes.tipologradouro  else importacao.TipoLogradouro end,
	logradouro  = case when importacao.Logradouro is null then lotacoes.logradouro  else importacao.Logradouro end,
	numero  = case when importacao.Numero is null then lotacoes.numero  else importacao.Numero end,
	complemento  = case when importacao.Complemento is null then lotacoes.complemento  else importacao.Complemento end,
	bairro  = case when importacao.Bairro is null then lotacoes.bairro  else importacao.Bairro end,
	cidade  = case when importacao.Cidade is null then lotacoes.cidade  else importacao.Cidade end,
	cep  = case when importacao.Cep is null then lotacoes.cep  else importacao.Cep end,
	uf  = case when importacao.Uf is null then lotacoes.uf  else importacao.Uf end,
	municipio  = case when importacao.Municipio is null then lotacoes.municipio  else importacao.Municipio end,
	centrocustonasajon  = case when importacao.CentroCustoNasajon is null then lotacoes.centrocustonasajon  else importacao.CentroCustoNasajon end,
	classefinnasajon  = case when importacao.ClasseFinNasajon is null then lotacoes.classefinnasajon  else importacao.ClasseFinNasajon end,
	ccustopersona  = case when importacao.CcustoPersona is null then lotacoes.ccustopersona  else importacao.CcustoPersona end,
	classefinpersona  = case when importacao.ClasseFinPersona is null then lotacoes.classefinpersona  else importacao.ClasseFinPersona end,
	outrasentidadesdiferente  = case when importacao.OutrasEntidadesDiferente is null then lotacoes.outrasentidadesdiferente  else importacao.OutrasEntidadesDiferente end,
	fpas  = case when importacao.Fpas is null then lotacoes.fpas  else importacao.Fpas end,
	codigoterceiros  = case when importacao.CodigoTerceiros is null then lotacoes.codigoterceiros  else importacao.CodigoTerceiros end,
	aliquotaterceiros  = case when importacao.AliquotaTerceiros is null then lotacoes.aliquotaterceiros  else importacao.AliquotaTerceiros end,
	agentenocivo  = case when importacao.AgenteNocivo is null then lotacoes.agentenocivo  else importacao.AgenteNocivo end,
	
	
	estabelecimento  = case when importacao.CodigoEstabelecimento is null then lotacoes.estabelecimento  else (SELECT estabelecimento FROM ns.estabelecimentos WHERE estabelecimentos.codigo = importacao.codigoestabelecimento AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial))) END,
	tomador  = case when importacao.CodigoTomador is null then lotacoes.tomador  else (SELECT id FROM ns.pessoas WHERE pessoa = pessoas.pessoa AND pessoas.id IN (SELECT registro FROM ns.conjuntosfichas WHERE conjunto IN 
	(SELECT conjunto FROM ns.estabelecimentosconjuntos WHERE estabelecimento IN 
	(SELECT estabelecimento FROM ns.estabelecimentos WHERE empresa IN 
	(SELECT empresa FROM ns.empresas WHERE grupoempresarial IN 
	(SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = importacao.codigogrupoempresarial
	)
	)
	)
	)))
	 end,
	lotacao  = case when importacao.codigolotacao is null then lotacoes.lotacao  else (SELECT lotacao FROM persona.lotacoes WHERE codigo = importacao.codigolotacao AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = importacao.codigogrupoempresarial))) END,

	obra  = case when importacao.CodigoObra is null then lotacoes.obra  else (SELECT id FROM ns.obras WHERE obras.id_estabelecimento =(SELECT estabelecimento from ns.estabelecimentos WHERE estabelecimentos.codigo = importacao.codigoestabelecimento) OR obras.id_pessoa = (SELECT id FROM ns.pessoas WHERE pessoa = pessoas.pessoa AND pessoas.id IN (SELECT registro FROM ns.conjuntosfichas WHERE conjunto IN 
	(SELECT conjunto FROM ns.estabelecimentosconjuntos WHERE estabelecimento IN 
	(SELECT estabelecimento FROM ns.estabelecimentos WHERE empresa IN 
	(SELECT empresa FROM ns.empresas WHERE grupoempresarial IN 
	(SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = importacao.codigogrupoempresarial
	)
	)
	)
	)))) END ,
	
	nuncaexpostoagentenocivo  = case when importacao.NuncaExpostoAgenteNocivo is null then lotacoes.nuncaexpostoagentenocivo  else importacao.NuncaExpostoAgenteNocivo end


FROM importacao, ns.gruposempresariais, ns.empresas
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.codigolotacao = lotacoes.codigo
AND empresas.empresa = lotacoes.empresa;




INSERT INTO persona.lotacoes(empresa, codigo  , nome  , tipo  , enderecodiferente  , tipologradouro  , logradouro  , numero  , complemento  , bairro  , cidade  , cep  , uf  , municipio  , centrocustonasajon  , classefinnasajon  , ccustopersona  , classefinpersona  , outrasentidadesdiferente  , fpas  , codigoterceiros  , aliquotaterceiros  , agentenocivo  , estabelecimento  , tomador  , lotacao  , obra  , nuncaexpostoagentenocivo )

SELECT empresas.Empresa , importacao.CodigoLotacao , importacao.Nome , importacao.Tipo , importacao.EnderecoDiferente , importacao.TipoLogradouro , importacao.Logradouro , importacao.Numero , importacao.Complemento , importacao.Bairro , importacao.Cidade , importacao.Cep , importacao.Uf , importacao.Municipio , importacao.CentroCustoNasajon , importacao.ClasseFinNasajon , importacao.CcustoPersona , importacao.ClasseFinPersona , importacao.OutrasEntidadesDiferente , importacao.Fpas , importacao.CodigoTerceiros , importacao.AliquotaTerceiros , importacao.AgenteNocivo , estabelecimentos.estabelecimento , tomadores.Tomador , lotacoes.Lotacao , obras.Obra , importacao.NuncaExpostoAgenteNocivo
FROM importacao, ns.gruposempresariais, ns.empresas
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
LEFT JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
LEFT JOIN persona.departamentos ON importacao.codigodepartamento = departamentos.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = importacao.codigogrupoempresarial
LEFT JOIN persona.horarios ON importacao.codigohorario = horarios.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
LEFT JOIN persona.lotacoes ON importacao.codigolotacao = lotacoes.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
LEFT JOIN persona.sindicatos ON importacao.codigosindicato = sindicatos.codigo
LEFT JOIN ns.estabelecimentos ON importacao.codigoestabelecimento = estabelecimentos.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 

WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.codigolotacao = lotacoes.codigo
AND empresas.empresa = lotacoes.empresa;

DROP TABLE importacao;