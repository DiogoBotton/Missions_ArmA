//tocarMusicaWhip = true;
//publicVariable "tocarMusica";
if (alive civil_morteiro) then {
	nul = [speaker_music_1, "whip", 2000] call fn_netSay3D;
};

hmmwv1 removeAction 0;
hmmwv1 removeAction 1;
civil_morteiro setDamage 1;
sleep 250;

//tocarMusicaWhip = false;
//publicVariable "tocarMusica";

hmmwv1 addAction ["Espantar Inimigos", "musica.sqf"];
hmmwv1 addAction ["Nao me Aperte", "whiplash.sqf"];