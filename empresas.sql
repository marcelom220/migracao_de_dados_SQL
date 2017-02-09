CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, descricao character varying, tipodeidentificacao smallint, tipodeidentificacaolegado character varying, raizcnpj character varying, ordemcnpj character varying, cpf character varying, razaosocial character varying, mascaraconta character varying, mascaragerencial character varying, usadv boolean, filantropica boolean, codigocnae character varying, codigonaturezajuridica character varying, tipopagamento character varying, tipopagamentolegado character varying, tipocooperativa smallint, tipocooperativalegado character varying, tipocontrutora smallint, tipocontrutoralegado character varying, numerocertificacao character varying, ministerio character varying, dataemissaocertificado date, datavencimentocertificado date, numeroprotocolorenovacao character varying, dataprotocolorenovacao date, datapublicaodou date, numeropaginadou character varying, numerocontato character varying, cpfcontato character varying, telefonefixocontato character varying, dddtelfixocontato character varying, telefonecelularcontato character varying, dddtelcelularcontato character varying, faxcontato character varying, dddfaxcontato character varying, emailcontato character varying, inativa boolean, inicioexercicio date, idweb bigint, inicio_atividades date, tributacaopisconfins integer, alelonumerocontato bigint, tipopontoeletronico smallint, tipopontoeletronicolegado character varying, multiplastabelasrubrica boolean, numerosiafi character varying, acordointernacionallicensamulta boolean, tiposituacaopj smallint, tiposituacaopjlegado character varying, tiposituaçaopf smallint, tiposituaçaopflegado character varying, regimeproprioprevidenciasocial boolean, codigomunicipioentefederativo character varying, descricaoleisegurodiferenciado character varying, valorsubtetoexecutivo double precision, valorsubtetolegislativo double precision, valorsubtetojudiciario double precision, valorsubtetotodospoderes double precision, anosmaioridadedependentesexecutivo smallint, anosmaioridadedependenteslegislativo smallint, anosmaioridadedependentesjudiciario smallint, anosmaioridadedependentetodospoderes smallint, codigomoeda character varying, codigoperfil character varying);

COPY importacao FROM 'C:\NASAJONIMPORTACAO\empresas.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

UPDATE ns.empresas SET
	descricao = CASE WHEN importacao.descricao IS NULL THEN empresas.descricao ELSE importacao.descricao END,
	tipoidentificacao = CASE WHEN importacao.tipodeidentificacao IS NULL THEN empresas.tipoidentificacao ELSE importacao.tipodeidentificacao END,
	raizcnpj = CASE WHEN importacao.raizcnpj IS NULL THEN empresas.raizcnpj ELSE importacao.raizcnpj END,
	ordemcnpj = CASE WHEN importacao.ordemcnpj IS NULL THEN empresas.ordemcnpj ELSE importacao.ordemcnpj END,
	cpf = CASE WHEN importacao.cpf IS NULL THEN empresas.cpf ELSE importacao.cpf END,
	razaosocial = CASE WHEN importacao.razaosocial IS NULL THEN empresas.razaosocial ELSE importacao.razaosocial END,
	mascaraconta = CASE WHEN importacao.mascaraconta IS NULL THEN empresas.mascaraconta ELSE importacao.mascaraconta END,
	mascaragerencial = CASE WHEN importacao.mascaragerencial IS NULL THEN empresas.mascaragerencial ELSE importacao.mascaragerencial END,
	usadv = CASE WHEN importacao.usadv IS NULL THEN empresas.usadv ELSE importacao.usadv END,
	filantropica = CASE WHEN importacao.filantropica IS NULL THEN empresas.filantropica ELSE importacao.filantropica END,
	tipopagamento = CASE WHEN importacao.tipopagamento IS NULL THEN empresas.tipopagamento ELSE importacao.tipopagamento END,
	tipocooperativa = CASE WHEN importacao.tipocooperativa IS NULL THEN empresas.tipocooperativa ELSE importacao.tipocooperativa END,
	tipoconstrutora = CASE WHEN importacao.tipocontrutora IS NULL THEN empresas.tipoconstrutora ELSE importacao.tipocontrutora END,
	numerocertificado = CASE WHEN importacao.numerocertificacao IS NULL THEN empresas.numerocertificado ELSE importacao.numerocertificacao END,
	ministerio = CASE WHEN importacao.ministerio IS NULL THEN empresas.ministerio ELSE importacao.ministerio END,
	dataemissaocertificado = CASE WHEN importacao.dataemissaocertificado IS NULL THEN empresas.dataemissaocertificado ELSE importacao.dataemissaocertificado END,
	datavencimentocertificado = CASE WHEN importacao.datavencimentocertificado IS NULL THEN empresas.datavencimentocertificado ELSE importacao.datavencimentocertificado END,
	numeroprotocolorenovacao = CASE WHEN importacao.numeroprotocolorenovacao IS NULL THEN empresas.numeroprotocolorenovacao ELSE importacao.numeroprotocolorenovacao END,
	dataprotocolorenovacao = CASE WHEN importacao.dataprotocolorenovacao IS NULL THEN empresas.dataprotocolorenovacao ELSE importacao.dataprotocolorenovacao END,
	datapublicacaodou = CASE WHEN importacao.datapublicaodou IS NULL THEN empresas.datapublicacaodou ELSE importacao.datapublicaodou END,
	numeropaginadou = CASE WHEN importacao.numeropaginadou IS NULL THEN empresas.numeropaginadou ELSE importacao.numeropaginadou END,
	nomecontato = CASE WHEN importacao.numerocontato IS NULL THEN empresas.nomecontato ELSE importacao.numerocontato END,
	cpfcontato = CASE WHEN importacao.cpfcontato IS NULL THEN empresas.cpfcontato ELSE importacao.cpfcontato END,
	telefonefixocontato = CASE WHEN importacao.telefonefixocontato IS NULL THEN empresas.telefonefixocontato ELSE importacao.telefonefixocontato END,
	dddtelfixocontato = CASE WHEN importacao.dddtelfixocontato IS NULL THEN empresas.dddtelfixocontato ELSE importacao.dddtelfixocontato END,
	telefonecelularcontato = CASE WHEN importacao.telefonecelularcontato IS NULL THEN empresas.telefonecelularcontato ELSE importacao.telefonecelularcontato END,
	dddtelcelularcontato = CASE WHEN importacao.dddtelcelularcontato IS NULL THEN empresas.dddtelcelularcontato ELSE importacao.dddtelcelularcontato END,
	faxcontato = CASE WHEN importacao.faxcontato IS NULL THEN empresas.faxcontato ELSE importacao.faxcontato END,
	dddfaxcontato = CASE WHEN importacao.dddfaxcontato IS NULL THEN empresas.dddfaxcontato ELSE importacao.dddfaxcontato END,
	emailcontato = CASE WHEN importacao.emailcontato IS NULL THEN empresas.emailcontato ELSE importacao.emailcontato END,
	inativa = CASE WHEN importacao.inativa IS NULL THEN empresas.inativa ELSE importacao.inativa END,
	inicioexercicio = CASE WHEN importacao.inicioexercicio IS NULL THEN empresas.inicioexercicio ELSE importacao.inicioexercicio END,
	idweb = CASE WHEN importacao.idweb IS NULL THEN empresas.idweb ELSE importacao.idweb END,
	inicio_atividades = CASE WHEN importacao.inicio_atividades IS NULL THEN empresas.inicio_atividades ELSE importacao.inicio_atividades END,
	tributacaopiscofins = CASE WHEN importacao.tributacaopisconfins IS NULL THEN empresas.tributacaopiscofins ELSE importacao.tributacaopisconfins END,
	alelonumerocontrato = CASE WHEN importacao.alelonumerocontato IS NULL THEN empresas.alelonumerocontrato ELSE importacao.alelonumerocontato END,
	tipopontoeletronico = CASE WHEN importacao.tipopontoeletronico IS NULL THEN empresas.tipopontoeletronico ELSE importacao.tipopontoeletronico END,
	multiplastabelasrubrica = CASE WHEN importacao.multiplastabelasrubrica IS NULL THEN empresas.multiplastabelasrubrica ELSE importacao.multiplastabelasrubrica END,
	numerosiafi = CASE WHEN importacao.numerosiafi IS NULL THEN empresas.numerosiafi ELSE importacao.numerosiafi END,
	acordointernacionalisencaomulta = CASE WHEN importacao.acordointernacionallicensamulta IS NULL THEN empresas.acordointernacionalisencaomulta ELSE importacao.acordointernacionallicensamulta END,
	tiposituacaopj = CASE WHEN importacao.tiposituacaopj IS NULL THEN empresas.tiposituacaopj ELSE importacao.tiposituacaopj END,
	tiposituacaopf = CASE WHEN importacao.tiposituaçaopf IS NULL THEN empresas.tiposituacaopf ELSE importacao.tiposituaçaopf END,
	regimeproprioprevidenciasocial = CASE WHEN importacao.regimeproprioprevidenciasocial IS NULL THEN empresas.regimeproprioprevidenciasocial ELSE importacao.regimeproprioprevidenciasocial END,
	descricaoleiseguradodiferenciado = CASE WHEN importacao.descricaoleisegurodiferenciado IS NULL THEN empresas.descricaoleiseguradodiferenciado ELSE importacao.descricaoleisegurodiferenciado END,
	valorsubtetoexecutivo = CASE WHEN importacao.valorsubtetoexecutivo IS NULL THEN empresas.valorsubtetoexecutivo ELSE importacao.valorsubtetoexecutivo END,
	valorsubtetolegislativo = CASE WHEN importacao.valorsubtetolegislativo IS NULL THEN empresas.valorsubtetolegislativo ELSE importacao.valorsubtetolegislativo END,
	valorsubtetojudiciario = CASE WHEN importacao.valorsubtetojudiciario IS NULL THEN empresas.valorsubtetojudiciario ELSE importacao.valorsubtetojudiciario END,
	valorsubtetotodospoderes = CASE WHEN importacao.valorsubtetotodospoderes IS NULL THEN empresas.valorsubtetotodospoderes ELSE importacao.valorsubtetotodospoderes END,
	anosmaioridadedependenteexecutivo = CASE WHEN importacao.anosmaioridadedependentesexecutivo IS NULL THEN empresas.anosmaioridadedependenteexecutivo ELSE importacao.anosmaioridadedependentesexecutivo END,
	anosmaioridadedependentelegislativo = CASE WHEN importacao.anosmaioridadedependenteslegislativo IS NULL THEN empresas.anosmaioridadedependentelegislativo ELSE importacao.anosmaioridadedependenteslegislativo END,
	anosmaioridadedependentejudiciario = CASE WHEN importacao.anosmaioridadedependentesjudiciario IS NULL THEN empresas.anosmaioridadedependentejudiciario ELSE importacao.anosmaioridadedependentesjudiciario END,
	anosmaioridadedependentetodospoderes = CASE WHEN importacao.anosmaioridadedependentetodospoderes IS NULL THEN empresas.anosmaioridadedependentetodospoderes ELSE importacao.anosmaioridadedependentetodospoderes END,
	moeda = CASE WHEN importacao.codigomoeda IS NULL THEN empresas.moeda ELSE (SELECT moeda FROM ns.moedas WHERE codigo = importacao.codigomoeda) END,
	perfil = CASE WHEN importacao.codigoperfil IS NULL THEN empresas.perfil ELSE (SELECT id FROM scritta.perfilimp WHERE perfil = importacao.codigoperfil) END,
	cnae = CASE WHEN importacao.codigocnae IS NULL THEN empresas.cnae ELSE (SELECT cnae FROM ns.cnaes WHERE cnae = importacao.codigocnae) END,
	naturezajuridica = CASE WHEN importacao.codigonaturezajuridica IS NULL THEN empresas.naturezajuridica ELSE (SELECT naturezajuridica FROM ns.naturezasjuridicas WHERE naturezajuridica = importacao.codigonaturezajuridica) END,
	municipioentefederativo = CASE WHEN importacao.codigomunicipioentefederativo IS NULL THEN empresas.municipioentefederativo ELSE (SELECT ibge FROM ns.municipios WHERE ibge = importacao.codigomunicipioentefederativo) END
FROM importacao, ns.gruposempresariais
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial;

DROP TRIGGER IF EXISTS "TRG_MigracaoCadastroEmpresa" ON ns.empresas;

DROP FUNCTION IF EXISTS ns.migracaocadastroempresa();

CREATE FUNCTION ns.migracaocadastroempresa()
 RETURNS trigger AS
$$
BEGIN
	SELECT ns.criarempresa(NEW.empresa, TRUE);
END;
$$
 LANGUAGE plpgsql;

CREATE TRIGGER "TRG_MigracaoCadastroEmpresa"
  AFTER INSERT
  ON ns.empresas
  FOR EACH ROW
  EXECUTE PROCEDURE ns.migracaocadastroempresa();

INSERT INTO ns.empresas (grupoempresarial, descricao, tipoidentificacao, raizcnpj, ordemcnpj, cpf, razaosocial, mascaraconta, mascaragerencial, usadv, filantropica, tipopagamento, tipocooperativa, tipoconstrutora, numerocertificado, ministerio, dataemissaocertificado, datavencimentocertificado, numeroprotocolorenovacao, dataprotocolorenovacao, datapublicacaodou, numeropaginadou, nomecontato, cpfcontato, telefonefixocontato, dddtelfixocontato, telefonecelularcontato, dddtelcelularcontato, faxcontato, dddfaxcontato, emailcontato, inativa, inicioexercicio, idweb, inicio_atividades, tributacaopiscofins, alelonumerocontrato, tipopontoeletronico, multiplastabelasrubrica, numerosiafi, acordointernacionalisencaomulta, tiposituacaopj, tiposituacaopf, regimeproprioprevidenciasocial, descricaoleiseguradodiferenciado, valorsubtetoexecutivo, valorsubtetolegislativo, valorsubtetojudiciario, valorsubtetotodospoderes, anosmaioridadedependenteexecutivo, anosmaioridadedependentelegislativo, anosmaioridadedependentejudiciario, anosmaioridadedependentetodospoderes, moeda, perfil, cnae, naturezajuridica, municipioentefederativo)
SELECT gruposempresariais.grupoempresarial, importacao.descricao, importacao.tipodeidentificacao, importacao.raizcnpj, importacao.ordemcnpj, importacao.cpf, importacao.razaosocial, importacao.mascaraconta, importacao.mascaragerencial, importacao.usadv, importacao.filantropica, importacao.tipopagamento, importacao.tipocooperativa, importacao.tipocontrutora, importacao.numerocertificacao, importacao.ministerio, importacao.dataemissaocertificado, importacao.datavencimentocertificado, importacao.numeroprotocolorenovacao, importacao.dataprotocolorenovacao, importacao.datapublicaodou, importacao.numeropaginadou, importacao.numerocontato, importacao.cpfcontato, importacao.telefonefixocontato, importacao.dddtelfixocontato, importacao.telefonecelularcontato, importacao.dddtelcelularcontato, importacao.faxcontato, importacao.dddfaxcontato, importacao.emailcontato, importacao.inativa, importacao.inicioexercicio, importacao.idweb, importacao.inicio_atividades, importacao.tributacaopisconfins, importacao.alelonumerocontato, importacao.tipopontoeletronico, importacao.multiplastabelasrubrica, importacao.numerosiafi, importacao.acordointernacionallicensamulta, importacao.tiposituacaopj, importacao.tiposituaçaopf, importacao.regimeproprioprevidenciasocial, importacao.descricaoleisegurodiferenciado, importacao.valorsubtetoexecutivo, importacao.valorsubtetolegislativo, importacao.valorsubtetojudiciario, importacao.valorsubtetotodospoderes, importacao.anosmaioridadedependentesexecutivo, importacao.anosmaioridadedependenteslegislativo, importacao.anosmaioridadedependentesjudiciario, importacao.anosmaioridadedependentetodospoderes, moedas.moeda, perfilimp.id, cnaes.cnae, naturezasjuridicas.naturezajuridica, municipios.ibge
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
LEFT JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
LEFT JOIN ns.moedas ON importacao.codigomoeda = moedas.codigo
LEFT JOIN scritta.perfilimp ON importacao.codigoperfil = perfilimp.perfil
LEFT JOIN ns.cnaes ON importacao.codigocnae = cnaes.cnae
LEFT JOIN ns.naturezasjuridicas ON importacao.codigonaturezajuridica = naturezasjuridicas.naturezajuridica
LEFT JOIN ns.municipios ON importacao.codigomunicipioentefederativo = municipios.ibge
WHERE empresas.empresa IS NULL;

DROP TRIGGER IF EXISTS "TRG_MigracaoCadastroEmpresa" ON ns.empresas;

DROP FUNCTION IF EXISTS ns.migracaocadastroempresa();

DROP TABLE importacao;