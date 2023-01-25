_object = _this select 0;
_quem = _this select 1;
_informanteId = _this select 2;
texto = "ConversaArabe";

if(_object == informante1) then {

	if(_quem == interprete) then
	{
		for [{_i=1}, {_i <= 3}, {_i=_I+1}] do {	
			if(sequenciaConversa1 == _i) exitWith
			{
				texto = "Conversa" + str _i;
				sequenciaConversa1 = sequenciaConversa1 + 1;
			};
		};
	};
};

if(_object == informante2) then {
	for [{_i=1}, {_i <= 3}, {_i=_I+1}] do {	
		if(sequenciaConversa2 == _i) exitWith
		{
			texto = "ConversaDiferente" + str _i;
			sequenciaConversa2 = sequenciaConversa2 + 1;
		};
	};
};

if(_object == informante3) then {

	if(_quem == interprete) then
	{
		for [{_i=1}, {_i <= 3}, {_i=_I+1}] do {	
			if(sequenciaConversa3 == _i) exitWith
			{
				texto = "ConversaDiferenciada" + str _i;
				sequenciaConversa3 = sequenciaConversa3 + 1;
			};
		};
	};
};

if(_object == informante4) then {

	if(_quem == interprete) then
	{
		for [{_i=1}, {_i <= 3}, {_i=_I+1}] do {	
			if(sequenciaConversa4 == _i) exitWith
			{
				texto = "aviso" + str _i;
				sequenciaConversa4 = sequenciaConversa4 + 1;
			};
		};
	};
};

titleRsc [texto, "plain down"];

if(sequenciaConversa1 > 3 && _object == informante1) then {_object removeAction _informanteId; CivilGatilho1 setDamage 1;};
if(sequenciaConversa2 > 3 && _object == informante2) then {_object removeAction _informanteId; CivilGatilho2 setDamage 1;};
if(sequenciaConversa3 > 3 && _object == informante3) then {_object removeAction _informanteId; CivilGatilho3 setDamage 1;};
if(sequenciaConversa4 > 3 && _object == informante4) then {_object removeAction _informanteId; CivilGatilho4 setDamage 1;};