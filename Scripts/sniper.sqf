// Crie markers nos locais desejados para spawnar o sniper com a nomenclatura "nomeDoMarker_1", "nomeDoMarker_2" e assim por diante, como no exemplo abaixo:
//
// "sniper_1", "sniper_2" e assim por diante
//
// Para spawnar um sniper, no chamamento do script coloque como o exemplo abaixo:
//
// 1° exemplo: nul = ["nomeDoMarker_", 2] execVM "sniper.sqf";
// 2° exemplo: nul = ["sniper_", 3] execVM "sniper.sqf";
//
// O 1° exemplo spawnará 1 sniper em algum dos 2 markers criados
// O 2° exemplo spawnará 1 sniper em algum dos 3 markers criados
//
// Observações:
//
// * IMPORTANTE: Esse script deve rodar no lado do servidor! Mate um civil para isso.
// * Recomendado colocar o sniper em uma distância de no máximo 400 metros do alvo (motivo: IA do ArmA limitado)
// * doTarget e doFire não funcionam no servidor dedicado sem antes do lookAt ou doWatch
// * Apenas com lookAt ou doWatch (algum dos dois) a unidade já abrirá fogo contra o alvo
// * Decidi manter doTarget e doFire em casos de algum dos dois comandos acima não funcionarem
// * Apenas funcionará com unidades líder que são PLAYERS e que estejam numa distância de no máximo 450 metros do local de spawn do sniper
// * Caso haja 2 esquadrões ou mais, escolherá aleatoriamente um dos líderes para abrir fogo

_markerName = _this select 0;
_qtdMarkers = _this select 1;

if(isServer) then
	{
	_numRandom = [1, _qtdMarkers] call BIS_fnc_randomInt;
	_markerNameRandom = _markerName + str _numRandom;
	
	// Cria unidade sniper
	_sniperGroup = CreateGroup east;
	_sniperGroup createUnit ["TK_Soldier_SniperH_EP1", (getMarkerPos _markerNameRandom), [], 0, "CANCOLLIDE"];
	sleep 2;

	// Retorna o atual líder de blufor
	{
		if (side _x == west && alive _x && isPlayer _x && _x distance (getMarkerPos _markerNameRandom) < 450 && (leader group _x == leader _x)) then
			{
				target = _x;
			};
	} forEach allUnits;

	// Faz um foreach nas unidades do grupo e ordena que abram fogo no líder
	{
		_x setSkill 1;
		_x reveal target;
		_x lookAt target;
		_x doWatch target;
		_x doTarget target;
		_x doFire target;
	} forEach units group (leader _sniperGroup);
};