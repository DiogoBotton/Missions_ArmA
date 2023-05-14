_centroDesligamento = _this select 0;
_distancia = _this select 1;
_types = ["Land_PowLines_WoodL", "StreetLamp", "Land_PowLines_ConcL", "Land_lampa_ind_zebr", "Land_lampa_sidl_3", "Land_lampa_vysoka", "Land_lampa_ind", "Land_lampa_ind_b", "Land_lampa_sidl", "NonStrategic"];
{
 _lamps = (_centroDesligamento nearObjects [_x,_distancia]);
 {_x switchLight "OFF";} forEach _lamps;
}foreach _types;