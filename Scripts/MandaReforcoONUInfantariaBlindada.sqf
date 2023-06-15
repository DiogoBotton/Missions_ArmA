//////////////////////////
//DESCRIÇÃO
//////////////////////////
//Quando OPFOR DETECTA BLUFOR em uma área específica, o script criará veículos aliados ocupados e os enviará para área (PODE SER FEITO DE OUTRAS FORMAS)
//
/////////////////////////
//MODO DE USAR
/////////////////////////
//
//1)Coloque um marker chamado "SpawnQrf" no local onde deseja que os reforços spawnem
//2)Cada área que receberá reforços deve ser coberta por um Trigger com as seguintes propriedades:
//ACTIVATION: BLUFOR
//DETECTED BY OPFOR
//ON ACT: _nil = [X,Y] execVM "MandaReforcoONUInfantariaMecanizada.sqf";
//ATENÇÃO: ESSE NÃO É O ÚNICO MÉTODO PARA FAZEREM COM QUE O REFORÇO SPAWNE (PARA FUNCIONAR COM HC, DEVERÁ SPAWNAR AO INÍCIO DA MISSÃO COM O "INIT.SQF")
//Muita atenção no [x,y] que deve ser substituído pelo código da área a ser defendida e quandidade de ondas
//Próximo ao centro da área, deve-se colocar um marker chamado "areaComQRE_x" sendo X o código da área
//
//Exemplo, numa missão, três áreas receberão reforços quando atacadas, seguem a configuração do trigger e seus respectivos markers
//
//AREA 1: ON ACT: _nil = [1,2] execVM "MandaReforcoONUInfantariaMecanizada.sqf"; e seu marker "areaComQRE_1
//AREA 1: ON ACT: _nil = [2,2] execVM "MandaReforcoONUInfantariaMecanizada.sqf"; e seu marker "areaComQRE_2
//AREA 1: ON ACT: _nil = [3,4] execVM "MandaReforcoONUInfantariaMecanizada.sqf"; e seu marker "areaComQRE_3
//

// Parametros opcionais:
//
// Foram adicionado três parametros opcionais (Quantidade máxima de veiculos por onda, Tempo entre ondas em MINUTOS E Quantidade máxima de unidades por veículo)
// Os 2 primeiros paramêtros são obrigatórios (sufixo e ondas)
// 3°, 4° e 5° paramêtros são opcionais
//
//Exemplo:
//
// _nil = [1,2,4,2,10] execVM "MandaReforcoONUInfantariaMecanizada.sqf";
//
// 3° paramêtro: respawnará de 1 até 4 carros por onda
// 4° paramêtro: tempo entre ondas 2 minutos
// 5° paramêtro: respawnará de X até 10 unidades por onda (configurar variável local _QtdMinUndiades)
//
// Caso não seja preenchido, pegará um valor padrão para ambos

_countThis = count _this;

_probabilidadeDeReforco = 100;
_QtdMaxVeiculos = if (_countThis >= 3) then [{_this select 2},{1}]; // Valor padrão 1 veículo por onda
_TempoEntreOndasMinutos = if (_countThis >= 4) then [{_this select 3},{15}]; // Valor padrão 15 minutos
_QtdMaxUnidades = if (_countThis >= 5) then [{_this select 4},{4}]; // Valor padrão até 4 unidades por onda

// Quantidade mínima de unidades para cada onda
_QtdMinUnidades = 4;

_prefixo = "areaComQRE_";
_sufixo = _this select 0;
_ondas = _this select 1;
_spawnVeiculo = "SpawnQrf10";
//OBS: SE ESTIVER REPLICANDO O SCRIPT PARA MÚLTIPLOS PONTOS DE SPAWN, LEMBRE DE COLOCAR UM NÚMERO PARA DIFERENCIAR CADA SPAWN EM CADA CÓPIA (EXEMPLO: "MandaReforcoONUInfantariaMecanizada1.sqf" > "SpawnQrf1" / "MandaReforcoONUInfantariaMecanizada2.sqf" > "SpawnQrf2")
//OBS2: SE ESTIVER REPLICANDO O SCRIPT PARA MÚLTIPLOS PONTOS DE SPAWN, OS "areaComQRE_x" FUNCIONARÃO PARA TODOS OS ARQUIVOS, MESMO QUE ESTEJAM SPAWNANDOS TIPOS DIFERENTES DE UNIDADES.

_ArrayONU  = ["UN_CDF_Soldier_SL_EP1","UN_CDF_Soldier_EP1","UN_CDF_Soldier_B_EP1","UN_CDF_Soldier_AT_EP1","UN_CDF_Soldier_Medic_EP1","ACE_UN_CDF_Medic_EP1"];

_ArrayDaArmaPrincipal = ["M16A2"];
_ArrayDoTipoDeMunicao = ["30Rnd_556x45_Stanag"];
_ArrayQuantiDeMunicao = [9];
_TotalEquipAmerican = count _ArrayDaArmaPrincipal;

//Dar Visao Noturna para os Inimigos caso seja noite (1 = SIM, 0 = NAO)
_VisaoNoturna = 0;
_ChanceVisaoNoturna = 75;

If (isServer) then

{

for"_QtdDeOndas" from 1 to _ondas do

	{
	_maxVeiculos = [1, _QtdMaxVeiculos] call BIS_fnc_randomInt;
	for "_i" from 1 to _maxVeiculos do
		{
	
		_NomeDoMarker = _prefixo + str _sufixo;
		_NomeGrupo = _NomeDoMarker;
		_NomeGrupo = CreateGroup RESISTANCE;

		//spawnar veiculo
		_veiculo = createVehicle ["BMP2_UN_EP1", getmarkerPos _spawnVeiculo,[],35,"CAN_COLLIDE"];

		_maxUnidades = [_QtdMinUnidades, _QtdMaxUnidades] call BIS_fnc_randomInt;
		//inicio do loop de spawn de unidades do grupo
		for "_y" from 1 to _maxUnidades do
			{
			//define o tipo de unidade e a cria
			_TipoDeUnidade = _ArrayONU call BIS_fnc_selectRandom;
			_NomeGrupo createUnit [_TipoDeUnidade, [(getMarkerPos _spawnVeiculo select 0),(getMarkerPos _spawnVeiculo select 1),0], [], 100, "CANCOLLIDE"];
	
	
			//fim do spawn das unidades
			};


		//Mover unidades para o veiculo
		_ContagemDaEquipe = 1;
		{
			// Remover tudo da unidade
			removeAllWeapons _x;
			removeAllItems _x;
			removeBackpack _x;

			// Equipamento comum americano
			_x addMagazine "HandGrenade_West";
			_x addMagazine "HandGrenade_West";
			_x addMagazine "SmokeShell";
			_x addMagazine "ACE_Bandage";
			_x addMagazine "ACE_Bandage";
			_x addMagazine "ACE_Bandage";
			_x addMagazine "ACE_Epinephrine";
			_x addMagazine "ACE_Morphine";
			_x addMagazine "ACE_Medkit";


			//SELECIONAR ARMA PRINCIPAL
			_SeletorEquipamento = floor (random _TotalEquipAmerican);
			_ArmaSelecionada = _ArrayDaArmaPrincipal select _SeletorEquipamento;
			_MunicaoSelecionada = _ArrayDoTipoDeMunicao select _SeletorEquipamento;
			_QuantidadeDeMunicao = _ArrayQuantiDeMunicao select _SeletorEquipamento;

			//ADICIONAR ARMA PRINCIPAL E MUNIÇÃO			
			_X addWeapon _ArmaSelecionada;
			for [{_z=1}, {_z <= _QuantidadeDeMunicao}, {_z=_z+1}] do {	
				_x addMagazine _MunicaoSelecionada;
			};

			//DAR VISAO NOTURNA
			if (_VisaoNoturna == 1) then
				{
				if ((dayTime > 16) or (dayTime < 5)) then
					{
					_RolarDadoVisaoNoturna = floor (random 100);
					if (_RolarDadoVisaoNoturna < _ChanceVisaoNoturna) then
						{
						_x addWeapon "NVGoggles";
						};
					};
				};
			
			//DESCOBRIR TIPO DA UNIDADE
			_TipoDestaUnidade = typeOf _x;

			//SE FOR ANTI TANQUE
			if (_TipoDestaUnidade == "UN_CDF_Soldier_AT_EP1") then
			{
				_x addWeapon "M136";
				[_x, ""] call ACE_fnc_PutWeaponOnBack;
			};

			//SE FOR MEDICO
			if (_TipoDestaUnidade == "UN_CDF_Soldier_Medic_EP1") then
			{
				_x addWeapon "ACE_ALICE_Backpack";
				[_x, "ACE_Epinephrine", 2] call ACE_fnc_PackMagazine;
				[_x, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
				[_x, "ACE_Medkit", 1] call ACE_fnc_PackMagazine;
				[_x, "ACE_LargeBandage", 5] call ACE_fnc_PackMagazine;
				[_x, "ACE_Bandage", 7] call ACE_fnc_PackMagazine;
				[_x, "ACE_Tourniquet", 4] call ACE_fnc_PackMagazine;
				[_x, ""] call ACE_fnc_PutWeaponOnBack;
			};

			//SE FOR AUTOMATIC RIFLEMAN
			if (_TipoDestaUnidade == "UN_CDF_Soldier_B_EP1") then
			{
				removeAllWeapons _x;
				_x addMagazine "100Rnd_556x45_M249";
				_x addMagazine "100Rnd_556x45_M249";
				_x addMagazine "100Rnd_556x45_M249";
				_x addMagazine "100Rnd_556x45_M249";
				_x addMagazine "100Rnd_556x45_M249";
				_x addWeapon "M249";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Epinephrine";
				_x addMagazine "ACE_Morphine";
				_x addMagazine "ACE_Medkit";
				_x addMagazine "HandGrenade_West";
				_x addMagazine "SmokeShell";
				_x addMagazine "SmokeShell";
			};

		if (_ContagemDaEquipe == 1) then {_x moveInCommander _veiculo;}; 
		if (_ContagemDaEquipe == 2) then {_x moveInGunner _veiculo;};
		if (_ContagemDaEquipe == 3) then {_x moveInDriver _veiculo;};
		if (_ContagemDaEquipe >= 4) then {_x moveInCargo _veiculo;};
		_ContagemDaEquipe = _ContagemDaEquipe + 1;
		} foreach units group (leader _NomeGrupo);
	
	
		_nomeWaypoint1 = str _NomeGrupo + str _i;
		_nomeWaypoint1 = _NomeGrupo addWaypoint [getMarkerPos _NomeDoMarker,10]; 
		_nomeWaypoint1 setWaypointType "MOVE" ;  
		_nomeWaypoint1 setWaypointCombatMode "RED";
		_nomeWaypoint1 setWaypointBehaviour "AWARE";
		_nomeWaypoint1 setWaypointSpeed "FULL";
		_nomeWaypoint1 setWaypointPosition [getMarkerPos _NomeDoMarker,10];


		};

	_tempoEntreOndas = _TempoEntreOndasMinutos * 60;
	sleep _tempoEntreOndas;

	};


};