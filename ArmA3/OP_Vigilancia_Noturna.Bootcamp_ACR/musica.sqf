//tocarMusicaOnlyU = true;
//publicVariable "tocarMusica";

nul = [speaker_music_1, "onlyU", 2000] call fn_netSay3D;

hmmwv1 removeAction 0;
hmmwv1 removeAction 1;
sleep 250;

//tocarMusicaOnlyU = false;
//publicVariable "tocarMusica";

hmmwv1 addAction ["Espantar Inimigos", "musica.sqf"];
hmmwv1 addAction ["Nao me Aperte", "whiplash.sqf"];