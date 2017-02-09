CREATE TABLE importacao (codigogrupoempresarial character varying, codigoempresa character varying, codigohorario character varying, nome character varying, numerofolgasfixas smallint, diafolgaextra smallint, diasemanafolgaextra smallint, tipo smallint, diasemanatolerancia smallint, atrasosegunda boolean, atrasoterca boolean, atrasoquarta boolean, atrasoquinta boolean, atrasosexta boolean, atrasosabado boolean, atrasodomingo boolean, repousosegunda boolean, repousoterca boolean, repousoquarta boolean, repousoquinta boolean, repousosexta boolean, repousosabado boolean, repousodomingo boolean, desconsiderardsrsegunda boolean, desconsiderardsrterca boolean, desconsiderardsrquarta boolean, desconsiderardsrquinta boolean, desconsiderardsrsexta boolean, desconsiderardsrsabado boolean, desconsiderardsrdomingo boolean, codigojornadaquinta character varying, codigojornadadomingo character varying, codigojornadasabado character varying, codigojornadasegunda character varying, codigojornadaoutros character varying, codigojornadaquarta character varying, codigojornadasexta character varying, codigojornadaterca character varying);

--COPY importacao FROM 'C:\NASAJONIMPORTACAO\horarios.csv' WITH CSV HEADER DELIMITER E'\t' ENCODING 'WIN1252';



UPDATE persona.horarios SET
	
nome = case when importacao.Nome is null then horarios.nome else importacao.Nome end,
numerofolgasfixas = case when importacao.NumeroFolgasFixas is null then horarios.numerofolgasfixas else importacao.NumeroFolgasFixas end,
diafolgaextra = case when importacao.DiaFolgaExtra is null then horarios.diafolgaextra else importacao.DiaFolgaExtra end,
diasemanafolgaextra = case when importacao.DiaSemanaFolgaExtra is null then horarios.diasemanafolgaextra else importacao.DiaSemanaFolgaExtra end,
tipo = case when importacao.Tipo is null then horarios.tipo else importacao.Tipo end,
diasemanatolerancia = case when importacao.DiaSemanaTolerancia is null then horarios.diasemanatolerancia else importacao.DiaSemanaTolerancia end,
atrasosegunda = case when importacao.AtrasoSegunda is null then horarios.atrasosegunda else importacao.AtrasoSegunda end,
atrasoterca = case when importacao.AtrasoTerca is null then horarios.atrasoterca else importacao.AtrasoTerca end,
atrasoquarta = case when importacao.AtrasoQuarta is null then horarios.atrasoquarta else importacao.AtrasoQuarta end,
atrasoquinta = case when importacao.AtrasoQuinta is null then horarios.atrasoquinta else importacao.AtrasoQuinta end,
atrasosexta = case when importacao.AtrasoSexta is null then horarios.atrasosexta else importacao.AtrasoSexta end,
atrasosabado = case when importacao.AtrasoSabado is null then horarios.atrasosabado else importacao.AtrasoSabado end,
atrasodomingo = case when importacao.AtrasoDomingo is null then horarios.atrasodomingo else importacao.AtrasoDomingo end,
repousosegunda = case when importacao.RepousoSegunda is null then horarios.repousosegunda else importacao.RepousoSegunda end,
repousoterca = case when importacao.RepousoTerca is null then horarios.repousoterca else importacao.RepousoTerca end,
repousoquarta = case when importacao.RepousoQuarta is null then horarios.repousoquarta else importacao.RepousoQuarta end,
repousoquinta = case when importacao.RepousoQuinta is null then horarios.repousoquinta else importacao.RepousoQuinta end,
repousosexta = case when importacao.RepousoSexta is null then horarios.repousosexta else importacao.RepousoSexta end,
repousosabado = case when importacao.RepousoSabado is null then horarios.repousosabado else importacao.RepousoSabado end,
repousodomingo = case when importacao.RepousoDomingo is null then horarios.repousodomingo else importacao.RepousoDomingo end,
desconsiderardsrsegunda = case when importacao.DesconsiderarDsrSegunda is null then horarios.desconsiderardsrsegunda else importacao.DesconsiderarDsrSegunda end,
desconsiderardsrterca = case when importacao.DesconsiderarDsrTerca is null then horarios.desconsiderardsrterca else importacao.DesconsiderarDsrTerca end,
desconsiderardsrquarta = case when importacao.DesconsiderarDsrQuarta is null then horarios.desconsiderardsrquarta else importacao.DesconsiderarDsrQuarta end,
desconsiderardsrquinta = case when importacao.DesconsiderarDsrQuinta is null then horarios.desconsiderardsrquinta else importacao.DesconsiderarDsrQuinta end,
desconsiderardsrsexta = case when importacao.DesconsiderarDsrSexta is null then horarios.desconsiderardsrsexta else importacao.DesconsiderarDsrSexta end,
desconsiderardsrsabado = case when importacao.DesconsiderarDsrSabado is null then horarios.desconsiderardsrsabado else importacao.DesconsiderarDsrSabado end,
desconsiderardsrdomingo = case when importacao.DesconsiderarDsrDomingo is null then horarios.desconsiderardsrdomingo else importacao.DesconsiderarDsrDomingo end,

jornadaquinta = case when importacao.CodigoJornadaQuinta is null then horarios.jornadaquinta else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadaquinta AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadadomingo = case when importacao.CodigoJornadaDomingo is null then horarios.jornadadomingo else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadadomingo AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadasabado = case when importacao.CodigoJornadaSabado is null then horarios.jornadasabado else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadasabado AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadasegunda = case when importacao.CodigoJornadaSegunda is null then horarios.jornadasegunda else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadasegunda AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadaoutros = case when importacao.CodigoJornadaOutros is null then horarios.jornadaoutros else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadaoutros AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadaquarta = case when importacao.CodigoJornadaQuarta is null then horarios.jornadaquarta else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadaquarta AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadasexta = case when importacao.CodigoJornadaSexta is null then horarios.jornadasexta else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadasexta AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end,
jornadaterca = case when importacao.CodigoJornadaTerca is null then horarios.jornadaterca else (SELECT jornada FROM persona.jornadas WHERE codigo = codigojornadaterca AND empresa = (SELECT empresa FROM ns.empresas WHERE codigo = importacao.codigoempresa AND grupoempresarial = (SELECT grupoempresarial FROM ns.gruposempresariais WHERE codigo = codigogrupoempresarial)) )end
	
	
FROM importacao, ns.gruposempresariais, ns.empresas
WHERE importacao.codigogrupoempresarial = gruposempresariais.codigo
AND importacao.codigoempresa = empresas.codigo
AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
AND importacao.codigohorario = horarios.codigo
AND empresas.empresa = horarios.empresa;

INSERT INTO persona.horarios (codigo , nome , numerofolgasfixas , diafolgaextra , diasemanafolgaextra , tipo , diasemanatolerancia , atrasosegunda , atrasoterca , atrasoquarta , atrasoquinta , atrasosexta , atrasosabado , atrasodomingo , repousosegunda , repousoterca , repousoquarta , repousoquinta , repousosexta , repousosabado , repousodomingo , desconsiderardsrsegunda , desconsiderardsrterca , desconsiderardsrquarta , desconsiderardsrquinta , desconsiderardsrsexta , desconsiderardsrsabado , desconsiderardsrdomingo , jornadaquinta , jornadadomingo , jornadasabado , jornadasegunda , jornadaoutros , jornadaquarta , jornadasexta , jornadaterca)
SELECT importacao.codigohorario , importacao.nome , importacao.numerofolgasfixas , importacao.diafolgaextra , importacao.diasemanafolgaextra , importacao.tipo , importacao.diasemanatolerancia , importacao.atrasosegunda , importacao.atrasoterca , importacao.atrasoquarta , importacao.atrasoquinta , importacao.atrasosexta , importacao.atrasosabado , importacao.atrasodomingo , importacao.repousosegunda , importacao.repousoterca , importacao.repousoquarta , importacao.repousoquinta , importacao.repousosexta , importacao.repousosabado , importacao.repousodomingo , importacao.desconsiderardsrsegunda , importacao.desconsiderardsrterca , importacao.desconsiderardsrquarta , importacao.desconsiderardsrquinta , importacao.desconsiderardsrsexta , importacao.desconsiderardsrsabado , importacao.desconsiderardsrdomingo , jquinta.jornada , jdomingo.jornada , jsabado.jornada , jsegunda.jornada , joutros.jornada , jquarta.jornada , jsexta.jornada , jterca.jornada 
FROM importacao
INNER JOIN ns.gruposempresariais ON importacao.codigogrupoempresarial = gruposempresariais.codigo
INNER JOIN ns.empresas ON importacao.codigoempresa = empresas.codigo AND gruposempresariais.grupoempresarial = empresas.grupoempresarial
LEFT JOIN persona.horarios ON importacao.codigohorario = horarios.codigo AND empresas.empresa = horarios.empresa
LEFT JOIN persona.jornadas jquinta ON importacao.codigojornadaquinta = jquinta.codigo AND empresas.empresa = jquinta.empresa
LEFT JOIN persona.jornadas jdomingo ON importacao.codigojornadadomingo = jdomingo.codigo AND empresas.empresa = jdomingo.empresa
LEFT JOIN persona.jornadas jsabado ON importacao.codigojornadasabado = jsabado.codigo AND empresas.empresa = jsabado.empresa
LEFT JOIN persona.jornadas jsegunda ON importacao.codigojornadasegunda = jsegunda.codigo AND empresas.empresa = jsegunda.empresa
LEFT JOIN persona.jornadas joutros ON importacao.codigojornadaoutros = joutros.codigo AND empresas.empresa = joutros.empresa
LEFT JOIN persona.jornadas jquarta ON importacao.codigojornadaquarta = jquarta.codigo AND empresas.empresa = jquarta.empresa
LEFT JOIN persona.jornadas jsexta ON importacao.codigojornadasexta = jsexta.codigo AND empresas.empresa = jsexta.empresa
LEFT JOIN persona.jornadas jterca ON importacao.codigojornadaterca = jterca.codigo AND empresas.empresa = jterca.empresa
WHERE horarios.horario IS NULL;

DROP TABLE importacao;