if(dobraEspacialIniciada) exitWith{hint "Aguarde, motores de dobra já estão em processo de inicialização.";};

_velocidadeMinima = 150;
_altitudeMinima = 40;
dobraLigada = true;

_ufoXYZ = getPosATL ufo;
_altitude = _ufoXYZ select 2;
_ufoVel = speed ufo;

if(_altitude < _altitudeMinima) exitWith{hint "Altitude muito baixa para executar a dobra espacial. Mínimo 40.";};

if(_ufoVel < _velocidadeMinima) exitWith{hint "Velocidade muito baixa para executar a dobra espacial. Mínimo 150.";};

dobraEspacialIniciada = true;
publicVariable "dobraEspacialIniciada";

if(debugar == 1) then {
	sleep 13;
} else {
	sleep tempoWarpSegundos;
};

ufo addAction ["Cancelar Dobra Espacial", "cancelarWarp.sqf"];

_ufoXYZ = getPosATL ufo;
_altitude = _ufoXYZ select 2;
_ufoVel = speed ufo;

if(_altitude < _altitudeMinima || _ufoVel < _velocidadeMinima) then{
	while {(_altitude < _altitudeMinima || _ufoVel < _velocidadeMinima) && dobraLigada} do {
		_ufoXYZ = getPosATL ufo;
		_altitude = _ufoXYZ select 2;
		_ufoVel = speed ufo;
		hint "Motor de Dobra Carregado... Velocidade ou altura insuficientes para iniciar dobra.";
		sleep 1;
	};
};

if(!dobraLigada) exitWith {
	dobraEspacialIniciada = false;
	publicVariable "dobraEspacialIniciada";
};

_actionId = _this select 2;
ufo removeAction _actionId;

dobraEspacialAtivada = true;
publicVariable "dobraEspacialAtivada";

nul = [(ufo), "warp"] call fn_netSay3D;
sleep 6.5;

_vel = velocity ufo;
_dir = direction ufo;
_speed = 120;
ufo setVelocity [
	(_vel select 0) + (sin _dir * _speed),
	(_vel select 1) + (cos _dir * _speed),
	(_vel select 2)
];

sleep 5;
fimJogo = true;
publicVariable "fimJogo";