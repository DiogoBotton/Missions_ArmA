if (tocarMusicaWhip || tocarMusicaOnlyU) exitWith{};

if (alive civil_morteiro) then {
	nul = [speaker_music_1, "whip", 2000] call fn_netSay3D;

	tocarMusicaWhip = true;
	publicVariable "tocarMusica";
};

hmmwv1 removeAction 0;
hmmwv1 removeAction 1;
civil_morteiro setDamage 1;
sleep 230;

tocarMusicaWhip = false;
publicVariable "tocarMusica";

hmmwv1 addAction ["Espantar Inimigos", "musica.sqf", [],1,false,true,"","_this distance _target < 6"];
hmmwv1 addAction ["Nao me Aperte", "whiplash.sqf", [],1,false,true,"","_this distance _target < 6"];