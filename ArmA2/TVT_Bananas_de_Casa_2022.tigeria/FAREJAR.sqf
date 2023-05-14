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

hint format ["Inimigo a %1 metros", _DISTANCIA];
