CREATE TABLE importacao (codigocargo character varying, nome character varying, descricao character varying, cbo character varying, experiencia character varying, grauinstrucao character varying, maiorsalmercado character varying, menorsalmercado character varying, requisitos character varying, diasexperienciacontrato character varying, diasprorrogacaocontrato character varying, codigoempresa character varying, codigoestabelecimento character varying, codigodepartamento character varying, codigohorario character varying, codigolotacao character varying, codigosindicato character varying, pontuacao character varying);

COPY importacao FROM 'C:\NASAJONIMPORTACAO\cargos.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

UPDATE persona.cargos SET
	
	
	nome  = case when importacao.nome is null then cargos.nome  else importacao.nome end,
	descricao  = case when importacao.descricao is null then cargos.descricao  else importacao.descricao end,
	cbo  = case when importacao.cbo is null then cargos.cbo  else importacao.cbo end,
	experiencia  = case when importacao.experiencia is null then cargos.experiencia  else importacao.experiencia end,
	grauinstrucao  = case when importacao.grauinstrucao is null then cargos.grauinstrucao  else importacao.grauinstrucao end,
	maiorsalmercado  = case when importacao.maiorsalmercado is null then cargos.maiorsalmercado  else importacao.maiorsalmercado end,
	menorsalmercado  = case when importacao.menorsalmercado is null then cargos.menorsalmercado  else importacao.menorsalmercado end,
	requisitos  = case when importacao.requisitos is null then cargos.requisitos  else importacao.requisitos end,
	diasexperienciacontrato  = case when importacao.diasexperienciacontrato is null then cargos.diasexperienciacontrato  else importacao.diasexperienciacontrato end,
	diasprorrogacaocontrato  = case when importacao.diasprorrogacaocontrato is null then cargos.diasprorrogacaocontrato  else importacao.diasprorrogacaocontrato end,
	pontuacao  = case when importacao.pontuacao is null then cargos.pontuacao  else importacao.pontuacao end,
	
	departamento  = case when importacao.codigodepartamento is null then cargos.departamento  else (SELECT departamento FROM persona.departamentos WHERE codigo = importacao.codigodepartamento ) END,
	horario  = case when importacao.codigohorario is null then cargos.horario  else (SELECT horario FROM persona.horarios WHERE codigo = importacao.codigohorario  ) END,
	lotacao  = case when importacao.codigolotacao is null then cargos.lotacao  else (SELECT lotacao FROM persona.lotacoes WHERE codigo = importacao.codigolotacao ) END,
	sindicato  = case when importacao.codigosindicato is null then cargos.sindicato  (SELECT sindicato FROM persona.sindicatos WHERE codigo = importacao.codigosindicato ) END,
	
------------------------------------
FROM importacao
WHERE importacao.codigocargo = cargos.codigo
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