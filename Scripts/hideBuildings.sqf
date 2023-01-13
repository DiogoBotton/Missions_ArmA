// Chame o script no init.sqf com execvm "hideBuildingsById.sqf";
// Acrescente no modo editor da missão markers invisiveis em cima das construções que deseja remover;
// Nomeie os markers com a nomenclatura "hideObj_1", "hideObj_2", "hideObj_3" e assim por diante;
// Crie um objeto (recomendado: Heliponto invisível) em algum lugar distante e nomeie como "objHide";
// Baseado na quantidade de markers criados, altere o valor da variavel local _qtdMarkers.

_markerName = "hideObj_";
_qtdMarkers = 1;
_objHidePos = getPos objHide;
objHide setPos [_objHidePos select 0, _objHidePos select 1, -500];

for [{_i=1}, {_i <= _qtdMarkers}, {_i=_I+1}] do {
	_buildPos = (nearestObject getMarkerPos (_markerName + str _i));
	_buildPos attachto [objHide, [0,0,0]];
};