// Crie markers nos locais desejados para spawnar o homem Bomba com a nomenclatura "nomeDoMarker_1", "nomeDoMarker_2" e assim por diante, como no exemplo abaixo:
//
// "homemBomba_1", "homemBomba_2" e assim por diante
//
// Para spawnar um homem Bomba, no chamamento do script coloque como o exemplo abaixo:
//
// 1° exemplo: nul = ["nomeDoMarker_", 2, "nomeDoMarkerDeAtaque"] execVM "homemBomba.sqf";
// 2° exemplo: nul = ["homemBomba_", 3, "homemBombaAtaque"] execVM "homemBomba.sqf";
//
// O 2° exemplo spawnará 1 homem Bomba em algum dos 3 markers criados e atacará a posição do marker "homemBombaAtaque"
//
// Observações:
//
// * IMPORTANTE: Esse script deve rodar no lado do servidor! Mate um civil para isso.
// * Talvez haja situações em que o civil fique com medo e desvie de sua trajetória, como por exemplo, dar vários tiros em sua direção ou para o alto, mas após um tempo [...]
//	[...] ele irá retornar para o objetivo e explodir.

_markerName = _this select 0;
_qtdMarkers = _this select 1;
_markerNameAttack = _this select 2;

if(isServer) then {
	_numRandom = [1, _qtdMarkers] call BIS_fnc_randomInt;
	_markerNameRandom = _markerName + str _numRandom;

	_hb = CreateGroup east;
	_hb createUnit ["TK_CIV_Takistani01_EP1", (getMarkerPos _markerNameRandom), [], 0, "CANCOLLIDE"];

	{
		_x disableAI "FSM"; 
		_x setBehaviour "CARELESS";
		_x allowFleeing 0;
		_x setSkill ["courage", 1];
		_x move getMarkerPos _markerNameAttack;
		unitHb = _x;
	} forEach units group (leader _hb);

	while {(alive unitHb && !unitReady unitHb)} do 
	{
		sleep 1;
	};

	if(!alive unitHb) exitWith{};

	nul = [(unitHb), "allahuakbar"] call fn_netSay3D;

	sleep 2;
	
	if(alive unitHb) then{
		_boom = "Sh_105_HE" createVehicle (position unitHb);
	};
};