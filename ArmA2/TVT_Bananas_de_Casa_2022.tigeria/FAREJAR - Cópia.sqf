_quem = _this select 1;
_UnidadesProximas = nearestObjects [_quem,["Man"],5000];
_InimigosProximos = [];

if (EAST countSide _UnidadesProximas > 0) then {
	{
	_Unit = _x;
	if (side _unit == EAST) then {_InimigosProximos = _Inimigosproximos + [_unit]};
	} foreach _UnidadesProximas;
};

_INIMIGOPROXIMO = _InimigosProximos select 0;
_DISTANCIA = _quem distance _INIMIGOPROXIMO;

//_dir = [_quem, _InimigoPROXIMO] call BIS_fnc_relativeDirTo;
_dir = _quem getDir _InimigoPROXIMO;

_DIRECAO = "nada";

if (_dir < 359.999) then 
	{_DIRECAO = "N";
	if (_dir < 337.5) then
		{_DIRECAO = "NW";
		if (_dir < 292.5) then
			{_DIRECAO = "W";
			if (_dir < 247.5) then
				{_DIRECAO = "SW";
				if (_dir < 202.5) then
					{_DIRECAO = "S";
					if (_dir < 157.5) then
						{_DIRECAO = "SE";
						if (_dir < 112.5) then
							{_DIRECAO = "E";
							if (_dir < 67.5) then
								{_DIRECAO = "NE";
								if (_dir < 22.5) then
									{_DIRECAO = "N";
									};			
								};
							};		
						};
					};
				};
			};
		};
	};

hint format ["Inimigo a %1 metros\nDirecao do inimigo: %2", _DISTANCIA, _DIR];
