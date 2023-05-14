if(abastecimentoIniciado) exitWith {hint "O Caminhão Pipa já está abastecendo uma torre de água.";};

_torreAgua = _this select 0;

_textTor = "Essa torre de água já foi abastecida, vá para a próxima.";

if(_torreAgua == w1 && w1Abastecido) exitWith {hint _textTor;};
if(_torreAgua == w2 && w2Abastecido) exitWith {hint _textTor;};
if(_torreAgua == w3 && w3Abastecido) exitWith {hint _textTor;};
if(_torreAgua == w4 && w4Abastecido) exitWith {hint _textTor;};
if(_torreAgua == w5 && w5Abastecido) exitWith {hint _textTor;};

if(_torreAgua distance caminhao_pipa > 15) exitWith {hint "Você precisa chegar mais perto da torre com o caminhão. (mínimo 15 metros)";};

qualTorre = _torreAgua;
publicVariable "qualTorre";

_aviso = "Abastecimento de água em andamento, 5 MINUTOS para finalizar.";
nul = [(_aviso)] execVM "hintGlobal.sqf";

abastecimentoIniciado = true;
publicVariable "abastecimentoIniciado";