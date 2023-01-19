_ArrayDaArmaPrincipal = ["AK_47_M", "AK_47_S", "AKS_74"];
_ArrayDoTipoDeMunicao = ["30Rnd_762x39_AK47", "30Rnd_762x39_AK47", "ACE_30Rnd_545x39_AP_AK"];
_ArrayQuantiDeMunicao = [9,9,9];
_TotalEquipAmerican = count _ArrayDaArmaPrincipal;

if(isServer) then {
	// Altera o armamento de todas as unidades opfor para padrão iraquiano (AK's)
	{
		if (side _x == east && _x != coronel_aziz) then
			{
				// Remover tudo da unidade
				removeAllWeapons _x;
				removeBackpack _x;

				// Equipamento comum americano
				_x addMagazine "HandGrenade_West";
				_x addMagazine "HandGrenade_West";
				_x addMagazine "SmokeShell";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Bandage";
				_x addMagazine "ACE_Epinephrine";
				_x addMagazine "ACE_Morphine";
				_x addMagazine "ACE_Medkit";

				//DESCOBRIR TIPO DA UNIDADE
				_TipoDestaUnidade = typeOf _x;

				//SELECIONAR ARMA PRINCIPAL
				_SeletorEquipamento = floor (random _TotalEquipAmerican);
				_ArmaSelecionada = _ArrayDaArmaPrincipal select _SeletorEquipamento;
				_MunicaoSelecionada = _ArrayDoTipoDeMunicao select _SeletorEquipamento;
				_QuantidadeDeMunicao = _ArrayQuantiDeMunicao select _SeletorEquipamento;

				//SE FOR MG
				if(_TipoDestaUnidade == "TK_Soldier_MG_EP1") then {
					_ArmaSelecionada = "PK";
					_MunicaoSelecionada = "100Rnd_762x54_PK";
					_QuantidadeDeMunicao = 5;
					_x addWeapon "ACE_SpareBarrel";
				};

				//SE FOR ANTI TANQUE
				if (_TipoDestaUnidade == "TK_Soldier_AT_EP1") then
				{
					_QuantidadeDeMunicao = 6;
					removeAllWeapons _x;
					_x addMagazine "ACE_Bandage";
					_x addMagazine "ACE_Bandage";
					_x addMagazine "ACE_Bandage";
					_x addMagazine "ACE_Bandage";
					_x addMagazine "ACE_Epinephrine";
					_x addMagazine "ACE_Morphine";
					_x addMagazine "ACE_Medkit";
					_x addWeapon "RPG7V";
					_x addMagazine "ACE_PG7VM_PGO7";
					_x addMagazine "ACE_PG7VM_PGO7";
					_x addMagazine "ACE_PG7VL_PGO7";
					[_x, ""] call ACE_fnc_PutWeaponOnBack;
				};

				//SE FOR GRANADEIRO
				if (_TipoDestaUnidade == "TK_Soldier_GL_EP1") then
				{
					_ArmaSelecionada = "AK_74_GL";
					_MunicaoSelecionada = "ACE_30Rnd_545x39_AP_AK";
					removeAllWeapons _x;
					_x addMagazine "HandGrenade_West";
					_x addMagazine "HandGrenade_West";
					_x addMagazine "SmokeShell";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addMagazine "1Rnd_HE_GP25";
					_x addWeapon "ACE_ALICE_Backpack";
					[_x, "ACE_Epinephrine", 1] call ACE_fnc_PackMagazine;
					[_x, "ACE_Morphine", 2] call ACE_fnc_PackMagazine;
					[_x, "ACE_Medkit", 1] call ACE_fnc_PackMagazine;
					[_x, "ACE_LargeBandage", 4] call ACE_fnc_PackMagazine;
					[_x, "ACE_Bandage", 4] call ACE_fnc_PackMagazine;
					[_x, "1Rnd_HE_GP25", 4] call ACE_fnc_PackMagazine;
					[_x, ""] call ACE_fnc_PutWeaponOnBack;
				};

				//SE FOR MEDICO
				if (_TipoDestaUnidade == "TK_Soldier_Medic_EP1") then
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

				//ADICIONAR ARMA PRINCIPAL E MUNIÇÃO			
				_x addWeapon _ArmaSelecionada;
				for [{_z=1}, {_z <= _QuantidadeDeMunicao}, {_z=_z+1}] do {	
					_x addMagazine _MunicaoSelecionada;
				};
			};
	} forEach allUnits;
};