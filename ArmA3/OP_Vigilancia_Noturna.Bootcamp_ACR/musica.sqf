if (tocarMusicaWhip || tocarMusicaOnlyU) exitWith{};

nul = [speaker_music_1, "onlyU", 2000] call fn_netSay3D;

tocarMusicaOnlyU = true;
publicVariable "tocarMusica";

hmmwv1 removeAction 0;
hmmwv1 removeAction 1;
sleep 170;

tocarMusicaOnlyU = false;
publicVariable "tocarMusica";

hmmwv1 addAction ["Espantar Inimigos", "musica.sqf", [],1,false,true,"","_this distance _target < 6"];
hmmwv1 addAction ["Nao me Aperte", "whiplash.sqf", [],1,false,true,"","_this distance _target < 6"];