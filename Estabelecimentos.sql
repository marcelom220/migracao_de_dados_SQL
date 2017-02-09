
CREATE TABLE importacao (codigoempresa character varying, codigoestabelecimento character varying, descricao character varying, tipoidentificacao smallint, raizcnpj character varying, ordemcnpj character varying, cpf character varying, caepf character varying, cidade character varying, inscricaoestadual character varying, inscricaomunicipal character varying, nomefantasia character varying, email character varying, site character varying, codigotipologradouro character varying, logradouro character varying, numero character varying, complemento character varying, bairro character varying, cep character varying, tiposimples smallint, dddtel character varying, telefone character varying, dddfax character varying, fax character varying, bloqueado smallint, selecionarcfop smallint, ramoatividade character varying, qualificacao integer, naturezapj integer, anofiscal integer, inicio_atividades date, final_atividades date, dataregistro date, suframa character varying, atividademunicipal character varying, atividadeestadual character varying, registro character varying, representante character varying, cpfrepresentante character varying, dddtelrepresentante character varying, telefonerepresentante character varying, ramalrepresentante character varying, dddfaxrepresentante character varying, faxrepresentante character varying, emailrepresentante character varying, caixapostal character varying, ufcaixapostal character varying, cepcaixapostal character varying, codigofpas character varying, acidentetrabalho character varying, numeroproprietarios integer, numerofamiliares integer, numeroconta character varying, tipopagamento character varying, codigoterceiros character varying, porte integer, fazpartepat boolean, aliquotafilantropica double precision, capitalsocial numeric, observacao character varying, pagapis boolean, tipoconta smallint, inicioexercicio date, cei character varying, datanascimentorepresentante date, sexorepresentante smallint, contacorrentepagadora character varying, codigoibge character varying, codigocnae character varying, identificacaoregistro integer, contribuinteipi boolean, tipocontroleponto smallint, centralizacontribuicaosindical boolean, nomecontato character varying, cpfcontato character varying, telefonefixocontato character varying, dddtelfixocontato character varying, telefonecelularcontato character varying, dddtelcelularcontato character varying, faxcontato character varying, dddfaxcontato character varying, emailcontato character varying, excessosublimite boolean, aliquotaaplicavel double precision, logotipo bytea, alelocodigopessoajuridica bigint, alelonumerofilial integer, nisrepresentante character varying, dataimplantacaosaldo date, codigoagencia character varying, codigocontador character varying, codigosindicato character varying);

--COPY importacao FROM 'C:\NASAJONIMPORTACAO\estabelecimentos.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

UPDATE ns.estabelecimentos SET
	descricao = case when importacao.descricao is null then estabelecimentos.descricao else importacao.descricao end,
	tipoidentificacao = case when importacao.tipoidentificacao is null then estabelecimentos.tipoidentificacao else importacao.tipoidentificacao end,
	raizcnpj = case when importacao.raizcnpj is null then estabelecimentos.raizcnpj else importacao.raizcnpj end,
	ordemcnpj = case when importacao.ordemcnpj is null then estabelecimentos.ordemcnpj else importacao.ordemcnpj end,
	cpf = case when importacao.cpf is null then estabelecimentos.cpf else importacao.cpf end,
	caepf = case when importacao.caepf is null then estabelecimentos.caepf else importacao.caepf end,
	cidade = case when importacao.cidade is null then estabelecimentos.cidade else importacao.cidade end,
	inscricaoestadual = case when importacao.inscricaoestadual is null then estabelecimentos.inscricaoestadual else importacao.inscricaoestadual end,
	inscricaomunicipal = case when importacao.inscricaomunicipal is null then estabelecimentos.inscricaomunicipal else importacao.inscricaomunicipal end,
	nomefantasia = case when importacao.nomefantasia is null then estabelecimentos.nomefantasia else importacao.nomefantasia end,
	email = case when importacao.email is null then estabelecimentos.email else importacao.email end,
	site = case when importacao.site is null then estabelecimentos.site else importacao.site end,
	logradouro = case when importacao.logradouro is null then estabelecimentos.logradouro else importacao.logradouro end,
	numero = case when importacao.numero is null then estabelecimentos.numero else importacao.numero end,
	complemento = case when importacao.complemento is null then estabelecimentos.complemento else importacao.complemento end,
	bairro = case when importacao.bairro is null then estabelecimentos.bairro else importacao.bairro end,
	cep = case when importacao.cep is null then estabelecimentos.cep else importacao.cep end,
	tiposimples = case when importacao.tiposimples is null then estabelecimentos.tiposimples else importacao.tiposimples end,
	dddtel = case when importacao.dddtel is null then estabelecimentos.dddtel else importacao.dddtel end,
	telefone = case when importacao.telefone is null then estabelecimentos.telefone else importacao.telefone end,
	dddfax = case when importacao.dddfax is null then estabelecimentos.dddfax else importacao.dddfax end,
	fax = case when importacao.fax is null then estabelecimentos.fax else importacao.fax end,
	bloqueado = case when importacao.bloqueado is null then estabelecimentos.bloqueado else importacao.bloqueado end,
	selecionarcfop = case when importacao.selecionarcfop is null then estabelecimentos.selecionarcfop else importacao.selecionarcfop end,
	ramoatividade = case when importacao.ramoatividade is null then estabelecimentos.ramoatividade else importacao.ramoatividade end,
	qualificacao = case when importacao.qualificacao is null then estabelecimentos.qualificacao else importacao.qualificacao end,
	naturezapj = case when importacao.naturezapj is null then estabelecimentos.naturezapj else importacao.naturezapj end,
	anofiscal = case when importacao.anofiscal is null then estabelecimentos.anofiscal else importacao.anofiscal end,
	inicio_atividades = case when importacao.inicio_atividades is null then estabelecimentos.inicio_atividades else importacao.inicio_atividades end,
	final_atividades = case when importacao.final_atividades is null then estabelecimentos.final_atividades else importacao.final_atividades end,
	dataregistro = case when importacao.dataregistro is null then estabelecimentos.dataregistro else importacao.dataregistro end,
	suframa = case when importacao.suframa is null then estabelecimentos.suframa else importacao.suframa end,
	atividademunicipal = case when importacao.atividademunicipal is null then estabelecimentos.atividademunicipal else importacao.atividademunicipal end,
	atividadeestadual = case when importacao.atividadeestadual is null then estabelecimentos.atividadeestadual else importacao.atividadeestadual end,
	registro = case when importacao.registro is null then estabelecimentos.registro else importacao.registro end,
	representante = case when importacao.representante is null then estabelecimentos.representante else importacao.representante end,
	cpfrepresentante = case when importacao.cpfrepresentante is null then estabelecimentos.cpfrepresentante else importacao.cpfrepresentante end,
	dddtelrepresentante = case when importacao.dddtelrepresentante is null then estabelecimentos.dddtelrepresentante else importacao.dddtelrepresentante end,
	telefonerepresentante = case when importacao.telefonerepresentante is null then estabelecimentos.telefonerepresentante else importacao.telefonerepresentante end,
	ramalrepresentante = case when importacao.ramalrepresentante is null then estabelecimentos.ramalrepresentante else importacao.ramalrepresentante end,
	dddfaxrepresentante = case when importacao.dddfaxrepresentante is null then estabelecimentos.dddfaxrepresentante else importacao.dddfaxrepresentante end,
	faxrepresentante = case when importacao.faxrepresentante is null then estabelecimentos.faxrepresentante else importacao.faxrepresentante end,
	emailrepresentante = case when importacao.emailrepresentante is null then estabelecimentos.emailrepresentante else importacao.emailrepresentante end,
	caixapostal = case when importacao.caixapostal is null then estabelecimentos.caixapostal else importacao.caixapostal end,
	ufcaixapostal = case when importacao.ufcaixapostal is null then estabelecimentos.ufcaixapostal else importacao.ufcaixapostal end,
	cepcaixapostal = case when importacao.cepcaixapostal is null then estabelecimentos.cepcaixapostal else importacao.cepcaixapostal end,
	acidentetrabalho = case when importacao.acidentetrabalho is null then estabelecimentos.acidentetrabalho else importacao.acidentetrabalho end,
	numeroproprietarios = case when importacao.numeroproprietarios is null then estabelecimentos.numeroproprietarios else importacao.numeroproprietarios end,
	numerofamiliares = case when importacao.numerofamiliares is null then estabelecimentos.numerofamiliares else importacao.numerofamiliares end,
	numeroconta = case when importacao.numeroconta is null then estabelecimentos.numeroconta else importacao.numeroconta end,
	tipopagamento = case when importacao.tipopagamento is null then estabelecimentos.tipopagamento else importacao.tipopagamento end,
	codigoterceiros = case when importacao.codigoterceiros is null then estabelecimentos.codigoterceiros else importacao.codigoterceiros end,
	porte = case when importacao.porte is null then estabelecimentos.porte else importacao.porte end,
	fazpartepat = case when importacao.fazpartepat is null then estabelecimentos.fazpartepat else importacao.fazpartepat end,
	aliquotafilantropica = case when importacao.aliquotafilantropica is null then estabelecimentos.aliquotafilantropica else importacao.aliquotafilantropica end,
	capitalsocial = case when importacao.capitalsocial is null then estabelecimentos.capitalsocial else importacao.capitalsocial end,
	observacao = case when importacao.observacao is null then estabelecimentos.observacao else importacao.observacao end,
	pagapis = case when importacao.pagapis is null then estabelecimentos.pagapis else importacao.pagapis end,
	tipoconta = case when importacao.tipoconta is null then estabelecimentos.tipoconta else importacao.tipoconta end,
	inicioexercicio = case when importacao.inicioexercicio is null then estabelecimentos.inicioexercicio else importacao.inicioexercicio end,
	cei = case when importacao.cei is null then estabelecimentos.cei else importacao.cei end,
	datanascimentorepresentante = case when importacao.datanascimentorepresentante is null then estabelecimentos.datanascimentorepresentante else importacao.datanascimentorepresentante end,
	sexorepresentante = case when importacao.sexorepresentante is null then estabelecimentos.sexorepresentante else importacao.sexorepresentante end,
	contacorrentepagadora = case when importacao.contacorrentepagadora is null then estabelecimentos.contacorrentepagadora else importacao.contacorrentepagadora end,
	identificacaoregistro = case when importacao.identificacaoregistro is null then estabelecimentos.identificacaoregistro else importacao.identificacaoregistro end,
	contribuinteipi = case when importacao.contribuinteipi is null then estabelecimentos.contribuinteipi else importacao.contribuinteipi end,
	tipocontroleponto = case when importacao.tipocontroleponto is null then estabelecimentos.tipocontroleponto else importacao.tipocontroleponto end,
	centralizacontribuicaosindical = case when importacao.centralizacontribuicaosindical is null then estabelecimentos.centralizacontribuicaosindical else importacao.centralizacontribuicaosindical end,
	nomecontato = case when importacao.nomecontato is null then estabelecimentos.nomecontato else importacao.nomecontato end,
	cpfcontato = case when importacao.cpfcontato is null then estabelecimentos.cpfcontato else importacao.cpfcontato end,
	telefonefixocontato = case when importacao.telefonefixocontato is null then estabelecimentos.telefonefixocontato else importacao.telefonefixocontato end,
	dddtelfixocontato = case when importacao.dddtelfixocontato is null then estabelecimentos.dddtelfixocontato else importacao.dddtelfixocontato end,
	telefonecelularcontato = case when importacao.telefonecelularcontato is null then estabelecimentos.telefonecelularcontato else importacao.telefonecelularcontato end,
	dddtelcelularcontato = case when importacao.dddtelcelularcontato is null then estabelecimentos.dddtelcelularcontato else importacao.dddtelcelularcontato end,
	faxcontato = case when importacao.faxcontato is null then estabelecimentos.faxcontato else importacao.faxcontato end,
	dddfaxcontato = case when importacao.dddfaxcontato is null then estabelecimentos.dddfaxcontato else importacao.dddfaxcontato end,
	emailcontato = case when importacao.emailcontato is null then estabelecimentos.emailcontato else importacao.emailcontato end,
	excessosublimite = case when importacao.excessosublimite is null then estabelecimentos.excessosublimite else importacao.excessosublimite end,
	aliquotaaplicavel = case when importacao.aliquotaaplicavel is null then estabelecimentos.aliquotaaplicavel else importacao.aliquotaaplicavel end,
	logotipo = case when importacao.logotipo is null then estabelecimentos.logotipo else importacao.logotipo end,
	alelocodigopessoajuridica = case when importacao.alelocodigopessoajuridica is null then estabelecimentos.alelocodigopessoajuridica else importacao.alelocodigopessoajuridica end,
	alelonumerofilial = case when importacao.alelonumerofilial is null then estabelecimentos.alelonumerofilial else importacao.alelonumerofilial end,
	nisrepresentante = case when importacao.nisrepresentante is null then estabelecimentos.nisrepresentante else importacao.nisrepresentante end,
	dataimplantacaosaldo = case when importacao.dataimplantacaosaldo is null then estabelecimentos.dataimplantacaosaldo else importacao.dataimplantacaosaldo end,
	agencia = case when importacao.codigoagencia is null then estabelecimentos.agencia else (SELECT agencia FROM financas.agencias Where codigo = importacao.codigoagencia) END,
	cnae = case when importacao.codigocnae is null then estabelecimentos.cnae else (SELECT cnae  FROM ns.cnaes WHERE cnae = importacao.codigocnae) END,
	contador = case when importacao.codigocontador is null then estabelecimentos.contador else (SELECT contador  FROM ns.contadores WHERE codigo = importacao.codigocontador) END,
	fpas = case when importacao.codigofpas is null then estabelecimentos.fpas else (SELECT fpas  FROM persona.fpas WHERE fpas = importacao.codigofpas) END,
	ibge = case when importacao.codigoibge is null then estabelecimentos.ibge else (SELECT ibge  FROM ns.municipios WHERE ibge = importacao.codigoibge) END,
	sindicato = case when importacao.codigosindicato is null then estabelecimentos.sindicato else (SELECT sindicato  FROM persona.sindicatos WHERE codigo = importacao.codigosindicato) END,
	tipologradouro = case when importacao.codigotipologradouro is null then estabelecimentos.tipologradouro else (SELECT tipologradouro FROM ns.tiposlogradouros WHERE tipologradouro = importacao.codigotipologradouro) END

FROM importacao, ns.gruposempresariais,ns.empresas
WHERE importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND  importacao.codigoestabelecimento = estabelecimentos.codigo
AND empresas.empresa = estabelecimentos.empresa;
DROP TRIGGER IF EXISTS "TRG_MigracaoCadastroEstabelecimento" ON ns.estabelecimentos;

DROP FUNCTION IF EXISTS ns.migracaocadastroestabelecimento();

CREATE FUNCTION ns.migracaocadastroestabelecimento()
 RETURNS trigger AS
$$
BEGIN
	SELECT ns.criarestabelecimento(NEW.estabelecimento);
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER "TRG_MigracaoCadastroEstabelecimento"
  AFTER INSERT
  ON ns.estabelecimentos
  FOR EACH ROW
  EXECUTE PROCEDURE ns.migracaocadastroestabelecimento();

INSERT INTO ns.estabelecimentos (empresa , codigo , descricao , tipoidentificacao , raizcnpj , ordemcnpj , cpf , caepf , cidade , inscricaoestadual , inscricaomunicipal , nomefantasia , email , site , tipologradouro , logradouro , numero , complemento , bairro , cep , tiposimples , dddtel , telefone , dddfax , fax , bloqueado , selecionarcfop , ramoatividade , qualificacao , naturezapj , anofiscal , inicio_atividades , final_atividades , dataregistro , suframa , atividademunicipal , atividadeestadual , registro , representante , cpfrepresentante , dddtelrepresentante , telefonerepresentante , ramalrepresentante , dddfaxrepresentante , faxrepresentante , emailrepresentante , caixapostal , ufcaixapostal , cepcaixapostal , fpas , acidentetrabalho , numeroproprietarios , numerofamiliares , numeroconta , tipopagamento , codigoterceiros , porte , fazpartepat , aliquotafilantropica , capitalsocial , observacao , pagapis , tipoconta , inicioexercicio , cei , datanascimentorepresentante , sexorepresentante , contacorrentepagadora , ibge , cnae , identificacaoregistro , contribuinteipi , tipocontroleponto , centralizacontribuicaosindical , nomecontato , cpfcontato , telefonefixocontato , dddtelfixocontato , telefonecelularcontato , dddtelcelularcontato , faxcontato , dddfaxcontato , emailcontato , excessosublimite , aliquotaaplicavel , logotipo , alelocodigopessoajuridica , alelonumerofilial , nisrepresentante , dataimplantacaosaldo , agencia , contador , sindicato)
SELECT empresas.empresa , importacao.codigoestabelecimento , importacao.descricao , importacao.tipoidentificacao , importacao.raizcnpj , importacao.ordemcnpj , importacao.cpf , importacao.caepf , importacao.cidade , importacao.inscricaoestadual , importacao.inscricaomunicipal , importacao.nomefantasia , importacao.email , importacao.site , importacao.codigotipologradouro , importacao.logradouro , importacao.numero , importacao.complemento , importacao.bairro , importacao.cep , importacao.tiposimples , importacao.dddtel , importacao.telefone , importacao.dddfax , importacao.fax , importacao.bloqueado , importacao.selecionarcfop , importacao.ramoatividade , importacao.qualificacao , importacao.naturezapj , importacao.anofiscal , importacao.inicio_atividades , importacao.final_atividades , importacao.dataregistro , importacao.suframa , importacao.atividademunicipal , importacao.atividadeestadual , importacao.registro , importacao.representante , importacao.cpfrepresentante , importacao.dddtelrepresentante , importacao.telefonerepresentante , importacao.ramalrepresentante , importacao.dddfaxrepresentante , importacao.faxrepresentante , importacao.emailrepresentante , importacao.caixapostal , importacao.ufcaixapostal , importacao.cepcaixapostal , importacao.codigofpas , importacao.acidentetrabalho , importacao.numeroproprietarios , importacao.numerofamiliares , importacao.numeroconta , importacao.tipopagamento , importacao.codigoterceiros , importacao.porte , importacao.fazpartepat , importacao.aliquotafilantropica , importacao.capitalsocial , importacao.observacao , importacao.pagapis , importacao.tipoconta , importacao.inicioexercicio , importacao.cei , importacao.datanascimentorepresentante , importacao.sexorepresentante , importacao.contacorrentepagadora , importacao.codigoibge , importacao.codigocnae , importacao.identificacaoregistro , importacao.contribuinteipi , importacao.tipocontroleponto , importacao.centralizacontribuicaosindical , importacao.nomecontato , importacao.cpfcontato , importacao.telefonefixocontato , importacao.dddtelfixocontato , importacao.telefonecelularcontato , importacao.dddtelcelularcontato , importacao.faxcontato , importacao.dddfaxcontato , importacao.emailcontato , importacao.excessosublimite , importacao.aliquotaaplicavel , importacao.logotipo , importacao.alelocodigopessoajuridica , importacao.alelonumerofilial , importacao.nisrepresentante , importacao.dataimplantacaosaldo , agencias.agencia , contadores.contador , sindicatos.sindicato
FROM importacao
INNER JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo
LEFT JOIN ns.estabelecimentos ON importacao.codigoestabelecimento = estabelecimentos.codigo AND empresas.empresa = estabelecimentos.empresa
LEFT JOIN financas.agencias on importacao.codigoagencia = agencias.codigo
LEFT JOIN ns.cnaes ON importacao.codigocnae = cnaes.cnae
LEFT JOIN ns.contadores ON importacao.codigocontador = contadores.codigo
LEFT JOIN ns.municipios ON importacao.codigoibge = municipios.ibge
LEFT JOIN persona.fpas ON importacao.codigofpas = fpas.fpas
LEFT JOIN persona.sindicatos ON importacao.codigosindicato = sindicatos.codigo
WHERE estabelecimentos.estabelecimento IS NULL;

DROP TRIGGER IF EXISTS "TRG_MigracaoCadastroEstabelecimento" ON ns.estabelecimentos;

DROP FUNCTION IF EXISTS ns.migracaocadastroestabelecimento();

DROP TABLE importacao;
