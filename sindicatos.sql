CREATE TABLE importacao (codigosindicato character varying, nome character varying, logradouro character varying, numero character varying, complemento character varying, bairro character varying, cidade character varying, cep character varying, codigocontribuicao character varying, cnpj character varying, codigoentidadesindical character varying, pisosalarial numeric, calculoeacumulativo boolean, estado character varying, calculanofim boolean, patronal boolean, contato character varying, telefone character varying, dddtel character varying, fax character varying, dddfax character varying, email character varying, somentemaioranuenio boolean, multafgts double precision, mesesmediamaternidade smallint, diadissidio smallint, diasaviso smallint, qtdemrre smallint, qtdemrfe smallint, qtdemr13 smallint, mesassistencial smallint, mediaferiaspelomaiorvalor boolean, media13pelomaiorvalor boolean, mediarescisaopelomaiorvalor boolean, mesdesconto smallint, mesdissidio smallint, mesesmediaferias smallint, mesesmediarescisao smallint, mesesmedia13 smallint, numeradorfracao smallint, denominadorfracao smallint, fpas character varying, codigoterceiros character varying, sindicato character varying);

--COPY importacao FROM 'C:\NASAJONIMPORTACAO\sindicatos.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

UPDATE persona.sindicatos SET
	
	
	
	nome  = case when importacao.Nome is null then sindicatos.nome  else importacao.Nome end,
	logradouro  = case when importacao.Logradouro is null then sindicatos.logradouro  else importacao.Logradouro end,
	numero  = case when importacao.Numero is null then sindicatos.numero  else importacao.Numero end,
	complemento  = case when importacao.Complemento is null then sindicatos.complemento  else importacao.Complemento end,
	bairro  = case when importacao.Bairro is null then sindicatos.bairro  else importacao.Bairro end,
	cidade  = case when importacao.Cidade is null then sindicatos.cidade  else importacao.Cidade end,
	cep  = case when importacao.Cep is null then sindicatos.cep  else importacao.Cep end,
	codigocontribuicao  = case when importacao.CodigoContribuicao is null then sindicatos.codigocontribuicao  else importacao.CodigoContribuicao end,
	cnpj  = case when importacao.Cnpj is null then sindicatos.cnpj  else importacao.Cnpj end,
	codigoentidadesindical  = case when importacao.CodigoEntidadeSindical is null then sindicatos.codigoentidadesindical  else importacao.CodigoEntidadeSindical end,
	pisosalarial  = case when importacao.PisoSalarial is null then sindicatos.pisosalarial  else importacao.PisoSalarial end,
	calculoeacumulativo  = case when importacao.CalculoEAcumulativo is null then sindicatos.calculoeacumulativo  else importacao.CalculoEAcumulativo end,
	estado  = case when importacao.Estado is null then sindicatos.estado  else importacao.Estado end,
	calculanofim  = case when importacao.CalculaNoFim is null then sindicatos.calculanofim  else importacao.CalculaNoFim end,
	patronal  = case when importacao.Patronal is null then sindicatos.patronal  else importacao.Patronal end,
	contato  = case when importacao.Contato is null then sindicatos.contato  else importacao.Contato end,
	telefone  = case when importacao.Telefone is null then sindicatos.telefone  else importacao.Telefone end,
	dddtel  = case when importacao.DddTel is null then sindicatos.dddtel  else importacao.DddTel end,
	fax  = case when importacao.Fax is null then sindicatos.fax  else importacao.Fax end,
	dddfax  = case when importacao.DddFax is null then sindicatos.dddfax  else importacao.DddFax end,
	email  = case when importacao.Email is null then sindicatos.email  else importacao.Email end,
	somentemaioranuenio  = case when importacao.SomenteMaiorAnuenio is null then sindicatos.somentemaioranuenio  else importacao.SomenteMaiorAnuenio end,
	multafgts  = case when importacao.MultaFgts is null then sindicatos.multafgts  else importacao.MultaFgts end,
	mesesmediamaternidade  = case when importacao.MesesMediaMaternidade is null then sindicatos.mesesmediamaternidade  else importacao.MesesMediaMaternidade end,
	diadissidio  = case when importacao.DiaDissidio is null then sindicatos.diadissidio  else importacao.DiaDissidio end,
	diasaviso  = case when importacao.DiasAviso is null then sindicatos.diasaviso  else importacao.DiasAviso end,
	qtdemrre  = case when importacao.QtdEMrre is null then sindicatos.qtdemrre  else importacao.QtdEMrre end,
	qtdemrfe  = case when importacao.QtdEMrfe is null then sindicatos.qtdemrfe  else importacao.QtdEMrfe end,
	qtdemr13  = case when importacao.QtdEMr13 is null then sindicatos.qtdemr13  else importacao.QtdEMr13 end,
	mesassistencial  = case when importacao.MesAssistencial is null then sindicatos.mesassistencial  else importacao.MesAssistencial end,
	mediaferiaspelomaiorvalor  = case when importacao.MediaFeriasPeloMaiorValor is null then sindicatos.mediaferiaspelomaiorvalor  else importacao.MediaFeriasPeloMaiorValor end,
	media13pelomaiorvalor  = case when importacao.Media13PeloMaiorValor is null then sindicatos.media13pelomaiorvalor  else importacao.Media13PeloMaiorValor end,
	mediarescisaopelomaiorvalor  = case when importacao.MediaRescisaoPeloMaiorValor is null then sindicatos.mediarescisaopelomaiorvalor  else importacao.MediaRescisaoPeloMaiorValor end,
	mesdesconto  = case when importacao.MesDesconto is null then sindicatos.mesdesconto  else importacao.MesDesconto end,
	mesdissidio  = case when importacao.MesDissidio is null then sindicatos.mesdissidio  else importacao.MesDissidio end,
	mesesmediaferias  = case when importacao.MesesMediaFerias is null then sindicatos.mesesmediaferias  else importacao.MesesMediaFerias end,
	mesesmediarescisao  = case when importacao.MesesMediaRescisao is null then sindicatos.mesesmediarescisao  else importacao.MesesMediaRescisao end,
	mesesmedia13  = case when importacao.MesesMedia13 is null then sindicatos.mesesmedia13  else importacao.MesesMedia13 end,
	numeradorfracao  = case when importacao.NumeradorFracao is null then sindicatos.numeradorfracao  else importacao.NumeradorFracao end,
	denominadorfracao  = case when importacao.DenominadorFracao is null then sindicatos.denominadorfracao  else importacao.DenominadorFracao end,
	fpas  = case when importacao.Fpas is null then sindicatos.fpas  else importacao.Fpas end,
	codigoterceiros  = case when importacao.CodigoTerceiros is null then sindicatos.codigoterceiros  else importacao.CodigoTerceiros end


	
FROM importacao
WHERE importacao.codigosindicato = sindicatos.codigo ;




INSERT INTO persona.sindicatos (codigo , nome , logradouro , numero , complemento , bairro , cidade , cep , codigocontribuicao , cnpj , codigoentidadesindical , pisosalarial , calculoeacumulativo , estado , calculanofim , patronal , contato , telefone , dddtel , fax , dddfax , email , somentemaioranuenio , multafgts , mesesmediamaternidade , diadissidio , diasaviso , qtdemrre , qtdemrfe , qtdemr13 , mesassistencial , mediaferiaspelomaiorvalor , media13pelomaiorvalor , mediarescisaopelomaiorvalor , mesdesconto , mesdissidio , mesesmediaferias , mesesmediarescisao , mesesmedia13 , numeradorfracao , denominadorfracao , fpas, codigoterceiros)
SELECT importacao.codigosindicato , importacao.nome , importacao.logradouro , importacao.numero , importacao.complemento , importacao.bairro , importacao.cidade , importacao.cep , importacao.codigocontribuicao , importacao.cnpj , importacao.codigoentidadesindical , importacao.pisosalarial , importacao.calculoeacumulativo , importacao.estado , importacao.calculanofim , importacao.patronal , importacao.contato , importacao.telefone , importacao.dddtel , importacao.fax , importacao.dddfax , importacao.email , importacao.somentemaioranuenio , importacao.multafgts , importacao.mesesmediamaternidade , importacao.diadissidio , importacao.diasaviso , importacao.qtdemrre , importacao.qtdemrfe , importacao.qtdemr13 , importacao.mesassistencial , importacao.mediaferiaspelomaiorvalor , importacao.media13pelomaiorvalor , importacao.mediarescisaopelomaiorvalor , importacao.mesdesconto , importacao.mesdissidio , importacao.mesesmediaferias , importacao.mesesmediarescisao , importacao.mesesmedia13 , importacao.numeradorfracao , importacao.denominadorfracao , importacao.fpas , importacao.codigoterceiros
FROM importacao,persona.sindicatos
WHERE sindicatos.sindicato IS NULL;


DROP TABLE importacao;