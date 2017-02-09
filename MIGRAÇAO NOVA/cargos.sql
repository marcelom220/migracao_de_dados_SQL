CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, codigocargo character varying, nome character varying, descricao character varying, cbo character varying, experiencia character varying, grauinstrucao character varying, maiorsalmercado numeric, menorsalmercado numeric, requisitos character varying, diasexperienciacontrato smallint, diasprorrogacaocontrato smallint, codigoestabelecimento character varying, codigodepartamento character varying, codigohorario character varying, codigolotacao character varying, codigosindicato character varying, pontuacao double precision);

--COPY importacao FROM 'C:\NASAJONIMPORTACAO\cargos.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';

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

	estabelecimento = case when importacao.CodigoEstabelecimento is null then cargos.estabelecimento  else (SELECT estabelecimento FROM ns.estabelecimentos WHERE estabelecimentos.codigo = importacao.codigoestabelecimento AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial))) END,
	departamento  = case when importacao.codigodepartamento is null then cargos.departamento  else (SELECT departamento FROM persona.departamentos WHERE codigo = importacao.codigodepartamento AND estabelecimento = (SELECT estabelecimento FROM ns.estabelecimentos WHERE codigo = codigoestabelecimento) )END,
	horario  = case when importacao.codigohorario is null then cargos.horario  else (SELECT horario FROM persona.horarios WHERE codigo = importacao.codigohorario AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial ))) END ,
	lotacao  = case when importacao.codigolotacao is null then cargos.lotacao  else (SELECT lotacao FROM persona.lotacoes WHERE codigo = importacao.codigolotacao AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = importacao.codigogrupoempresarial))) END,
	sindicato  = case when importacao.codigosindicato is null then cargos.sindicato else  (SELECT sindicato FROM persona.sindicatos WHERE codigo = importacao.codigosindicato ) END
	

FROM importacao, ns.gruposempresariais, ns.empresas
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.codigocargo = cargos.codigo
AND empresas.empresa = cargos.empresa;



INSERT INTO persona.cargos (empresa  , codigo  , nome  , descricao  , cbo  , experiencia  , grauinstrucao  , maiorsalmercado  , menorsalmercado  , requisitos  , diasexperienciacontrato  , diasprorrogacaocontrato  , estabelecimento  , departamento  , horario  , lotacao  , sindicato  , pontuacao )
SELECT empresas.Empresa , importacao.CodigoCargo , importacao.Nome , importacao.Descricao , importacao.Cbo , importacao.Experiencia , importacao.GrauInstrucao , importacao.MaiorSalMercado , importacao.MenorSalMercado , importacao.Requisitos , importacao.DiasExperienciaContrato , importacao.DiasProrrogacaoContrato , estabelecimentos.Estabelecimento , departamentos.Departamento , horarios.Horario , lotacoes.Lotacao , sindicatos.Sindicato , importacao.Pontuacao
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
LEFT JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
LEFT JOIN persona.departamentos ON importacao.codigodepartamento = departamentos.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = importacao.codigogrupoempresarial
LEFT JOIN persona.horarios ON importacao.codigohorario = horarios.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
LEFT JOIN persona.lotacoes ON importacao.codigolotacao = lotacoes.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
LEFT JOIN persona.sindicatos ON importacao.codigosindicato = sindicatos.codigo
LEFT JOIN persona.cargos ON importacao.codigocargo = cargos.codigo AND empresas.codigo =importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
LEFT JOIN ns.estabelecimentos ON importacao.codigoestabelecimento = estabelecimentos.codigo AND empresas.codigo = importacao.codigoempresa AND gruposempresariais.codigo = codigogrupoempresarial 
WHERE cargos.cargo IS NULL;


DROP TABLE importacao;